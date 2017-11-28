#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"

#define CLOCK_FREQ 25000000      // 25 Mhz
#define EXTCLOCK_FREQ 32768      // 32.768 kHz
#define EXEC_FREQ CLOCK_FREQ/4   // 4 clock cycles to execute an instruction

#define LOW(a)      (a & 0xFF)
#define HIGH(a)     ((a>>8) & 0xFF)
#define MAX_HOURS   23           // max allowed value for hours
#define MAX_MINUTES 59           // max allowed value for minutes
#define MAX_SECONDS 59           // max allowed value for seconds
#define BASE        10           // radix for ultoa

// enum representing which value the user is currently setting
enum setting_values {
    HOURS,
    MINUTES
} in_setting;

// enum representing the actual display's state
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
    int half_sec;
    int one_sec;
    int alarm;
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

// struct representing the triggered interrupts
struct interrupts {
    int button1;
    int button2;
} ints;

char time_value[9]; // string used to display the time

void UpdateTimeValue(int* const, int, int);
void CompleteHoursSetting();
void Int2String(int, int);
void SetupCompleteTime();
void HandleButton1Pressure();
void UpdateProperTimeValue(int* const, int* const);
void HandleButton2Pressure();
void ConfigureRegisters();
void AssignDefaultValues();
void UpdateDisplay(enum display_states);
void UpdateClock();
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
void UpdateTimeValue(int* const value, int limit, int pos) {
    if (*value == limit) {
        *value = 0;
    } else {
        (*value)++;
    }
    Int2String(*value, pos);
}

/**
 * Complete the hour's setting procedure and start the minutes' one. This 
 * function set the `in_setting` flag to `MINUTES`.
 */
void CompleteHoursSetting() {
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
void Int2String(int value, int pos) {
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
void SetupCompleteTime() {
    // assign the right values to time_value
    Int2String(clock.hours, 0);
    time_value[2] = ':';
    Int2String(clock.minutes, 3);
    time_value[5] = ':';
    Int2String(clock.seconds, 6);
    // start making the user see the time flowing
    UpdateDisplay(TIME_FLOWING);
}

/**
 * Handle the pressure of BUT1. This button is used to confirm the time 
 * values entered during the setting (or changing) procedure. It is also 
 * used to issue a clock's time modification.
 */
void HandleButton1Pressure() {
    if (flags.time_setting_procedure) { // setting clock's time
        if (in_setting == HOURS) {
            CompleteHoursSetting(); // start minutes setting
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
                UpdateDisplay(TIMER_SETTING);
                in_setting = HOURS; // start from setting hours
            } else { // restore time flowing view
                SetupCompleteTime();
            }   
        }
    } else if (flags.awake_setting_procedure) { // setting the awake time
        if (in_setting == HOURS) {
            CompleteHoursSetting();
        } else {
            // end the procedure
            flags.awake_setting_procedure = 0; 
            flags.set = 1; 
            // display the complete time
            SetupCompleteTime();
            T1CONbits.TMR1ON    =    1;
        }
    } else if (flags.set) {
        // copy the actual time into the temporary structure
        setting.hours   = clock.hours;
        setting.minutes = clock.minutes;
        flags.time_setting_procedure = 1; // start the time setting
        Int2String(setting.hours, 0);
        time_value[2] = ':';
        Int2String(setting.minutes, 3);
        UpdateDisplay(CLOCK_SETTING);
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
 * This function uses `UpdateTimeValue`.
 * @param hours A pointer to an int corresponding to an hour value
 * @param hours A pointer to an int corresponding to an minute value
 */
void UpdateProperTimeValue(int* const hours, int* const minutes) {
    if (in_setting == HOURS) {
        UpdateTimeValue(hours, MAX_HOURS, 0);
        DisplayString(16 + 6 * flags.awake_setting_procedure, &time_value[0]);
    } else {
        UpdateTimeValue(minutes, MAX_MINUTES, 3);
        DisplayString(19 + 6 * flags.awake_setting_procedure, &time_value[3]);
    }
}

/**
 * Handle the pressure of BUT2. This button is used to set the actual values
 * of both hours and minutes during the setting and the changing procedures.
 * It is also used to issue a modification of the awake time.
 */
void HandleButton2Pressure() {
    if (flags.time_setting_procedure) { // setting the clock's time
        // update the values in the `setting` struct
        UpdateProperTimeValue(&setting.hours, &setting.minutes); 
    } else if (flags.awake_setting_procedure) { // setting the awake time
        // update the values in the `timer` struct
        UpdateProperTimeValue(&timer.hours, &timer.minutes);
    } else if (flags.set) {
        flags.awake_setting_procedure = 1;
        Int2String(timer.hours, 0);
        time_value[2] = ':';
        Int2String(timer.minutes, 3);
        in_setting = HOURS;
        UpdateDisplay(TIMER_SETTING);
    }
}

/**
 * This function is meant as an initial setup. It sets the configuration
 * registers for interrupts, timers, buttons and LEDs handling
 */
void ConfigureRegisters() {
    // global interrupt configuration
    INTCONbits.GIE      =   1;   //enable high priority interrupts
    RCONbits.IPEN       =   1;   //enable interrupts priority levels
    
    /**
     * timer1 (32.760 kHz) configuration
     * 16-bit counter, 0.5 seconds to overflow (bounded configuration)
     */
    T1CONbits.TMR1ON    =   0;    // disable timer1
    T1CONbits.RD16      =   1;    // use timer1 16-bit counter
    T1CONbits.T1CKPS0   =   0;    // prescaler set to 1:1
    T1CONbits.T1CKPS1   =   0;
    T1CONbits.T1OSCEN   =   1;    // timer1 oscillator enable
    T1CONbits.TMR1CS    =   1;    // external clock selected
    PIR1bits.TMR1IF     =   0;    // clear timer1 overflow bit
    PIE1bits.TMR1IE     =   1;    // timer1 interrupt enable
    IPR1bits.TMR1IP     =   1;    // high priority interrupt
    TMR1L               =   (0x10000 - EXTCLOCK_FREQ/2) & 0xff;    // timer1 initial value
    TMR1H               =   (0x10000 - EXTCLOCK_FREQ/2) >> 8;

    // external interrupts (buttons) configuration
    INTCON3bits.INT1P   =   1;    //connect INT1 interrupt (button 2) to high prio
    INTCON2bits.INT3IP  =   1;    //connect INT3 interrupt (button 1) to high prio
    INTCON2bits.INTEDG1 =   0;    //INT1 interrupts on falling edge
    INTCON2bits.INTEDG3 =   0;    //INT3 interrupts on falling edge
    INTCON3bits.INT1F   =   0;    //clear INT1 flag
    INTCON3bits.INT3F   =   0;    //clear INT3 flag
    INTCON3bits.INT1E   =   1;    //enable INT1 interrupt (button 2)
    INTCON3bits.INT3E   =   1;    //enable INT1 interrupt (button 1)

    // LEDs configuration
    TRISJbits.TRISJ0    =   0;    // configure PORTJ0 for output (led0)
    TRISJbits.TRISJ1    =   0;    // configure PORTJ1 for output (led1)
    LATJbits.LATJ0      =   1;    // led0 output high
    LATJbits.LATJ1      =   0;    // led1 output low
}

/**
 * This function is meant as an initial setup. It sets every flag value used
 * later on by the program. 
 */
void AssignDefaultValues() {
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
    flags.half_sec = 0;
    flags.one_sec = 0;
    flags.alarm = 0;
    // init the timer
    timer.hours = 0;
    timer.minutes = 0;
    // init the setting time
    setting.hours = 0;
    setting.minutes = 0;
    // set the display status
    UpdateDisplay(CLOCK_SETTING);
    // no need to assign 0 to the clock's fields since they will be init for sure
    // after the setting procedure
}

/**
 * Update the display according to its parameter. The latter corresponds to
 * different timer's states.
 * @param state A display_states value representing the state
 */
void UpdateDisplay(enum display_states state) {
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
void UpdateClock() {
    UpdateTimeValue(&clock.seconds, MAX_SECONDS, 6);
    if (!clock.seconds) { // new minute
        UpdateTimeValue(&clock.minutes, MAX_MINUTES, 3);
        time_value[5] = ':';
        if (!clock.minutes) { // new hour
            UpdateTimeValue(&clock.hours, MAX_HOURS, 0);
            time_value[2] = ':';
        }
        if(!flags.alarm && (clock.minutes == timer.minutes && clock.hours == timer.hours))
            flags.alarm = 1; // alarm activation
    }
    if(flags.alarm && (clock.seconds > 30 || clock.minutes != timer.minutes || clock.hours != timer.hours))
        flags.alarm = 0;     // alarm deactivation after ~30 seconds or after clock change
    if (!flags.awake_setting_procedure    && !flags.time_setting_procedure)
        DisplayString(16, &time_value[0]);
}

/**
 * Handle a high priority interrupt. This function actually handles three
 * interrupts:
 * -) TMR1IF, issued by timer1 counter overflow
 * -) INT1F, issued by a pressure of BUT2
 * -) INT3F, issued by a pressure of BUT1
 */
void HighISR(void) __interrupt (1) {
    if(PIR1bits.TMR1IF == 1) {      // timer1 overflow (every 0.5 seconds)
        TMR1L             =     (0x10000 - EXTCLOCK_FREQ/2) & 0xff;    // timer1 reset
        TMR1H             =     (0x10000 - EXTCLOCK_FREQ/2) >> 8;
        flags.half_sec = 1;         // set a flag every 0.5 seconds
        if(!LATJbits.LATJ0)
            flags.one_sec = 1;      // set a flag every second (i.e. every time led0 becomes high)
        PIR1bits.TMR1IF = 0;
    }
    if(INTCON3bits.INT1F == 1) {    // button 2 ISR
        ints.button2 = 1;           // set a flag for successive handling
        INTCON3bits.INT1F = 0;
    } 
    if (INTCON3bits.INT3F == 1) {   // button 1 ISR
        ints.button1 = 1;           // set a flag for successive handling
        INTCON3bits.INT3F = 0;
    }
}


void main(void) {
    LCDInit();
    DelayMs(200);

    // initial configuration
    ConfigureRegisters();
    AssignDefaultValues();

    while(1) {
        if (flags.half_sec) {               // routine executed every half second
            // clock update
            if (flags.one_sec) {
                UpdateClock();
            }
            // turn off the red LED if the alarm is not active
            if (!flags.alarm && LATJbits.LATJ1)
                LATJbits.LATJ1  = 0;
            // LEDs blinking
            if (flags.alarm && flags.one_sec) {
                LATJbits.LATJ0 ^= 1;        // led0 blink
                LATJbits.LATJ1 ^= 1;        // led1 blink
            } else {
                LATJbits.LATJ0 ^= 1;        // led0 blink
            }
            // flags reset
            flags.one_sec = 0;
            flags.half_sec = 0;
        }
        if (ints.button1) {         // button 1 pressed
            ints.button1 = 0;
            HandleButton1Pressure();
        }
        if (ints.button2) {         // button 2 pressed
            ints.button2 = 0;
            HandleButton2Pressure();
        }
    }
}

#if defined(__SDCC__)
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
