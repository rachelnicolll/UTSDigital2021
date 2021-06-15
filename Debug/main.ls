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
 117                     	switch	.const
 118  0012               L01:
 119  0012 0001b198      	dc.l	111000
 120                     ; 24 void main(void)
 120                     ; 25 {
 121                     	switch	.text
 122  000a               _main:
 124  000a 5204          	subw	sp,#4
 125       00000004      OFST:	set	4
 128                     ; 26 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 130  000c 725f50c0      	clr	20672
 131                     ; 27 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 133  0010 c650c4        	ld	a,20676
 134  0013 aaff          	or	a,#255
 135  0015 c750c4        	ld	20676,a
 136                     ; 28 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 138  0018 c650c3        	ld	a,20675
 139  001b aaff          	or	a,#255
 140  001d c750c3        	ld	20675,a
 141                     ; 38 	GPIOB->DDR |= 0x03;
 143  0020 c65007        	ld	a,20487
 144  0023 aa03          	or	a,#3
 145  0025 c75007        	ld	20487,a
 146                     ; 39 	GPIOB->CR1 |= 0x03;
 148  0028 c65008        	ld	a,20488
 149  002b aa03          	or	a,#3
 150  002d c75008        	ld	20488,a
 151                     ; 42 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
 153  0030 3508500c      	mov	20492,#8
 154                     ; 43 	GPIOC->CR1 = 0x08; // 0b0000 1000
 156  0034 3508500d      	mov	20493,#8
 157                     ; 46 	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
 159  0038 35085235      	mov	21045,#8
 160                     ; 47 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
 162  003c c65236        	ld	a,21046
 163  003f a4cf          	and	a,#207
 164  0041 c75236        	ld	21046,a
 165                     ; 48 	USART1->BRR2 = 0x03;
 167  0044 35035233      	mov	21043,#3
 168                     ; 49 	USART1->BRR1 = 0x68; // 9600 baud
 170  0048 35685232      	mov	21042,#104
 171                     ; 52 	SPI_init();
 173  004c cd0000        	call	_SPI_init
 175                     ; 53 	BTN_init();
 177  004f cd0000        	call	_BTN_init
 179                     ; 54 	LCD_init();
 181  0052 cd0000        	call	_LCD_init
 183  0055               L54:
 184                     ; 69 		if (state == 1)
 186  0055 b600          	ld	a,_state
 187  0057 a101          	cp	a,#1
 188  0059 26fa          	jrne	L54
 189                     ; 71 			LCD_clear();
 191  005b cd0000        	call	_LCD_clear
 193                     ; 72 			{int i; for (i = 0; i < sizeof(pressMSG) - 1; i++)
 195  005e 5f            	clrw	x
 196  005f 1f03          	ldw	(OFST-1,sp),x
 198  0061               L35:
 199                     ; 73 				LCD_putc(pressMSG[i]);}
 201  0061 1e03          	ldw	x,(OFST-1,sp)
 202  0063 d60006        	ld	a,(_pressMSG,x)
 203  0066 cd0000        	call	_LCD_putc
 205                     ; 72 			{int i; for (i = 0; i < sizeof(pressMSG) - 1; i++)
 207  0069 1e03          	ldw	x,(OFST-1,sp)
 208  006b 1c0001        	addw	x,#1
 209  006e 1f03          	ldw	(OFST-1,sp),x
 213  0070 1e03          	ldw	x,(OFST-1,sp)
 214  0072 a3000b        	cpw	x,#11
 215  0075 25ea          	jrult	L35
 216                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 219  0077 ae0000        	ldw	x,#0
 220  007a 1f03          	ldw	(OFST-1,sp),x
 221  007c ae0000        	ldw	x,#0
 222  007f 1f01          	ldw	(OFST-3,sp),x
 224  0081               L16:
 225                     ; 14         _asm("nop");
 228  0081 9d            nop
 230                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 232  0082 96            	ldw	x,sp
 233  0083 1c0001        	addw	x,#OFST-3
 234  0086 a601          	ld	a,#1
 235  0088 cd0000        	call	c_lgadc
 240  008b 96            	ldw	x,sp
 241  008c 1c0001        	addw	x,#OFST-3
 242  008f cd0000        	call	c_ltor
 244  0092 ae0012        	ldw	x,#L01
 245  0095 cd0000        	call	c_lcmp
 247  0098 25e7          	jrult	L16
 248                     ; 75 			state = FALSE;
 250  009a 3f00          	clr	_state
 251  009c 20b7          	jra	L54
 316                     	xdef	_main
 317                     	xdef	_clock
 318                     	xdef	_state
 319                     	xdef	_pressMSG
 320                     	xdef	_op
 321                     	xref	_BTN_init
 322                     	xref	_LCD_putc
 323                     	xref	_LCD_clear
 324                     	xref	_LCD_init
 325                     	xref	_SPI_init
 344                     	xref	c_lcmp
 345                     	xref	c_ltor
 346                     	xref	c_lgadc
 347                     	end
