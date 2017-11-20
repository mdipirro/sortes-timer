;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (Nov 14 2017) (UNIX)
; This file was generated Mon Nov 20 23:13:55 2017
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _clock_seconds
	global _clock_minutes
	global _clock_hours
	global _DisplayWORD
	global _DisplayString
	global _strlcpy
	global _in_setting
	global _awake_hours
	global _awake_minutes
	global _setting_hours
	global _setting_minutes
	global _time_setting_procedure
	global _awake_setting_procedure
	global _set
	global _time_value
	global _update_setting_hours
	global _update_setting_minutes
	global _update_awake_hours
	global _update_awake_minutes
	global _update_time
	global _handle_button1_pressure
	global _handle_button2_pressure
	global _high_isr
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput1
	extern __gptrget1
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
	extern _sprintf
	extern _ultoa
	extern _strlen
	extern _LCDInit
	extern _LCDUpdate
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
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


	idata
_clock_hours	db	0x00, 0x00
_clock_minutes	db	0x00, 0x00
_clock_seconds	db	0x00, 0x00
_awake_hours	db	0x00, 0x00
_awake_minutes	db	0x00, 0x00
_setting_hours	db	0x00, 0x00
_setting_minutes	db	0x00, 0x00
_time_setting_procedure	db	0x01, 0x00
_awake_setting_procedure	db	0x00, 0x00
_set	db	0x00, 0x00


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
_time_value	res	6

udata_timer_1	udata
_in_setting	res	1

udata_timer_2	udata
_DisplayWORD_WDigit_1_1	res	6

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_timer_ivec_0x1_high_isr	code	0X000008
ivec_0x1_high_isr:
	GOTO	_high_isr

; I code from now on!
; ; Starting pCode block
S_timer__main	code
_main:
;	.line	134; timer.c	time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
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
;	.line	135; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
	BANKSEL	(_time_value + 5)
;	.line	136; timer.c	time_value[5] = '\0';
	CLRF	(_time_value + 5), B
;	.line	138; timer.c	LCDInit();
	CALL	_LCDInit
;	.line	139; timer.c	DelayMs(100);
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x98
	MOVWF	r0x01
	MOVLW	0x02
	MOVWF	r0x02
	CLRF	r0x03
_00206_DS_:
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
	BNZ	_00206_DS_
;	.line	141; timer.c	RCONbits.IPEN      = 1;   //enable interrupts priority levels
	BSF	_RCONbits, 7
;	.line	142; timer.c	INTCON3bits.INT1P  = 1;   //connect INT1 interrupt (button 2) to high prio
	BSF	_INTCON3bits, 6
;	.line	143; timer.c	INTCON2bits.INT3IP = 1;
	BSF	_INTCON2bits, 1
;	.line	144; timer.c	INTCON2bits.INTEDG1= 0;   //INT1 interrupts on falling edge
	BCF	_INTCON2bits, 5
;	.line	145; timer.c	INTCON2bits.INTEDG3= 0;   //connect INT1 interrupt (button 2) to high prio
	BCF	_INTCON2bits, 3
;	.line	146; timer.c	INTCONbits.GIE     = 1;   //enable high priority interrupts
	BSF	_INTCONbits, 7
;	.line	147; timer.c	INTCON3bits.INT1F  = 0;   //clear INT1 flag
	BCF	_INTCON3bits, 0
;	.line	148; timer.c	INTCON3bits.INT3F  = 0;
	BCF	_INTCON3bits, 2
;	.line	149; timer.c	INTCON3bits.INT1E  = 1;   //enable INT1 interrupt (button 2)
	BSF	_INTCON3bits, 3
;	.line	150; timer.c	INTCON3bits.INT3E  = 1;   
	BSF	_INTCON3bits, 5
;	.line	152; timer.c	DisplayString(0,"Enter the time:");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	153; timer.c	DisplayString(16, "00:00");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	154; timer.c	LCDUpdate();
	CALL	_LCDUpdate
	BANKSEL	_in_setting
;	.line	156; timer.c	in_setting = HOURS;
	CLRF	_in_setting, B
_00220_DS_:
	BANKSEL	_awake_setting_procedure
;	.line	159; timer.c	if (awake_setting_procedure && awake_hours == 0 && awake_minutes == 0) {
	MOVF	_awake_setting_procedure, W, B
	BANKSEL	(_awake_setting_procedure + 1)
	IORWF	(_awake_setting_procedure + 1), W, B
	BZ	_00215_DS_
	BANKSEL	_awake_hours
	MOVF	_awake_hours, W, B
	BANKSEL	(_awake_hours + 1)
	IORWF	(_awake_hours + 1), W, B
	BNZ	_00215_DS_
	BANKSEL	_awake_minutes
	MOVF	_awake_minutes, W, B
	BANKSEL	(_awake_minutes + 1)
	IORWF	(_awake_minutes + 1), W, B
	BNZ	_00215_DS_
;	.line	160; timer.c	DisplayString(0, "Enter the wake:");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
	BRA	_00216_DS_
_00215_DS_:
	BANKSEL	_set
;	.line	161; timer.c	} else if (set) {
	MOVF	_set, W, B
	BANKSEL	(_set + 1)
	IORWF	(_set + 1), W, B
	BZ	_00216_DS_
;	.line	162; timer.c	DisplayString(0, "               ");
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
_00216_DS_:
;	.line	164; timer.c	DisplayString(16, &time_value[0]);
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
	BRA	_00220_DS_
	RETURN	

; ; Starting pCode block
S_timer__strlcpy	code
_strlcpy:
;	.line	269; timer.c	strlcpy(char *dst, const char *src, size_t siz)
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
;	.line	271; timer.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	272; timer.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	273; timer.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	276; timer.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00269_DS_
;	.line	278; timer.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00265_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00284_DS_
;	.line	280; timer.c	if ((*d++ = *s++) == '\0')
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
	BNZ	_00265_DS_
_00284_DS_:
;	.line	281; timer.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00269_DS_:
;	.line	286; timer.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00276_DS_
;	.line	288; timer.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00283_DS_
;	.line	289; timer.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00283_DS_:
;	.line	290; timer.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00272_DS_:
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
	BNZ	_00272_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00276_DS_:
;	.line	294; timer.c	return (s - src - 1);       /* count does not include NUL */
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
;	.line	217; timer.c	void DisplayString(BYTE pos, char* text)
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
;	.line	219; timer.c	BYTE        l = strlen(text);/*number of actual chars in the string*/
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
;	.line	220; timer.c	BYTE      max = 32-pos;    /*available space on the lcd*/
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	221; timer.c	char       *d = (char*)&LCDText[pos];
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
;	.line	223; timer.c	size_t      n = (l<max)?l:max;
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00253_DS_
	MOVFF	r0x05, r0x04
_00253_DS_:
	CLRF	r0x05
;	.line	225; timer.c	if (n != 0)
	MOVF	r0x04, W
	IORWF	r0x05, W
	BZ	_00249_DS_
_00245_DS_:
;	.line	226; timer.c	while (n-- != 0)*d++ = *s++;
	MOVFF	r0x04, r0x08
	MOVFF	r0x05, r0x09
	MOVLW	0xff
	ADDWF	r0x04, F
	BTFSS	STATUS, 0
	DECF	r0x05, F
	MOVF	r0x08, W
	IORWF	r0x09, W
	BZ	_00249_DS_
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
	BRA	_00245_DS_
_00249_DS_:
;	.line	227; timer.c	LCDUpdate();
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
;	.line	178; timer.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
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
;	.line	186; timer.c	ultoa(w, WDigit, radix);      
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
;	.line	187; timer.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00229_DS_:
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
	BNZ	_00239_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00239_DS_:
	BC	_00232_DS_
;	.line	189; timer.c	LCDText[LCDPos++] = WDigit[j];
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
;	.line	187; timer.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00229_DS_
_00232_DS_:
;	.line	191; timer.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00240_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00240_DS_:
	BC	_00228_DS_
;	.line	192; timer.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00228_DS_:
;	.line	193; timer.c	LCDUpdate();
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
S_timer__high_isr	code
_high_isr:
;	.line	122; timer.c	void high_isr(void) __interrupt (1) {
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
;	.line	123; timer.c	if(INTCON3bits.INT1F == 1) { // Button 2
	CLRF	r0x00
	BTFSC	_INTCON3bits, 0
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00191_DS_
;	.line	124; timer.c	handle_button2_pressure();
	CALL	_handle_button2_pressure
;	.line	125; timer.c	INTCON3bits.INT1F = 0;
	BCF	_INTCON3bits, 0
_00191_DS_:
;	.line	127; timer.c	if (INTCON3bits.INT3F == 1) { // Button 1
	CLRF	r0x00
	BTFSC	_INTCON3bits, 2
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00194_DS_
;	.line	128; timer.c	handle_button1_pressure();
	CALL	_handle_button1_pressure
;	.line	129; timer.c	INTCON3bits.INT3F = 0;
	BCF	_INTCON3bits, 2
_00194_DS_:
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
S_timer__handle_button2_pressure	code
_handle_button2_pressure:
;	.line	106; timer.c	void handle_button2_pressure() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_time_setting_procedure
;	.line	107; timer.c	if (time_setting_procedure) {
	MOVF	_time_setting_procedure, W, B
	BANKSEL	(_time_setting_procedure + 1)
	IORWF	(_time_setting_procedure + 1), W, B
	BZ	_00183_DS_
	BANKSEL	_in_setting
;	.line	108; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00175_DS_
;	.line	109; timer.c	update_setting_hours();
	CALL	_update_setting_hours
	BRA	_00185_DS_
_00175_DS_:
;	.line	111; timer.c	update_setting_minutes();
	CALL	_update_setting_minutes
	BRA	_00185_DS_
_00183_DS_:
	BANKSEL	_awake_setting_procedure
;	.line	113; timer.c	} else if (awake_setting_procedure) {
	MOVF	_awake_setting_procedure, W, B
	BANKSEL	(_awake_setting_procedure + 1)
	IORWF	(_awake_setting_procedure + 1), W, B
	BZ	_00185_DS_
	BANKSEL	_in_setting
;	.line	114; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00178_DS_
;	.line	115; timer.c	update_awake_hours();
	CALL	_update_awake_hours
	BRA	_00185_DS_
_00178_DS_:
;	.line	117; timer.c	update_awake_minutes();
	CALL	_update_awake_minutes
_00185_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__handle_button1_pressure	code
_handle_button1_pressure:
;	.line	81; timer.c	void handle_button1_pressure() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	BANKSEL	_time_setting_procedure
;	.line	82; timer.c	if (time_setting_procedure) {
	MOVF	_time_setting_procedure, W, B
	BANKSEL	(_time_setting_procedure + 1)
	IORWF	(_time_setting_procedure + 1), W, B
	BZ	_00167_DS_
	BANKSEL	_in_setting
;	.line	83; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00159_DS_
;	.line	84; timer.c	in_setting = MINUTES;
	MOVLW	0x01
	BANKSEL	_in_setting
	MOVWF	_in_setting, B
	BRA	_00169_DS_
_00159_DS_:
;	.line	87; timer.c	clock_hours = setting_hours;
	MOVFF	_setting_hours, _clock_hours
	MOVFF	(_setting_hours + 1), (_clock_hours + 1)
;	.line	88; timer.c	clock_minutes = setting_minutes;
	MOVFF	_setting_minutes, _clock_minutes
	MOVFF	(_setting_minutes + 1), (_clock_minutes + 1)
	BANKSEL	_clock_seconds
;	.line	89; timer.c	clock_seconds = 0;
	CLRF	_clock_seconds, B
	BANKSEL	(_clock_seconds + 1)
	CLRF	(_clock_seconds + 1), B
	BANKSEL	_time_setting_procedure
;	.line	90; timer.c	time_setting_procedure = 0; // end the time setting
	CLRF	_time_setting_procedure, B
	BANKSEL	(_time_setting_procedure + 1)
	CLRF	(_time_setting_procedure + 1), B
;	.line	91; timer.c	awake_setting_procedure = 1; // start the awake time setting
	MOVLW	0x01
	BANKSEL	_awake_setting_procedure
	MOVWF	_awake_setting_procedure, B
	BANKSEL	(_awake_setting_procedure + 1)
	CLRF	(_awake_setting_procedure + 1), B
;	.line	92; timer.c	time_value[0] = time_value[1] = time_value[3] = time_value[4] = '0';
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
	BANKSEL	_in_setting
;	.line	93; timer.c	in_setting = HOURS;
	CLRF	_in_setting, B
	BRA	_00169_DS_
_00167_DS_:
	BANKSEL	_awake_setting_procedure
;	.line	95; timer.c	} else if (awake_setting_procedure) {
	MOVF	_awake_setting_procedure, W, B
	BANKSEL	(_awake_setting_procedure + 1)
	IORWF	(_awake_setting_procedure + 1), W, B
	BZ	_00169_DS_
	BANKSEL	_in_setting
;	.line	96; timer.c	if (in_setting == HOURS) {
	MOVF	_in_setting, W, B
	BNZ	_00162_DS_
;	.line	97; timer.c	in_setting = MINUTES;
	MOVLW	0x01
	BANKSEL	_in_setting
	MOVWF	_in_setting, B
	BRA	_00169_DS_
_00162_DS_:
	BANKSEL	_awake_setting_procedure
;	.line	99; timer.c	awake_setting_procedure = 0;
	CLRF	_awake_setting_procedure, B
	BANKSEL	(_awake_setting_procedure + 1)
	CLRF	(_awake_setting_procedure + 1), B
;	.line	100; timer.c	set = 1;
	MOVLW	0x01
	BANKSEL	_set
	MOVWF	_set, B
	BANKSEL	(_set + 1)
	CLRF	(_set + 1), B
_00169_DS_:
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__update_time	code
_update_time:
;	.line	73; timer.c	void update_time(char* timeValue, int hour, int min) {
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
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
;	.line	74; timer.c	sprintf(&timeValue[0], "%02d", hour);
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	75; timer.c	timeValue[2] = ':';
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVLW	0x3a
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	76; timer.c	sprintf(&timeValue[3], "%02d", min);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	77; timer.c	DisplayString(16, timeValue);
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
;	.line	78; timer.c	LCDUpdate();
	CALL	_LCDUpdate
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
S_timer__update_awake_minutes	code
_update_awake_minutes:
;	.line	63; timer.c	void update_awake_minutes() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_awake_minutes
;	.line	64; timer.c	if (awake_minutes == 59) {
	MOVF	_awake_minutes, W, B
	XORLW	0x3b
	BNZ	_00147_DS_
	BANKSEL	(_awake_minutes + 1)
	MOVF	(_awake_minutes + 1), W, B
	BZ	_00148_DS_
_00147_DS_:
	BRA	_00142_DS_
_00148_DS_:
	BANKSEL	_awake_minutes
;	.line	65; timer.c	awake_minutes = 0;
	CLRF	_awake_minutes, B
	BANKSEL	(_awake_minutes + 1)
	CLRF	(_awake_minutes + 1), B
	BRA	_00143_DS_
_00142_DS_:
	BANKSEL	_awake_minutes
;	.line	67; timer.c	awake_minutes++;
	INCF	_awake_minutes, F, B
	BNC	_10263_DS_
	BANKSEL	(_awake_minutes + 1)
	INCF	(_awake_minutes + 1), F, B
_10263_DS_:
_00143_DS_:
;	.line	69; timer.c	sprintf(&time_value[3], "%02d", awake_minutes);
	MOVLW	HIGH(_time_value + 3)
	MOVWF	r0x01
	MOVLW	LOW(_time_value + 3)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_awake_minutes + 1)
	MOVF	(_awake_minutes + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_awake_minutes
	MOVF	_awake_minutes, W, B
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__update_awake_hours	code
_update_awake_hours:
;	.line	52; timer.c	void update_awake_hours() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_awake_hours
;	.line	53; timer.c	if (awake_hours == 23) {
	MOVF	_awake_hours, W, B
	XORLW	0x17
	BNZ	_00135_DS_
	BANKSEL	(_awake_hours + 1)
	MOVF	(_awake_hours + 1), W, B
	BZ	_00136_DS_
_00135_DS_:
	BRA	_00130_DS_
_00136_DS_:
	BANKSEL	_awake_hours
;	.line	54; timer.c	awake_hours = 0;
	CLRF	_awake_hours, B
	BANKSEL	(_awake_hours + 1)
	CLRF	(_awake_hours + 1), B
	BRA	_00131_DS_
_00130_DS_:
	BANKSEL	_awake_hours
;	.line	56; timer.c	awake_hours++;
	INCF	_awake_hours, F, B
	BNC	_20264_DS_
	BANKSEL	(_awake_hours + 1)
	INCF	(_awake_hours + 1), F, B
_20264_DS_:
_00131_DS_:
;	.line	58; timer.c	sprintf(&time_value[0], "%02d", awake_hours);
	MOVLW	HIGH(_time_value)
	MOVWF	r0x01
	MOVLW	LOW(_time_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_awake_hours + 1)
	MOVF	(_awake_hours + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_awake_hours
	MOVF	_awake_hours, W, B
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	59; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__update_setting_minutes	code
_update_setting_minutes:
;	.line	42; timer.c	void update_setting_minutes() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_setting_minutes
;	.line	43; timer.c	if (setting_minutes == 59) {
	MOVF	_setting_minutes, W, B
	XORLW	0x3b
	BNZ	_00123_DS_
	BANKSEL	(_setting_minutes + 1)
	MOVF	(_setting_minutes + 1), W, B
	BZ	_00124_DS_
_00123_DS_:
	BRA	_00118_DS_
_00124_DS_:
	BANKSEL	_setting_minutes
;	.line	44; timer.c	setting_minutes = 0;
	CLRF	_setting_minutes, B
	BANKSEL	(_setting_minutes + 1)
	CLRF	(_setting_minutes + 1), B
	BRA	_00119_DS_
_00118_DS_:
	BANKSEL	_setting_minutes
;	.line	46; timer.c	setting_minutes++;
	INCF	_setting_minutes, F, B
	BNC	_30265_DS_
	BANKSEL	(_setting_minutes + 1)
	INCF	(_setting_minutes + 1), F, B
_30265_DS_:
_00119_DS_:
;	.line	48; timer.c	sprintf(time_value + 3, "%02d", setting_minutes);
	MOVLW	HIGH(_time_value + 3)
	MOVWF	r0x01
	MOVLW	LOW(_time_value + 3)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_setting_minutes + 1)
	MOVF	(_setting_minutes + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_setting_minutes
	MOVF	_setting_minutes, W, B
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_timer__update_setting_hours	code
_update_setting_hours:
;	.line	31; timer.c	void update_setting_hours() {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_setting_hours
;	.line	32; timer.c	if (setting_hours == 23) {
	MOVF	_setting_hours, W, B
	XORLW	0x17
	BNZ	_00111_DS_
	BANKSEL	(_setting_hours + 1)
	MOVF	(_setting_hours + 1), W, B
	BZ	_00112_DS_
_00111_DS_:
	BRA	_00106_DS_
_00112_DS_:
	BANKSEL	_setting_hours
;	.line	33; timer.c	setting_hours = 0;
	CLRF	_setting_hours, B
	BANKSEL	(_setting_hours + 1)
	CLRF	(_setting_hours + 1), B
	BRA	_00107_DS_
_00106_DS_:
	BANKSEL	_setting_hours
;	.line	35; timer.c	setting_hours++;
	INCF	_setting_hours, F, B
	BNC	_40266_DS_
	BANKSEL	(_setting_hours + 1)
	INCF	(_setting_hours + 1), F, B
_40266_DS_:
_00107_DS_:
;	.line	37; timer.c	sprintf(&time_value[0], "%02d", setting_hours);
	MOVLW	HIGH(_time_value)
	MOVWF	r0x01
	MOVLW	LOW(_time_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_setting_hours + 1)
	MOVF	(_setting_hours + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_setting_hours
	MOVF	_setting_hours, W, B
	MOVWF	POSTDEC1
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sprintf
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	38; timer.c	time_value[2] = ':';
	MOVLW	0x3a
	BANKSEL	(_time_value + 2)
	MOVWF	(_time_value + 2), B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x25, 0x30, 0x32, 0x64, 0x00
; ; Starting pCode block
__str_1:
	DB	0x45, 0x6e, 0x74, 0x65, 0x72, 0x20, 0x74, 0x68, 0x65, 0x20, 0x74, 0x69
	DB	0x6d, 0x65, 0x3a, 0x00
; ; Starting pCode block
__str_2:
	DB	0x30, 0x30, 0x3a, 0x30, 0x30, 0x00
; ; Starting pCode block
__str_3:
	DB	0x45, 0x6e, 0x74, 0x65, 0x72, 0x20, 0x74, 0x68, 0x65, 0x20, 0x77, 0x61
	DB	0x6b, 0x65, 0x3a, 0x00
; ; Starting pCode block
__str_4:
	DB	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20
	DB	0x20, 0x20, 0x20, 0x00


; Statistics:
; code size:	 2552 (0x09f8) bytes ( 1.95%)
;           	 1276 (0x04fc) words
; udata size:	   13 (0x000d) bytes ( 0.34%)
; access size:	   22 (0x0016) bytes


	end
