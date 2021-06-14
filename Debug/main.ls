   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     .const:	section	.text
  14  0000               _text:
  15  0000 4845592c2042  	dc.b	"HEY, BITCH!",0
  44                     ; 18 unsigned int clock(void)
  44                     ; 19 {
  46                     	switch	.text
  47  0000               _clock:
  51                     ; 20 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  53  0000 c652bf        	ld	a,21183
  54  0003 5f            	clrw	x
  55  0004 97            	ld	xl,a
  56  0005 c652c0        	ld	a,21184
  57  0008 02            	rlwa	x,a
  60  0009 81            	ret
 110                     	switch	.const
 111  000c               L01:
 112  000c 00036330      	dc.l	222000
 113                     ; 23 void main(void)
 113                     ; 24 {
 114                     	switch	.text
 115  000a               _main:
 117  000a 5204          	subw	sp,#4
 118       00000004      OFST:	set	4
 121                     ; 25 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 123  000c 725f50c0      	clr	20672
 124                     ; 26 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 126  0010 c650c4        	ld	a,20676
 127  0013 aaff          	or	a,#255
 128  0015 c750c4        	ld	20676,a
 129                     ; 27 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 131  0018 c650c3        	ld	a,20675
 132  001b aaff          	or	a,#255
 133  001d c750c3        	ld	20675,a
 134                     ; 37 	GPIOB->DDR |= 0x03;
 136  0020 c65007        	ld	a,20487
 137  0023 aa03          	or	a,#3
 138  0025 c75007        	ld	20487,a
 139                     ; 38 	GPIOB->CR1 |= 0x03;
 141  0028 c65008        	ld	a,20488
 142  002b aa03          	or	a,#3
 143  002d c75008        	ld	20488,a
 144                     ; 41 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
 146  0030 3508500c      	mov	20492,#8
 147                     ; 42 	GPIOC->CR1 = 0x08; // 0b0000 1000
 149  0034 3508500d      	mov	20493,#8
 150                     ; 45 	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
 152  0038 35085235      	mov	21045,#8
 153                     ; 46 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
 155  003c c65236        	ld	a,21046
 156  003f a4cf          	and	a,#207
 157  0041 c75236        	ld	21046,a
 158                     ; 47 	USART1->BRR2 = 0x03;
 160  0044 35035233      	mov	21043,#3
 161                     ; 48 	USART1->BRR1 = 0x68; // 9600 baud
 163  0048 35685232      	mov	21042,#104
 164                     ; 51 	SPI_init();
 166  004c cd0000        	call	_SPI_init
 168                     ; 52 	LCD_init();
 170  004f cd0000        	call	_LCD_init
 172                     ; 54 	LCD_goto(12, 2);
 174  0052 ae0c02        	ldw	x,#3074
 175  0055 cd0000        	call	_LCD_goto
 177                     ; 55     {int i ;for (i = 0; i < sizeof(text) - 1; i++)
 179  0058 5f            	clrw	x
 180  0059 1f03          	ldw	(OFST-1,sp),x
 182  005b               L54:
 183                     ; 56 			LCD_putc(text[i]);}
 185  005b 1e03          	ldw	x,(OFST-1,sp)
 186  005d d60000        	ld	a,(_text,x)
 187  0060 cd0000        	call	_LCD_putc
 189                     ; 55     {int i ;for (i = 0; i < sizeof(text) - 1; i++)
 191  0063 1e03          	ldw	x,(OFST-1,sp)
 192  0065 1c0001        	addw	x,#1
 193  0068 1f03          	ldw	(OFST-1,sp),x
 197  006a 1e03          	ldw	x,(OFST-1,sp)
 198  006c a3000b        	cpw	x,#11
 199  006f 25ea          	jrult	L54
 200                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 203  0071 ae0000        	ldw	x,#0
 204  0074 1f03          	ldw	(OFST-1,sp),x
 205  0076 ae0000        	ldw	x,#0
 206  0079 1f01          	ldw	(OFST-3,sp),x
 208  007b               L35:
 211  007b 96            	ldw	x,sp
 212  007c 1c0001        	addw	x,#OFST-3
 213  007f a601          	ld	a,#1
 214  0081 cd0000        	call	c_lgadc
 219  0084 96            	ldw	x,sp
 220  0085 1c0001        	addw	x,#OFST-3
 221  0088 cd0000        	call	c_ltor
 223  008b ae000c        	ldw	x,#L01
 224  008e cd0000        	call	c_lcmp
 226  0091 25e8          	jrult	L35
 227  0093               L16:
 228                     ; 73 		SPI_write(0xFF);
 230  0093 a6ff          	ld	a,#255
 231  0095 cd0000        	call	_SPI_write
 234  0098 20f9          	jra	L16
 259                     	xdef	_main
 260                     	xdef	_clock
 261                     	xdef	_text
 262                     	xref	_LCD_putc
 263                     	xref	_LCD_goto
 264                     	xref	_LCD_init
 265                     	xref	_SPI_write
 266                     	xref	_SPI_init
 285                     	xref	c_lcmp
 286                     	xref	c_ltor
 287                     	xref	c_lgadc
 288                     	end
