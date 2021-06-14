   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     .const:	section	.text
  14  0000               _op:
  15  0000 686568652100  	dc.b	"hehe!",0
  16  0006               _pressMSG:
  17  0006 505245535345  	dc.b	"PRESSED ME!",0
  18                     	bsct
  19  0000               _state:
  20  0000 00            	dc.b	0
  49                     ; 19 unsigned int clock(void)
  49                     ; 20 {
  51                     	switch	.text
  52  0000               _clock:
  56                     ; 21 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  58  0000 c652bf        	ld	a,21183
  59  0003 5f            	clrw	x
  60  0004 97            	ld	xl,a
  61  0005 c652c0        	ld	a,21184
  62  0008 02            	rlwa	x,a
  65  0009 81            	ret
  92                     ; 24 void main(void)
  92                     ; 25 {
  93                     	switch	.text
  94  000a               _main:
  98                     ; 26 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 100  000a 725f50c0      	clr	20672
 101                     ; 27 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 103  000e c650c4        	ld	a,20676
 104  0011 aaff          	or	a,#255
 105  0013 c750c4        	ld	20676,a
 106                     ; 28 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 108  0016 c650c3        	ld	a,20675
 109  0019 aaff          	or	a,#255
 110  001b c750c3        	ld	20675,a
 111                     ; 38 	GPIOB->DDR |= 0x03;
 113  001e c65007        	ld	a,20487
 114  0021 aa03          	or	a,#3
 115  0023 c75007        	ld	20487,a
 116                     ; 39 	GPIOB->CR1 |= 0x03;
 118  0026 c65008        	ld	a,20488
 119  0029 aa03          	or	a,#3
 120  002b c75008        	ld	20488,a
 121                     ; 42 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
 123  002e 3508500c      	mov	20492,#8
 124                     ; 43 	GPIOC->CR1 = 0x08; // 0b0000 1000
 126  0032 3508500d      	mov	20493,#8
 127                     ; 46 	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
 129  0036 35085235      	mov	21045,#8
 130                     ; 47 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
 132  003a c65236        	ld	a,21046
 133  003d a4cf          	and	a,#207
 134  003f c75236        	ld	21046,a
 135                     ; 48 	USART1->BRR2 = 0x03;
 137  0042 35035233      	mov	21043,#3
 138                     ; 49 	USART1->BRR1 = 0x68; // 9600 baud
 140  0046 35685232      	mov	21042,#104
 141                     ; 52 	SPI_init();
 143  004a cd0000        	call	_SPI_init
 145                     ; 53 	BTN_init();
 147  004d cd0000        	call	_BTN_init
 149                     ; 54 	LCD_init();
 151  0050 cd0000        	call	_LCD_init
 153  0053               L13:
 154                     ; 80 		SPI_write(0xFF);
 156  0053 a6ff          	ld	a,#255
 157  0055 cd0000        	call	_SPI_write
 160  0058 20f9          	jra	L13
 225                     	xdef	_main
 226                     	xdef	_clock
 227                     	xdef	_state
 228                     	xdef	_pressMSG
 229                     	xdef	_op
 230                     	xref	_BTN_init
 231                     	xref	_LCD_init
 232                     	xref	_SPI_write
 233                     	xref	_SPI_init
 252                     	end
