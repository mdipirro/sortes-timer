;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Nov 15 2017) (UNIX)
; This file was generated Mon Nov 27 18:30:57 2017
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
	global _AssignDefaultValues
	global _UpdateDisplay
	global _UpdateClock
	global _DisplayWORD
	global _DisplayString
	global _strlcpy
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
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1

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

udata_timer_7	udata
_DisplayWORD_WDigit_1_1	res	6

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
;	.line	343; timer.c	LCDInit();
	CALL	_LCDInit
;	.line	344; timer.c	DelayMs(100);
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x98
	MOVWF	r0x01
	MOVLW	0x02
	MOVWF	r0x02
	CLRF	r0x03
_00245_DS_:
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
	BNZ	_00245_DS_
;	.line	350; timer.c	T1CONbits.TMR1ON	=	0;		// disable timer1
	BCF	_T1CONbits, 0
;	.line	351; timer.c	T1CONbits.RD16		=	1;		// use timer1 16-bit counter
	BSF	_T1CONbits, 7
;	.line	352; timer.c	T1CONbits.T1CKPS0	=	0;		// prescaler set to 1:1
	BCF	_T1CONbits, 4
;	.line	353; timer.c	T1CONbits.T1CKPS1	=	0;
	BCF	_T1CONbits, 5
;	.line	354; timer.c	T1CONbits.T1OSCEN	=	1;		// timer1 oscillator enable
	BSF	_T1CONbits, 3
;	.line	355; timer.c	T1CONbits.TMR1CS	=	1;		// external clock selected
	BSF	_T1CONbits, 1
;	.line	356; timer.c	PIR1bits.TMR1IF		=	0;		// clear timer1 overflow bit
	BCF	_PIR1bits, 0
;	.line	357; timer.c	PIE1bits.TMR1IE		=	1;		// timer1 interrupt enable
	BSF	_PIE1bits, 0
;	.line	358; timer.c	IPR1bits.TMR1IP		=	1;		// high priority interrupt
	BSF	_IPR1bits, 0
;	.line	359; timer.c	TMR1L				=	(0x10000 - EXTCLOCK_FREQ/2) & 0xff;	// timer1 initial value
	CLRF	_TMR1L
;	.line	360; timer.c	TMR1H				=	(0x10000 - EXTCLOCK_FREQ/2) >> 8;
	MOVLW	0xc0
	MOVWF	_TMR1H
;	.line	362; timer.c	RCONbits.IPEN      = 1;   //enable interrupts priority levels
	BSF	_RCONbits, 7
;	.line	363; timer.c	INTCON3bits.INT1P  = 1;   //connect INT1 interrupt (button 2) to high prio
	BSF	_INTCON3bits, 6
;	.line	364; timer.c	INTCON2bits.INT3IP = 1;
	BSF	_INTCON2bits, 1
;	.line	365; timer.c	INTCON2bits.INTEDG1= 0;   //INT1 interrupts on falling edge
	BCF	_INTCON2bits, 5
;	.line	366; timer.c	INTCON2bits.INTEDG3= 0;   //connect INT1 interrupt (button 2) to high prio
	BCF	_INTCON2bits, 3
;	.line	367; timer.c	INTCONbits.GIE     = 1;   //enable high priority interrupts
	BSF	_INTCONbits, 7
;	.line	368; timer.c	INTCON3bits.INT1F  = 0;   //clear INT1 flag
	BCF	_INTCON3bits, 0
;	.line	369; timer.c	INTCON3bits.INT3F  = 0;
	BCF	_INTCON3bits, 2
;	.line	370; timer.c	INTCON3bits.INT1E  = 1;   //enable INT1 interrupt (button 2)
	BSF	_INTCON3bits, 3
;	.line	371; timer.c	INTCON3bits.INT3E  = 1;   
	BSF	_INTCON3bits, 5
;	.line	373; timer.c	TRISJbits.TRISJ0	=	0; // configure PORTJ0 for output (LED)
	BCF	_TRISJbits, 0
;	.line	374; timer.c	TRISJbits.TRISJ1	=	0; // configure PORTJ1 for output (LED)
	BCF	_TRISJbits, 1
;	.line	375; timer.c	LATJbits.LATJ0		=	1;
	BSF	_LATJbits, 0
;	.line	376; timer.c	LATJbits.LATJ1		=	0;
	BCF	_LATJbits, 1
;	.line	378; timer.c	AssignDefaultValues();
	CALL	_AssignDefaultValues
_00264_DS_:
	BANKSEL	(_flags + 6)
;	.line	381; timer.c	if (flags.half_sec) {
	MOVF	(_flags + 6), W, B
	BANKSEL	(_flags + 7)
	IORWF	(_flags + 7), W, B
	BTFSC	STATUS, 2
	BRA	_00258_DS_
;	.line	382; timer.c	LATJbits.LATJ0  ^=   1; // toggle LED
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
	BANKSEL	(_flags + 6)
;	.line	383; timer.c	flags.half_sec  =    0;
	CLRF	(_flags + 6), B
	BANKSEL	(_flags + 7)
	CLRF	(_flags + 7), B
	BANKSEL	(_flags + 8)
;	.line	384; timer.c	if (flags.one_sec) {
	MOVF	(_flags + 8), W, B
	BANKSEL	(_flags + 9)
	IORWF	(_flags + 9), W, B
	BZ	_00258_DS_
;	.line	385; timer.c	UpdateClock();
	CALL	_UpdateClock
	BANKSEL	(_flags + 10)
;	.line	386; timer.c	if(flags.alarm) {
	MOVF	(_flags + 10), W, B
	BANKSEL	(_flags + 11)
	IORWF	(_flags + 11), W, B
	BZ	_00254_DS_
;	.line	387; timer.c	LATJbits.LATJ1	^=	1;
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
	BANKSEL	(_clock + 5)
;	.line	388; timer.c	if(clock.seconds > 30) {
	MOVF	(_clock + 5), W, B
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00280_DS_
	MOVLW	0x1f
	BANKSEL	(_clock + 4)
	SUBWF	(_clock + 4), W, B
_00280_DS_:
	BNC	_00254_DS_
;	.line	389; timer.c	LATJbits.LATJ1	=	0;
	BCF	_LATJbits, 1
	BANKSEL	(_flags + 10)
;	.line	390; timer.c	flags.alarm 	=	0;
	CLRF	(_flags + 10), B
	BANKSEL	(_flags + 11)
	CLRF	(_flags + 11), B
_00254_DS_:
	BANKSEL	(_flags + 8)
;	.line	393; timer.c	flags.one_sec = 0;
	CLRF	(_flags + 8), B
	BANKSEL	(_flags + 9)
	CLRF	(_flags + 9), B
_00258_DS_:
	BANKSEL	_ints
;	.line	396; timer.c	if (ints.button1) {
	MOVF	_ints, W, B
	BANKSEL	(_ints + 1)
	IORWF	(_ints + 1), W, B
	BZ	_00260_DS_
	BANKSEL	_ints
;	.line	397; timer.c	ints.button1 = 0;
	CLRF	_ints, B
	BANKSEL	(_ints + 1)
	CLRF	(_ints + 1), B
;	.line	398; timer.c	HandleButton1Pressure();
	CALL	_HandleButton1Pressure
_00260_DS_:
	BANKSEL	(_ints + 2)
;	.line	400; timer.c	if (ints.button2) {
	MOVF	(_ints + 2), W, B
	BANKSEL	(_ints + 3)
	IORWF	(_ints + 3), W, B
	BTFSC	STATUS, 2
	BRA	_00264_DS_
	BANKSEL	(_ints + 2)
;	.line	401; timer.c	ints.button2 = 0;
	CLRF	(_ints + 2), B
	BANKSEL	(_ints + 3)
	CLRF	(_ints + 3), B
;	.line	402; timer.c	HandleButton2Pressure();
	CALL	_HandleButton2Pressure
	BRA	_00264_DS_
	RETURN	

; ; Starting pCode block
S_timer__strlcpy	code
_strlcpy:
;	.line	508; timer.c	strlcpy(char *dst, const char *src, size_t siz)
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
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
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
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	510; timer.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	511; timer.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	512; timer.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	515; timer.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00327_DS_
;	.line	517; timer.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00323_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00342_DS_
;	.line	519; timer.c	if ((*d++ = *s++) == '\0')
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x15
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x15, W
	BNZ	_00323_DS_
_00342_DS_:
;	.line	520; timer.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00327_DS_:
;	.line	525; timer.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00334_DS_
;	.line	527; timer.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00341_DS_
;	.line	528; timer.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00341_DS_:
;	.line	529; timer.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00330_DS_:
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x06, W
	BNZ	_00330_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00334_DS_:
;	.line	533; timer.c	return (s - src - 1);       /* count does not include NUL */
	MOVF	r0x03, W
	SUBWF	r0x0b, W
	MOVWF	r0x03
	MOVF	r0x04, W
	SUBWFB	r0x0c, W
	MOVWF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
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
S_timer__DisplayString	code
_DisplayString:
;	.line	456; timer.c	void DisplayString(BYTE pos, char* text)
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
;	.line	458; timer.c	BYTE        l = strlen(text);/*number of actual chars in the string*/
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
;	.line	459; timer.c	BYTE      max = 32-pos;    /*available space on the lcd*/
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	460; timer.c	char       *d = (char*)&LCDText[pos];
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
;	.line	462; timer.c	size_t      n = (l<max)?l:max;
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00311_DS_
	MOVFF	r0x05, r0x04
_00311_DS_:
	CLRF	r0x05
;	.line	464; timer.c	if (n != 0)
	MOVF	r0x04, W
	IORWF	r0x05, W
	BZ	_00307_DS_
_00303_DS_:
;	.line	465; timer.c	while (n-- != 0)*d++ = *s++;
	MOVFF	r0x04, r0x08
	MOVFF	r0x05, r0x09
	MOVLW	0xff
	ADDWF	r0x04, F
	BTFSS	STATUS, 0
	DECF	r0x05, F
	MOVF	r0x08, W
	IORWF	r0x09, W
	BZ	_00307_DS_
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
	BRA	_00303_DS_
_00307_DS_:
;	.line	466; timer.c	LCDUpdate();
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
S_timer__DisplayWORD	code
_DisplayWORD:
;	.line	417; timer.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	425; timer.c	ultoa(w, WDigit, radix);      
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	426; timer.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00287_DS_:
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	r0x01, r0x04
	CLRF	r0x05
	MOVF	r0x05, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x03, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00297_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00297_DS_:
	BC	_00290_DS_
;	.line	428; timer.c	LCDText[LCDPos++] = WDigit[j];
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_LCDText)
	ADDWF	r0x02, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	426; timer.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00287_DS_
_00290_DS_:
;	.line	430; timer.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00298_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00298_DS_:
	BC	_00286_DS_
;	.line	431; timer.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00286_DS_:
;	.line	432; timer.c	LCDUpdate();
	CALL	_LCDUpdate
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
;	.line	322; timer.c	void HighISR(void) __interrupt (1) {
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
;	.line	323; timer.c	if(PIR1bits.TMR1IF == 1) {
	CLRF	r0x00
	BTFSC	_PIR1bits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00224_DS_
;	.line	324; timer.c	TMR1L			=	(0x10000 - EXTCLOCK_FREQ/2) & 0xff;	// timer1 initial value
	CLRF	_TMR1L
;	.line	325; timer.c	TMR1H			=	(0x10000 - EXTCLOCK_FREQ/2) >> 8;
	MOVLW	0xc0
	MOVWF	_TMR1H
;	.line	326; timer.c	flags.half_sec = 1;
	MOVLW	0x01
	BANKSEL	(_flags + 6)
	MOVWF	(_flags + 6), B
	BANKSEL	(_flags + 7)
	CLRF	(_flags + 7), B
;	.line	327; timer.c	if(LATJbits.LATJ0)
	BTFSS	_LATJbits, 0
	BRA	_00222_DS_
;	.line	328; timer.c	flags.one_sec = 1;
	MOVLW	0x01
	BANKSEL	(_flags + 8)
	MOVWF	(_flags + 8), B
	BANKSEL	(_flags + 9)
	CLRF	(_flags + 9), B
_00222_DS_:
;	.line	329; timer.c	PIR1bits.TMR1IF = 	0;
	BCF	_PIR1bits, 0
_00224_DS_:
;	.line	331; timer.c	if(INTCON3bits.INT1F == 1) { // Button 2
	CLRF	r0x00
	BTFSC	_INTCON3bits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00226_DS_
;	.line	332; timer.c	ints.button2 = 1;
	MOVLW	0x01
	BANKSEL	(_ints + 2)
	MOVWF	(_ints + 2), B
	BANKSEL	(_ints + 3)
	CLRF	(_ints + 3), B
;	.line	333; timer.c	INTCON3bits.INT1F = 0;
	BCF	_INTCON3bits, 0
_00226_DS_:
;	.line	335; timer.c	if (INTCON3bits.INT3F == 1) { // Button 1
	CLRF	r0x00
	BTFSC	_INTCON3bits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00229_DS_
;	.line	336; timer.c	ints.button1 = 1;
	MOVLW	0x01
	BANKSEL	_ints
	MOVWF	_ints, B
	BANKSEL	(_ints + 1)
	CLRF	(_ints + 1), B
;	.line	337; timer.c	INTCON3bits.INT3F = 0;
	BCF	_INTCON3bits, 2
_00229_DS_:
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
;	.line	300; timer.c	void UpdateClock() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	301; timer.c	UpdateTimeValue(&clock.seconds, MAX_SECONDS, 6);
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
;	.line	302; timer.c	if (!clock.seconds) { // new minute
	MOVF	(_clock + 4), W, B
	BANKSEL	(_clock + 5)
	IORWF	(_clock + 5), W, B
	BTFSS	STATUS, 2
	BRA	_00201_DS_
;	.line	303; timer.c	UpdateTimeValue(&clock.minutes, MAX_MINUTES, 3);
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
;	.line	304; timer.c	time_value[5] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 5)
	MOVWF	(_time_value + 5), B
	BANKSEL	(_clock + 2)
;	.line	305; timer.c	if (!clock.minutes) { // new hour
	MOVF	(_clock + 2), W, B
	BANKSEL	(_clock + 3)
	IORWF	(_clock + 3), W, B
	BNZ	_00196_DS_
;	.line	306; timer.c	UpdateTimeValue(&clock.hours, MAX_HOURS, 0);
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
;	.line	307; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
_00196_DS_:
	BANKSEL	(_clock + 2)
;	.line	309; timer.c	if((clock.minutes == timer.minutes) && (clock.hours == timer.hours))
	MOVF	(_clock + 2), W, B
	BANKSEL	(_timer + 2)
	XORWF	(_timer + 2), W, B
	BNZ	_00213_DS_
	BANKSEL	(_clock + 3)
	MOVF	(_clock + 3), W, B
	BANKSEL	(_timer + 3)
	XORWF	(_timer + 3), W, B
	BZ	_00214_DS_
_00213_DS_:
	BRA	_00201_DS_
_00214_DS_:
	BANKSEL	_clock
	MOVF	_clock, W, B
	BANKSEL	_timer
	XORWF	_timer, W, B
	BNZ	_00215_DS_
	BANKSEL	(_clock + 1)
	MOVF	(_clock + 1), W, B
	BANKSEL	(_timer + 1)
	XORWF	(_timer + 1), W, B
	BZ	_00216_DS_
_00215_DS_:
	BRA	_00201_DS_
_00216_DS_:
;	.line	310; timer.c	flags.alarm = 1;
	MOVLW	0x01
	BANKSEL	(_flags + 10)
	MOVWF	(_flags + 10), B
	BANKSEL	(_flags + 11)
	CLRF	(_flags + 11), B
_00201_DS_:
	BANKSEL	(_flags + 2)
;	.line	312; timer.c	if (!flags.awake_setting_procedure	&& !flags.time_setting_procedure)
	MOVF	(_flags + 2), W, B
	BANKSEL	(_flags + 3)
	IORWF	(_flags + 3), W, B
	BNZ	_00205_DS_
	BANKSEL	_flags
	MOVF	_flags, W, B
	BANKSEL	(_flags + 1)
	IORWF	(_flags + 1), W, B
	BNZ	_00205_DS_
;	.line	313; timer.c	DisplayString(16, &time_value[0]);
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
_00205_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__UpdateDisplay	code
_UpdateDisplay:
;	.line	272; timer.c	void UpdateDisplay(enum display_states state) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	273; timer.c	switch (state) {
	MOVLW	0x03
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00186_DS_
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00190_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00190_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00190_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00190_DS_:
	GOTO	_00182_DS_
	GOTO	_00183_DS_
	GOTO	_00184_DS_
_00182_DS_:
;	.line	275; timer.c	DisplayString(0,"Enter the time:");
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
;	.line	276; timer.c	DisplayString(16, &time_value[0]);
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
;	.line	277; timer.c	DisplayString(21,"   ");
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
;	.line	278; timer.c	break;
	BRA	_00186_DS_
_00183_DS_:
;	.line	280; timer.c	DisplayString(0, "Enter the awake ");
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
;	.line	281; timer.c	DisplayString(16, "time: ");
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
;	.line	282; timer.c	DisplayString(22, &time_value[0]);
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
;	.line	283; timer.c	break;
	BRA	_00186_DS_
_00184_DS_:
;	.line	285; timer.c	DisplayString(0, "                ");
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
;	.line	286; timer.c	DisplayString(16 + 6, "         ");
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
;	.line	287; timer.c	DisplayString(16, &time_value[0]);
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
_00186_DS_:
;	.line	289; timer.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__AssignDefaultValues	code
_AssignDefaultValues:
;	.line	239; timer.c	void AssignDefaultValues() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_ints
;	.line	241; timer.c	ints.button1 = 0;
	CLRF	_ints, B
	BANKSEL	(_ints + 1)
	CLRF	(_ints + 1), B
	BANKSEL	(_ints + 2)
;	.line	242; timer.c	ints.button2 = 0;
	CLRF	(_ints + 2), B
	BANKSEL	(_ints + 3)
	CLRF	(_ints + 3), B
;	.line	244; timer.c	time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
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
;	.line	245; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
	BANKSEL	(_time_value + 5)
;	.line	246; timer.c	time_value[5] = '\0';
	CLRF	(_time_value + 5), B
	BANKSEL	_in_setting
;	.line	247; timer.c	in_setting = HOURS; // start from setting the hours
	CLRF	_in_setting, B
;	.line	249; timer.c	flags.time_setting_procedure = 1;
	MOVLW	0x01
	BANKSEL	_flags
	MOVWF	_flags, B
	BANKSEL	(_flags + 1)
	CLRF	(_flags + 1), B
	BANKSEL	(_flags + 2)
;	.line	250; timer.c	flags.awake_setting_procedure = 0;
	CLRF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
	BANKSEL	(_flags + 4)
;	.line	251; timer.c	flags.set = 0;
	CLRF	(_flags + 4), B
	BANKSEL	(_flags + 5)
	CLRF	(_flags + 5), B
;	.line	252; timer.c	flags.half_sec = 1;
	MOVLW	0x01
	BANKSEL	(_flags + 6)
	MOVWF	(_flags + 6), B
	BANKSEL	(_flags + 7)
	CLRF	(_flags + 7), B
	BANKSEL	(_flags + 8)
;	.line	253; timer.c	flags.one_sec = 0;
	CLRF	(_flags + 8), B
	BANKSEL	(_flags + 9)
	CLRF	(_flags + 9), B
	BANKSEL	(_flags + 10)
;	.line	254; timer.c	flags.alarm = 0;
	CLRF	(_flags + 10), B
	BANKSEL	(_flags + 11)
	CLRF	(_flags + 11), B
	BANKSEL	_timer
;	.line	256; timer.c	timer.hours = 0;
	CLRF	_timer, B
	BANKSEL	(_timer + 1)
	CLRF	(_timer + 1), B
	BANKSEL	(_timer + 2)
;	.line	257; timer.c	timer.minutes = 0;
	CLRF	(_timer + 2), B
	BANKSEL	(_timer + 3)
	CLRF	(_timer + 3), B
	BANKSEL	_setting
;	.line	259; timer.c	setting.hours = 0;
	CLRF	_setting, B
	BANKSEL	(_setting + 1)
	CLRF	(_setting + 1), B
	BANKSEL	(_setting + 2)
;	.line	260; timer.c	setting.minutes = 0;
	CLRF	(_setting + 2), B
	BANKSEL	(_setting + 3)
	CLRF	(_setting + 3), B
;	.line	262; timer.c	UpdateDisplay(CLOCK_SETTING);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__HandleButton2Pressure	code
_HandleButton2Pressure:
;	.line	218; timer.c	void HandleButton2Pressure() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	BANKSEL	_flags
;	.line	219; timer.c	if (flags.time_setting_procedure) { // setting the clock's time
	MOVF	_flags, W, B
	BANKSEL	(_flags + 1)
	IORWF	(_flags + 1), W, B
	BZ	_00170_DS_
;	.line	221; timer.c	UpdateProperTimeValue(&setting.hours, &setting.minutes); 
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
;	.line	222; timer.c	} else if (flags.awake_setting_procedure) { // setting the awake time
	MOVF	(_flags + 2), W, B
	BANKSEL	(_flags + 3)
	IORWF	(_flags + 3), W, B
	BZ	_00167_DS_
;	.line	224; timer.c	UpdateProperTimeValue(&timer.hours, &timer.minutes);
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
;	.line	225; timer.c	} else if (flags.set) {
	MOVF	(_flags + 4), W, B
	BANKSEL	(_flags + 5)
	IORWF	(_flags + 5), W, B
	BZ	_00172_DS_
;	.line	226; timer.c	flags.awake_setting_procedure = 1;
	MOVLW	0x01
	BANKSEL	(_flags + 2)
	MOVWF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
;	.line	227; timer.c	Int2String(timer.hours, 0);
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
;	.line	228; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
;	.line	229; timer.c	Int2String(timer.minutes, 3);
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
;	.line	230; timer.c	in_setting = HOURS;
	CLRF	_in_setting, B
;	.line	231; timer.c	UpdateDisplay(TIMER_SETTING);
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
;	.line	203; timer.c	void UpdateProperTimeValue(int* const hours, int* const minutes) {
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
;	.line	204; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00157_DS_
;	.line	205; timer.c	UpdateTimeValue(hours, MAX_HOURS, 0);
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
;	.line	206; timer.c	DisplayString(16 + 6 * flags.awake_setting_procedure, &time_value[0]);
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
;	.line	208; timer.c	UpdateTimeValue(minutes, MAX_MINUTES, 3);
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
;	.line	209; timer.c	DisplayString(19 + 6 * flags.awake_setting_procedure, &time_value[3]);
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
;	.line	150; timer.c	void HandleButton1Pressure() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_flags
;	.line	151; timer.c	if (flags.time_setting_procedure) { // setting clock's time
	MOVF	_flags, W, B
	BANKSEL	(_flags + 1)
	IORWF	(_flags + 1), W, B
	BTFSC	STATUS, 2
	BRA	_00149_DS_
	BANKSEL	_in_setting
;	.line	152; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00138_DS_
;	.line	153; timer.c	CompleteHoursSetting(); // start minutes setting
	CALL	_CompleteHoursSetting
	BRA	_00151_DS_
_00138_DS_:
	BANKSEL	_setting
;	.line	156; timer.c	clock.hours = setting.hours;
	MOVF	_setting, W, B
	BANKSEL	_clock
	MOVWF	_clock, B
	BANKSEL	(_setting + 1)
	MOVF	(_setting + 1), W, B
	BANKSEL	(_clock + 1)
	MOVWF	(_clock + 1), B
	BANKSEL	(_setting + 2)
;	.line	157; timer.c	clock.minutes = setting.minutes;
	MOVF	(_setting + 2), W, B
	BANKSEL	(_clock + 2)
	MOVWF	(_clock + 2), B
	BANKSEL	(_setting + 3)
	MOVF	(_setting + 3), W, B
	BANKSEL	(_clock + 3)
	MOVWF	(_clock + 3), B
	BANKSEL	(_clock + 4)
;	.line	158; timer.c	clock.seconds = 0;
	CLRF	(_clock + 4), B
	BANKSEL	(_clock + 5)
	CLRF	(_clock + 5), B
	BANKSEL	_flags
;	.line	159; timer.c	flags.time_setting_procedure = 0; // end the time setting
	CLRF	_flags, B
	BANKSEL	(_flags + 1)
	CLRF	(_flags + 1), B
	BANKSEL	(_flags + 4)
;	.line	161; timer.c	if (!flags.set) {
	MOVF	(_flags + 4), W, B
	BANKSEL	(_flags + 5)
	IORWF	(_flags + 5), W, B
	BNZ	_00135_DS_
;	.line	162; timer.c	flags.awake_setting_procedure = 1; // start the second procedure
	MOVLW	0x01
	BANKSEL	(_flags + 2)
	MOVWF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
;	.line	164; timer.c	time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
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
;	.line	165; timer.c	UpdateDisplay(TIMER_SETTING);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	BANKSEL	_in_setting
;	.line	166; timer.c	in_setting = HOURS; // start from setting hours
	CLRF	_in_setting, B
	BRA	_00151_DS_
_00135_DS_:
;	.line	168; timer.c	SetupCompleteTime();
	CALL	_SetupCompleteTime
	BRA	_00151_DS_
_00149_DS_:
	BANKSEL	(_flags + 2)
;	.line	171; timer.c	} else if (flags.awake_setting_procedure) { // setting the awake time
	MOVF	(_flags + 2), W, B
	BANKSEL	(_flags + 3)
	IORWF	(_flags + 3), W, B
	BZ	_00146_DS_
	BANKSEL	_in_setting
;	.line	172; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00141_DS_
;	.line	173; timer.c	CompleteHoursSetting();
	CALL	_CompleteHoursSetting
	BRA	_00151_DS_
_00141_DS_:
	BANKSEL	(_flags + 2)
;	.line	176; timer.c	flags.awake_setting_procedure = 0; 
	CLRF	(_flags + 2), B
	BANKSEL	(_flags + 3)
	CLRF	(_flags + 3), B
;	.line	177; timer.c	flags.set = 1; 
	MOVLW	0x01
	BANKSEL	(_flags + 4)
	MOVWF	(_flags + 4), B
	BANKSEL	(_flags + 5)
	CLRF	(_flags + 5), B
;	.line	179; timer.c	SetupCompleteTime();
	CALL	_SetupCompleteTime
;	.line	180; timer.c	T1CONbits.TMR1ON	=	1;
	BSF	_T1CONbits, 0
	BRA	_00151_DS_
_00146_DS_:
	BANKSEL	(_flags + 4)
;	.line	182; timer.c	} else if (flags.set) {
	MOVF	(_flags + 4), W, B
	BANKSEL	(_flags + 5)
	IORWF	(_flags + 5), W, B
	BZ	_00151_DS_
;	.line	183; timer.c	flags.time_setting_procedure = 1;
	MOVLW	0x01
	BANKSEL	_flags
	MOVWF	_flags, B
	BANKSEL	(_flags + 1)
	CLRF	(_flags + 1), B
;	.line	184; timer.c	Int2String(clock.hours, 0);
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
;	.line	185; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
;	.line	186; timer.c	Int2String(clock.minutes, 3);
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
;	.line	187; timer.c	UpdateDisplay(CLOCK_SETTING);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	BANKSEL	_in_setting
;	.line	188; timer.c	in_setting = HOURS;
	CLRF	_in_setting, B
_00151_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__SetupCompleteTime	code
_SetupCompleteTime:
;	.line	134; timer.c	void SetupCompleteTime() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	136; timer.c	Int2String(clock.hours, 0);
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
;	.line	137; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
;	.line	138; timer.c	Int2String(clock.minutes, 3);
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
;	.line	139; timer.c	time_value[5] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 5)
	MOVWF	(_time_value + 5), B
;	.line	140; timer.c	Int2String(clock.seconds, 6);
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
;	.line	142; timer.c	UpdateDisplay(TIME_FLOWING);
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_UpdateDisplay
	INCF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__Int2String	code
_Int2String:
;	.line	120; timer.c	void Int2String(int value, int pos) {
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
;	.line	121; timer.c	ultoa(value, &time_value[pos], BASE);
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
;	.line	123; timer.c	if (!(time_value[pos + 1])) {
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
;	.line	124; timer.c	time_value[pos + 1] = time_value[pos];
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
;	.line	125; timer.c	time_value[pos] = '0';
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x30
	MOVWF	INDF0
;	.line	126; timer.c	time_value[pos + 2] = '\0';
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
;	.line	108; timer.c	void CompleteHoursSetting() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	109; timer.c	in_setting = MINUTES;
	MOVLW	0x01
	BANKSEL	_in_setting
	MOVWF	_in_setting, B
;	.line	110; timer.c	time_value[2] = ':'; // overwite '\0' added by ultoa when setting hours
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__UpdateTimeValue	code
_UpdateTimeValue:
;	.line	95; timer.c	void UpdateTimeValue(int* const value, int limit, int pos) {
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
;	.line	96; timer.c	if (*value == limit) {
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
;	.line	97; timer.c	*value = 0;
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
;	.line	99; timer.c	(*value)++;
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
;	.line	101; timer.c	Int2String(*value, pos);
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
; code size:	 3994 (0x0f9a) bytes ( 3.05%)
;           	 1997 (0x07cd) words
; udata size:	   46 (0x002e) bytes ( 1.20%)
; access size:	   22 (0x0016) bytes


	end
