#define __18F97J60
#define __SDCC__
#define THIS_INCLUDES_THE_MAIN_FUNCTION
#include "Include/HardwareProfile.h"

#include <string.h>
#include <stdlib.h>

#include "Include/LCDBlocking.h"
#include "Include/TCPIP_Stack/Delay.h"

void TimersConfig(void);
void TimersReset(void);
void DisplayString(BYTE pos, char* text);
void DisplayWORD(BYTE pos, WORD w);
void DisplayIPValue(DWORD IPdw);
size_t strlcpy(char *dst, const char *src, size_t siz);

/**
 *  Each time the timer0 counter generates an
 *  overflow this variable is incremented by one
 */  
int16_t rounds;

/**
 *  Registers configuration for timer0 and timer1
 */
void TimersConfig(void) {
	
	/**
	 *  timer0 (exec clock) configuration
	 *  8-bit counter, few us to overflow
	 *  Maximum measurable frequency ~= 33 MHz
	 *  (using a 16-bit overflow counter)
	 */
	T0CONbits.TMR0ON	=	0;		// disable timer0
	T0CONbits.T08BIT	=	1;		// use timer0 8-bit counter
	T0CONbits.PSA		=	1;		// disable timer0 prescaler
	T0CONbits.T0CS		=	0;		// use timer0 instruction cycle clock
	INTCONbits.TMR0IF	=	0;		// clear timer0 overflow bit
	INTCONbits.TMR0IE	=	1;		// enable timer0 overflow interrupt
	INTCON2bits.TMR0IP	=	1;		// timer0 interrupt is high priority
	TMR0L			=	0x00;		// timer0 initial value
	TMR0H			=	0x00;
	
	/**
	 *  timer1 (32.760 kHz) configuration
	 *  16-bit counter, 2 seconds to overflow
	 */
	T1CONbits.TMR1ON	=	0;		// disable timer1
	T1CONbits.RD16		=	1;		// use timer1 16-bit counter
	T1CONbits.T1CKPS0	=	0;		// prescaler set to 1:1
	T1CONbits.T1CKPS1	=	0;
	T1CONbits.T1OSCEN	=	1;		// timer1 oscillator enable
	T1CONbits.TMR1CS	=	1;		// external clock selected
	PIR1bits.TMR1IF		=	0;		// clear timer1 overflow bit
	TMR1L			=	0x00;		// timer1 initial value
	TMR1H			=	0x00;

}

/**
 *  Set initial value (zero) for timer0 and timer1
 */
void TimersReset(void) {

	TMR0L			=	0x00;		// timer0 initial value
	TMR0H			=	0x00;
	TMR1L			=	0x00;		// timer1 initial value
	TMR1H			=	0x00;

}

/**
 *  Handle a high priority interrupt.
 */
void HighISR(void) __interrupt (1) {
	
	if(INTCONbits.TMR0IF == 1) {	// timer0 overflow
		rounds++;
		INTCONbits.TMR0IF = 0;
	}
	
}

void main(void) { 
    LCDInit();
    DelayMs(100);

	DisplayString(0, "T0 Overflows:");
	DisplayString(16, "<please wait>");
	
    TimersConfig();
	
    RCONbits.IPEN      = 1;   //enable interrupts priority levels
    INTCONbits.GIE     = 1;   //enable high priority interrupts
	
    while(1) {
		TimersReset();
		rounds = 0;
		
		T1CONbits.TMR1ON	=	1;	// enable timer1
		T0CONbits.TMR0ON	=	1;	// enable timer0
		
		while (!PIR1bits.TMR1IF) {}		// wait for timer1 overflow

		T0CONbits.TMR0ON	=	0;	// disable timer0
		T1CONbits.TMR1ON	=	0;	// disable timer1
		PIR1bits.TMR1IF		=	0; 	// clear timer1 overflow bit
		
		DisplayWORD(16, (WORD)rounds);
		LCDUpdate();
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
