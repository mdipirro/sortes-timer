#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"

#define LOW(a)      (a & 0xFF)
#define HIGH(a)     ((a>>8) & 0xFF)
#define MAX_HOURS   23 // max allowed value for hours
#define MAX_MINUTES 59 // max allowed value for minutes
#define MAX_SECONDS 59 // max allowed value for seconds
#define BASE        10 // radix for ultoa

// enum representing which value the user is currently setting
enum setting_values {
    HOURS,
    MINUTES
} in_setting;

enum display_states {
    CLOCK_SETTING,
    TIMER_SETTING,
    TIME_FLOWING
};

// various flags used to communicate from interrupts to the main
struct flags {
    int time_setting_procedure; // the user is setting the clock's time
    int awake_setting_procedure; // the user is setting the awake time
    int set; // initial set up completed
} flags;

// struct representing the clock's time
struct clock_time {
    int hours;
    int minutes;
    int seconds;
} clock;

// struct representing the awake time
struct awake_time {
    int hours;
    int minutes;
} timer;

// struct representing the new clock time's values
struct setting_values {
    int hours;
    int minutes;
} setting;

struct interrupts {
    int button1;
    int button2;
} ints;

char time_value[9]; // string used to display the time

void update_time_value(int* const, int, int);
void complete_hours_setting();
void int2string(int, int);
void set_up_complete_time();
void handle_button1_pressure();
void update_proper_time_value(int* const, int* const);
void handle_button2_pressure();
void update_display(enum display_states);
void assign_default_values();
void update_clock();
void DisplayString(BYTE pos, char* text);
void DisplayWORD(BYTE pos, WORD w);
void DisplayIPValue(DWORD IPdw);
size_t strlcpy(char *dst, const char *src, size_t siz);

/**
 * Update an arbitrary time value (it may represent either minutes or hours).
 * The function takes as an argument a pointer to the value, a limit beyond 
 * which an overflow is issued and a position. The position is meant to 
 * update the string representing the complete time.
 * @param value Pointer to the value to be changed
 * @param limit Limit beyond which an overflow is issued
 * @param pos Position of the corresponding time value in time_value
 */
void update_time_value(int* const value, int limit, int pos) {
    if (*value == limit) {
        *value = 0;
    } else {
        (*value)++;
    }
    ultoa(*value, &time_value[pos], BASE);
    // if the value has only one digit, prepend a 0
    int2string(*value, pos);
    DisplayString(16 + 6 * flags.awake_setting_procedure, &time_value[0]);
}

/**
 * Complete the hour's setting procedure and start the minutes' one. This 
 * function set the `in_setting` flag to `MINUTES`.
 */
void complete_hours_setting() {
    in_setting = MINUTES;
    time_value[2] = ':'; // overwite '\0' added by ultoa when setting hours
}

/**
 * Given an int, casts it in a string using ultoa. If the int is < 10
 * (meaning it has only one digit), prepend a 0. The value is then 
 assigned to the corresponding position in time_value.
 * @param value The int
 * @param pos The position in time_value
 */
void int2string(int value, int pos) {
    ultoa(value, &time_value[pos], BASE);
    // if the value has only one digit, prepend a 0
    if (!(time_value[pos + 1])) {
        time_value[pos + 1] = time_value[pos];
        time_value[pos] = '0';
        time_value[pos + 2] = '\0';
    }
}

/**
 * Assign characters to `time_value` in order to display the time in
 * the format hh:mm:ss. 
 */
void set_up_complete_time() {
    // assign the right values to time_value
    int2string(clock.hours, 0);
    time_value[2] = ':';
    int2string(clock.minutes, 3);
    time_value[5] = ':';
    int2string(clock.seconds, 6);
    // start making the user see the time flowing
    update_display(TIME_FLOWING);
}

/**
 * Handle the pressure of BUT1. This button is used to confirm the time 
 * values entered during the setting (or changing) procedure. It is also 
 * used to issue a clock's time modification.
 */
void handle_button1_pressure() {
    if (flags.time_setting_procedure) { // setting clock's time
        if (in_setting == HOURS) {
            complete_hours_setting(); // start minutes setting
        } else {
            // init the clock
            clock.hours = setting.hours;
            clock.minutes = setting.minutes;
            clock.seconds = 0;
            flags.time_setting_procedure = 0; // end the time setting
            // start the awake time setting if the user is in the initial procedure
            if (!flags.set) {
                flags.awake_setting_procedure = 1; // start the second procedure
                // update the display accordingly
                time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
                update_display(TIMER_SETTING);
                in_setting = HOURS; // start from setting hours
            } else { // restore time flowing view
                set_up_complete_time();
            }   
        }
    } else if (flags.awake_setting_procedure) { // setting the awake time
        if (in_setting == HOURS) {
            complete_hours_setting();
        } else {
            // end the procedure
            flags.awake_setting_procedure = 0; 
            flags.set = 1; 
            // display the complete time
            set_up_complete_time();
        }
    } else if (flags.set) {
        flags.time_setting_procedure = 1;
        ultoa(clock.hours, &time_value[0], BASE);
        time_value[2] = ':';
        ultoa(clock.minutes, &time_value[3], BASE);
        update_display(CLOCK_SETTING);
        in_setting = HOURS;
    }
}

/**
 * Update the corrrect time value according to the actual `in_setting`
 * value and to the values pointed to by the parameters. The two 
 * arguments refer to the hours and minutes values. The function updates
 * only one out of two values, according to `in_setting`:
 * -) in_setting = HOURS -> hours
 * -) in_setting = MINUTES -> minutes
 * This function uses `update_time_value`.
 * @param hours A pointer to an int corresponding to an hour value
 * @param hours A pointer to an int corresponding to an minute value
 */
void update_proper_time_value(int* const hours, int* const minutes) {
    if (in_setting == HOURS) {
        update_time_value(hours, MAX_HOURS, 0);
    } else {
        update_time_value(minutes, MAX_MINUTES, 3);
    }
}

/**
 * Handle the pressure of BUT2. This button is used to set the actual values
 * of both hours and minutes during the setting and the changing procedures.
 * It is also used to issue a modification of the awake time.
 */
void handle_button2_pressure() {
    if (flags.time_setting_procedure) { // setting the clock's time
        // update the values in the `setting` struct
        update_proper_time_value(&setting.hours, &setting.minutes); 
    } else if (flags.awake_setting_procedure) { // setting the awake time
        // update the values in the `timer` struct
        update_proper_time_value(&timer.hours, &timer.minutes);
    } else if (flags.set) {
        flags.awake_setting_procedure = 1;
        ultoa(timer.hours, &time_value[0], BASE);
        time_value[2] = ':';
        ultoa(timer.minutes, &time_value[3], BASE);
        in_setting = HOURS;
        update_display(TIMER_SETTING);
    }
}

/**
 * This function is meant as an initial setup. It sets every flag value used
 * later on by the program. 
 */
void assign_default_values() {
    // setting a 0 the interrupts
    ints.button1 = 0;
    ints.button2 = 0;
    // setting initial string values
    time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
    time_value[2] = ':';
    time_value[5] = '\0';
    in_setting = HOURS; // start from setting the hours
    // init the flags
    flags.time_setting_procedure = 1;
    flags.awake_setting_procedure = 0;
    flags.set = 0;
    // init the timer
    timer.hours = 0;
    timer.minutes = 0;
    // init the setting time
    setting.hours = 0;
    setting.minutes = 0;
    // set the display status
    update_display(CLOCK_SETTING);
    // no need to assign 0 to the clock's fields since they will be init for sure
    // after the setting procedure
}

/**
 * Update the display according to its parameter. The latter corresponds to
 * different timer's states.
 * @param state A display_states value representing the state
 */
void update_display(enum display_states state) {
    switch (state) {
        case CLOCK_SETTING:
            DisplayString(0,"Enter the time:");
            DisplayString(16, &time_value[0]);
            DisplayString(21,"   ");
            break;
        case TIMER_SETTING:
            DisplayString(0, "Enter the awake ");
            DisplayString(16, "time: ");
            DisplayString(22, &time_value[0]);
            break;
        case TIME_FLOWING:
            DisplayString(0, "                ");
            DisplayString(16 + 6, "         ");
            DisplayString(16, &time_value[0]);
            break;
    }
}

/**
 * This function represents a tick and should be called every time the clock
 * ticks. It updates the values in the `clock` structure according to the 
 * conventional time rules:
 * -) seconds go from 0 to 59
 * -) minutes go from 0 to 59
 * -) hours go from 0 to 23
 */
void update_clock() {
    clock.seconds = (clock.seconds == MAX_SECONDS) ? 0 : clock.seconds + 1;
    sprintf(&time_value[6], "%02d", clock.seconds);
    if (!clock.seconds) { // new minute
        update_time_value(&clock.minutes, MAX_MINUTES, 3);
        time_value[5] = ':';
    }
    if (!clock.minutes) { // new hour
        update_time_value(&clock.hours, MAX_HOURS, 0);
        time_value[3] = ':';
    }
}

/**
 * Handle a high priority interrupt. This function actually handles two
 * interrupts:
 * -) INT1F, issued by a pressure of BUT2
 * -) INT3F, issued by a pressure of BUT1
 */
void high_isr(void) __interrupt (1) {
    if(INTCON3bits.INT1F == 1) { // Button 2
        ints.button2 = 1;
        INTCON3bits.INT1F = 0;
    } 
    if (INTCON3bits.INT3F == 1) { // Button 1
        ints.button1 = 1;
        INTCON3bits.INT3F = 0;
    }
}

// FIXME
// wait for approx 1ms
#define CLOCK_FREQ 25000000 // 40 Mhz
#define EXEC_FREQ CLOCK_FREQ/4 // 4 clock cycles to execute an instruction
void delay_1ms(void) {
	TMR0H=(0x10000-EXEC_FREQ/1000)>>8;
	TMR0L=(0x10000-EXEC_FREQ/1000)&0xff;
	T0CONbits.TMR0ON=0; // disable timer0
	T0CONbits.T08BIT=0; // use timer0 16-bit counter
	T0CONbits.T0CS=0; // use timer0 instruction cycle clock
	T0CONbits.PSA=1; // disable timer0 prescaler
	INTCONbits.T0IF=0; // clear timer0 overflow bit
	T0CONbits.TMR0ON=1; // enable timer0
	while (!INTCONbits.T0IF) {} // wait for timer0 overflow
	INTCONbits.T0IF=0; // clear timer0 overflow bit
	T0CONbits.TMR0ON=0; // disable timer0
}

void delay_ms(unsigned int ms) {
	while (ms--) {
		delay_1ms();
	}
}

void main(void) { 
    LCDInit();
    DelayMs(100);

    RCONbits.IPEN      = 1;   //enable interrupts priority levels
    INTCON3bits.INT1P  = 1;   //connect INT1 interrupt (button 2) to high prio
    INTCON2bits.INT3IP = 1;
    INTCON2bits.INTEDG1= 0;   //INT1 interrupts on falling edge
    INTCON2bits.INTEDG3= 0;   //connect INT1 interrupt (button 2) to high prio
    INTCONbits.GIE     = 1;   //enable high priority interrupts
    INTCON3bits.INT1F  = 0;   //clear INT1 flag
    INTCON3bits.INT3F  = 0;
    INTCON3bits.INT1E  = 1;   //enable INT1 interrupt (button 2)
    INTCON3bits.INT3E  = 1;   

    assign_default_values();

    while(1) {
        if (ints.button1) {
            ints.button1 = 0;
            handle_button1_pressure();
        }
        if (ints.button2) {
            ints.button2 = 0;
            handle_button2_pressure();
        }
    }
}
 
/*************************************************
 Function DisplayWORD:
 writes a WORD in hexa on the position indicated by
 pos. 
 - pos=0 -> 1st line of the LCD
 - pos=16 -> 2nd line of the LCD

 __SDCC__ only: for debugging
*************************************************/
#if defined(__SDCC__)
void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
{
    BYTE WDigit[6]; //enough for a  number < 65636: 5 digits + \0
    BYTE j;
    BYTE LCDPos=0;  //write on first line of LCD
    unsigned radix=10; //type expected by sdcc's ultoa()

    LCDPos=pos;
    ultoa(w, WDigit, radix);      
    for(j = 0; j < strlen((char*)WDigit); j++)
    {
       LCDText[LCDPos++] = WDigit[j];
    }
    if(LCDPos < 32u)
       LCDText[LCDPos] = 0;
    LCDUpdate();
}

// /*************************************************
//  Function DisplayString: 
//  Writes string to the LCD display starting at pos
//  since strlcopy writes the final \0, only 31 characters 
//  are really usable on the LCD
//  *************************************************/
// void DisplayString(BYTE pos, char* text)
// {
//   BYTE l= strlen(text)+1;/* l must include the finam \0, so, it is strlen+1*/
//    BYTE max= 32-pos;
//    strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
//    LCDUpdate();
// 
// }

/*************************************************
 Function DisplayString: 
 Writes the first characters of the string in the remaining 
 space of the 32 positions LCD, starting at pos
 (does not use strlcopy, so can use up to the 32th place)
*************************************************/
void DisplayString(BYTE pos, char* text)
{
   BYTE        l = strlen(text);/*number of actual chars in the string*/
   BYTE      max = 32-pos;    /*available space on the lcd*/
   char       *d = (char*)&LCDText[pos];
   const char *s = text;
   size_t      n = (l<max)?l:max;
   /* Copy as many bytes as will fit */
    if (n != 0)
      while (n-- != 0)*d++ = *s++;
   LCDUpdate();

}

#endif


/*-------------------------------------------------------------------------
 *
 * strlcpy.c
 *    strncpy done right
 *
 * This file was taken from OpenBSD and is used on platforms that don't
 * provide strlcpy().  The OpenBSD copyright terms follow.
 *-------------------------------------------------------------------------
 */

/*  $OpenBSD: strlcpy.c,v 1.11 2006/05/05 15:27:38 millert Exp $    */

/*
 * Copyright (c) 1998 Todd C. Miller <Todd.Miller@courtesan.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
 
/*
 * Copy src to string dst of size siz.  At most siz-1 characters
 * will be copied.  Always NUL terminates (unless siz == 0).
 * Returns strlen(src); if retval >= siz, truncation occurred.
 * Function creation history:  http://www.gratisoft.us/todd/papers/strlcpy.html
 */
size_t
strlcpy(char *dst, const char *src, size_t siz)
{
    char       *d = dst;
    const char *s = src;
    size_t      n = siz;
 
    /* Copy as many bytes as will fit */
    if (n != 0)
    {
        while (--n != 0)
        {
            if ((*d++ = *s++) == '\0')
                break;
        }
    }

    /* Not enough room in dst, add NUL and traverse rest of src */
    if (n == 0)
    {
        if (siz != 0)
            *d = '\0';          /* NUL-terminate dst */
        while (*s++)
            ;
    }

    return (s - src - 1);       /* count does not include NUL */
}
