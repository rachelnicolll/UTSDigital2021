   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 17 unsigned int clock(void)
  41                     ; 18 {
  43                     	switch	.text
  44  0000               _clock:
  48                     ; 19 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  50  0000 c652bf        	ld	a,21183
  51  0003 5f            	clrw	x
  52  0004 97            	ld	xl,a
  53  0005 c652c0        	ld	a,21184
  54  0008 02            	rlwa	x,a
  57  0009 81            	ret
  60                     	xref	_chip_deselect
  61                     	xref	_chip_select
  97                     ; 22 void main(void)
  97                     ; 23 {
  98                     	switch	.text
  99  000a               _main:
 101  000a 88            	push	a
 102       00000001      OFST:	set	1
 105                     ; 24 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 107  000b 725f50c0      	clr	20672
 108                     ; 25 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 110  000f c650c4        	ld	a,20676
 111  0012 aaff          	or	a,#255
 112  0014 c750c4        	ld	20676,a
 113                     ; 26 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 115  0017 c650c3        	ld	a,20675
 116  001a aaff          	or	a,#255
 117  001c c750c3        	ld	20675,a
 118                     ; 30 	TIM1->PSCRH = 0x3e; // 0011 1110
 120  001f 353e52c1      	mov	21185,#62
 121                     ; 31 	TIM1->PSCRL = 0x80; // 0111 0000
 123  0023 358052c2      	mov	21186,#128
 124                     ; 33 	TIM1->CR1 = TIM1_CR1_CEN;
 126  0027 350152b0      	mov	21168,#1
 127                     ; 36 	GPIOB->DDR |= 0x03;
 129  002b c65007        	ld	a,20487
 130  002e aa03          	or	a,#3
 131  0030 c75007        	ld	20487,a
 132                     ; 37 	GPIOB->CR1 |= 0x03;
 134  0033 c65008        	ld	a,20488
 135  0036 aa03          	or	a,#3
 136  0038 c75008        	ld	20488,a
 137                     ; 40 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
 139  003b 3508500c      	mov	20492,#8
 140                     ; 41 	GPIOC->CR1 = 0x08; // 0b0000 1000
 142  003f 3508500d      	mov	20493,#8
 143                     ; 44 	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
 145  0043 35085235      	mov	21045,#8
 146                     ; 45 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
 148  0047 c65236        	ld	a,21046
 149  004a a4cf          	and	a,#207
 150  004c c75236        	ld	21046,a
 151                     ; 46 	USART1->BRR2 = 0x03;
 153  004f 35035233      	mov	21043,#3
 154                     ; 47 	USART1->BRR1 = 0x68; // 9600 baud
 156  0053 35685232      	mov	21042,#104
 157                     ; 49 	GPIOB->ODR |= (1 << CS_PIN);
 159  0057 72125005      	bset	20485,#1
 160                     ; 51 	SPI1->CR2 |= (SPI_CR2_SSM) | (SPI_CR2_SSI);
 162  005b c65201        	ld	a,20993
 163  005e aa03          	or	a,#3
 164  0060 c75201        	ld	20993,a
 165                     ; 52 	SPI1->CR1 |= 0b10100111;
 167  0063 c65200        	ld	a,20992
 168  0066 aaa7          	or	a,#167
 169  0068 c75200        	ld	20992,a
 170                     ; 53 	SPI1->CR1 |= 0x40; // Enable SPI peripheral
 172  006b 721c5200      	bset	20992,#6
 173  006f               L54:
 174                     ; 58 		while (!(USART1->SR & USART_SR_TXE))
 176  006f c65230        	ld	a,21040
 177  0072 a580          	bcp	a,#128
 178  0074 27f9          	jreq	L54
 179                     ; 60 		USART1->DR = 'A';
 181  0076 35415231      	mov	21041,#65
 182                     ; 62 		chip_select();
 184  007a cd0000        	call	_chip_select
 186                     ; 65 			for (i = 0xAA; i < 0xFA; i += 0x10)
 188  007d a6aa          	ld	a,#170
 189  007f 6b01          	ld	(OFST+0,sp),a
 191  0081               L15:
 192                     ; 66 				SPI_write(i);
 194  0081 7b01          	ld	a,(OFST+0,sp)
 195  0083 cd0000        	call	_SPI_write
 197                     ; 65 			for (i = 0xAA; i < 0xFA; i += 0x10)
 199  0086 7b01          	ld	a,(OFST+0,sp)
 200  0088 ab10          	add	a,#16
 201  008a 6b01          	ld	(OFST+0,sp),a
 205  008c 7b01          	ld	a,(OFST+0,sp)
 206  008e a1fa          	cp	a,#250
 207  0090 25ef          	jrult	L15
 208                     ; 68 		chip_deselect();
 210  0092 cd0000        	call	_chip_deselect
 212                     ; 70 		GPIOB->ODR &= ~0x01;
 214  0095 72115005      	bres	20485,#0
 215                     ; 71 		if (clock() % 1000 <= 500)
 217  0099 cd0000        	call	_clock
 219  009c 90ae03e8      	ldw	y,#1000
 220  00a0 65            	divw	x,y
 221  00a1 51            	exgw	x,y
 222  00a2 a301f5        	cpw	x,#501
 223  00a5 2404          	jruge	L75
 224                     ; 72 			GPIOB->ODR |= 0x01;
 226  00a7 72105005      	bset	20485,#0
 227  00ab               L75:
 228                     ; 73 		GPIOC->ODR &= 0x01;
 230  00ab c6500a        	ld	a,20490
 231  00ae a401          	and	a,#1
 232  00b0 c7500a        	ld	20490,a
 233                     ; 74 		if (clock() % 2000 <= 1000)
 235  00b3 cd0000        	call	_clock
 237  00b6 90ae07d0      	ldw	y,#2000
 238  00ba 65            	divw	x,y
 239  00bb 51            	exgw	x,y
 240  00bc a303e9        	cpw	x,#1001
 241  00bf 24ae          	jruge	L54
 242                     ; 75 			GPIOC->ODR |= 0x02;
 244  00c1 7212500a      	bset	20490,#1
 245  00c5 20a8          	jra	L54
 258                     	xdef	_main
 259                     	xdef	_clock
 260                     	xref	_SPI_write
 279                     	end
