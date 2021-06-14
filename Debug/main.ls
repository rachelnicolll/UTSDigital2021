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
  60                     	xref	_led_blink_init
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
 103                     ; 24 		GPIOB->ODR &= ~0x01;
 105  0014 72115005      	bres	20485,#0
 106                     ; 25 		if (clock() % 1000 <= 10)
 108  0018 ade6          	call	_clock
 110  001a 90ae03e8      	ldw	y,#1000
 111  001e 65            	divw	x,y
 112  001f 51            	exgw	x,y
 113  0020 a3000b        	cpw	x,#11
 114  0023 2404          	jruge	L53
 115                     ; 26 			GPIOB->ODR |= 0x01;
 117  0025 72105005      	bset	20485,#0
 118  0029               L53:
 119                     ; 27 		if (clock() % 1000 == 0)
 121  0029 add5          	call	_clock
 123  002b 90ae03e8      	ldw	y,#1000
 124  002f 65            	divw	x,y
 125  0030 51            	exgw	x,y
 126  0031 a30000        	cpw	x,#0
 127  0034 26de          	jrne	L13
 128                     ; 28 			UART_write();
 130  0036 cd0000        	call	_UART_write
 132  0039 20d9          	jra	L13
 145                     	xdef	_main
 146                     	xdef	_clock
 147                     	xref	_UART_write
 148                     	xref	_UART_init
 167                     	end
