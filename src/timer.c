#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"

#define LOW(a)     (a & 0xFF)
#define HIGH(a)    ((a>>8) & 0xFF)

void DisplayString(BYTE pos, char* text);
void DisplayWORD(BYTE pos, WORD w);
void DisplayIPValue(DWORD IPdw);
size_t strlcpy(char *dst, const char *src, size_t siz);

enum setting_values {
    HOURS,
    MINUTES
} in_setting;

int clock_hours = 0, clock_minutes = 0, clock_seconds = 0, // displayed time
    awake_hours = 0, awake_minutes = 0, // awake time
    setting_hours = 0, setting_minutes = 0, // values used during the setting procedure
    time_setting_procedure = 1, awake_setting_procedure = 0, set = 0; 
char time_value[6]; // string used to display the time

void update_setting_hours() {
    if (setting_hours == 23) {
        setting_hours = 0;
    } else {
        setting_hours++;
    }
    sprintf(&time_value[0], "%02d", setting_hours);
    time_value[2] = ':';
    //DisplayString(16, int_value);
}

void update_setting_minutes() {
    if (setting_minutes == 59) {
        setting_minutes = 0;
    } else {
        setting_minutes++;
    }
    sprintf(time_value + 3, "%02d", setting_minutes);
    //DisplayString(19, &time_value[3]);
}

void update_awake_hours() {
    if (awake_hours == 23) {
        awake_hours = 0;
    } else {
        awake_hours++;
    }
    sprintf(&time_value[0], "%02d", awake_hours);
    time_value[2] = ':';
    //DisplayString(16, int_value);
}

void update_awake_minutes() {
    if (awake_minutes == 59) {
        awake_minutes = 0;
    } else {
        awake_minutes++;
    }
    sprintf(&time_value[3], "%02d", awake_minutes);
//    DisplayString(0, &time_value[0]);
}

void update_time(char* timeValue, int hour, int min) {
    sprintf(&timeValue[0], "%02d", hour);
    timeValue[2] = ':';
    sprintf(&timeValue[3], "%02d", min);
    DisplayString(16, timeValue);
    LCDUpdate();
}

void handle_button1_pressure() {
    if (time_setting_procedure) {
        if (in_setting == HOURS) {
            in_setting = MINUTES;
        } else {
            // init the clock
            clock_hours = setting_hours;
            clock_minutes = setting_minutes;
            clock_seconds = 0;
            time_setting_procedure = 0; // end the time setting
            awake_setting_procedure = 1; // start the awake time setting
            time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
            in_setting = HOURS;
        }
    } else if (awake_setting_procedure) {
        if (in_setting == HOURS) {
            in_setting = MINUTES;
        } else {
            awake_setting_procedure = 0;
            set = 1;
            // TODO Update time_value with clock values
        }
    }
}

void handle_button2_pressure() {
    if (time_setting_procedure) {
        if (in_setting == HOURS) {
            update_setting_hours();
        } else {
            update_setting_minutes();
        }
    } else if (awake_setting_procedure) {
        if (in_setting == HOURS) {
            update_awake_hours();
        } else {
            update_awake_minutes();
        }
    }
}

void high_isr(void) __interrupt (1) {
    if(INTCON3bits.INT1F == 1) { // Button 2
        handle_button2_pressure();
        INTCON3bits.INT1F = 0;
    } 
    if (INTCON3bits.INT3F == 1) { // Button 1
        handle_button1_pressure();
        INTCON3bits.INT3F = 0;
    }
}

void main(void) {
    time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
    time_value[2] = ':';
    time_value[5] = '\0';
   
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

    DisplayString(0,"Enter the time:");
    DisplayString(16, "00:00");
    LCDUpdate();

    in_setting = HOURS;

    while(1) {
        if (awake_setting_procedure && awake_hours == 0 && awake_minutes == 0) {
            DisplayString(0, "Enter the wake:");
        } else if (set) {
            DisplayString(0, "               ");
        }
        DisplayString(16, &time_value[0]);
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
