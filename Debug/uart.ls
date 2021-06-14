   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 12 void UART_init()
  41                     ; 13 {
  43                     	switch	.text
  44  0000               _UART_init:
  48                     ; 14 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
  50  0000 721a50c3      	bset	20675,#5
  51                     ; 16 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
  53  0004 3508500c      	mov	20492,#8
  54                     ; 17 	GPIOC->CR1 = 0x08; // 0b0000 1000
  56  0008 3508500d      	mov	20493,#8
  57                     ; 19 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;	  // Allow TX & RX
  59  000c c65235        	ld	a,21045
  60  000f aa0c          	or	a,#12
  61  0011 c75235        	ld	21045,a
  62                     ; 20 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
  64  0014 c65236        	ld	a,21046
  65  0017 a4cf          	and	a,#207
  66  0019 c75236        	ld	21046,a
  67                     ; 21 	USART1->BRR2 = 0x03;
  69  001c 35035233      	mov	21043,#3
  70                     ; 22 	USART1->BRR1 = 0x68; // 9600 baud
  72  0020 35685232      	mov	21042,#104
  73                     ; 26 }
  76  0024 81            	ret
 110                     ; 29 void UART_TX(unsigned char val)
 110                     ; 30 {
 111                     	switch	.text
 112  0025               _UART_TX:
 116                     ; 31 	USART1->DR = val;
 118  0025 c75231        	ld	21041,a
 120  0028               L34:
 121                     ; 32 	while(!(USART1->SR & USART_SR_TXE));
 123  0028 c65230        	ld	a,21040
 124  002b a580          	bcp	a,#128
 125  002d 27f9          	jreq	L34
 126                     ; 33 }
 129  002f 81            	ret
 152                     ; 35 unsigned char UART_RX(void)
 152                     ; 36 {
 153                     	switch	.text
 154  0030               _UART_RX:
 158  0030               L16:
 159                     ; 37 	while(!(USART1->SR & USART_SR_RXNE));
 161  0030 c65230        	ld	a,21040
 162  0033 a520          	bcp	a,#32
 163  0035 27f9          	jreq	L16
 164                     ; 38 	return USART1->DR;
 166  0037 c65231        	ld	a,21041
 169  003a 81            	ret
 172                     	xref	_clock
 207                     ; 41 void UART_Test(void)
 207                     ; 42 {
 208                     	switch	.text
 209  003b               _UART_Test:
 211  003b 88            	push	a
 212       00000001      OFST:	set	1
 215                     ; 44 	unsigned char inChar = 0;
 217                     ; 45 	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
 219  003c c65230        	ld	a,21040
 220  003f a520          	bcp	a,#32
 221  0041 270a          	jreq	L301
 222                     ; 47 		inChar = UART_RX();
 224  0043 adeb          	call	_UART_RX
 226  0045 6b01          	ld	(OFST+0,sp),a
 228                     ; 48 		inChar++;
 230  0047 0c01          	inc	(OFST+0,sp)
 232                     ; 49 		UART_TX(inChar);
 234  0049 7b01          	ld	a,(OFST+0,sp)
 235  004b add8          	call	_UART_TX
 237  004d               L301:
 238                     ; 52 	if (clock() % 1000 == 0){
 240  004d cd0000        	call	_clock
 242  0050 90ae03e8      	ldw	y,#1000
 243  0054 cd0000        	call	c_idiv
 245  0057 51            	exgw	x,y
 246  0058 a30000        	cpw	x,#0
 247  005b 2604          	jrne	L501
 248                     ; 53 		UART_TX('A');	}
 250  005d a641          	ld	a,#65
 251  005f adc4          	call	_UART_TX
 253  0061               L501:
 254                     ; 54 }
 257  0061 84            	pop	a
 258  0062 81            	ret
 271                     	xdef	_UART_Test
 272                     	xdef	_UART_RX
 273                     	xdef	_UART_TX
 274                     	xdef	_UART_init
 293                     	xref	c_idiv
 294                     	end
