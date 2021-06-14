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
  60                     ; 18 	GPIOB->DDR |= 0x03;
  62  0010 c65007        	ld	a,20487
  63  0013 aa03          	or	a,#3
  64  0015 c75007        	ld	20487,a
  65                     ; 19 	GPIOB->CR1 |= 0x03;
  67  0018 c65008        	ld	a,20488
  68  001b aa03          	or	a,#3
  69  001d c75008        	ld	20488,a
  70                     ; 20 }
  73  0020 81            	ret
  96                     ; 22 void led_blink()
  96                     ; 23 {
  97                     	switch	.text
  98  0021               _led_blink:
 102                     ; 25 }
 105  0021 81            	ret
 118                     	xdef	_led_blink
 119                     	xdef	_led_blink_init
 138                     	end
