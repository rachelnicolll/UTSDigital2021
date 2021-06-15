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
  85                     ; 15 void main(void)
  85                     ; 16 {
  86                     	switch	.text
  87  000a               _main:
  91                     ; 17 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
  93  000a 725f50c0      	clr	20672
  94                     ; 18 	led_blink_init();
  96  000e cd0000        	call	_led_blink_init
  98                     ; 19 	UART_init();
 100  0011 cd0000        	call	_UART_init
 102  0014               L13:
 103                     ; 23 		led_blink();
 105  0014 cd0000        	call	_led_blink
 107                     ; 24 		UART_Poll();
 109  0017 cd0000        	call	_UART_Poll
 111                     ; 25 		UART_Welcome();
 113  001a cd0000        	call	_UART_Welcome
 116  001d 20f5          	jra	L13
 129                     	xdef	_main
 130                     	xdef	_clock
 131                     	xref	_led_blink
 132                     	xref	_led_blink_init
 133                     	xref	_UART_Welcome
 134                     	xref	_UART_Poll
 135                     	xref	_UART_init
 154                     	end
