   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _welcome:
  15  0000 0000          	dc.w	0
  45                     ; 13 void UART_init()
  45                     ; 14 {
  47                     	switch	.text
  48  0000               _UART_init:
  52                     ; 15 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
  54  0000 721a50c3      	bset	20675,#5
  55                     ; 18 	GPIOC->DDR |= 0x08; // Put TX line on (0b0000 1000)
  57  0004 7216500c      	bset	20492,#3
  58                     ; 19 	GPIOC->CR1 |= 0x08; // USART Wakeup method (0b0000 1000)
  60  0008 7216500d      	bset	20493,#3
  61                     ; 21 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
  63  000c c65235        	ld	a,21045
  64  000f aa0c          	or	a,#12
  65  0011 c75235        	ld	21045,a
  66                     ; 22 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit (0b0011 0000)
  68  0014 c65236        	ld	a,21046
  69  0017 a4cf          	and	a,#207
  70  0019 c75236        	ld	21046,a
  71                     ; 23 	USART1->BRR2 = 0x03;			  //setting
  73  001c 35035233      	mov	21043,#3
  74                     ; 24 	USART1->BRR1 = 0x68;			  // 9600 baud
  76  0020 35685232      	mov	21042,#104
  77                     ; 26 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_In_FL_No_IT);
  79  0024 4b00          	push	#0
  80  0026 4b20          	push	#32
  81  0028 ae500a        	ldw	x,#20490
  82  002b cd0000        	call	_GPIO_Init
  84  002e 85            	popw	x
  85                     ; 27 }
  88  002f 81            	ret
 159                     ; 30 void reverse(char *str, int len)
 159                     ; 31 {
 160                     	switch	.text
 161  0030               _reverse:
 163  0030 89            	pushw	x
 164  0031 5206          	subw	sp,#6
 165       00000006      OFST:	set	6
 168                     ; 32 	int i = 0, j = len - 1, temp;
 170  0033 5f            	clrw	x
 171  0034 1f03          	ldw	(OFST-3,sp),x
 175  0036 1e0b          	ldw	x,(OFST+5,sp)
 176  0038 5a            	decw	x
 177  0039 1f05          	ldw	(OFST-1,sp),x
 180  003b 202c          	jra	L36
 181  003d               L75:
 182                     ; 35 		temp = str[i];
 184  003d 1e03          	ldw	x,(OFST-3,sp)
 185  003f 72fb07        	addw	x,(OFST+1,sp)
 186  0042 f6            	ld	a,(x)
 187  0043 5f            	clrw	x
 188  0044 97            	ld	xl,a
 189  0045 1f01          	ldw	(OFST-5,sp),x
 191                     ; 36 		str[i] = str[j];
 193  0047 1e05          	ldw	x,(OFST-1,sp)
 194  0049 72fb07        	addw	x,(OFST+1,sp)
 195  004c f6            	ld	a,(x)
 196  004d 1e03          	ldw	x,(OFST-3,sp)
 197  004f 72fb07        	addw	x,(OFST+1,sp)
 198  0052 f7            	ld	(x),a
 199                     ; 37 		str[j] = temp;
 201  0053 7b02          	ld	a,(OFST-4,sp)
 202  0055 1e05          	ldw	x,(OFST-1,sp)
 203  0057 72fb07        	addw	x,(OFST+1,sp)
 204  005a f7            	ld	(x),a
 205                     ; 38 		i++;
 207  005b 1e03          	ldw	x,(OFST-3,sp)
 208  005d 1c0001        	addw	x,#1
 209  0060 1f03          	ldw	(OFST-3,sp),x
 211                     ; 39 		j--;
 213  0062 1e05          	ldw	x,(OFST-1,sp)
 214  0064 1d0001        	subw	x,#1
 215  0067 1f05          	ldw	(OFST-1,sp),x
 217  0069               L36:
 218                     ; 33 	while (i < j)
 220  0069 9c            	rvf
 221  006a 1e03          	ldw	x,(OFST-3,sp)
 222  006c 1305          	cpw	x,(OFST-1,sp)
 223  006e 2fcd          	jrslt	L75
 224                     ; 41 }
 227  0070 5b08          	addw	sp,#8
 228  0072 81            	ret
 291                     ; 47 int intToStr(int x, char str[], int d)
 291                     ; 48 {
 292                     	switch	.text
 293  0073               _intToStr:
 295  0073 89            	pushw	x
 296  0074 89            	pushw	x
 297       00000002      OFST:	set	2
 300                     ; 49 	int i = 0;
 302  0075 5f            	clrw	x
 303  0076 1f01          	ldw	(OFST-1,sp),x
 306  0078 2026          	jra	L521
 307  007a               L121:
 308                     ; 52 		str[i++] = (x % 10) + '0';
 310  007a 1e03          	ldw	x,(OFST+1,sp)
 311  007c a60a          	ld	a,#10
 312  007e cd0000        	call	c_smodx
 314  0081 1c0030        	addw	x,#48
 315  0084 1601          	ldw	y,(OFST-1,sp)
 316  0086 72a90001      	addw	y,#1
 317  008a 1701          	ldw	(OFST-1,sp),y
 318  008c 72a20001      	subw	y,#1
 320  0090 72f907        	addw	y,(OFST+5,sp)
 321  0093 01            	rrwa	x,a
 322  0094 90f7          	ld	(y),a
 323  0096 02            	rlwa	x,a
 324                     ; 53 		x = x / 10;
 326  0097 1e03          	ldw	x,(OFST+1,sp)
 327  0099 a60a          	ld	a,#10
 328  009b cd0000        	call	c_sdivx
 330  009e 1f03          	ldw	(OFST+1,sp),x
 331  00a0               L521:
 332                     ; 50 	while (x)
 334  00a0 1e03          	ldw	x,(OFST+1,sp)
 335  00a2 26d6          	jrne	L121
 337  00a4 2010          	jra	L331
 338  00a6               L131:
 339                     ; 59 		str[i++] = '0';
 341  00a6 1e01          	ldw	x,(OFST-1,sp)
 342  00a8 1c0001        	addw	x,#1
 343  00ab 1f01          	ldw	(OFST-1,sp),x
 344  00ad 1d0001        	subw	x,#1
 346  00b0 72fb07        	addw	x,(OFST+5,sp)
 347  00b3 a630          	ld	a,#48
 348  00b5 f7            	ld	(x),a
 349  00b6               L331:
 350                     ; 58 	while (i < d)
 352  00b6 9c            	rvf
 353  00b7 1e01          	ldw	x,(OFST-1,sp)
 354  00b9 1309          	cpw	x,(OFST+7,sp)
 355  00bb 2fe9          	jrslt	L131
 356                     ; 61 	reverse(str, i);
 358  00bd 1e01          	ldw	x,(OFST-1,sp)
 359  00bf 89            	pushw	x
 360  00c0 1e09          	ldw	x,(OFST+7,sp)
 361  00c2 cd0030        	call	_reverse
 363  00c5 85            	popw	x
 364                     ; 62 	str[i] = '\0';
 366  00c6 1e01          	ldw	x,(OFST-1,sp)
 367  00c8 72fb07        	addw	x,(OFST+5,sp)
 368  00cb 7f            	clr	(x)
 369                     ; 63 	return i;
 371  00cc 1e01          	ldw	x,(OFST-1,sp)
 374  00ce 5b04          	addw	sp,#4
 375  00d0 81            	ret
 474                     ; 67 void ftoa(float n, char *res, int afterpoint)
 474                     ; 68 {
 475                     	switch	.text
 476  00d1               _ftoa:
 478  00d1 520e          	subw	sp,#14
 479       0000000e      OFST:	set	14
 482                     ; 70 	int ipart = (int)n;
 484  00d3 96            	ldw	x,sp
 485  00d4 1c0011        	addw	x,#OFST+3
 486  00d7 cd0000        	call	c_ltor
 488  00da cd0000        	call	c_ftoi
 490  00dd 1f09          	ldw	(OFST-5,sp),x
 492                     ; 73 	float fpart = n - (float)ipart;
 494  00df 1e09          	ldw	x,(OFST-5,sp)
 495  00e1 cd0000        	call	c_itof
 497  00e4 96            	ldw	x,sp
 498  00e5 1c0001        	addw	x,#OFST-13
 499  00e8 cd0000        	call	c_rtol
 502  00eb 96            	ldw	x,sp
 503  00ec 1c0011        	addw	x,#OFST+3
 504  00ef cd0000        	call	c_ltor
 506  00f2 96            	ldw	x,sp
 507  00f3 1c0001        	addw	x,#OFST-13
 508  00f6 cd0000        	call	c_fsub
 510  00f9 96            	ldw	x,sp
 511  00fa 1c0005        	addw	x,#OFST-9
 512  00fd cd0000        	call	c_rtol
 515                     ; 76 	int i = intToStr(ipart, res, 0);
 517  0100 5f            	clrw	x
 518  0101 89            	pushw	x
 519  0102 1e17          	ldw	x,(OFST+9,sp)
 520  0104 89            	pushw	x
 521  0105 1e0d          	ldw	x,(OFST-1,sp)
 522  0107 cd0073        	call	_intToStr
 524  010a 5b04          	addw	sp,#4
 525  010c 1f09          	ldw	(OFST-5,sp),x
 527                     ; 80 	int power = 1;
 529  010e ae0001        	ldw	x,#1
 530  0111 1f0d          	ldw	(OFST-1,sp),x
 532                     ; 83 	if (afterpoint != 0)
 534  0113 1e17          	ldw	x,(OFST+9,sp)
 535  0115 2749          	jreq	L112
 536                     ; 85 		res[i] = '.'; // add dot
 538  0117 1e09          	ldw	x,(OFST-5,sp)
 539  0119 72fb15        	addw	x,(OFST+7,sp)
 540  011c a62e          	ld	a,#46
 541  011e f7            	ld	(x),a
 542                     ; 90 		for (j = 0; j <= afterpoint; j++)
 544  011f 5f            	clrw	x
 545  0120 1f0b          	ldw	(OFST-3,sp),x
 548  0122 2010          	jra	L712
 549  0124               L312:
 550                     ; 91 			power = power * 10;
 552  0124 1e0d          	ldw	x,(OFST-1,sp)
 553  0126 a60a          	ld	a,#10
 554  0128 cd0000        	call	c_bmulx
 556  012b 1f0d          	ldw	(OFST-1,sp),x
 558                     ; 90 		for (j = 0; j <= afterpoint; j++)
 560  012d 1e0b          	ldw	x,(OFST-3,sp)
 561  012f 1c0001        	addw	x,#1
 562  0132 1f0b          	ldw	(OFST-3,sp),x
 564  0134               L712:
 567  0134 9c            	rvf
 568  0135 1e0b          	ldw	x,(OFST-3,sp)
 569  0137 1317          	cpw	x,(OFST+9,sp)
 570  0139 2de9          	jrsle	L312
 571                     ; 93 		fpart = fpart * power;
 573  013b 1e0d          	ldw	x,(OFST-1,sp)
 574  013d cd0000        	call	c_itof
 576  0140 96            	ldw	x,sp
 577  0141 1c0005        	addw	x,#OFST-9
 578  0144 cd0000        	call	c_fgmul
 581                     ; 95 		intToStr((int)fpart, res + i + 1, afterpoint);
 583  0147 1e17          	ldw	x,(OFST+9,sp)
 584  0149 89            	pushw	x
 585  014a 1e0b          	ldw	x,(OFST-3,sp)
 586  014c 72fb17        	addw	x,(OFST+9,sp)
 587  014f 5c            	incw	x
 588  0150 89            	pushw	x
 589  0151 96            	ldw	x,sp
 590  0152 1c0009        	addw	x,#OFST-5
 591  0155 cd0000        	call	c_ltor
 593  0158 cd0000        	call	c_ftoi
 595  015b cd0073        	call	_intToStr
 597  015e 5b04          	addw	sp,#4
 598  0160               L112:
 599                     ; 97 }
 602  0160 5b0e          	addw	sp,#14
 603  0162 81            	ret
 637                     ; 99 char putchar(char c)
 637                     ; 100 {
 638                     	switch	.text
 639  0163               _putchar:
 641  0163 88            	push	a
 642       00000000      OFST:	set	0
 645  0164               L342:
 646                     ; 101 	while (!(USART1->SR & USART_SR_TXE))
 648  0164 c65230        	ld	a,21040
 649  0167 a580          	bcp	a,#128
 650  0169 27f9          	jreq	L342
 651                     ; 103 	USART1->DR = c;
 653  016b 7b01          	ld	a,(OFST+1,sp)
 654  016d c75231        	ld	21041,a
 655                     ; 104 	return (c);
 657  0170 7b01          	ld	a,(OFST+1,sp)
 660  0172 5b01          	addw	sp,#1
 661  0174 81            	ret
 695                     ; 107 char getchar(void)
 695                     ; 108 {
 696                     	switch	.text
 697  0175               _getchar:
 699  0175 88            	push	a
 700       00000001      OFST:	set	1
 703  0176               L762:
 704                     ; 110 	while (!(USART1->SR & USART_SR_RXNE))
 706  0176 c65230        	ld	a,21040
 707  0179 a520          	bcp	a,#32
 708  017b 27f9          	jreq	L762
 709                     ; 112 	c = USART1->DR;
 711  017d c65231        	ld	a,21041
 712  0180 6b01          	ld	(OFST+0,sp),a
 714                     ; 113 	return (c);
 716  0182 7b01          	ld	a,(OFST+0,sp)
 719  0184 5b01          	addw	sp,#1
 720  0186 81            	ret
 754                     ; 116 void UART_TX(unsigned char val)
 754                     ; 117 {
 755                     	switch	.text
 756  0187               _UART_TX:
 758  0187 88            	push	a
 759       00000000      OFST:	set	0
 762  0188               L313:
 763                     ; 118 	while (!(USART1->SR & USART_SR_TXE))
 765  0188 c65230        	ld	a,21040
 766  018b a580          	bcp	a,#128
 767  018d 27f9          	jreq	L313
 768                     ; 120 	USART1->DR = val;
 770  018f 7b01          	ld	a,(OFST+1,sp)
 771  0191 c75231        	ld	21041,a
 772                     ; 121 }
 775  0194 84            	pop	a
 776  0195 81            	ret
 799                     ; 123 unsigned char UART_RX(void)
 799                     ; 124 {
 800                     	switch	.text
 801  0196               _UART_RX:
 805  0196               L133:
 806                     ; 125 	while (!(USART1->SR & USART_SR_RXNE))
 808  0196 c65230        	ld	a,21040
 809  0199 a520          	bcp	a,#32
 810  019b 27f9          	jreq	L133
 811                     ; 127 	return USART1->DR;
 813  019d c65231        	ld	a,21041
 816  01a0 81            	ret
 852                     ; 130 void UART_Poll(void)
 852                     ; 131 {
 853                     	switch	.text
 854  01a1               _UART_Poll:
 856  01a1 88            	push	a
 857       00000001      OFST:	set	1
 860                     ; 133 	unsigned char inChar = 0;
 862                     ; 134 	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
 864  01a2 c65230        	ld	a,21040
 865  01a5 a520          	bcp	a,#32
 866  01a7 2708          	jreq	L353
 867                     ; 136 		inChar = UART_RX();
 869  01a9 adeb          	call	_UART_RX
 871  01ab 6b01          	ld	(OFST+0,sp),a
 873                     ; 137 		UART_TX(inChar);
 875  01ad 7b01          	ld	a,(OFST+0,sp)
 876  01af add6          	call	_UART_TX
 878  01b1               L353:
 879                     ; 139 }
 882  01b1 84            	pop	a
 883  01b2 81            	ret
 950                     ; 141 void UART_2PC(float tempResults, float humResults)
 950                     ; 142 {
 951                     	switch	.text
 952  01b3               _UART_2PC:
 954  01b3 88            	push	a
 955       00000001      OFST:	set	1
 958                     ; 146 	val = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5);
 960  01b4 4b20          	push	#32
 961  01b6 ae500a        	ldw	x,#20490
 962  01b9 cd0000        	call	_GPIO_ReadInputDataBit
 964  01bc 5b01          	addw	sp,#1
 965  01be 6b01          	ld	(OFST+0,sp),a
 967                     ; 147 	if (val == SET && welcome == 0)
 969  01c0 7b01          	ld	a,(OFST+0,sp)
 970  01c2 a101          	cp	a,#1
 971  01c4 2617          	jrne	L704
 973  01c6 be00          	ldw	x,_welcome
 974  01c8 2613          	jrne	L704
 975                     ; 149 		printf("Welcome to the Greenhouse Datalogger\n");
 977  01ca ae001f        	ldw	x,#L114
 978  01cd cd0000        	call	_printf
 980                     ; 150 		printf("Transmitting Data...\n");
 982  01d0 ae0009        	ldw	x,#L314
 983  01d3 cd0000        	call	_printf
 985                     ; 151 		welcome++;
 987  01d6 be00          	ldw	x,_welcome
 988  01d8 1c0001        	addw	x,#1
 989  01db bf00          	ldw	_welcome,x
 990  01dd               L704:
 991                     ; 153 }
 994  01dd 84            	pop	a
 995  01de 81            	ret
1060                     ; 155 void UART_SendReading(float t, float h)
1060                     ; 156 {
1061                     	switch	.text
1062  01df               _UART_SendReading:
1064  01df 5210          	subw	sp,#16
1065       00000010      OFST:	set	16
1068                     ; 160 	ftoa(t, tempBuff, 1);
1070  01e1 ae0001        	ldw	x,#1
1071  01e4 89            	pushw	x
1072  01e5 96            	ldw	x,sp
1073  01e6 1c0003        	addw	x,#OFST-13
1074  01e9 89            	pushw	x
1075  01ea 1e19          	ldw	x,(OFST+9,sp)
1076  01ec 89            	pushw	x
1077  01ed 1e19          	ldw	x,(OFST+9,sp)
1078  01ef 89            	pushw	x
1079  01f0 cd00d1        	call	_ftoa
1081  01f3 5b08          	addw	sp,#8
1082                     ; 161 	ftoa(h, humBuff, 1);
1084  01f5 ae0001        	ldw	x,#1
1085  01f8 89            	pushw	x
1086  01f9 96            	ldw	x,sp
1087  01fa 1c000b        	addw	x,#OFST-5
1088  01fd 89            	pushw	x
1089  01fe 1e1d          	ldw	x,(OFST+13,sp)
1090  0200 89            	pushw	x
1091  0201 1e1d          	ldw	x,(OFST+13,sp)
1092  0203 89            	pushw	x
1093  0204 cd00d1        	call	_ftoa
1095  0207 5b08          	addw	sp,#8
1096                     ; 162 	printf("$%s %s;\n", tempBuff, humBuff);
1098  0209 96            	ldw	x,sp
1099  020a 1c0009        	addw	x,#OFST-7
1100  020d 89            	pushw	x
1101  020e 96            	ldw	x,sp
1102  020f 1c0003        	addw	x,#OFST-13
1103  0212 89            	pushw	x
1104  0213 ae0000        	ldw	x,#L744
1105  0216 cd0000        	call	_printf
1107  0219 5b04          	addw	sp,#4
1108                     ; 165 }
1111  021b 5b10          	addw	sp,#16
1112  021d 81            	ret
1136                     	xdef	_welcome
1137                     	xdef	_putchar
1138                     	xref	_printf
1139                     	xdef	_getchar
1140                     	xdef	_UART_SendReading
1141                     	xdef	_UART_2PC
1142                     	xdef	_UART_Poll
1143                     	xdef	_UART_RX
1144                     	xdef	_UART_TX
1145                     	xdef	_ftoa
1146                     	xdef	_intToStr
1147                     	xdef	_reverse
1148                     	xdef	_UART_init
1149                     	xref	_GPIO_ReadInputDataBit
1150                     	xref	_GPIO_Init
1151                     .const:	section	.text
1152  0000               L744:
1153  0000 242573202573  	dc.b	"$%s %s;",10,0
1154  0009               L314:
1155  0009 5472616e736d  	dc.b	"Transmitting Data."
1156  001b 2e2e0a00      	dc.b	"..",10,0
1157  001f               L114:
1158  001f 57656c636f6d  	dc.b	"Welcome to the Gre"
1159  0031 656e686f7573  	dc.b	"enhouse Datalogger"
1160  0043 0a00          	dc.b	10,0
1161                     	xref.b	c_x
1181                     	xref	c_fgmul
1182                     	xref	c_bmulx
1183                     	xref	c_fsub
1184                     	xref	c_rtol
1185                     	xref	c_itof
1186                     	xref	c_ftoi
1187                     	xref	c_ltor
1188                     	xref	c_sdivx
1189                     	xref	c_smodx
1190                     	end
