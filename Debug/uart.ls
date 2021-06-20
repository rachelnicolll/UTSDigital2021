   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _welcome:
  15  0000 0000          	dc.w	0
  45                     ; 16 void UART_init()
  45                     ; 17 {
  47                     	switch	.text
  48  0000               _UART_init:
  52                     ; 21 	USART1->CR2 |= USART_CR2_REN; // Allow RX
  54  0000 72145235      	bset	21045,#2
  55                     ; 24 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
  57  0004 721a50c3      	bset	20675,#5
  58                     ; 27 	GPIOC->DDR |= 0x08;					 // Put TX line on (0b0000 1000)
  60  0008 7216500c      	bset	20492,#3
  61                     ; 28 	GPIOC->CR1 |= 0x08;					 // USART Wakeup method (0b0000 1000)
  63  000c 7216500d      	bset	20493,#3
  64                     ; 29 	GPIOB->DDR &= 0xfe;					 //ensure GPIOB pin 0 is input mode (0b1111 1110)
  66  0010 72115007      	bres	20487,#0
  67                     ; 30 	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
  69  0014 c65008        	ld	a,20488
  70                     ; 31 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
  72  0017 c65235        	ld	a,21045
  73  001a aa0c          	or	a,#12
  74  001c c75235        	ld	21045,a
  75                     ; 32 	USART1->CR3 &= ~(USART_CR3_STOP);					 // 1 stop bit (0b0011 0000)
  77  001f c65236        	ld	a,21046
  78  0022 a4cf          	and	a,#207
  79  0024 c75236        	ld	21046,a
  80                     ; 33 	USART1->BRR2 = 0x03;								 //setting
  82  0027 35035233      	mov	21043,#3
  83                     ; 34 	USART1->BRR1 = 0x68;								 // 9600 baud
  85  002b 35685232      	mov	21042,#104
  86                     ; 35 	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT); //Initialise GPIOB Pin 0 to sense of the USB is plugged in or not. SLEEP#
  88  002f 4b00          	push	#0
  89  0031 4b01          	push	#1
  90  0033 ae5005        	ldw	x,#20485
  91  0036 cd0000        	call	_GPIO_Init
  93  0039 85            	popw	x
  94                     ; 36 }
  97  003a 81            	ret
 131                     ; 38 char putchar(char c)
 131                     ; 39 {
 132                     	switch	.text
 133  003b               _putchar:
 135  003b 88            	push	a
 136       00000000      OFST:	set	0
 139  003c               L14:
 140                     ; 40 	while (!(USART1->SR & USART_SR_TXE))
 142  003c c65230        	ld	a,21040
 143  003f a580          	bcp	a,#128
 144  0041 27f9          	jreq	L14
 145                     ; 42 	USART1->DR = c;
 147  0043 7b01          	ld	a,(OFST+1,sp)
 148  0045 c75231        	ld	21041,a
 149                     ; 43 	return (c);
 151  0048 7b01          	ld	a,(OFST+1,sp)
 154  004a 5b01          	addw	sp,#1
 155  004c 81            	ret
 189                     ; 46 char getchar(void)
 189                     ; 47 {
 190                     	switch	.text
 191  004d               _getchar:
 193  004d 88            	push	a
 194       00000001      OFST:	set	1
 197  004e               L56:
 198                     ; 49 	while (!(USART1->SR & USART_SR_RXNE))
 200  004e c65230        	ld	a,21040
 201  0051 a520          	bcp	a,#32
 202  0053 27f9          	jreq	L56
 203                     ; 51 	c = USART1->DR;
 205  0055 c65231        	ld	a,21041
 206  0058 6b01          	ld	(OFST+0,sp),a
 208                     ; 52 	return (c);
 210  005a 7b01          	ld	a,(OFST+0,sp)
 213  005c 5b01          	addw	sp,#1
 214  005e 81            	ret
 248                     ; 55 void UART_TX(unsigned char val)
 248                     ; 56 {
 249                     	switch	.text
 250  005f               _UART_TX:
 252  005f 88            	push	a
 253       00000000      OFST:	set	0
 256  0060               L111:
 257                     ; 57 	while (!(USART1->SR & USART_SR_TXE))
 259  0060 c65230        	ld	a,21040
 260  0063 a580          	bcp	a,#128
 261  0065 27f9          	jreq	L111
 262                     ; 59 	USART1->DR = val;
 264  0067 7b01          	ld	a,(OFST+1,sp)
 265  0069 c75231        	ld	21041,a
 266                     ; 60 }
 269  006c 84            	pop	a
 270  006d 81            	ret
 293                     ; 62 unsigned char UART_RX(void)
 293                     ; 63 {
 294                     	switch	.text
 295  006e               _UART_RX:
 299  006e               L721:
 300                     ; 64 	while (!(USART1->SR & USART_SR_RXNE))
 302  006e c65230        	ld	a,21040
 303  0071 a520          	bcp	a,#32
 304  0073 27f9          	jreq	L721
 305                     ; 66 	return USART1->DR;
 307  0075 c65231        	ld	a,21041
 310  0078 81            	ret
 346                     ; 69 void UART_Poll(void)
 346                     ; 70 {
 347                     	switch	.text
 348  0079               _UART_Poll:
 350  0079 88            	push	a
 351       00000001      OFST:	set	1
 354                     ; 72 	unsigned char inChar = 0;
 356                     ; 73 	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
 358  007a c65230        	ld	a,21040
 359  007d a520          	bcp	a,#32
 360  007f 2708          	jreq	L151
 361                     ; 75 		inChar = UART_RX();
 363  0081 adeb          	call	_UART_RX
 365  0083 6b01          	ld	(OFST+0,sp),a
 367                     ; 76 		UART_TX(inChar);
 369  0085 7b01          	ld	a,(OFST+0,sp)
 370  0087 add6          	call	_UART_TX
 372  0089               L151:
 373                     ; 81 }
 376  0089 84            	pop	a
 377  008a 81            	ret
 380                     	xref	_clock
 381                     	xref	_printf
 382                     	xref	_sprintf
 476                     ; 83 void UART_Welcome(int nbReadings, float readingResults[])
 476                     ; 84 {
 477                     	switch	.text
 478  008b               _UART_Welcome:
 480  008b 521d          	subw	sp,#29
 481       0000001d      OFST:	set	29
 484                     ; 88 	float f = 32.3;
 486                     ; 89 	float a = 345.65412;
 488  008d ce0006        	ldw	x,L532+2
 489  0090 1f08          	ldw	(OFST-21,sp),x
 490  0092 ce0004        	ldw	x,L532
 491  0095 1f06          	ldw	(OFST-23,sp),x
 493                     ; 92 	val = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0);
 495  0097 4b01          	push	#1
 496  0099 ae5005        	ldw	x,#20485
 497  009c cd0000        	call	_GPIO_ReadInputDataBit
 499  009f 84            	pop	a
 500                     ; 117 	if (clock() % 1000 == 10)
 502  00a0 cd0000        	call	_clock
 504  00a3 90ae03e8      	ldw	y,#1000
 505  00a7 cd0000        	call	c_idiv
 507  00aa 51            	exgw	x,y
 508  00ab a3000a        	cpw	x,#10
 509  00ae 261a          	jrne	L142
 510                     ; 123 		sprintf(buffr, "%f\n", a);
 512  00b0 1e08          	ldw	x,(OFST-21,sp)
 513  00b2 89            	pushw	x
 514  00b3 1e08          	ldw	x,(OFST-21,sp)
 515  00b5 89            	pushw	x
 516  00b6 ae0000        	ldw	x,#L342
 517  00b9 89            	pushw	x
 518  00ba 96            	ldw	x,sp
 519  00bb 1c0010        	addw	x,#OFST-13
 520  00be cd0000        	call	_sprintf
 522  00c1 5b06          	addw	sp,#6
 523                     ; 124 		printf(buffr);
 525  00c3 96            	ldw	x,sp
 526  00c4 1c000a        	addw	x,#OFST-19
 527  00c7 cd0000        	call	_printf
 529  00ca               L142:
 530                     ; 131 }
 533  00ca 5b1d          	addw	sp,#29
 534  00cc 81            	ret
 567                     	xdef	_getchar
 568                     	xdef	_putchar
 569                     	switch	.ubsct
 570  0000               _readyuTx:
 571  0000 00            	ds.b	1
 572                     	xdef	_readyuTx
 573                     	xdef	_welcome
 574                     	xdef	_UART_Welcome
 575                     	xdef	_UART_Poll
 576                     	xdef	_UART_RX
 577                     	xdef	_UART_TX
 578                     	xdef	_UART_init
 579                     	xref	_GPIO_ReadInputDataBit
 580                     	xref	_GPIO_Init
 581                     .const:	section	.text
 582  0000               L342:
 583  0000 25660a00      	dc.b	"%f",10,0
 584  0004               L532:
 585  0004 43acd3ba      	dc.w	17324,-11334
 586  0008               L522:
 587  0008 42013333      	dc.w	16897,13107
 607                     	xref	c_idiv
 608                     	end
