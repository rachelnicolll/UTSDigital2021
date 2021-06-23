   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 8 void led_blink_init()
  41                     ; 9 {
  43                     	switch	.text
  44  0000               _led_blink_init:
  48                     ; 10 	CLK->PCKENR2 |= CLK_PCKENR2_TIM1; // Enable timer1 for LED blink
  50  0000 721250c4      	bset	20676,#1
  51                     ; 13 	TIM1->PSCRH = 0x3e; // 0011 1110
  53  0004 353e52c1      	mov	21185,#62
  54                     ; 14 	TIM1->PSCRL = 0x80; // 0111 0000
  56  0008 358052c2      	mov	21186,#128
  57                     ; 16 	TIM1->CR1 = TIM1_CR1_CEN;
  59  000c 350152b0      	mov	21168,#1
  60                     ; 18 	GPIOE->DDR |= 0x80;
  62  0010 721e5016      	bset	20502,#7
  63                     ; 19 	GPIOE->CR1 |= 0x80;
  65  0014 721e5017      	bset	20503,#7
  66                     ; 20 }
  69  0018 81            	ret
  72                     	xref	_clock
  94                     ; 22 void led_blink()
  94                     ; 23 {
  95                     	switch	.text
  96  0019               _led_blink:
 100                     ; 24 	GPIOE->ODR &= 0x7f; //0b0111 1111
 102  0019 721f5014      	bres	20500,#7
 103                     ; 25 	if (clock() % 1000 <= 500)
 105  001d 9c            	rvf
 106  001e cd0000        	call	_clock
 108  0021 9c            	rvf
 109  0022 90ae03e8      	ldw	y,#1000
 110  0026 cd0000        	call	c_idiv
 112  0029 51            	exgw	x,y
 113  002a a301f5        	cpw	x,#501
 114  002d 2e04          	jrsge	L13
 115                     ; 26 			GPIOE->ODR |= 0x80; //0b1000 000
 117  002f 721e5014      	bset	20500,#7
 118  0033               L13:
 119                     ; 27 }
 122  0033 81            	ret
 135                     	xdef	_led_blink
 136                     	xdef	_led_blink_init
 155                     	xref	c_idiv
 156                     	end
