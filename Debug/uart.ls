   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _welcome:
  15  0000 0000          	dc.w	0
  45                     ; 14 void UART_init()
  45                     ; 15 {
  47                     	switch	.text
  48  0000               _UART_init:
  52                     ; 16 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
  54  0000 721a50c3      	bset	20675,#5
  55                     ; 19 	GPIOC->DDR |= 0x08;					 // Put TX line on (0b0000 1000)
  57  0004 7216500c      	bset	20492,#3
  58                     ; 20 	GPIOC->CR1 |= 0x08;					 // USART Wakeup method (0b0000 1000)
  60  0008 7216500d      	bset	20493,#3
  61                     ; 21 	GPIOB->DDR &= 0xfe;					 //ensure GPIOB pin 0 is input mode (0b1111 1110)
  63  000c 72115007      	bres	20487,#0
  64                     ; 22 	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
  66  0010 c65008        	ld	a,20488
  67                     ; 24 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
  69  0013 c65235        	ld	a,21045
  70  0016 aa0c          	or	a,#12
  71  0018 c75235        	ld	21045,a
  72                     ; 25 	USART1->CR3 &= ~(USART_CR3_STOP);					 // 1 stop bit (0b0011 0000)
  74  001b c65236        	ld	a,21046
  75  001e a4cf          	and	a,#207
  76  0020 c75236        	ld	21046,a
  77                     ; 26 	USART1->BRR2 = 0x03;								 //setting
  79  0023 35035233      	mov	21043,#3
  80                     ; 27 	USART1->BRR1 = 0x68;								 // 9600 baud
  82  0027 35685232      	mov	21042,#104
  83                     ; 29 	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT); 
  85  002b 4b00          	push	#0
  86  002d 4b01          	push	#1
  87  002f ae5005        	ldw	x,#20485
  88  0032 cd0000        	call	_GPIO_Init
  90  0035 85            	popw	x
  91                     ; 30 }
  94  0036 81            	ret
 165                     ; 33 void reverse(char* str, int len)
 165                     ; 34 {
 166                     	switch	.text
 167  0037               _reverse:
 169  0037 89            	pushw	x
 170  0038 5206          	subw	sp,#6
 171       00000006      OFST:	set	6
 174                     ; 35     int i = 0, j = len - 1, temp;
 176  003a 5f            	clrw	x
 177  003b 1f03          	ldw	(OFST-3,sp),x
 181  003d 1e0b          	ldw	x,(OFST+5,sp)
 182  003f 5a            	decw	x
 183  0040 1f05          	ldw	(OFST-1,sp),x
 186  0042 202c          	jra	L36
 187  0044               L75:
 188                     ; 37         temp = str[i];
 190  0044 1e03          	ldw	x,(OFST-3,sp)
 191  0046 72fb07        	addw	x,(OFST+1,sp)
 192  0049 f6            	ld	a,(x)
 193  004a 5f            	clrw	x
 194  004b 97            	ld	xl,a
 195  004c 1f01          	ldw	(OFST-5,sp),x
 197                     ; 38         str[i] = str[j];
 199  004e 1e05          	ldw	x,(OFST-1,sp)
 200  0050 72fb07        	addw	x,(OFST+1,sp)
 201  0053 f6            	ld	a,(x)
 202  0054 1e03          	ldw	x,(OFST-3,sp)
 203  0056 72fb07        	addw	x,(OFST+1,sp)
 204  0059 f7            	ld	(x),a
 205                     ; 39         str[j] = temp;
 207  005a 7b02          	ld	a,(OFST-4,sp)
 208  005c 1e05          	ldw	x,(OFST-1,sp)
 209  005e 72fb07        	addw	x,(OFST+1,sp)
 210  0061 f7            	ld	(x),a
 211                     ; 40         i++;
 213  0062 1e03          	ldw	x,(OFST-3,sp)
 214  0064 1c0001        	addw	x,#1
 215  0067 1f03          	ldw	(OFST-3,sp),x
 217                     ; 41         j--;
 219  0069 1e05          	ldw	x,(OFST-1,sp)
 220  006b 1d0001        	subw	x,#1
 221  006e 1f05          	ldw	(OFST-1,sp),x
 223  0070               L36:
 224                     ; 36     while (i < j) {
 226  0070 9c            	rvf
 227  0071 1e03          	ldw	x,(OFST-3,sp)
 228  0073 1305          	cpw	x,(OFST-1,sp)
 229  0075 2fcd          	jrslt	L75
 230                     ; 43 }
 233  0077 5b08          	addw	sp,#8
 234  0079 81            	ret
 297                     ; 49 int intToStr(int x, char str[], int d)
 297                     ; 50 {
 298                     	switch	.text
 299  007a               _intToStr:
 301  007a 89            	pushw	x
 302  007b 89            	pushw	x
 303       00000002      OFST:	set	2
 306                     ; 51     int i = 0;
 308  007c 5f            	clrw	x
 309  007d 1f01          	ldw	(OFST-1,sp),x
 312  007f 2026          	jra	L521
 313  0081               L121:
 314                     ; 53         str[i++] = (x % 10) + '0';
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
 330                     ; 54         x = x / 10;
 332  009e 1e03          	ldw	x,(OFST+1,sp)
 333  00a0 a60a          	ld	a,#10
 334  00a2 cd0000        	call	c_sdivx
 336  00a5 1f03          	ldw	(OFST+1,sp),x
 337  00a7               L521:
 338                     ; 52     while (x) {
 340  00a7 1e03          	ldw	x,(OFST+1,sp)
 341  00a9 26d6          	jrne	L121
 343  00ab 2010          	jra	L331
 344  00ad               L131:
 345                     ; 60         str[i++] = '0';
 347  00ad 1e01          	ldw	x,(OFST-1,sp)
 348  00af 1c0001        	addw	x,#1
 349  00b2 1f01          	ldw	(OFST-1,sp),x
 350  00b4 1d0001        	subw	x,#1
 352  00b7 72fb07        	addw	x,(OFST+5,sp)
 353  00ba a630          	ld	a,#48
 354  00bc f7            	ld	(x),a
 355  00bd               L331:
 356                     ; 59     while (i < d)
 358  00bd 9c            	rvf
 359  00be 1e01          	ldw	x,(OFST-1,sp)
 360  00c0 1309          	cpw	x,(OFST+7,sp)
 361  00c2 2fe9          	jrslt	L131
 362                     ; 62     reverse(str, i);
 364  00c4 1e01          	ldw	x,(OFST-1,sp)
 365  00c6 89            	pushw	x
 366  00c7 1e09          	ldw	x,(OFST+7,sp)
 367  00c9 cd0037        	call	_reverse
 369  00cc 85            	popw	x
 370                     ; 63     str[i] = '\0';
 372  00cd 1e01          	ldw	x,(OFST-1,sp)
 373  00cf 72fb07        	addw	x,(OFST+5,sp)
 374  00d2 7f            	clr	(x)
 375                     ; 64     return i;
 377  00d3 1e01          	ldw	x,(OFST-1,sp)
 380  00d5 5b04          	addw	sp,#4
 381  00d7 81            	ret
 480                     ; 68 void ftoa(float n, char* res, int afterpoint)
 480                     ; 69 {
 481                     	switch	.text
 482  00d8               _ftoa:
 484  00d8 520e          	subw	sp,#14
 485       0000000e      OFST:	set	14
 488                     ; 71     int ipart = (int)n;
 490  00da 96            	ldw	x,sp
 491  00db 1c0011        	addw	x,#OFST+3
 492  00de cd0000        	call	c_ltor
 494  00e1 cd0000        	call	c_ftoi
 496  00e4 1f09          	ldw	(OFST-5,sp),x
 498                     ; 74     float fpart = n - (float)ipart;
 500  00e6 1e09          	ldw	x,(OFST-5,sp)
 501  00e8 cd0000        	call	c_itof
 503  00eb 96            	ldw	x,sp
 504  00ec 1c0001        	addw	x,#OFST-13
 505  00ef cd0000        	call	c_rtol
 508  00f2 96            	ldw	x,sp
 509  00f3 1c0011        	addw	x,#OFST+3
 510  00f6 cd0000        	call	c_ltor
 512  00f9 96            	ldw	x,sp
 513  00fa 1c0001        	addw	x,#OFST-13
 514  00fd cd0000        	call	c_fsub
 516  0100 96            	ldw	x,sp
 517  0101 1c0005        	addw	x,#OFST-9
 518  0104 cd0000        	call	c_rtol
 521                     ; 77     int i = intToStr(ipart, res, 0);
 523  0107 5f            	clrw	x
 524  0108 89            	pushw	x
 525  0109 1e17          	ldw	x,(OFST+9,sp)
 526  010b 89            	pushw	x
 527  010c 1e0d          	ldw	x,(OFST-1,sp)
 528  010e cd007a        	call	_intToStr
 530  0111 5b04          	addw	sp,#4
 531  0113 1f09          	ldw	(OFST-5,sp),x
 533                     ; 81 		int power = 1;
 535  0115 ae0001        	ldw	x,#1
 536  0118 1f0d          	ldw	(OFST-1,sp),x
 538                     ; 84     if (afterpoint != 0) {
 540  011a 1e17          	ldw	x,(OFST+9,sp)
 541  011c 2749          	jreq	L112
 542                     ; 85         res[i] = '.'; // add dot
 544  011e 1e09          	ldw	x,(OFST-5,sp)
 545  0120 72fb15        	addw	x,(OFST+7,sp)
 546  0123 a62e          	ld	a,#46
 547  0125 f7            	ld	(x),a
 548                     ; 90 				for (j = 0; j<= afterpoint; j++)
 550  0126 5f            	clrw	x
 551  0127 1f0b          	ldw	(OFST-3,sp),x
 554  0129 2010          	jra	L712
 555  012b               L312:
 556                     ; 91 					power = power * 10; 
 558  012b 1e0d          	ldw	x,(OFST-1,sp)
 559  012d a60a          	ld	a,#10
 560  012f cd0000        	call	c_bmulx
 562  0132 1f0d          	ldw	(OFST-1,sp),x
 564                     ; 90 				for (j = 0; j<= afterpoint; j++)
 566  0134 1e0b          	ldw	x,(OFST-3,sp)
 567  0136 1c0001        	addw	x,#1
 568  0139 1f0b          	ldw	(OFST-3,sp),x
 570  013b               L712:
 573  013b 9c            	rvf
 574  013c 1e0b          	ldw	x,(OFST-3,sp)
 575  013e 1317          	cpw	x,(OFST+9,sp)
 576  0140 2de9          	jrsle	L312
 577                     ; 93         fpart = fpart * power;
 579  0142 1e0d          	ldw	x,(OFST-1,sp)
 580  0144 cd0000        	call	c_itof
 582  0147 96            	ldw	x,sp
 583  0148 1c0005        	addw	x,#OFST-9
 584  014b cd0000        	call	c_fgmul
 587                     ; 95         intToStr((int)fpart, res + i + 1, afterpoint);
 589  014e 1e17          	ldw	x,(OFST+9,sp)
 590  0150 89            	pushw	x
 591  0151 1e0b          	ldw	x,(OFST-3,sp)
 592  0153 72fb17        	addw	x,(OFST+9,sp)
 593  0156 5c            	incw	x
 594  0157 89            	pushw	x
 595  0158 96            	ldw	x,sp
 596  0159 1c0009        	addw	x,#OFST-5
 597  015c cd0000        	call	c_ltor
 599  015f cd0000        	call	c_ftoi
 601  0162 cd007a        	call	_intToStr
 603  0165 5b04          	addw	sp,#4
 604  0167               L112:
 605                     ; 97 }
 608  0167 5b0e          	addw	sp,#14
 609  0169 81            	ret
 643                     ; 99 char putchar(char c)
 643                     ; 100 {
 644                     	switch	.text
 645  016a               _putchar:
 647  016a 88            	push	a
 648       00000000      OFST:	set	0
 651  016b               L342:
 652                     ; 101 	while (!(USART1->SR & USART_SR_TXE))
 654  016b c65230        	ld	a,21040
 655  016e a580          	bcp	a,#128
 656  0170 27f9          	jreq	L342
 657                     ; 103 	USART1->DR = c;
 659  0172 7b01          	ld	a,(OFST+1,sp)
 660  0174 c75231        	ld	21041,a
 661                     ; 104 	return (c);
 663  0177 7b01          	ld	a,(OFST+1,sp)
 666  0179 5b01          	addw	sp,#1
 667  017b 81            	ret
 701                     ; 107 char getchar(void)
 701                     ; 108 {
 702                     	switch	.text
 703  017c               _getchar:
 705  017c 88            	push	a
 706       00000001      OFST:	set	1
 709  017d               L762:
 710                     ; 110 	while (!(USART1->SR & USART_SR_RXNE))
 712  017d c65230        	ld	a,21040
 713  0180 a520          	bcp	a,#32
 714  0182 27f9          	jreq	L762
 715                     ; 112 	c = USART1->DR;
 717  0184 c65231        	ld	a,21041
 718  0187 6b01          	ld	(OFST+0,sp),a
 720                     ; 113 	return (c);
 722  0189 7b01          	ld	a,(OFST+0,sp)
 725  018b 5b01          	addw	sp,#1
 726  018d 81            	ret
 760                     ; 116 void UART_TX(unsigned char val)
 760                     ; 117 {
 761                     	switch	.text
 762  018e               _UART_TX:
 764  018e 88            	push	a
 765       00000000      OFST:	set	0
 768  018f               L313:
 769                     ; 118 	while (!(USART1->SR & USART_SR_TXE))
 771  018f c65230        	ld	a,21040
 772  0192 a580          	bcp	a,#128
 773  0194 27f9          	jreq	L313
 774                     ; 120 	USART1->DR = val;
 776  0196 7b01          	ld	a,(OFST+1,sp)
 777  0198 c75231        	ld	21041,a
 778                     ; 121 }
 781  019b 84            	pop	a
 782  019c 81            	ret
 805                     ; 123 unsigned char UART_RX(void)
 805                     ; 124 {
 806                     	switch	.text
 807  019d               _UART_RX:
 811  019d               L133:
 812                     ; 125 	while (!(USART1->SR & USART_SR_RXNE))
 814  019d c65230        	ld	a,21040
 815  01a0 a520          	bcp	a,#32
 816  01a2 27f9          	jreq	L133
 817                     ; 127 	return USART1->DR;
 819  01a4 c65231        	ld	a,21041
 822  01a7 81            	ret
 858                     ; 130 void UART_Poll(void)
 858                     ; 131 {
 859                     	switch	.text
 860  01a8               _UART_Poll:
 862  01a8 88            	push	a
 863       00000001      OFST:	set	1
 866                     ; 133 	unsigned char inChar = 0;
 868                     ; 134 	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
 870  01a9 c65230        	ld	a,21040
 871  01ac a520          	bcp	a,#32
 872  01ae 2708          	jreq	L353
 873                     ; 136 		inChar = UART_RX();
 875  01b0 adeb          	call	_UART_RX
 877  01b2 6b01          	ld	(OFST+0,sp),a
 879                     ; 137 		UART_TX(inChar);
 881  01b4 7b01          	ld	a,(OFST+0,sp)
 882  01b6 add6          	call	_UART_TX
 884  01b8               L353:
 885                     ; 139 }
 888  01b8 84            	pop	a
 889  01b9 81            	ret
 892                     	xref	_UART_SendReading
1005                     ; 141 void UART_2PC(uint16_t nbReadings, float tempResults[],float humResults[])
1005                     ; 142 {
1006                     	switch	.text
1007  01ba               _UART_2PC:
1009  01ba 89            	pushw	x
1010  01bb 520b          	subw	sp,#11
1011       0000000b      OFST:	set	11
1014                     ; 147 	val = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0);
1016  01bd 4b01          	push	#1
1017  01bf ae5005        	ldw	x,#20485
1018  01c2 cd0000        	call	_GPIO_ReadInputDataBit
1020  01c5 5b01          	addw	sp,#1
1021  01c7 6b01          	ld	(OFST-10,sp),a
1023                     ; 148 	if (val == SET && welcome == 0)
1025  01c9 7b01          	ld	a,(OFST-10,sp)
1026  01cb a101          	cp	a,#1
1027  01cd 2617          	jrne	L334
1029  01cf be00          	ldw	x,_welcome
1030  01d1 2613          	jrne	L334
1031                     ; 150 		printf("Welcome to the Greenhouse Datalogger\n");
1033  01d3 ae001f        	ldw	x,#L534
1034  01d6 cd0000        	call	_printf
1036                     ; 151 		printf("Transmitting Data...\n");
1038  01d9 ae0009        	ldw	x,#L734
1039  01dc cd0000        	call	_printf
1041                     ; 152 		welcome++;
1043  01df be00          	ldw	x,_welcome
1044  01e1 1c0001        	addw	x,#1
1045  01e4 bf00          	ldw	_welcome,x
1046  01e6               L334:
1047                     ; 155 	for (i = 0; i < nbReadings; i++)
1049  01e6 5f            	clrw	x
1050  01e7 1f0a          	ldw	(OFST-1,sp),x
1053  01e9 2039          	jra	L544
1054  01eb               L144:
1055                     ; 157 		t = tempResults[i];
1057  01eb 1e0a          	ldw	x,(OFST-1,sp)
1058  01ed 58            	sllw	x
1059  01ee 58            	sllw	x
1060  01ef 72fb10        	addw	x,(OFST+5,sp)
1061  01f2 9093          	ldw	y,x
1062  01f4 ee02          	ldw	x,(2,x)
1063  01f6 1f04          	ldw	(OFST-7,sp),x
1064  01f8 93            	ldw	x,y
1065  01f9 fe            	ldw	x,(x)
1066  01fa 1f02          	ldw	(OFST-9,sp),x
1068                     ; 158 		h = humResults[i];
1070  01fc 1e0a          	ldw	x,(OFST-1,sp)
1071  01fe 58            	sllw	x
1072  01ff 58            	sllw	x
1073  0200 72fb12        	addw	x,(OFST+7,sp)
1074  0203 9093          	ldw	y,x
1075  0205 ee02          	ldw	x,(2,x)
1076  0207 1f08          	ldw	(OFST-3,sp),x
1077  0209 93            	ldw	x,y
1078  020a fe            	ldw	x,(x)
1079  020b 1f06          	ldw	(OFST-5,sp),x
1081                     ; 159 		UART_SendReading(t, h);
1083  020d 1e08          	ldw	x,(OFST-3,sp)
1084  020f 89            	pushw	x
1085  0210 1e08          	ldw	x,(OFST-3,sp)
1086  0212 89            	pushw	x
1087  0213 1e08          	ldw	x,(OFST-3,sp)
1088  0215 89            	pushw	x
1089  0216 1e08          	ldw	x,(OFST-3,sp)
1090  0218 89            	pushw	x
1091  0219 ad12          	call	_UART_SendReading
1093  021b 5b08          	addw	sp,#8
1094                     ; 155 	for (i = 0; i < nbReadings; i++)
1096  021d 1e0a          	ldw	x,(OFST-1,sp)
1097  021f 1c0001        	addw	x,#1
1098  0222 1f0a          	ldw	(OFST-1,sp),x
1100  0224               L544:
1103  0224 1e0a          	ldw	x,(OFST-1,sp)
1104  0226 130c          	cpw	x,(OFST+1,sp)
1105  0228 25c1          	jrult	L144
1106                     ; 161 }
1109  022a 5b0d          	addw	sp,#13
1110  022c 81            	ret
1175                     ; 163 void UART_SendReading(float t, float h)
1175                     ; 164 {
1176                     	switch	.text
1177  022d               _UART_SendReading:
1179  022d 5210          	subw	sp,#16
1180       00000010      OFST:	set	16
1183                     ; 168 		ftoa(t, tempBuff, 1);
1185  022f ae0001        	ldw	x,#1
1186  0232 89            	pushw	x
1187  0233 96            	ldw	x,sp
1188  0234 1c0003        	addw	x,#OFST-13
1189  0237 89            	pushw	x
1190  0238 1e19          	ldw	x,(OFST+9,sp)
1191  023a 89            	pushw	x
1192  023b 1e19          	ldw	x,(OFST+9,sp)
1193  023d 89            	pushw	x
1194  023e cd00d8        	call	_ftoa
1196  0241 5b08          	addw	sp,#8
1197                     ; 169 		ftoa(h, humBuff, 1);
1199  0243 ae0001        	ldw	x,#1
1200  0246 89            	pushw	x
1201  0247 96            	ldw	x,sp
1202  0248 1c000b        	addw	x,#OFST-5
1203  024b 89            	pushw	x
1204  024c 1e1d          	ldw	x,(OFST+13,sp)
1205  024e 89            	pushw	x
1206  024f 1e1d          	ldw	x,(OFST+13,sp)
1207  0251 89            	pushw	x
1208  0252 cd00d8        	call	_ftoa
1210  0255 5b08          	addw	sp,#8
1211                     ; 170 		printf("$%s %s;\n", tempBuff, humBuff);
1213  0257 96            	ldw	x,sp
1214  0258 1c0009        	addw	x,#OFST-7
1215  025b 89            	pushw	x
1216  025c 96            	ldw	x,sp
1217  025d 1c0003        	addw	x,#OFST-13
1218  0260 89            	pushw	x
1219  0261 ae0000        	ldw	x,#L305
1220  0264 cd0000        	call	_printf
1222  0267 5b04          	addw	sp,#4
1223                     ; 171 }
1226  0269 5b10          	addw	sp,#16
1227  026b 81            	ret
1251                     	xdef	_UART_SendReading
1252                     	xdef	_welcome
1253                     	xdef	_putchar
1254                     	xref	_printf
1255                     	xdef	_getchar
1256                     	xdef	_UART_2PC
1257                     	xdef	_UART_Poll
1258                     	xdef	_UART_RX
1259                     	xdef	_UART_TX
1260                     	xdef	_ftoa
1261                     	xdef	_intToStr
1262                     	xdef	_reverse
1263                     	xdef	_UART_init
1264                     	xref	_GPIO_ReadInputDataBit
1265                     	xref	_GPIO_Init
1266                     .const:	section	.text
1267  0000               L305:
1268  0000 242573202573  	dc.b	"$%s %s;",10,0
1269  0009               L734:
1270  0009 5472616e736d  	dc.b	"Transmitting Data."
1271  001b 2e2e0a00      	dc.b	"..",10,0
1272  001f               L534:
1273  001f 57656c636f6d  	dc.b	"Welcome to the Gre"
1274  0031 656e686f7573  	dc.b	"enhouse Datalogger"
1275  0043 0a00          	dc.b	10,0
1276                     	xref.b	c_x
1296                     	xref	c_fgmul
1297                     	xref	c_bmulx
1298                     	xref	c_fsub
1299                     	xref	c_rtol
1300                     	xref	c_itof
1301                     	xref	c_ftoi
1302                     	xref	c_ltor
1303                     	xref	c_sdivx
1304                     	xref	c_smodx
1305                     	end
