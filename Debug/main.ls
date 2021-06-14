   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 10 unsigned int clock(void)
  41                     ; 11 {
  43                     	switch	.text
  44  0000               _clock:
  48                     ; 12 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  50  0000 c652bf        	ld	a,21183
  51  0003 5f            	clrw	x
  52  0004 97            	ld	xl,a
  53  0005 c652c0        	ld	a,21184
  54  0008 02            	rlwa	x,a
  57  0009 81            	ret
  84                     ; 15 void main(void)
  84                     ; 16 {
  85                     	switch	.text
  86  000a               _main:
  90                     ; 17 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
  92  000a 725f50c0      	clr	20672
  93                     ; 18 	led_blink_init();
  95  000e cd0000        	call	_led_blink_init
  97                     ; 19 	UART_init();
  99  0011 cd0000        	call	_UART_init
 101  0014               L13:
 102                     ; 23 		led_blink();
 104  0014 cd0000        	call	_led_blink
 106                     ; 24 		UART_Test();
 108  0017 cd0000        	call	_UART_Test
 111  001a 20f8          	jra	L13
 124                     	xdef	_main
 125                     	xdef	_clock
 126                     	xref	_led_blink
 127                     	xref	_led_blink_init
 128                     	xref	_UART_Test
 129                     	xref	_UART_init
 148                     	end
