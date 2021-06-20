   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _readingResults:
  15  0000 40000000      	dc.w	16384,0
  16  0004 40133333      	dc.w	16403,13107
  17  0008 42306666      	dc.w	16944,26214
  46                     ; 13 unsigned int clock(void)
  46                     ; 14 {
  48                     	switch	.text
  49  0000               _clock:
  53                     ; 15 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  55  0000 c652bf        	ld	a,21183
  56  0003 5f            	clrw	x
  57  0004 97            	ld	xl,a
  58  0005 c652c0        	ld	a,21184
  59  0008 02            	rlwa	x,a
  62  0009 81            	ret
  92                     ; 18 void main(void)
  92                     ; 19 {
  93                     	switch	.text
  94  000a               _main:
  98                     ; 20 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 100  000a 725f50c0      	clr	20672
 101                     ; 21 	led_blink_init();
 103  000e cd0000        	call	_led_blink_init
 105                     ; 22 	UART_init();
 107  0011 cd0000        	call	_UART_init
 109                     ; 23 	nbReadings = 3; //arbitrary number, will be passed in via I2C
 111  0014 ae0003        	ldw	x,#3
 112  0017 bf00          	ldw	_nbReadings,x
 113  0019               L13:
 114                     ; 26 		led_blink();
 116  0019 cd0000        	call	_led_blink
 118                     ; 27 		UART_Poll();
 120  001c cd0000        	call	_UART_Poll
 122                     ; 28 		UART_Welcome(nbReadings, readingResults);
 124  001f ae0000        	ldw	x,#_readingResults
 125  0022 89            	pushw	x
 126  0023 be00          	ldw	x,_nbReadings
 127  0025 cd0000        	call	_UART_Welcome
 129  0028 85            	popw	x
 131  0029 20ee          	jra	L13
 165                     	xdef	_main
 166                     	xdef	_clock
 167                     	xdef	_readingResults
 168                     	switch	.ubsct
 169  0000               _nbReadings:
 170  0000 0000          	ds.b	2
 171                     	xdef	_nbReadings
 172                     	xref	_led_blink
 173                     	xref	_led_blink_init
 174                     	xref	_UART_Welcome
 175                     	xref	_UART_Poll
 176                     	xref	_UART_init
 196                     	end
