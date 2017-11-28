;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Nov 14 2017) (UNIX)
; This file was generated Tue Nov 28 23:15:15 2017
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _UpdateTimeValue
	global _CompleteHoursSetting
	global _Int2String
	global _SetupCompleteTime
	global _HandleButton1Pressure
	global _UpdateProperTimeValue
	global _HandleButton2Pressure
	global _ConfigureRegisters
	global _AssignDefaultValues
	global _UpdateDisplay
	global _UpdateClock
	global _DisplayString
	global _in_setting
	global _flags
	global _clock
	global _timer
	global _setting
	global _ints
	global _time_value
	global _HighISR
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget2
	extern __gptrput2
	extern __gptrget1
	extern __gptrput1
	extern _EBSTCONbits
	extern _MISTATbits
	extern _EFLOCONbits
	extern _MACON1bits
	extern _MACON2bits
	extern _MACON3bits
	extern _MACON4bits
	extern _MACLCON1bits
	extern _MACLCON2bits
	extern _MICONbits
	extern _MICMDbits
	extern _EWOLIEbits
	extern _EWOLIRbits
	extern _ERXFCONbits
	extern _EIEbits
	extern _ESTATbits
	extern _ECON2bits
	extern _EIRbits
	extern _EDATAbits
	extern _SSP2CON2bits
	extern _SSP2CON1bits
	extern _SSP2STATbits
	extern _ECCP2DELbits
	extern _ECCP2ASbits
	extern _ECCP3DELbits
	extern _ECCP3ASbits
	extern _RCSTA2bits
	extern _TXSTA2bits
	extern _CCP5CONbits
	extern _CCP4CONbits
	extern _T4CONbits
	extern _ECCP1DELbits
	extern _BAUDCON2bits
	extern _BAUDCTL2bits
	extern _BAUDCONbits
	extern _BAUDCON1bits
	extern _BAUDCTLbits
	extern _BAUDCTL1bits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _PORTFbits
	extern _PORTGbits
	extern _PORTHbits
	extern _PORTJbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _LATFbits
	extern _LATGbits
	extern _LATHbits
	extern _LATJbits
	extern _DDRAbits
	extern _TRISAbits
	extern _DDRBbits
	extern _TRISBbits
	extern _DDRCbits
	extern _TRISCbits
	extern _DDRDbits
	extern _TRISDbits
	extern _DDREbits
	extern _TRISEbits
	extern _DDRFbits
	extern _TRISFbits
	extern _DDRGbits
	extern _TRISGbits
	extern _DDRHbits
	extern _TRISHbits
	extern _DDRJbits
	extern _TRISJbits
	extern _OSCTUNEbits
	extern _MEMCONbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _PIE3bits
	extern _PIR3bits
	extern _IPR3bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _RCSTA1bits
	extern _TXSTAbits
	extern _TXSTA1bits
	extern _PSPCONbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _CCP3CONbits
	extern _ECCP3CONbits
	extern _CCP2CONbits
	extern _ECCP2CONbits
	extern _CCP1CONbits
	extern _ECCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSP1CON2bits
	extern _SSPCON2bits
	extern _SSP1CON1bits
	extern _SSPCON1bits
	extern _SSP1STATbits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _ECON1bits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _stdin
	extern _stdout
	extern _LCDText
	extern _MAADR5
	extern _MAADR6
	extern _MAADR3
	extern _MAADR4
	extern _MAADR1
	extern _MAADR2
	extern _EBSTSD
	extern _EBSTCON
	extern _EBSTCS
	extern _EBSTCSL
	extern _EBSTCSH
	extern _MISTAT
	extern _EFLOCON
	extern _EPAUS
	extern _EPAUSL
	extern _EPAUSH
	extern _MACON1
	extern _MACON2
	extern _MACON3
	extern _MACON4
	extern _MABBIPG
	extern _MAIPG
	extern _MAIPGL
	extern _MAIPGH
	extern _MACLCON1
	extern _MACLCON2
	extern _MAMXFL
	extern _MAMXFLL
	extern _MAMXFLH
	extern _MICON
	extern _MICMD
	extern _MIREGADR
	extern _MIWR
	extern _MIWRL
	extern _MIWRH
	extern _MIRD
	extern _MIRDL
	extern _MIRDH
	extern _EHT0
	extern _EHT1
	extern _EHT2
	extern _EHT3
	extern _EHT4
	extern _EHT5
	extern _EHT6
	extern _EHT7
	extern _EPMM0
	extern _EPMM1
	extern _EPMM2
	extern _EPMM3
	extern _EPMM4
	extern _EPMM5
	extern _EPMM6
	extern _EPMM7
	extern _EPMCS
	extern _EPMCSL
	extern _EPMCSH
	extern _EPMO
	extern _EPMOL
	extern _EPMOH
	extern _EWOLIE
	extern _EWOLIR
	extern _ERXFCON
	extern _EPKTCNT
	extern _EWRPT
	extern _EWRPTL
	extern _EWRPTH
	extern _ETXST
	extern _ETXSTL
	extern _ETXSTH
	extern _ETXND
	extern _ETXNDL
	extern _ETXNDH
	extern _ERXST
	extern _ERXSTL
	extern _ERXSTH
	extern _ERXND
	extern _ERXNDL
	extern _ERXNDH
	extern _ERXRDPT
	extern _ERXRDPTL
	extern _ERXRDPTH
	extern _ERXWRPT
	extern _ERXWRPTL
	extern _ERXWRPTH
	extern _EDMAST
	extern _EDMASTL
	extern _EDMASTH
	extern _EDMAND
	extern _EDMANDL
	extern _EDMANDH
	extern _EDMADST
	extern _EDMADSTL
	extern _EDMADSTH
	extern _EDMACS
	extern _EDMACSL
	extern _EDMACSH
	extern _EIE
	extern _ESTAT
	extern _ECON2
	extern _EIR
	extern _EDATA
	extern _SSP2CON2
	extern _SSP2CON1
	extern _SSP2STAT
	extern _SSP2ADD
	extern _SSP2BUF
	extern _ECCP2DEL
	extern _ECCP2AS
	extern _ECCP3DEL
	extern _ECCP3AS
	extern _RCSTA2
	extern _TXSTA2
	extern _TXREG2
	extern _RCREG2
	extern _SPBRG2
	extern _CCP5CON
	extern _CCPR5
	extern _CCPR5L
	extern _CCPR5H
	extern _CCP4CON
	extern _CCPR4
	extern _CCPR4L
	extern _CCPR4H
	extern _T4CON
	extern _PR4
	extern _TMR4
	extern _ECCP1DEL
	extern _ERDPT
	extern _ERDPTL
	extern _ERDPTH
	extern _BAUDCON2
	extern _BAUDCTL2
	extern _SPBRGH2
	extern _BAUDCON
	extern _BAUDCON1
	extern _BAUDCTL
	extern _BAUDCTL1
	extern _SPBRGH
	extern _SPBRGH1
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _PORTF
	extern _PORTG
	extern _PORTH
	extern _PORTJ
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _LATF
	extern _LATG
	extern _LATH
	extern _LATJ
	extern _DDRA
	extern _TRISA
	extern _DDRB
	extern _TRISB
	extern _DDRC
	extern _TRISC
	extern _DDRD
	extern _TRISD
	extern _DDRE
	extern _TRISE
	extern _DDRF
	extern _TRISF
	extern _DDRG
	extern _TRISG
	extern _DDRH
	extern _TRISH
	extern _DDRJ
	extern _TRISJ
	extern _OSCTUNE
	extern _MEMCON
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _PIE3
	extern _PIR3
	extern _IPR3
	extern _EECON1
	extern _EECON2
	extern _RCSTA
	extern _RCSTA1
	extern _TXSTA
	extern _TXSTA1
	extern _TXREG
	extern _TXREG1
	extern _RCREG
	extern _RCREG1
	extern _SPBRG
	extern _SPBRG1
	extern _PSPCON
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _CCP3CON
	extern _ECCP3CON
	extern _CCPR3
	extern _CCPR3L
	extern _CCPR3H
	extern _CCP2CON
	extern _ECCP2CON
	extern _CCPR2
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _ECCP1CON
	extern _CCPR1
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRES
	extern _ADRESL
	extern _ADRESH
	extern _SSP1CON2
	extern _SSPCON2
	extern _SSP1CON1
	extern _SSPCON1
	extern _SSP1STAT
	extern _SSPSTAT
	extern _SSP1ADD
	extern _SSPADD
	extern _SSP1BUF
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _ECON1
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PROD
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTR
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PC
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOS
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _ultoa
	extern _strlen
	extern _LCDInit
	extern _LCDUpdate
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1

udata_timer_0	udata
_in_setting	res	1

udata_timer_1	udata
_time_value	res	9

udata_timer_2	udata
_clock	res	6

udata_timer_3	udata
_flags	res	12

udata_timer_4	udata
_setting	res	4

udata_timer_5	udata
_timer	res	4

udata_timer_6	udata
_ints	res	4

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_timer_ivec_0x1_HighISR	code	0X000008
ivec_0x1_HighISR:
	GOTO	_HighISR

; I code from now on!
; ; Starting pCode block
S_timer__main	code
_main:
;	.line	394; timer.c	LCDInit();
	CALL	_LCDInit
;	.line	395; timer.c	DelayMs(200);
	MOVLW	0x20
	MOVWF	r0x00
	MOVLW	0x30
	MOVWF	r0x01
	MOVLW	0x05
	MOVWF	r0x02
	CLRF	r0x03
_00265_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00265_DS_
;	.line	398; timer.c	ConfigureRegisters();
	CALL	_ConfigureRegisters
;	.line	399; timer.c	AssignDefaultValues();
	CALL	_AssignDefaultValues
_00287_DS_:
	BANKSEL	(_flags + 6)
;	.line	402; timer.c	if (flags.half_sec) {               // routine executed every half second
	MOVF	(_flags + 6), W, B
	BANKSEL	(_flags + 7)
	IORWF	(_flags + 7), W, B
	BTFSC	STATUS, 2
	BRA	_00281_DS_
	BANKSEL	(_flags + 8)
;	.line	404; timer.c	if (flags.one_sec) {
	MOVF	(_flags + 8), W, B
	BANKSEL	(_flags + 9)
	IORWF	(_flags + 9), W, B
	BZ	_00272_DS_
;	.line	405; timer.c	UpdateClock();
	CALL	_UpdateClock
_00272_DS_:
;	.line	408; timer.c	if (!flags.alarm && LATJbits.LATJ1)
	MOVFF	(_flags + 10), r0x00
	MOVFF	(_flags + 11), r0x01
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00274_DS_
	BTFSS	_LATJbits, 1
	BRA	_00274_DS_
;	.line	409; timer.c	LATJbits.LATJ1  = 0;
	BCF	_LATJbits, 1
_00274_DS_:
;	.line	411; timer.c	if (flags.alarm && flags.one_sec) {
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00277_DS_
	BANKSEL	(_flags + 8)
	MOVF	(_flags + 8), W, B
	BANKSEL	(_flags + 9)
	IORWF	(_flags + 9), W, B
	BZ	_00277_DS_
;	.line	412; timer.c	LATJbits.LATJ0 ^= 1;        // led0 blink
	CLRF	r0x00
	BTFSC	_LATJbits, 0
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATJbits
;	.line	413; timer.c	LATJbits.LATJ1 ^= 1;        // led1 blink
	CLRF	r0x00
	BTFSC	_LATJbits, 1
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfd
	IORWF	PRODH, W
	MOVWF	_LATJbits
	BRA	_00278_DS_
_00277_DS_:
;	.line	415; timer.c	LATJbits.LATJ0 ^= 1;        // led0 blink
	CLRF	r0x00
	BTFSC	_LATJbits, 0
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATJbits
_00278_DS_:
	BANKSEL	(_flags + 8)
;	.line	418; timer.c	flags.one_sec = 0;
	CLRF	(_flags + 8), B
	BANKSEL	(_flags + 9)
	CLRF	(_flags + 9), B
	BANKSEL	(_flags + 6)
;	.line	419; timer.c	flags.half_sec = 0;
	CLRF	(_flags + 6), B
	BANKSEL	(_flags + 7)
	CLRF	(_flags + 7), B
_00281_DS_:
	BANKSEL	_ints
;	.line	421; timer.c	if (ints.button1) {         // button 1 pressed
	MOVF	_ints, W, B
	BANKSEL	(_ints + 1)
	IORWF	(_ints + 1), W, B
	BZ	_00283_DS_
	BANKSEL	_ints
;	.line	422; timer.c	ints.button1 = 0;
	CLRF	_ints, B
	BANKSEL	(_ints + 1)
	CLRF	(_ints + 1), B
;	.line	423; timer.c	HandleButton1Pressure();
	CALL	_HandleButton1Pressure
_00283_DS_:
	BANKSEL	(_ints + 2)
;	.line	425; timer.c	if (ints.button2) {         // button 2 pressed
	MOVF	(_ints + 2), W, B
	BANKSEL	(_ints + 3)
	IORWF	(_ints + 3), W, B
	BTFSC	STATUS, 2
	BRA	_00287_DS_
	BANKSEL	(_ints + 2)
;	.line	426; timer.c	ints.button2 = 0;
	CLRF	(_ints + 2), B
	BANKSEL	(_ints + 3)
	CLRF	(_ints + 3), B
;	.line	427; timer.c	HandleButton2Pressure();
	CALL	_HandleButton2Pressure
	BRA	_00287_DS_
	RETURN	

; ; Starting pCode block
S_timer__DisplayString	code
_DisplayString:
;	.line	439; timer.c	void DisplayString(BYTE pos, char* text)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	441; timer.c	BYTE        l = strlen(text);/*number of actual chars in the string*/
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	442; timer.c	BYTE      max = 32-pos;    /*available space on the lcd*/
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	443; timer.c	char       *d = (char*)&LCDText[pos];
	CLRF	r0x06
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x07
;	.line	445; timer.c	size_t      n = (l<max)?l:max;
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00302_DS_
	MOVFF	r0x05, r0x04
_00302_DS_:
	CLRF	r0x05
;	.line	447; timer.c	if (n != 0)
	MOVF	r0x04, W
	IORWF	r0x05, W
	BZ	_00298_DS_
_00294_DS_:
;	.line	448; timer.c	while (n-- != 0)*d++ = *s++;
	MOVFF	r0x04, r0x08
	MOVFF	r0x05, r0x09
	MOVLW	0xff
	ADDWF	r0x04, F
	BTFSS	STATUS, 0
	DECF	r0x05, F
	MOVF	r0x08, W
	IORWF	r0x09, W
	BZ	_00298_DS_
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget1
	MOVWF	r0x08
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00294_DS_
_00298_DS_:
;	.line	449; timer.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__HighISR	code
_HighISR:
;	.line	373; timer.c	void HighISR(void) __interrupt (1) {
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
;	.line	374; timer.c	if(PIR1bits.TMR1IF == 1) {      // timer1 overflow (every 0.5 seconds)
	CLRF	r0x00
	BTFSC	_PIR1bits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00244_DS_
;	.line	375; timer.c	TMR1L             =     (0x10000 - EXTCLOCK_FREQ/2) & 0xff;    // timer1 reset
	CLRF	_TMR1L
;	.line	376; timer.c	TMR1H             =     (0x10000 - EXTCLOCK_FREQ/2) >> 8;
	MOVLW	0xc0
	MOVWF	_TMR1H
;	.line	377; timer.c	flags.half_sec = 1;         // set a flag every 0.5 seconds
	MOVLW	0x01
	BANKSEL	(_flags + 6)
	MOVWF	(_flags + 6), B
	BANKSEL	(_flags + 7)
	CLRF	(_flags + 7), B
;	.line	378; timer.c	if(!LATJbits.LATJ0)
	BTFSC	_LATJbits, 0
	BRA	_00242_DS_
;	.line	379; timer.c	flags.one_sec = 1;      // set a flag every second (i.e. every time led0 becomes high)
	MOVLW	0x01
	BANKSEL	(_flags + 8)
	MOVWF	(_flags + 8), B
	BANKSEL	(_flags + 9)
	CLRF	(_flags + 9), B
_00242_DS_:
;	.line	380; timer.c	PIR1bits.TMR1IF = 0;
	BCF	_PIR1bits, 0
_00244_DS_:
;	.line	382; timer.c	if(INTCON3bits.INT1F == 1) {    // button 2 ISR
	CLRF	r0x00
	BTFSC	_INTCON3bits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00246_DS_
;	.line	383; timer.c	ints.button2 = 1;           // set a flag for successive handling
	MOVLW	0x01
	BANKSEL	(_ints + 2)
	MOVWF	(_ints + 2), B
	BANKSEL	(_ints + 3)
	CLRF	(_ints + 3), B
;	.line	384; timer.c	INTCON3bits.INT1F = 0;
	BCF	_INTCON3bits, 0
_00246_DS_:
;	.line	386; timer.c	if (INTCON3bits.INT3F == 1) {   // button 1 ISR
	CLRF	r0x00
	BTFSC	_INTCON3bits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00249_DS_
;	.line	387; timer.c	ints.button1 = 1;           // set a flag for successive handling
	MOVLW	0x01
	BANKSEL	_ints
	MOVWF	_ints, B
	BANKSEL	(_ints + 1)
	CLRF	(_ints + 1), B
;	.line	388; timer.c	INTCON3bits.INT3F = 0;
	BCF	_INTCON3bits, 2
_00249_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
S_timer__UpdateClock	code
_UpdateClock:
;	.line	348; timer.c	void UpdateClock() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	349; timer.c	UpdateTimeValue(&clock.seconds, MAX_SECONDS, 6);
	MOVLW	HIGH(_clock + 4)
	MOVWF	r0x01
	MOVLW	LOW(_clock + 4)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x3b
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UpdateTimeValue
	MOVLW	0x07
	ADDWF	FSR1L, F
	BANKSEL	(_clock + 4)
;	.line	350; timer.c	if (!clock.seconds) { // new minute
	MOVF	(_clock + 4), W, B
	BANKSEL	(_clock + 5)
	IORWF	(_clock + 5), W, B
	BTFSS	STATUS, 2
	BRA	_00207_DS_
;	.line	351; timer.c	UpdateTimeValue(&clock.minutes, MAX_MINUTES, 3);
	MOVLW	HIGH(_clock + 2)
	MOVWF	r0x01
	MOVLW	LOW(_clock + 2)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x3b
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UpdateTimeValue
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	352; timer.c	time_value[5] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 5)
	MOVWF	(_time_value + 5), B
	BANKSEL	(_clock + 2)
;	.line	353; timer.c	if (!clock.minutes) { // new hour
	MOVF	(_clock + 2), W, B
	BANKSEL	(_clock + 3)
	IORWF	(_clock + 3), W, B
	BNZ	_00201_DS_
;	.line	354; timer.c	UpdateTimeValue(&clock.hours, MAX_HOURS, 0);
	MOVLW	HIGH(_clock)
	MOVWF	r0x01
	MOVLW	LOW(_clock)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x17
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UpdateTimeValue
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	355; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
_00201_DS_:
	BANKSEL	(_flags + 10)
;	.line	357; timer.c	if(!flags.alarm && (clock.minutes == timer.minutes && clock.hours == timer.hours))
	MOVF	(_flags + 10), W, B
	BANKSEL	(_flags + 11)
	IORWF	(_flags + 11), W, B
	BNZ	_00207_DS_
	BANKSEL	(_clock + 2)
	MOVF	(_clock + 2), W, B
	BANKSEL	(_timer + 2)
	XORWF	(_timer + 2), W, B
	BNZ	_00228_DS_
	BANKSEL	(_clock + 3)
	MOVF	(_clock + 3), W, B
	BANKSEL	(_timer + 3)
	XORWF	(_timer + 3), W, B
	BZ	_00229_DS_
_00228_DS_:
	BRA	_00207_DS_
_00229_DS_:
	BANKSEL	_clock
	MOVF	_clock, W, B
	BANKSEL	_timer
	XORWF	_timer, W, B
	BNZ	_00230_DS_
	BANKSEL	(_clock + 1)
	MOVF	(_clock + 1), W, B
	BANKSEL	(_timer + 1)
	XORWF	(_timer + 1), W, B
	BZ	_00231_DS_
_00230_DS_:
	BRA	_00207_DS_
_00231_DS_:
;	.line	358; timer.c	flags.alarm = 1; // alarm activation
	MOVLW	0x01
	BANKSEL	(_flags + 10)
	MOVWF	(_flags + 10), B
	BANKSEL	(_flags + 11)
	CLRF	(_flags + 11), B
_00207_DS_:
	BANKSEL	(_flags + 10)
;	.line	360; timer.c	if(flags.alarm && (clock.seconds > 30 || clock.minutes != timer.minutes || clock.hours != timer.hours))
	MOVF	(_flags + 10), W, B
	BANKSEL	(_flags + 11)
	IORWF	(_flags + 11), W, B
	BZ	_00209_DS_
	BANKSEL	(_clock + 5)
	MOVF	(_clock + 5), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00232_DS_
	MOVLW	0x1f
	BANKSEL	(_clock + 4)
	SUBWF	(_clock + 4), W, B
_00232_DS_:
	BC	_00208_DS_
	BANKSEL	(_clock + 2)
	MOVF	(_clock + 2), W, B
	BANKSEL	(_timer + 2)
	XORWF	(_timer + 2), W, B
	BNZ	_00233_DS_
	BANKSEL	(_clock + 3)
	MOVF	(_clock + 3), W, B
	BANKSEL	(_timer + 3)
	XORWF	(_timer + 3), W, B
	BZ	_00234_DS_
_00233_DS_:
	BRA	_00208_DS_
_00234_DS_:
	BANKSEL	_clock
	MOVF	_clock, W, B
	BANKSEL	_timer
	XORWF	_timer, W, B
	BNZ	_00208_DS_
	BANKSEL	(_clock + 1)
	MOVF	(_clock + 1), W, B
	BANKSEL	(_timer + 1)
	XORWF	(_timer + 1), W, B
	BZ	_00209_DS_
_00208_DS_:
	BANKSEL	(_flags + 10)
;	.line	361; timer.c	flags.alarm = 0;     // alarm deactivation after ~30 seconds or after clock change
	CLRF	(_flags + 10), B
	BANKSEL	(_flags + 11)
	CLRF	(_flags + 11), B
_00209_DS_:
	BANKSEL	(_flags + 2)
;	.line	362; timer.c	if (!flags.awake_setting_procedure    && !flags.time_setting_procedure)
	MOVF	(_flags + 2), W, B
	BANKSEL	(_flags + 3)
	IORWF	(_flags + 3), W, B
	BNZ	_00216_DS_
	BANKSEL	_flags
	MOVF	_flags, W, B
	BANKSEL	(_flags + 1)
	IORWF	(_flags + 1), W, B
	BNZ	_00216_DS_
;	.line	363; timer.c	DisplayString(16, &time_value[0]);
	MOVLW	HIGH(_time_value)
	MOVWF	r0x01
	MOVLW	LOW(_time_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00216_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__UpdateDisplay	code
_UpdateDisplay:
;	.line	320; timer.c	void UpdateDisplay(enum display_states state) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	321; timer.c	switch (state) {
	MOVLW	0x03
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00191_DS_
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00195_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00195_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00195_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00195_DS_:
	GOTO	_00187_DS_
	GOTO	_00188_DS_
	GOTO	_00189_DS_
_00187_DS_:
;	.line	323; timer.c	DisplayString(0,"Enter the time:");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	324; timer.c	DisplayString(16, &time_value[0]);
	MOVLW	HIGH(_time_value)
	MOVWF	r0x01
	MOVLW	LOW(_time_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	325; timer.c	DisplayString(21,"   ");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVLW	0x15
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	326; timer.c	break;
	BRA	_00191_DS_
_00188_DS_:
;	.line	328; timer.c	DisplayString(0, "Enter the awake ");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	329; timer.c	DisplayString(16, "time: ");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	330; timer.c	DisplayString(22, &time_value[0]);
	MOVLW	HIGH(_time_value)
	MOVWF	r0x01
	MOVLW	LOW(_time_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x16
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	331; timer.c	break;
	BRA	_00191_DS_
_00189_DS_:
;	.line	333; timer.c	DisplayString(0, "                ");
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	334; timer.c	DisplayString(16 + 6, "         ");
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	MOVLW	0x16
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	335; timer.c	DisplayString(16, &time_value[0]);
	MOVLW	HIGH(_time_value)
	MOVWF	r0x01
	MOVLW	LOW(_time_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00191_DS_:
;	.line	337; timer.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__AssignDefaultValues	code
_AssignDefaultValues:
;	.line	287; timer.c	void AssignDefaultValues() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_ints
;	.line	289; timer.c	ints.button1 = 0;
	CLRF	_ints, B
	BANKSEL	(_ints + 1)
	CLRF	(_ints + 1), B
	BANKSEL	(_ints + 2)
;	.line	290; timer.c	ints.button2 = 0;
	CLRF	(_ints + 2), B
	BANKSEL	(_ints + 3)
	CLRF	(_ints + 3), B
;	.line	292; timer.c	time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
	MOVLW	0x30
	BANKSEL	(_time_value + 4)
	MOVWF	(_time_value + 4), B
	MOVLW	0x30
	BANKSEL	(_time_value + 3)
	MOVWF	(_time_value + 3), B
	MOVLW	0x30
	BANKSEL	(_time_value + 1)
	MOVWF	(_time_value + 1), B
	MOVLW	0x30
	BANKSEL	_time_value
	MOVWF	_time_value, B
;	.line	293; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
	BANKSEL	(_time_value + 5)
;	.line	294; timer.c	time_value[5] = '\0';
	CLRF	(_time_value + 5), B
	BANKSEL	_in_setting
;	.line	295; timer.c	in_setting = HOURS; // start from setting the hours
	CLRF	_in_setting, B
;	.line	297; timer.c	flags.time_setting_procedure = 1;
	MOVLW	0x01
	BANKSEL	_flags
	MOVWF	_flags, B
	BANKSEL	(_flags + 1)
	CLRF	(_flags + 1), B
	BANKSEL	(_flags + 2)
;	.line	298; timer.c	flags.awake_setting_procedure = 0;
	CLRF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
	BANKSEL	(_flags + 4)
;	.line	299; timer.c	flags.set = 0;
	CLRF	(_flags + 4), B
	BANKSEL	(_flags + 5)
	CLRF	(_flags + 5), B
	BANKSEL	(_flags + 6)
;	.line	300; timer.c	flags.half_sec = 0;
	CLRF	(_flags + 6), B
	BANKSEL	(_flags + 7)
	CLRF	(_flags + 7), B
	BANKSEL	(_flags + 8)
;	.line	301; timer.c	flags.one_sec = 0;
	CLRF	(_flags + 8), B
	BANKSEL	(_flags + 9)
	CLRF	(_flags + 9), B
	BANKSEL	(_flags + 10)
;	.line	302; timer.c	flags.alarm = 0;
	CLRF	(_flags + 10), B
	BANKSEL	(_flags + 11)
	CLRF	(_flags + 11), B
	BANKSEL	_timer
;	.line	304; timer.c	timer.hours = 0;
	CLRF	_timer, B
	BANKSEL	(_timer + 1)
	CLRF	(_timer + 1), B
	BANKSEL	(_timer + 2)
;	.line	305; timer.c	timer.minutes = 0;
	CLRF	(_timer + 2), B
	BANKSEL	(_timer + 3)
	CLRF	(_timer + 3), B
	BANKSEL	_setting
;	.line	307; timer.c	setting.hours = 0;
	CLRF	_setting, B
	BANKSEL	(_setting + 1)
	CLRF	(_setting + 1), B
	BANKSEL	(_setting + 2)
;	.line	308; timer.c	setting.minutes = 0;
	CLRF	(_setting + 2), B
	BANKSEL	(_setting + 3)
	CLRF	(_setting + 3), B
;	.line	310; timer.c	UpdateDisplay(CLOCK_SETTING);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__ConfigureRegisters	code
_ConfigureRegisters:
;	.line	245; timer.c	void ConfigureRegisters() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	247; timer.c	INTCONbits.GIE      =   1;   //enable high priority interrupts
	BSF	_INTCONbits, 7
;	.line	248; timer.c	RCONbits.IPEN       =   1;   //enable interrupts priority levels
	BSF	_RCONbits, 7
;	.line	254; timer.c	T1CONbits.TMR1ON    =   0;    // disable timer1
	BCF	_T1CONbits, 0
;	.line	255; timer.c	T1CONbits.RD16      =   1;    // use timer1 16-bit counter
	BSF	_T1CONbits, 7
;	.line	256; timer.c	T1CONbits.T1CKPS0   =   0;    // prescaler set to 1:1
	BCF	_T1CONbits, 4
;	.line	257; timer.c	T1CONbits.T1CKPS1   =   0;
	BCF	_T1CONbits, 5
;	.line	258; timer.c	T1CONbits.T1OSCEN   =   1;    // timer1 oscillator enable
	BSF	_T1CONbits, 3
;	.line	259; timer.c	T1CONbits.TMR1CS    =   1;    // external clock selected
	BSF	_T1CONbits, 1
;	.line	260; timer.c	PIR1bits.TMR1IF     =   0;    // clear timer1 overflow bit
	BCF	_PIR1bits, 0
;	.line	261; timer.c	PIE1bits.TMR1IE     =   1;    // timer1 interrupt enable
	BSF	_PIE1bits, 0
;	.line	262; timer.c	IPR1bits.TMR1IP     =   1;    // high priority interrupt
	BSF	_IPR1bits, 0
;	.line	263; timer.c	TMR1L               =   (0x10000 - EXTCLOCK_FREQ/2) & 0xff;    // timer1 initial value
	CLRF	_TMR1L
;	.line	264; timer.c	TMR1H               =   (0x10000 - EXTCLOCK_FREQ/2) >> 8;
	MOVLW	0xc0
	MOVWF	_TMR1H
;	.line	267; timer.c	INTCON3bits.INT1P   =   1;    //connect INT1 interrupt (button 2) to high prio
	BSF	_INTCON3bits, 6
;	.line	268; timer.c	INTCON2bits.INT3IP  =   1;    //connect INT3 interrupt (button 1) to high prio
	BSF	_INTCON2bits, 1
;	.line	269; timer.c	INTCON2bits.INTEDG1 =   0;    //INT1 interrupts on falling edge
	BCF	_INTCON2bits, 5
;	.line	270; timer.c	INTCON2bits.INTEDG3 =   0;    //INT3 interrupts on falling edge
	BCF	_INTCON2bits, 3
;	.line	271; timer.c	INTCON3bits.INT1F   =   0;    //clear INT1 flag
	BCF	_INTCON3bits, 0
;	.line	272; timer.c	INTCON3bits.INT3F   =   0;    //clear INT3 flag
	BCF	_INTCON3bits, 2
;	.line	273; timer.c	INTCON3bits.INT1E   =   1;    //enable INT1 interrupt (button 2)
	BSF	_INTCON3bits, 3
;	.line	274; timer.c	INTCON3bits.INT3E   =   1;    //enable INT1 interrupt (button 1)
	BSF	_INTCON3bits, 5
;	.line	277; timer.c	TRISJbits.TRISJ0    =   0;    // configure PORTJ0 for output (led0)
	BCF	_TRISJbits, 0
;	.line	278; timer.c	TRISJbits.TRISJ1    =   0;    // configure PORTJ1 for output (led1)
	BCF	_TRISJbits, 1
;	.line	279; timer.c	LATJbits.LATJ0      =   1;    // led0 output high
	BSF	_LATJbits, 0
;	.line	280; timer.c	LATJbits.LATJ1      =   0;    // led1 output low
	BCF	_LATJbits, 1
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__HandleButton2Pressure	code
_HandleButton2Pressure:
;	.line	224; timer.c	void HandleButton2Pressure() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	BANKSEL	_flags
;	.line	225; timer.c	if (flags.time_setting_procedure) { // setting the clock's time
	MOVF	_flags, W, B
	BANKSEL	(_flags + 1)
	IORWF	(_flags + 1), W, B
	BZ	_00170_DS_
;	.line	227; timer.c	UpdateProperTimeValue(&setting.hours, &setting.minutes); 
	MOVLW	HIGH(_setting)
	MOVWF	r0x01
	MOVLW	LOW(_setting)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_setting + 2)
	MOVWF	r0x04
	MOVLW	LOW(_setting + 2)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UpdateProperTimeValue
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_00172_DS_
_00170_DS_:
	BANKSEL	(_flags + 2)
;	.line	228; timer.c	} else if (flags.awake_setting_procedure) { // setting the awake time
	MOVF	(_flags + 2), W, B
	BANKSEL	(_flags + 3)
	IORWF	(_flags + 3), W, B
	BZ	_00167_DS_
;	.line	230; timer.c	UpdateProperTimeValue(&timer.hours, &timer.minutes);
	MOVLW	HIGH(_timer)
	MOVWF	r0x01
	MOVLW	LOW(_timer)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_timer + 2)
	MOVWF	r0x04
	MOVLW	LOW(_timer + 2)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UpdateProperTimeValue
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_00172_DS_
_00167_DS_:
	BANKSEL	(_flags + 4)
;	.line	231; timer.c	} else if (flags.set) {
	MOVF	(_flags + 4), W, B
	BANKSEL	(_flags + 5)
	IORWF	(_flags + 5), W, B
	BZ	_00172_DS_
;	.line	232; timer.c	flags.awake_setting_procedure = 1;
	MOVLW	0x01
	BANKSEL	(_flags + 2)
	MOVWF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
;	.line	233; timer.c	Int2String(timer.hours, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_timer + 1)
	MOVF	(_timer + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_timer
	MOVF	_timer, W, B
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	234; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
;	.line	235; timer.c	Int2String(timer.minutes, 3);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	BANKSEL	(_timer + 3)
	MOVF	(_timer + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_timer + 2)
	MOVF	(_timer + 2), W, B
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_in_setting
;	.line	236; timer.c	in_setting = HOURS;
	CLRF	_in_setting, B
;	.line	237; timer.c	UpdateDisplay(TIMER_SETTING);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
_00172_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__UpdateProperTimeValue	code
_UpdateProperTimeValue:
;	.line	209; timer.c	void UpdateProperTimeValue(int* const hours, int* const minutes) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	BANKSEL	_in_setting
;	.line	210; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00157_DS_
;	.line	211; timer.c	UpdateTimeValue(hours, MAX_HOURS, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x17
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UpdateTimeValue
	MOVLW	0x07
	ADDWF	FSR1L, F
	BANKSEL	(_flags + 2)
;	.line	212; timer.c	DisplayString(16 + 6 * flags.awake_setting_procedure, &time_value[0]);
	MOVF	(_flags + 2), W, B
	MOVWF	r0x00
; ;multiply lit val:0x06 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x00, W
	MULLW	0x06
	MOVFF	PRODL, r0x00
	MOVLW	0x10
	ADDWF	r0x00, F
	MOVLW	HIGH(_time_value)
	MOVWF	r0x02
	MOVLW	LOW(_time_value)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00159_DS_
_00157_DS_:
;	.line	214; timer.c	UpdateTimeValue(minutes, MAX_MINUTES, 3);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x3b
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UpdateTimeValue
	MOVLW	0x07
	ADDWF	FSR1L, F
	BANKSEL	(_flags + 2)
;	.line	215; timer.c	DisplayString(19 + 6 * flags.awake_setting_procedure, &time_value[3]);
	MOVF	(_flags + 2), W, B
	MOVWF	r0x00
; ;multiply lit val:0x06 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	MOVF	r0x00, W
	MULLW	0x06
	MOVFF	PRODL, r0x00
	MOVLW	0x13
	ADDWF	r0x00, F
	MOVLW	HIGH(_time_value + 3)
	MOVWF	r0x02
	MOVLW	LOW(_time_value + 3)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00159_DS_:
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__HandleButton1Pressure	code
_HandleButton1Pressure:
;	.line	153; timer.c	void HandleButton1Pressure() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_flags
;	.line	154; timer.c	if (flags.time_setting_procedure) { // setting clock's time
	MOVF	_flags, W, B
	BANKSEL	(_flags + 1)
	IORWF	(_flags + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00149_DS_
	BANKSEL	_in_setting
;	.line	155; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00138_DS_
;	.line	156; timer.c	CompleteHoursSetting(); // start minutes setting
	CALL	_CompleteHoursSetting
	BRA	_00151_DS_
_00138_DS_:
	BANKSEL	_setting
;	.line	159; timer.c	clock.hours = setting.hours;
	MOVF	_setting, W, B
	BANKSEL	_clock
	MOVWF	_clock, B
	BANKSEL	(_setting + 1)
	MOVF	(_setting + 1), W, B
	BANKSEL	(_clock + 1)
	MOVWF	(_clock + 1), B
	BANKSEL	(_setting + 2)
;	.line	160; timer.c	clock.minutes = setting.minutes;
	MOVF	(_setting + 2), W, B
	BANKSEL	(_clock + 2)
	MOVWF	(_clock + 2), B
	BANKSEL	(_setting + 3)
	MOVF	(_setting + 3), W, B
	BANKSEL	(_clock + 3)
	MOVWF	(_clock + 3), B
	BANKSEL	(_clock + 4)
;	.line	161; timer.c	clock.seconds = 0;
	CLRF	(_clock + 4), B
	BANKSEL	(_clock + 5)
	CLRF	(_clock + 5), B
	BANKSEL	_flags
;	.line	162; timer.c	flags.time_setting_procedure = 0; // end the time setting
	CLRF	_flags, B
	BANKSEL	(_flags + 1)
	CLRF	(_flags + 1), B
	BANKSEL	(_flags + 4)
;	.line	164; timer.c	if (!flags.set) {
	MOVF	(_flags + 4), W, B
	BANKSEL	(_flags + 5)
	IORWF	(_flags + 5), W, B
	BNZ	_00135_DS_
;	.line	165; timer.c	flags.awake_setting_procedure = 1; // start the second procedure
	MOVLW	0x01
	BANKSEL	(_flags + 2)
	MOVWF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
;	.line	167; timer.c	time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
	MOVLW	0x30
	BANKSEL	(_time_value + 4)
	MOVWF	(_time_value + 4), B
	MOVLW	0x30
	BANKSEL	(_time_value + 3)
	MOVWF	(_time_value + 3), B
	MOVLW	0x30
	BANKSEL	(_time_value + 1)
	MOVWF	(_time_value + 1), B
	MOVLW	0x30
	BANKSEL	_time_value
	MOVWF	_time_value, B
;	.line	168; timer.c	UpdateDisplay(TIMER_SETTING);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	BANKSEL	_in_setting
;	.line	169; timer.c	in_setting = HOURS; // start from setting hours
	CLRF	_in_setting, B
	BRA	_00151_DS_
_00135_DS_:
;	.line	171; timer.c	SetupCompleteTime();
	CALL	_SetupCompleteTime
	BRA	_00151_DS_
_00149_DS_:
	BANKSEL	(_flags + 2)
;	.line	174; timer.c	} else if (flags.awake_setting_procedure) { // setting the awake time
	MOVF	(_flags + 2), W, B
	BANKSEL	(_flags + 3)
	IORWF	(_flags + 3), W, B
	BZ	_00146_DS_
	BANKSEL	_in_setting
;	.line	175; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00141_DS_
;	.line	176; timer.c	CompleteHoursSetting();
	CALL	_CompleteHoursSetting
	BRA	_00151_DS_
_00141_DS_:
	BANKSEL	(_flags + 2)
;	.line	179; timer.c	flags.awake_setting_procedure = 0; 
	CLRF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
;	.line	180; timer.c	flags.set = 1; 
	MOVLW	0x01
	BANKSEL	(_flags + 4)
	MOVWF	(_flags + 4), B
	BANKSEL	(_flags + 5)
	CLRF	(_flags + 5), B
;	.line	182; timer.c	SetupCompleteTime();
	CALL	_SetupCompleteTime
;	.line	183; timer.c	T1CONbits.TMR1ON    =    1;
	BSF	_T1CONbits, 0
	BRA	_00151_DS_
_00146_DS_:
	BANKSEL	(_flags + 4)
;	.line	185; timer.c	} else if (flags.set) {
	MOVF	(_flags + 4), W, B
	BANKSEL	(_flags + 5)
	IORWF	(_flags + 5), W, B
	BTFSC	STATUS, 2
	BRA	_00151_DS_
	BANKSEL	_clock
;	.line	187; timer.c	setting.hours   = clock.hours;
	MOVF	_clock, W, B
	BANKSEL	_setting
	MOVWF	_setting, B
	BANKSEL	(_clock + 1)
	MOVF	(_clock + 1), W, B
	BANKSEL	(_setting + 1)
	MOVWF	(_setting + 1), B
	BANKSEL	(_clock + 2)
;	.line	188; timer.c	setting.minutes = clock.minutes;
	MOVF	(_clock + 2), W, B
	BANKSEL	(_setting + 2)
	MOVWF	(_setting + 2), B
	BANKSEL	(_clock + 3)
	MOVF	(_clock + 3), W, B
	BANKSEL	(_setting + 3)
	MOVWF	(_setting + 3), B
;	.line	189; timer.c	flags.time_setting_procedure = 1; // start the time setting
	MOVLW	0x01
	BANKSEL	_flags
	MOVWF	_flags, B
	BANKSEL	(_flags + 1)
	CLRF	(_flags + 1), B
;	.line	190; timer.c	Int2String(setting.hours, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_setting + 1)
	MOVF	(_setting + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_setting
	MOVF	_setting, W, B
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	191; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
;	.line	192; timer.c	Int2String(setting.minutes, 3);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	BANKSEL	(_setting + 3)
	MOVF	(_setting + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_setting + 2)
	MOVF	(_setting + 2), W, B
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	193; timer.c	UpdateDisplay(CLOCK_SETTING);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	BANKSEL	_in_setting
;	.line	194; timer.c	in_setting = HOURS;
	CLRF	_in_setting, B
_00151_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__SetupCompleteTime	code
_SetupCompleteTime:
;	.line	137; timer.c	void SetupCompleteTime() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	139; timer.c	Int2String(clock.hours, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_clock + 1)
	MOVF	(_clock + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_clock
	MOVF	_clock, W, B
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	140; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
;	.line	141; timer.c	Int2String(clock.minutes, 3);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	BANKSEL	(_clock + 3)
	MOVF	(_clock + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_clock + 2)
	MOVF	(_clock + 2), W, B
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	142; timer.c	time_value[5] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 5)
	MOVWF	(_time_value + 5), B
;	.line	143; timer.c	Int2String(clock.seconds, 6);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	BANKSEL	(_clock + 5)
	MOVF	(_clock + 5), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_clock + 4)
	MOVF	(_clock + 4), W, B
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	145; timer.c	UpdateDisplay(TIME_FLOWING);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__Int2String	code
_Int2String:
;	.line	123; timer.c	void Int2String(int value, int pos) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	124; timer.c	ultoa(value, &time_value[pos], BASE);
	CLRF	WREG
	BTFSC	r0x01, 7
	MOVLW	0xff
	MOVWF	r0x04
	MOVWF	r0x05
	MOVLW	LOW(_time_value)
	ADDWF	r0x02, W
	MOVWF	r0x06
	MOVLW	HIGH(_time_value)
	ADDWFC	r0x03, W
	MOVWF	r0x07
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	126; timer.c	if (!(time_value[pos + 1])) {
	MOVF	r0x02, W
	MOVWF	r0x00
	INCF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x04
	BTFSC	r0x01, 7
	SETF	r0x04
	MOVLW	LOW(_time_value)
	ADDWF	r0x01, F
	MOVLW	HIGH(_time_value)
	ADDWFC	r0x04, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x05
	MOVF	r0x05, W
	BNZ	_00124_DS_
;	.line	127; timer.c	time_value[pos + 1] = time_value[pos];
	MOVLW	LOW(_time_value)
	ADDWF	r0x02, F
	MOVLW	HIGH(_time_value)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x05
	MOVFF	r0x01, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, INDF0
;	.line	128; timer.c	time_value[pos] = '0';
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x30
	MOVWF	INDF0
;	.line	129; timer.c	time_value[pos + 2] = '\0';
	INCF	r0x00, F
	INCF	r0x00, F
	CLRF	r0x01
	BTFSC	r0x00, 7
	SETF	r0x01
	MOVLW	LOW(_time_value)
	ADDWF	r0x00, F
	MOVLW	HIGH(_time_value)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00124_DS_:
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__CompleteHoursSetting	code
_CompleteHoursSetting:
;	.line	111; timer.c	void CompleteHoursSetting() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	112; timer.c	in_setting = MINUTES;
	MOVLW	0x01
	BANKSEL	_in_setting
	MOVWF	_in_setting, B
;	.line	113; timer.c	time_value[2] = ':'; // overwite '\0' added by ultoa when setting hours
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__UpdateTimeValue	code
_UpdateTimeValue:
;	.line	98; timer.c	void UpdateTimeValue(int* const value, int limit, int pos) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
;	.line	99; timer.c	if (*value == limit) {
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVF	r0x07, W
	XORWF	r0x03, W
	BNZ	_00111_DS_
	MOVF	r0x08, W
	XORWF	r0x04, W
	BZ	_00112_DS_
_00111_DS_:
	BRA	_00106_DS_
_00112_DS_:
;	.line	100; timer.c	*value = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
	BRA	_00107_DS_
_00106_DS_:
;	.line	102; timer.c	(*value)++;
	INCF	r0x07, F
	BTFSC	STATUS, 0
	INCF	r0x08, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
_00107_DS_:
;	.line	104; timer.c	Int2String(*value, pos);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget2
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Int2String
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x45, 0x6e, 0x74, 0x65, 0x72, 0x20, 0x74, 0x68, 0x65, 0x20, 0x74, 0x69
	DB	0x6d, 0x65, 0x3a, 0x00
; ; Starting pCode block
__str_1:
	DB	0x20, 0x20, 0x20, 0x00
; ; Starting pCode block
__str_2:
	DB	0x45, 0x6e, 0x74, 0x65, 0x72, 0x20, 0x74, 0x68, 0x65, 0x20, 0x61, 0x77
	DB	0x61, 0x6b, 0x65, 0x20, 0x00
; ; Starting pCode block
__str_3:
	DB	0x74, 0x69, 0x6d, 0x65, 0x3a, 0x20, 0x00
; ; Starting pCode block
__str_4:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x20, 0x00
; ; Starting pCode block
__str_5:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00


; Statistics:
; code size:	 3358 (0x0d1e) bytes ( 2.56%)
;           	 1679 (0x068f) words
; udata size:	   40 (0x0028) bytes ( 1.04%)
; access size:	   10 (0x000a) bytes


	end
