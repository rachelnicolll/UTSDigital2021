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
  52                     ; 21 	USART1->CR2 |= USART_CR2_REN;	  // Allow RX
  54  0000 72145235      	bset	21045,#2
  55                     ; 24 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
  57  0004 721a50c3      	bset	20675,#5
  58                     ; 27 	GPIOC->DDR |= 0x08; // Put TX line on (0b0000 1000)
  60  0008 7216500c      	bset	20492,#3
  61                     ; 28 	GPIOC->CR1 |= 0x08; // USART Wakeup method (0b0000 1000)
  63  000c 7216500d      	bset	20493,#3
  64                     ; 29 	GPIOB->DDR &= 0xfe; //ensure GPIOB pin 0 is input mode (0b1111 1110)
  66  0010 72115007      	bres	20487,#0
  67                     ; 30 	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
  69  0014 c65008        	ld	a,20488
  70                     ; 31 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
  72  0017 c65235        	ld	a,21045
  73  001a aa0c          	or	a,#12
  74  001c c75235        	ld	21045,a
  75                     ; 32 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit (0b0011 0000)
  77  001f c65236        	ld	a,21046
  78  0022 a4cf          	and	a,#207
  79  0024 c75236        	ld	21046,a
  80                     ; 33 	USART1->BRR2 = 0x03; //setting 
  82  0027 35035233      	mov	21043,#3
  83                     ; 34 	USART1->BRR1 = 0x68; // 9600 baud
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
 140                     ; 40 	while(!(USART1->SR & USART_SR_TXE));
 142  003c c65230        	ld	a,21040
 143  003f a580          	bcp	a,#128
 144  0041 27f9          	jreq	L14
 145                     ; 41 	USART1->DR = c;
 147  0043 7b01          	ld	a,(OFST+1,sp)
 148  0045 c75231        	ld	21041,a
 149                     ; 42 	return(c);
 151  0048 7b01          	ld	a,(OFST+1,sp)
 154  004a 5b01          	addw	sp,#1
 155  004c 81            	ret
 189                     ; 45 char getchar(void)
 189                     ; 46 {
 190                     	switch	.text
 191  004d               _getchar:
 193  004d 88            	push	a
 194       00000001      OFST:	set	1
 197  004e               L56:
 198                     ; 48 	while(!(USART1->SR & USART_SR_RXNE));
 200  004e c65230        	ld	a,21040
 201  0051 a520          	bcp	a,#32
 202  0053 27f9          	jreq	L56
 203                     ; 49 	c = USART1->DR;
 205  0055 c65231        	ld	a,21041
 206  0058 6b01          	ld	(OFST+0,sp),a
 208                     ; 50 	return(c);
 210  005a 7b01          	ld	a,(OFST+0,sp)
 213  005c 5b01          	addw	sp,#1
 214  005e 81            	ret
 248                     ; 53 void UART_TX(unsigned char val)
 248                     ; 54 {
 249                     	switch	.text
 250  005f               _UART_TX:
 252  005f 88            	push	a
 253       00000000      OFST:	set	0
 256  0060               L111:
 257                     ; 55 	while(!(USART1->SR & USART_SR_TXE));
 259  0060 c65230        	ld	a,21040
 260  0063 a580          	bcp	a,#128
 261  0065 27f9          	jreq	L111
 262                     ; 56 	USART1->DR = val;
 264  0067 7b01          	ld	a,(OFST+1,sp)
 265  0069 c75231        	ld	21041,a
 266                     ; 58 }
 269  006c 84            	pop	a
 270  006d 81            	ret
 293                     ; 60 unsigned char UART_RX(void)
 293                     ; 61 {
 294                     	switch	.text
 295  006e               _UART_RX:
 299  006e               L721:
 300                     ; 62 	while(!(USART1->SR & USART_SR_RXNE));
 302  006e c65230        	ld	a,21040
 303  0071 a520          	bcp	a,#32
 304  0073 27f9          	jreq	L721
 305                     ; 63 	return USART1->DR;
 307  0075 c65231        	ld	a,21041
 310  0078 81            	ret
 346                     ; 66 void UART_Poll(void)
 346                     ; 67 {
 347                     	switch	.text
 348  0079               _UART_Poll:
 350  0079 88            	push	a
 351       00000001      OFST:	set	1
 354                     ; 69 	unsigned char inChar = 0;
 356                     ; 70 	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
 358  007a c65230        	ld	a,21040
 359  007d a520          	bcp	a,#32
 360  007f 2708          	jreq	L151
 361                     ; 72 		inChar = UART_RX();
 363  0081 adeb          	call	_UART_RX
 365  0083 6b01          	ld	(OFST+0,sp),a
 367                     ; 73 		UART_TX(inChar);
 369  0085 7b01          	ld	a,(OFST+0,sp)
 370  0087 add6          	call	_UART_TX
 372  0089               L151:
 373                     ; 78 }	
 376  0089 84            	pop	a
 377  008a 81            	ret
 380                     	xref	_printf
 381                     	xref	_clock
 382                     	xref	_printf
 383                     	xref	_scanf
 452                     ; 80 void UART_Welcome()
 452                     ; 81 {
 453                     	switch	.text
 454  008b               _UART_Welcome:
 456  008b 5239          	subw	sp,#57
 457       00000039      OFST:	set	57
 460                     ; 84 	val = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0);
 462  008d 4b01          	push	#1
 463  008f ae5005        	ldw	x,#20485
 464  0092 cd0000        	call	_GPIO_ReadInputDataBit
 466  0095 5b01          	addw	sp,#1
 467  0097 6b01          	ld	(OFST-56,sp),a
 469                     ; 85 	if (val == SET && welcome == 0)
 471  0099 7b01          	ld	a,(OFST-56,sp)
 472  009b a101          	cp	a,#1
 473  009d 262f          	jrne	L502
 475  009f be00          	ldw	x,_welcome
 476  00a1 262b          	jrne	L502
 477                     ; 87 		printf("Welcome to the Greenhouse Datalogger\n");
 479  00a3 ae0066        	ldw	x,#L702
 480  00a6 cd0000        	call	_printf
 482                     ; 88 		printf("Please enter the text file name where today's data will be saved: \n");
 484  00a9 ae0022        	ldw	x,#L112
 485  00ac cd0000        	call	_printf
 487                     ; 90 		scanf("%s", &filename);
 489  00af 96            	ldw	x,sp
 490  00b0 1c0002        	addw	x,#OFST-55
 491  00b3 89            	pushw	x
 492  00b4 ae001f        	ldw	x,#L312
 493  00b7 cd0000        	call	_scanf
 495  00ba 85            	popw	x
 496                     ; 91 		printf("Writing to: %s\n", filename);
 498  00bb 96            	ldw	x,sp
 499  00bc 1c0002        	addw	x,#OFST-55
 500  00bf 89            	pushw	x
 501  00c0 ae000f        	ldw	x,#L512
 502  00c3 cd0000        	call	_printf
 504  00c6 85            	popw	x
 505                     ; 95   	welcome++;
 507  00c7 be00          	ldw	x,_welcome
 508  00c9 1c0001        	addw	x,#1
 509  00cc bf00          	ldw	_welcome,x
 510  00ce               L502:
 511                     ; 98 	if (clock() % 1000 == 10)
 513  00ce cd0000        	call	_clock
 515  00d1 90ae03e8      	ldw	y,#1000
 516  00d5 cd0000        	call	c_idiv
 518  00d8 51            	exgw	x,y
 519  00d9 a3000a        	cpw	x,#10
 520  00dc 2606          	jrne	L712
 521                     ; 99 		printf("Hello World! \n");
 523  00de ae0000        	ldw	x,#L122
 524  00e1 cd0000        	call	_printf
 526  00e4               L712:
 527                     ; 100 }
 530  00e4 5b39          	addw	sp,#57
 531  00e6 81            	ret
 565                     	xdef	_getchar
 566                     	xdef	_putchar
 567                     	switch	.ubsct
 568  0000               _filemsg:
 569  0000 000000000000  	ds.b	56
 570                     	xdef	_filemsg
 571                     	xdef	_welcome
 572                     	xdef	_UART_Welcome
 573                     	xdef	_UART_Poll
 574                     	xdef	_UART_RX
 575                     	xdef	_UART_TX
 576                     	xdef	_UART_init
 577                     	xref	_GPIO_ReadInputDataBit
 578                     	xref	_GPIO_Init
 579                     .const:	section	.text
 580  0000               L122:
 581  0000 48656c6c6f20  	dc.b	"Hello World! ",10,0
 582  000f               L512:
 583  000f 57726974696e  	dc.b	"Writing to: %s",10,0
 584  001f               L312:
 585  001f 257300        	dc.b	"%s",0
 586  0022               L112:
 587  0022 506c65617365  	dc.b	"Please enter the t"
 588  0034 657874206669  	dc.b	"ext file name wher"
 589  0046 6520746f6461  	dc.b	"e today's data wil"
 590  0058 6c2062652073  	dc.b	"l be saved: ",10,0
 591  0066               L702:
 592  0066 57656c636f6d  	dc.b	"Welcome to the Gre"
 593  0078 656e686f7573  	dc.b	"enhouse Datalogger"
 594  008a 0a00          	dc.b	10,0
 614                     	xref	c_idiv
 615                     	end
