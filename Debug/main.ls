   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _readingResults:
  15  0000 41a99999      	dc.w	16809,-26215
  16  0004 41ba6666      	dc.w	16826,26214
  17  0008 41c0cccc      	dc.w	16832,-13108
  18  000c 41b26666      	dc.w	16818,26214
  19  0010 41b40000      	dc.w	16820,0
  20  0014 41ae6666      	dc.w	16814,26214
  21  0018 41e59999      	dc.w	16869,-26215
  22  001c 41d59999      	dc.w	16853,-26215
  23  0020               _nbReadings:
  24  0020 41000000      	dc.w	16640,0
  53                     ; 14 unsigned int clock(void)
  53                     ; 15 {
  55                     	switch	.text
  56  0000               _clock:
  60                     ; 16 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  62  0000 c652bf        	ld	a,21183
  63  0003 5f            	clrw	x
  64  0004 97            	ld	xl,a
  65  0005 c652c0        	ld	a,21184
  66  0008 02            	rlwa	x,a
  69  0009 81            	ret
  99                     ; 19 void main(void)
  99                     ; 20 {
 100                     	switch	.text
 101  000a               _main:
 105                     ; 21 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 107  000a 725f50c0      	clr	20672
 108                     ; 22 	led_blink_init();
 110  000e cd0000        	call	_led_blink_init
 112                     ; 23 	UART_init();
 114  0011 cd0000        	call	_UART_init
 116  0014               L13:
 117                     ; 26 		led_blink();
 119  0014 cd0000        	call	_led_blink
 121                     ; 27 		UART_Poll();
 123  0017 cd0000        	call	_UART_Poll
 125                     ; 28 		UART_2PC(nbReadings, readingResults);
 127  001a ae0000        	ldw	x,#_readingResults
 128  001d 89            	pushw	x
 129  001e ae0020        	ldw	x,#_nbReadings
 130  0021 cd0000        	call	c_ltor
 132  0024 cd0000        	call	c_ftoi
 134  0027 cd0000        	call	_UART_2PC
 136  002a 85            	popw	x
 138  002b 20e7          	jra	L13
 172                     	xdef	_main
 173                     	xdef	_clock
 174                     	xdef	_nbReadings
 175                     	xdef	_readingResults
 176                     	xref	_led_blink
 177                     	xref	_led_blink_init
 178                     	xref	_UART_2PC
 179                     	xref	_UART_Poll
 180                     	xref	_UART_init
 199                     	xref	c_ftoi
 200                     	xref	c_ltor
 201                     	end
