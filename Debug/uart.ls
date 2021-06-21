   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _welcome:
  15  0000 0000          	dc.w	0
  45                     ; 15 void UART_init()
  45                     ; 16 {
  47                     	switch	.text
  48  0000               _UART_init:
  52                     ; 17 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
  54  0000 721a50c3      	bset	20675,#5
  55                     ; 20 	GPIOC->DDR |= 0x08;					 // Put TX line on (0b0000 1000)
  57  0004 7216500c      	bset	20492,#3
  58                     ; 21 	GPIOC->CR1 |= 0x08;					 // USART Wakeup method (0b0000 1000)
  60  0008 7216500d      	bset	20493,#3
  61                     ; 22 	GPIOB->DDR &= 0xfe;					 //ensure GPIOB pin 0 is input mode (0b1111 1110)
  63  000c 72115007      	bres	20487,#0
  64                     ; 23 	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
  66  0010 c65008        	ld	a,20488
  67                     ; 25 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
  69  0013 c65235        	ld	a,21045
  70  0016 aa0c          	or	a,#12
  71  0018 c75235        	ld	21045,a
  72                     ; 26 	USART1->CR3 &= ~(USART_CR3_STOP);					 // 1 stop bit (0b0011 0000)
  74  001b c65236        	ld	a,21046
  75  001e a4cf          	and	a,#207
  76  0020 c75236        	ld	21046,a
  77                     ; 27 	USART1->BRR2 = 0x03;								 //setting
  79  0023 35035233      	mov	21043,#3
  80                     ; 28 	USART1->BRR1 = 0x68;								 // 9600 baud
  82  0027 35685232      	mov	21042,#104
  83                     ; 30 	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT); 
  85  002b 4b00          	push	#0
  86  002d 4b01          	push	#1
  87  002f ae5005        	ldw	x,#20485
  88  0032 cd0000        	call	_GPIO_Init
  90  0035 85            	popw	x
  91                     ; 31 }
  94  0036 81            	ret
 165                     ; 34 void reverse(char* str, int len)
 165                     ; 35 {
 166                     	switch	.text
 167  0037               _reverse:
 169  0037 89            	pushw	x
 170  0038 5206          	subw	sp,#6
 171       00000006      OFST:	set	6
 174                     ; 36     int i = 0, j = len - 1, temp;
 176  003a 5f            	clrw	x
 177  003b 1f03          	ldw	(OFST-3,sp),x
 181  003d 1e0b          	ldw	x,(OFST+5,sp)
 182  003f 5a            	decw	x
 183  0040 1f05          	ldw	(OFST-1,sp),x
 186  0042 202c          	jra	L36
 187  0044               L75:
 188                     ; 38         temp = str[i];
 190  0044 1e03          	ldw	x,(OFST-3,sp)
 191  0046 72fb07        	addw	x,(OFST+1,sp)
 192  0049 f6            	ld	a,(x)
 193  004a 5f            	clrw	x
 194  004b 97            	ld	xl,a
 195  004c 1f01          	ldw	(OFST-5,sp),x
 197                     ; 39         str[i] = str[j];
 199  004e 1e05          	ldw	x,(OFST-1,sp)
 200  0050 72fb07        	addw	x,(OFST+1,sp)
 201  0053 f6            	ld	a,(x)
 202  0054 1e03          	ldw	x,(OFST-3,sp)
 203  0056 72fb07        	addw	x,(OFST+1,sp)
 204  0059 f7            	ld	(x),a
 205                     ; 40         str[j] = temp;
 207  005a 7b02          	ld	a,(OFST-4,sp)
 208  005c 1e05          	ldw	x,(OFST-1,sp)
 209  005e 72fb07        	addw	x,(OFST+1,sp)
 210  0061 f7            	ld	(x),a
 211                     ; 41         i++;
 213  0062 1e03          	ldw	x,(OFST-3,sp)
 214  0064 1c0001        	addw	x,#1
 215  0067 1f03          	ldw	(OFST-3,sp),x
 217                     ; 42         j--;
 219  0069 1e05          	ldw	x,(OFST-1,sp)
 220  006b 1d0001        	subw	x,#1
 221  006e 1f05          	ldw	(OFST-1,sp),x
 223  0070               L36:
 224                     ; 37     while (i < j) {
 226  0070 9c            	rvf
 227  0071 1e03          	ldw	x,(OFST-3,sp)
 228  0073 1305          	cpw	x,(OFST-1,sp)
 229  0075 2fcd          	jrslt	L75
 230                     ; 44 }
 233  0077 5b08          	addw	sp,#8
 234  0079 81            	ret
 297                     ; 50 int intToStr(int x, char str[], int d)
 297                     ; 51 {
 298                     	switch	.text
 299  007a               _intToStr:
 301  007a 89            	pushw	x
 302  007b 89            	pushw	x
 303       00000002      OFST:	set	2
 306                     ; 52     int i = 0;
 308  007c 5f            	clrw	x
 309  007d 1f01          	ldw	(OFST-1,sp),x
 312  007f 2026          	jra	L521
 313  0081               L121:
 314                     ; 54         str[i++] = (x % 10) + '0';
 316  0081 1e03          	ldw	x,(OFST+1,sp)
 317  0083 a60a          	ld	a,#10
 318  0085 cd0000        	call	c_smodx
 320  0088 1c0030        	addw	x,#48
 321  008b 1601          	ldw	y,(OFST-1,sp)
 322  008d 72a90001      	addw	y,#1
 323  0091 1701          	ldw	(OFST-1,sp),y
 324  0093 72a20001      	subw	y,#1
 326  0097 72f907        	addw	y,(OFST+5,sp)
 327  009a 01            	rrwa	x,a
 328  009b 90f7          	ld	(y),a
 329  009d 02            	rlwa	x,a
 330                     ; 55         x = x / 10;
 332  009e 1e03          	ldw	x,(OFST+1,sp)
 333  00a0 a60a          	ld	a,#10
 334  00a2 cd0000        	call	c_sdivx
 336  00a5 1f03          	ldw	(OFST+1,sp),x
 337  00a7               L521:
 338                     ; 53     while (x) {
 340  00a7 1e03          	ldw	x,(OFST+1,sp)
 341  00a9 26d6          	jrne	L121
 343  00ab 2010          	jra	L331
 344  00ad               L131:
 345                     ; 61         str[i++] = '0';
 347  00ad 1e01          	ldw	x,(OFST-1,sp)
 348  00af 1c0001        	addw	x,#1
 349  00b2 1f01          	ldw	(OFST-1,sp),x
 350  00b4 1d0001        	subw	x,#1
 352  00b7 72fb07        	addw	x,(OFST+5,sp)
 353  00ba a630          	ld	a,#48
 354  00bc f7            	ld	(x),a
 355  00bd               L331:
 356                     ; 60     while (i < d)
 358  00bd 9c            	rvf
 359  00be 1e01          	ldw	x,(OFST-1,sp)
 360  00c0 1309          	cpw	x,(OFST+7,sp)
 361  00c2 2fe9          	jrslt	L131
 362                     ; 63     reverse(str, i);
 364  00c4 1e01          	ldw	x,(OFST-1,sp)
 365  00c6 89            	pushw	x
 366  00c7 1e09          	ldw	x,(OFST+7,sp)
 367  00c9 cd0037        	call	_reverse
 369  00cc 85            	popw	x
 370                     ; 64     str[i] = '\0';
 372  00cd 1e01          	ldw	x,(OFST-1,sp)
 373  00cf 72fb07        	addw	x,(OFST+5,sp)
 374  00d2 7f            	clr	(x)
 375                     ; 65     return i;
 377  00d3 1e01          	ldw	x,(OFST-1,sp)
 380  00d5 5b04          	addw	sp,#4
 381  00d7 81            	ret
 463                     ; 69 void ftoa(float n, char* res, int afterpoint)
 463                     ; 70 {
 464                     	switch	.text
 465  00d8               _ftoa:
 467  00d8 520a          	subw	sp,#10
 468       0000000a      OFST:	set	10
 471                     ; 72     int ipart = (int)n;
 473  00da 96            	ldw	x,sp
 474  00db 1c000d        	addw	x,#OFST+3
 475  00de cd0000        	call	c_ltor
 477  00e1 cd0000        	call	c_ftoi
 479  00e4 1f09          	ldw	(OFST-1,sp),x
 481                     ; 75     float fpart = n - (float)ipart;
 483  00e6 1e09          	ldw	x,(OFST-1,sp)
 484  00e8 cd0000        	call	c_itof
 486  00eb 96            	ldw	x,sp
 487  00ec 1c0001        	addw	x,#OFST-9
 488  00ef cd0000        	call	c_rtol
 491  00f2 96            	ldw	x,sp
 492  00f3 1c000d        	addw	x,#OFST+3
 493  00f6 cd0000        	call	c_ltor
 495  00f9 96            	ldw	x,sp
 496  00fa 1c0001        	addw	x,#OFST-9
 497  00fd cd0000        	call	c_fsub
 499  0100 96            	ldw	x,sp
 500  0101 1c0005        	addw	x,#OFST-5
 501  0104 cd0000        	call	c_rtol
 504                     ; 78     int i = intToStr(ipart, res, 0);
 506  0107 5f            	clrw	x
 507  0108 89            	pushw	x
 508  0109 1e13          	ldw	x,(OFST+9,sp)
 509  010b 89            	pushw	x
 510  010c 1e0d          	ldw	x,(OFST+3,sp)
 511  010e cd007a        	call	_intToStr
 513  0111 5b04          	addw	sp,#4
 514  0113 1f09          	ldw	(OFST-1,sp),x
 516                     ; 81     if (afterpoint != 0) {
 518  0115 1e13          	ldw	x,(OFST+9,sp)
 519  0117 2740          	jreq	L102
 520                     ; 82         res[i] = '.'; // add dot
 522  0119 1e09          	ldw	x,(OFST-1,sp)
 523  011b 72fb11        	addw	x,(OFST+7,sp)
 524  011e a62e          	ld	a,#46
 525  0120 f7            	ld	(x),a
 526                     ; 87         fpart = fpart * pow(10, afterpoint);
 528  0121 1e13          	ldw	x,(OFST+9,sp)
 529  0123 cd0000        	call	c_itof
 531  0126 be02          	ldw	x,c_lreg+2
 532  0128 89            	pushw	x
 533  0129 be00          	ldw	x,c_lreg
 534  012b 89            	pushw	x
 535  012c ce0044        	ldw	x,L702+2
 536  012f 89            	pushw	x
 537  0130 ce0042        	ldw	x,L702
 538  0133 89            	pushw	x
 539  0134 cd0000        	call	_pow
 541  0137 5b08          	addw	sp,#8
 542  0139 96            	ldw	x,sp
 543  013a 1c0005        	addw	x,#OFST-5
 544  013d cd0000        	call	c_fgmul
 547                     ; 89         intToStr((int)fpart, res + i + 1, afterpoint);
 549  0140 1e13          	ldw	x,(OFST+9,sp)
 550  0142 89            	pushw	x
 551  0143 1e0b          	ldw	x,(OFST+1,sp)
 552  0145 72fb13        	addw	x,(OFST+9,sp)
 553  0148 5c            	incw	x
 554  0149 89            	pushw	x
 555  014a 96            	ldw	x,sp
 556  014b 1c0009        	addw	x,#OFST-1
 557  014e cd0000        	call	c_ltor
 559  0151 cd0000        	call	c_ftoi
 561  0154 cd007a        	call	_intToStr
 563  0157 5b04          	addw	sp,#4
 564  0159               L102:
 565                     ; 91 }
 568  0159 5b0a          	addw	sp,#10
 569  015b 81            	ret
 603                     ; 93 char putchar(char c)
 603                     ; 94 {
 604                     	switch	.text
 605  015c               _putchar:
 607  015c 88            	push	a
 608       00000000      OFST:	set	0
 611  015d               L332:
 612                     ; 95 	while (!(USART1->SR & USART_SR_TXE))
 614  015d c65230        	ld	a,21040
 615  0160 a580          	bcp	a,#128
 616  0162 27f9          	jreq	L332
 617                     ; 97 	USART1->DR = c;
 619  0164 7b01          	ld	a,(OFST+1,sp)
 620  0166 c75231        	ld	21041,a
 621                     ; 98 	return (c);
 623  0169 7b01          	ld	a,(OFST+1,sp)
 626  016b 5b01          	addw	sp,#1
 627  016d 81            	ret
 661                     ; 101 char getchar(void)
 661                     ; 102 {
 662                     	switch	.text
 663  016e               _getchar:
 665  016e 88            	push	a
 666       00000001      OFST:	set	1
 669  016f               L752:
 670                     ; 104 	while (!(USART1->SR & USART_SR_RXNE))
 672  016f c65230        	ld	a,21040
 673  0172 a520          	bcp	a,#32
 674  0174 27f9          	jreq	L752
 675                     ; 106 	c = USART1->DR;
 677  0176 c65231        	ld	a,21041
 678  0179 6b01          	ld	(OFST+0,sp),a
 680                     ; 107 	return (c);
 682  017b 7b01          	ld	a,(OFST+0,sp)
 685  017d 5b01          	addw	sp,#1
 686  017f 81            	ret
 720                     ; 110 void UART_TX(unsigned char val)
 720                     ; 111 {
 721                     	switch	.text
 722  0180               _UART_TX:
 724  0180 88            	push	a
 725       00000000      OFST:	set	0
 728  0181               L303:
 729                     ; 112 	while (!(USART1->SR & USART_SR_TXE))
 731  0181 c65230        	ld	a,21040
 732  0184 a580          	bcp	a,#128
 733  0186 27f9          	jreq	L303
 734                     ; 114 	USART1->DR = val;
 736  0188 7b01          	ld	a,(OFST+1,sp)
 737  018a c75231        	ld	21041,a
 738                     ; 115 }
 741  018d 84            	pop	a
 742  018e 81            	ret
 765                     ; 117 unsigned char UART_RX(void)
 765                     ; 118 {
 766                     	switch	.text
 767  018f               _UART_RX:
 771  018f               L123:
 772                     ; 119 	while (!(USART1->SR & USART_SR_RXNE))
 774  018f c65230        	ld	a,21040
 775  0192 a520          	bcp	a,#32
 776  0194 27f9          	jreq	L123
 777                     ; 121 	return USART1->DR;
 779  0196 c65231        	ld	a,21041
 782  0199 81            	ret
 818                     ; 124 void UART_Poll(void)
 818                     ; 125 {
 819                     	switch	.text
 820  019a               _UART_Poll:
 822  019a 88            	push	a
 823       00000001      OFST:	set	1
 826                     ; 127 	unsigned char inChar = 0;
 828                     ; 128 	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
 830  019b c65230        	ld	a,21040
 831  019e a520          	bcp	a,#32
 832  01a0 2708          	jreq	L343
 833                     ; 130 		inChar = UART_RX();
 835  01a2 adeb          	call	_UART_RX
 837  01a4 6b01          	ld	(OFST+0,sp),a
 839                     ; 131 		UART_TX(inChar);
 841  01a6 7b01          	ld	a,(OFST+0,sp)
 842  01a8 add6          	call	_UART_TX
 844  01aa               L343:
 845                     ; 133 }
 848  01aa 84            	pop	a
 849  01ab 81            	ret
 852                     	xref	_UART_SendReading
 946                     ; 135 void UART_2PC(uint16_t nbReadings, float readingResults[])
 946                     ; 136 {
 947                     	switch	.text
 948  01ac               _UART_2PC:
 950  01ac 89            	pushw	x
 951  01ad 5207          	subw	sp,#7
 952       00000007      OFST:	set	7
 955                     ; 141 	val = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0);
 957  01af 4b01          	push	#1
 958  01b1 ae5005        	ldw	x,#20485
 959  01b4 cd0000        	call	_GPIO_ReadInputDataBit
 961  01b7 5b01          	addw	sp,#1
 962  01b9 6b01          	ld	(OFST-6,sp),a
 964                     ; 142 	if (val == SET && welcome == 0)
 966  01bb 7b01          	ld	a,(OFST-6,sp)
 967  01bd a101          	cp	a,#1
 968  01bf 2611          	jrne	L314
 970  01c1 be00          	ldw	x,_welcome
 971  01c3 260d          	jrne	L314
 972                     ; 144 		printf("Welcome to the Greenhouse Datalogger\n");
 974  01c5 ae001c        	ldw	x,#L514
 975  01c8 cd0000        	call	_printf
 977                     ; 145 		welcome++;
 979  01cb be00          	ldw	x,_welcome
 980  01cd 1c0001        	addw	x,#1
 981  01d0 bf00          	ldw	_welcome,x
 982  01d2               L314:
 983                     ; 147 	printf("Transmitting Data...\n");
 985  01d2 ae0006        	ldw	x,#L714
 986  01d5 cd0000        	call	_printf
 988                     ; 148 	for (i = 0; i < nbReadings; i++)
 990  01d8 5f            	clrw	x
 991  01d9 1f06          	ldw	(OFST-1,sp),x
 994  01db 2022          	jra	L524
 995  01dd               L124:
 996                     ; 150 		n = readingResults[i];
 998  01dd 1e06          	ldw	x,(OFST-1,sp)
 999  01df 58            	sllw	x
1000  01e0 58            	sllw	x
1001  01e1 72fb0c        	addw	x,(OFST+5,sp)
1002  01e4 9093          	ldw	y,x
1003  01e6 ee02          	ldw	x,(2,x)
1004  01e8 1f04          	ldw	(OFST-3,sp),x
1005  01ea 93            	ldw	x,y
1006  01eb fe            	ldw	x,(x)
1007  01ec 1f02          	ldw	(OFST-5,sp),x
1009                     ; 151 		UART_SendReading(n);
1011  01ee 1e04          	ldw	x,(OFST-3,sp)
1012  01f0 89            	pushw	x
1013  01f1 1e04          	ldw	x,(OFST-3,sp)
1014  01f3 89            	pushw	x
1015  01f4 ad12          	call	_UART_SendReading
1017  01f6 5b04          	addw	sp,#4
1018                     ; 148 	for (i = 0; i < nbReadings; i++)
1020  01f8 1e06          	ldw	x,(OFST-1,sp)
1021  01fa 1c0001        	addw	x,#1
1022  01fd 1f06          	ldw	(OFST-1,sp),x
1024  01ff               L524:
1027  01ff 1e06          	ldw	x,(OFST-1,sp)
1028  0201 1308          	cpw	x,(OFST+1,sp)
1029  0203 25d8          	jrult	L124
1030                     ; 153 }
1033  0205 5b09          	addw	sp,#9
1034  0207 81            	ret
1080                     ; 155 void UART_SendReading(float n)
1080                     ; 156 {
1081                     	switch	.text
1082  0208               _UART_SendReading:
1084  0208 5208          	subw	sp,#8
1085       00000008      OFST:	set	8
1088                     ; 159 		ftoa(n, buff, 1);
1090  020a ae0001        	ldw	x,#1
1091  020d 89            	pushw	x
1092  020e 96            	ldw	x,sp
1093  020f 1c0003        	addw	x,#OFST-5
1094  0212 89            	pushw	x
1095  0213 1e11          	ldw	x,(OFST+9,sp)
1096  0215 89            	pushw	x
1097  0216 1e11          	ldw	x,(OFST+9,sp)
1098  0218 89            	pushw	x
1099  0219 cd00d8        	call	_ftoa
1101  021c 5b08          	addw	sp,#8
1102                     ; 160 		printf("$%s;\n", buff);
1104  021e 96            	ldw	x,sp
1105  021f 1c0001        	addw	x,#OFST-7
1106  0222 89            	pushw	x
1107  0223 ae0000        	ldw	x,#L354
1108  0226 cd0000        	call	_printf
1110  0229 85            	popw	x
1111                     ; 161 }
1114  022a 5b08          	addw	sp,#8
1115  022c 81            	ret
1139                     	xdef	_UART_SendReading
1140                     	xdef	_welcome
1141                     	xref	_pow
1142                     	xdef	_putchar
1143                     	xref	_printf
1144                     	xdef	_getchar
1145                     	xdef	_UART_2PC
1146                     	xdef	_UART_Poll
1147                     	xdef	_UART_RX
1148                     	xdef	_UART_TX
1149                     	xdef	_ftoa
1150                     	xdef	_intToStr
1151                     	xdef	_reverse
1152                     	xdef	_UART_init
1153                     	xref	_GPIO_ReadInputDataBit
1154                     	xref	_GPIO_Init
1155                     .const:	section	.text
1156  0000               L354:
1157  0000 2425733b0a00  	dc.b	"$%s;",10,0
1158  0006               L714:
1159  0006 5472616e736d  	dc.b	"Transmitting Data."
1160  0018 2e2e0a00      	dc.b	"..",10,0
1161  001c               L514:
1162  001c 57656c636f6d  	dc.b	"Welcome to the Gre"
1163  002e 656e686f7573  	dc.b	"enhouse Datalogger"
1164  0040 0a00          	dc.b	10,0
1165  0042               L702:
1166  0042 41200000      	dc.w	16672,0
1167                     	xref.b	c_lreg
1168                     	xref.b	c_x
1188                     	xref	c_fgmul
1189                     	xref	c_fsub
1190                     	xref	c_rtol
1191                     	xref	c_itof
1192                     	xref	c_ftoi
1193                     	xref	c_ltor
1194                     	xref	c_sdivx
1195                     	xref	c_smodx
1196                     	end
