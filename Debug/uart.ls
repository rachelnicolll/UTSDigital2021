   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _welcome:
  15  0000 0000          	dc.w	0
  45                     ; 12 void UART_init()
  45                     ; 13 {
  47                     	switch	.text
  48  0000               _UART_init:
  52                     ; 14 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
  54  0000 721a50c3      	bset	20675,#5
  55                     ; 16 	GPIOC->DDR |= 0x08; // Put TX line on (0b0000 1000)
  57  0004 7216500c      	bset	20492,#3
  58                     ; 17 	GPIOC->CR1 |= 0x08; // USART Wakeup method (0b0000 1000)
  60  0008 7216500d      	bset	20493,#3
  61                     ; 18 	GPIOB->DDR &= 0xfe; //ensure GPIOB pin 0 is input mode (0b1111 1110)
  63  000c 72115007      	bres	20487,#0
  64                     ; 19 	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
  66  0010 c65008        	ld	a,20488
  67                     ; 20 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;	  // Allow TX & RX
  69  0013 c65235        	ld	a,21045
  70  0016 aa0c          	or	a,#12
  71  0018 c75235        	ld	21045,a
  72                     ; 21 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit (0b0011 0000)
  74  001b c65236        	ld	a,21046
  75  001e a4cf          	and	a,#207
  76  0020 c75236        	ld	21046,a
  77                     ; 22 	USART1->BRR2 = 0x03; //setting 
  79  0023 35035233      	mov	21043,#3
  80                     ; 23 	USART1->BRR1 = 0x68; // 9600 baud
  82  0027 35685232      	mov	21042,#104
  83                     ; 24 	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT); //Initialise GPIOB Pin 0 to sense of the USB is plugged in or not.
  85  002b 4b00          	push	#0
  86  002d 4b01          	push	#1
  87  002f ae5005        	ldw	x,#20485
  88  0032 cd0000        	call	_GPIO_Init
  90  0035 85            	popw	x
  91                     ; 25 }
  94  0036 81            	ret
 128                     ; 27 char putchar(char c)
 128                     ; 28 {
 129                     	switch	.text
 130  0037               _putchar:
 132  0037 88            	push	a
 133       00000000      OFST:	set	0
 136  0038               L14:
 137                     ; 29 	while(!(USART1->SR & USART_SR_TXE));
 139  0038 c65230        	ld	a,21040
 140  003b a580          	bcp	a,#128
 141  003d 27f9          	jreq	L14
 142                     ; 30 	USART1->DR = c;
 144  003f 7b01          	ld	a,(OFST+1,sp)
 145  0041 c75231        	ld	21041,a
 146                     ; 31 	return(c);
 148  0044 7b01          	ld	a,(OFST+1,sp)
 151  0046 5b01          	addw	sp,#1
 152  0048 81            	ret
 186                     ; 34 char getchar(void)
 186                     ; 35 {
 187                     	switch	.text
 188  0049               _getchar:
 190  0049 88            	push	a
 191       00000001      OFST:	set	1
 194  004a               L56:
 195                     ; 37 	while(!(USART1->SR & USART_SR_RXNE));
 197  004a c65230        	ld	a,21040
 198  004d a520          	bcp	a,#32
 199  004f 27f9          	jreq	L56
 200                     ; 38 	c = USART1->DR;
 202  0051 c65231        	ld	a,21041
 203  0054 6b01          	ld	(OFST+0,sp),a
 205                     ; 39 	return(c);
 207  0056 7b01          	ld	a,(OFST+0,sp)
 210  0058 5b01          	addw	sp,#1
 211  005a 81            	ret
 245                     ; 42 void UART_TX(unsigned char val)
 245                     ; 43 {
 246                     	switch	.text
 247  005b               _UART_TX:
 249  005b 88            	push	a
 250       00000000      OFST:	set	0
 253  005c               L111:
 254                     ; 44 	while(!(USART1->SR & USART_SR_TXE));
 256  005c c65230        	ld	a,21040
 257  005f a580          	bcp	a,#128
 258  0061 27f9          	jreq	L111
 259                     ; 45 	USART1->DR = val;
 261  0063 7b01          	ld	a,(OFST+1,sp)
 262  0065 c75231        	ld	21041,a
 263                     ; 47 }
 266  0068 84            	pop	a
 267  0069 81            	ret
 290                     ; 49 unsigned char UART_RX(void)
 290                     ; 50 {
 291                     	switch	.text
 292  006a               _UART_RX:
 296  006a               L721:
 297                     ; 51 	while(!(USART1->SR & USART_SR_RXNE));
 299  006a c65230        	ld	a,21040
 300  006d a520          	bcp	a,#32
 301  006f 27f9          	jreq	L721
 302                     ; 52 	return USART1->DR;
 304  0071 c65231        	ld	a,21041
 307  0074 81            	ret
 343                     ; 55 void UART_Poll(void)
 343                     ; 56 {
 344                     	switch	.text
 345  0075               _UART_Poll:
 347  0075 88            	push	a
 348       00000001      OFST:	set	1
 351                     ; 58 	unsigned char inChar = 0;
 353                     ; 59 	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
 355  0076 c65230        	ld	a,21040
 356  0079 a520          	bcp	a,#32
 357  007b 2708          	jreq	L151
 358                     ; 61 		inChar = UART_RX();
 360  007d adeb          	call	_UART_RX
 362  007f 6b01          	ld	(OFST+0,sp),a
 364                     ; 62 		UART_TX(inChar);
 366  0081 7b01          	ld	a,(OFST+0,sp)
 367  0083 add6          	call	_UART_TX
 369  0085               L151:
 370                     ; 67 }	
 373  0085 84            	pop	a
 374  0086 81            	ret
 377                     	xref	_printf
 378                     	xref	_clock
 379                     	xref	_printf
 380                     	xref	_scanf
 419                     ; 69 void UART_Welcome()
 419                     ; 70 {
 420                     	switch	.text
 421  0087               _UART_Welcome:
 423  0087 52ff          	subw	sp,#255
 424  0089 5211          	subw	sp,#17
 425       00000110      OFST:	set	272
 428                     ; 71 	if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0) == SET && welcome == 0)
 430  008b 4b01          	push	#1
 431  008d ae5005        	ldw	x,#20485
 432  0090 cd0000        	call	_GPIO_ReadInputDataBit
 434  0093 5b01          	addw	sp,#1
 435  0095 a101          	cp	a,#1
 436  0097 262f          	jrne	L171
 438  0099 be00          	ldw	x,_welcome
 439  009b 262b          	jrne	L171
 440                     ; 74 		printf("Welcome to the Greenhouse Datalogger\n");
 442  009d ae006c        	ldw	x,#L371
 443  00a0 cd0000        	call	_printf
 445                     ; 75 		printf("Please enter the file name in which you would like to save today's data: \n");
 447  00a3 ae0021        	ldw	x,#L571
 448  00a6 cd0000        	call	_printf
 450                     ; 76 		scanf("%s", &filename);
 452  00a9 96            	ldw	x,sp
 453  00aa 1c0011        	addw	x,#OFST-255
 454  00ad 89            	pushw	x
 455  00ae ae001e        	ldw	x,#L771
 456  00b1 cd0000        	call	_scanf
 458  00b4 85            	popw	x
 459                     ; 77 		printf("Writing to %s\n", filename);
 461  00b5 96            	ldw	x,sp
 462  00b6 1c0011        	addw	x,#OFST-255
 463  00b9 89            	pushw	x
 464  00ba ae000f        	ldw	x,#L102
 465  00bd cd0000        	call	_printf
 467  00c0 85            	popw	x
 468                     ; 78   	welcome++;
 470  00c1 be00          	ldw	x,_welcome
 471  00c3 1c0001        	addw	x,#1
 472  00c6 bf00          	ldw	_welcome,x
 473  00c8               L171:
 474                     ; 81 	if (clock() % 1000 == 10)
 476  00c8 cd0000        	call	_clock
 478  00cb 90ae03e8      	ldw	y,#1000
 479  00cf cd0000        	call	c_idiv
 481  00d2 51            	exgw	x,y
 482  00d3 a3000a        	cpw	x,#10
 483  00d6 2606          	jrne	L302
 484                     ; 82 		printf("Hello World! \n");
 486  00d8 ae0000        	ldw	x,#L502
 487  00db cd0000        	call	_printf
 489  00de               L302:
 490                     ; 83 }
 493  00de 5bff          	addw	sp,#255
 494  00e0 5b11          	addw	sp,#17
 495  00e2 81            	ret
 519                     	xdef	_getchar
 520                     	xdef	_putchar
 521                     	xdef	_welcome
 522                     	xdef	_UART_Welcome
 523                     	xdef	_UART_Poll
 524                     	xdef	_UART_RX
 525                     	xdef	_UART_TX
 526                     	xdef	_UART_init
 527                     	xref	_GPIO_ReadInputDataBit
 528                     	xref	_GPIO_Init
 529                     .const:	section	.text
 530  0000               L502:
 531  0000 48656c6c6f20  	dc.b	"Hello World! ",10,0
 532  000f               L102:
 533  000f 57726974696e  	dc.b	"Writing to %s",10,0
 534  001e               L771:
 535  001e 257300        	dc.b	"%s",0
 536  0021               L571:
 537  0021 506c65617365  	dc.b	"Please enter the f"
 538  0033 696c65206e61  	dc.b	"ile name in which "
 539  0045 796f7520776f  	dc.b	"you would like to "
 540  0057 736176652074  	dc.b	"save today's data:"
 541  0069 200a00        	dc.b	" ",10,0
 542  006c               L371:
 543  006c 57656c636f6d  	dc.b	"Welcome to the Gre"
 544  007e 656e686f7573  	dc.b	"enhouse Datalogger"
 545  0090 0a00          	dc.b	10,0
 565                     	xref	c_idiv
 566                     	end
