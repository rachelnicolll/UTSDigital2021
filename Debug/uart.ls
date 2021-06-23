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
  61                     ; 24 	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
  63  000c c65235        	ld	a,21045
  64  000f aa0c          	or	a,#12
  65  0011 c75235        	ld	21045,a
  66                     ; 25 	USART1->CR3 &= ~(USART_CR3_STOP);					 // 1 stop bit (0b0011 0000)
  68  0014 c65236        	ld	a,21046
  69  0017 a4cf          	and	a,#207
  70  0019 c75236        	ld	21046,a
  71                     ; 26 	USART1->BRR2 = 0x03;								 //setting
  73  001c 35035233      	mov	21043,#3
  74                     ; 27 	USART1->BRR1 = 0x68;								 // 9600 baud
  76  0020 35685232      	mov	21042,#104
  77                     ; 29 	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_In_FL_No_IT); 
  79  0024 4b00          	push	#0
  80  0026 4b20          	push	#32
  81  0028 ae500a        	ldw	x,#20490
  82  002b cd0000        	call	_GPIO_Init
  84  002e 85            	popw	x
  85                     ; 30 }
  88  002f 81            	ret
 159                     ; 33 void reverse(char* str, int len)
 159                     ; 34 {
 160                     	switch	.text
 161  0030               _reverse:
 163  0030 89            	pushw	x
 164  0031 5206          	subw	sp,#6
 165       00000006      OFST:	set	6
 168                     ; 35     int i = 0, j = len - 1, temp;
 170  0033 5f            	clrw	x
 171  0034 1f03          	ldw	(OFST-3,sp),x
 175  0036 1e0b          	ldw	x,(OFST+5,sp)
 176  0038 5a            	decw	x
 177  0039 1f05          	ldw	(OFST-1,sp),x
 180  003b 202c          	jra	L36
 181  003d               L75:
 182                     ; 37         temp = str[i];
 184  003d 1e03          	ldw	x,(OFST-3,sp)
 185  003f 72fb07        	addw	x,(OFST+1,sp)
 186  0042 f6            	ld	a,(x)
 187  0043 5f            	clrw	x
 188  0044 97            	ld	xl,a
 189  0045 1f01          	ldw	(OFST-5,sp),x
 191                     ; 38         str[i] = str[j];
 193  0047 1e05          	ldw	x,(OFST-1,sp)
 194  0049 72fb07        	addw	x,(OFST+1,sp)
 195  004c f6            	ld	a,(x)
 196  004d 1e03          	ldw	x,(OFST-3,sp)
 197  004f 72fb07        	addw	x,(OFST+1,sp)
 198  0052 f7            	ld	(x),a
 199                     ; 39         str[j] = temp;
 201  0053 7b02          	ld	a,(OFST-4,sp)
 202  0055 1e05          	ldw	x,(OFST-1,sp)
 203  0057 72fb07        	addw	x,(OFST+1,sp)
 204  005a f7            	ld	(x),a
 205                     ; 40         i++;
 207  005b 1e03          	ldw	x,(OFST-3,sp)
 208  005d 1c0001        	addw	x,#1
 209  0060 1f03          	ldw	(OFST-3,sp),x
 211                     ; 41         j--;
 213  0062 1e05          	ldw	x,(OFST-1,sp)
 214  0064 1d0001        	subw	x,#1
 215  0067 1f05          	ldw	(OFST-1,sp),x
 217  0069               L36:
 218                     ; 36     while (i < j) {
 220  0069 9c            	rvf
 221  006a 1e03          	ldw	x,(OFST-3,sp)
 222  006c 1305          	cpw	x,(OFST-1,sp)
 223  006e 2fcd          	jrslt	L75
 224                     ; 43 }
 227  0070 5b08          	addw	sp,#8
 228  0072 81            	ret
 291                     ; 49 int intToStr(int x, char str[], int d)
 291                     ; 50 {
 292                     	switch	.text
 293  0073               _intToStr:
 295  0073 89            	pushw	x
 296  0074 89            	pushw	x
 297       00000002      OFST:	set	2
 300                     ; 51     int i = 0;
 302  0075 5f            	clrw	x
 303  0076 1f01          	ldw	(OFST-1,sp),x
 306  0078 2026          	jra	L521
 307  007a               L121:
 308                     ; 53         str[i++] = (x % 10) + '0';
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
 324                     ; 54         x = x / 10;
 326  0097 1e03          	ldw	x,(OFST+1,sp)
 327  0099 a60a          	ld	a,#10
 328  009b cd0000        	call	c_sdivx
 330  009e 1f03          	ldw	(OFST+1,sp),x
 331  00a0               L521:
 332                     ; 52     while (x) {
 334  00a0 1e03          	ldw	x,(OFST+1,sp)
 335  00a2 26d6          	jrne	L121
 337  00a4 2010          	jra	L331
 338  00a6               L131:
 339                     ; 60         str[i++] = '0';
 341  00a6 1e01          	ldw	x,(OFST-1,sp)
 342  00a8 1c0001        	addw	x,#1
 343  00ab 1f01          	ldw	(OFST-1,sp),x
 344  00ad 1d0001        	subw	x,#1
 346  00b0 72fb07        	addw	x,(OFST+5,sp)
 347  00b3 a630          	ld	a,#48
 348  00b5 f7            	ld	(x),a
 349  00b6               L331:
 350                     ; 59     while (i < d)
 352  00b6 9c            	rvf
 353  00b7 1e01          	ldw	x,(OFST-1,sp)
 354  00b9 1309          	cpw	x,(OFST+7,sp)
 355  00bb 2fe9          	jrslt	L131
 356                     ; 62     reverse(str, i);
 358  00bd 1e01          	ldw	x,(OFST-1,sp)
 359  00bf 89            	pushw	x
 360  00c0 1e09          	ldw	x,(OFST+7,sp)
 361  00c2 cd0030        	call	_reverse
 363  00c5 85            	popw	x
 364                     ; 63     str[i] = '\0';
 366  00c6 1e01          	ldw	x,(OFST-1,sp)
 367  00c8 72fb07        	addw	x,(OFST+5,sp)
 368  00cb 7f            	clr	(x)
 369                     ; 64     return i;
 371  00cc 1e01          	ldw	x,(OFST-1,sp)
 374  00ce 5b04          	addw	sp,#4
 375  00d0 81            	ret
 474                     ; 68 void ftoa(float n, char* res, int afterpoint)
 474                     ; 69 {
 475                     	switch	.text
 476  00d1               _ftoa:
 478  00d1 520e          	subw	sp,#14
 479       0000000e      OFST:	set	14
 482                     ; 71     int ipart = (int)n;
 484  00d3 96            	ldw	x,sp
 485  00d4 1c0011        	addw	x,#OFST+3
 486  00d7 cd0000        	call	c_ltor
 488  00da cd0000        	call	c_ftoi
 490  00dd 1f09          	ldw	(OFST-5,sp),x
 492                     ; 74     float fpart = n - (float)ipart;
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
 515                     ; 77     int i = intToStr(ipart, res, 0);
 517  0100 5f            	clrw	x
 518  0101 89            	pushw	x
 519  0102 1e17          	ldw	x,(OFST+9,sp)
 520  0104 89            	pushw	x
 521  0105 1e0d          	ldw	x,(OFST-1,sp)
 522  0107 cd0073        	call	_intToStr
 524  010a 5b04          	addw	sp,#4
 525  010c 1f09          	ldw	(OFST-5,sp),x
 527                     ; 81 		int power = 1;
 529  010e ae0001        	ldw	x,#1
 530  0111 1f0d          	ldw	(OFST-1,sp),x
 532                     ; 84     if (afterpoint != 0) {
 534  0113 1e17          	ldw	x,(OFST+9,sp)
 535  0115 2749          	jreq	L112
 536                     ; 85         res[i] = '.'; // add dot
 538  0117 1e09          	ldw	x,(OFST-5,sp)
 539  0119 72fb15        	addw	x,(OFST+7,sp)
 540  011c a62e          	ld	a,#46
 541  011e f7            	ld	(x),a
 542                     ; 90 				for (j = 0; j<= afterpoint; j++)
 544  011f 5f            	clrw	x
 545  0120 1f0b          	ldw	(OFST-3,sp),x
 548  0122 2010          	jra	L712
 549  0124               L312:
 550                     ; 91 					power = power * 10; 
 552  0124 1e0d          	ldw	x,(OFST-1,sp)
 553  0126 a60a          	ld	a,#10
 554  0128 cd0000        	call	c_bmulx
 556  012b 1f0d          	ldw	(OFST-1,sp),x
 558                     ; 90 				for (j = 0; j<= afterpoint; j++)
 560  012d 1e0b          	ldw	x,(OFST-3,sp)
 561  012f 1c0001        	addw	x,#1
 562  0132 1f0b          	ldw	(OFST-3,sp),x
 564  0134               L712:
 567  0134 9c            	rvf
 568  0135 1e0b          	ldw	x,(OFST-3,sp)
 569  0137 1317          	cpw	x,(OFST+9,sp)
 570  0139 2de9          	jrsle	L312
 571                     ; 93         fpart = fpart * power;
 573  013b 1e0d          	ldw	x,(OFST-1,sp)
 574  013d cd0000        	call	c_itof
 576  0140 96            	ldw	x,sp
 577  0141 1c0005        	addw	x,#OFST-9
 578  0144 cd0000        	call	c_fgmul
 581                     ; 95         intToStr((int)fpart, res + i + 1, afterpoint);
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
 886                     	xref	_UART_SendReading
 999                     ; 141 void UART_2PC(uint16_t nbReadings, float tempResults[],float humResults[])
 999                     ; 142 {
1000                     	switch	.text
1001  01b3               _UART_2PC:
1003  01b3 89            	pushw	x
1004  01b4 520b          	subw	sp,#11
1005       0000000b      OFST:	set	11
1008                     ; 147 	val = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5);
1010  01b6 4b20          	push	#32
1011  01b8 ae500a        	ldw	x,#20490
1012  01bb cd0000        	call	_GPIO_ReadInputDataBit
1014  01be 5b01          	addw	sp,#1
1015  01c0 6b01          	ld	(OFST-10,sp),a
1017                     ; 148 	if (val == SET && welcome == 0)
1019  01c2 7b01          	ld	a,(OFST-10,sp)
1020  01c4 a101          	cp	a,#1
1021  01c6 2617          	jrne	L334
1023  01c8 be00          	ldw	x,_welcome
1024  01ca 2613          	jrne	L334
1025                     ; 150 		printf("Welcome to the Greenhouse Datalogger\n");
1027  01cc ae001f        	ldw	x,#L534
1028  01cf cd0000        	call	_printf
1030                     ; 151 		printf("Transmitting Data...\n");
1032  01d2 ae0009        	ldw	x,#L734
1033  01d5 cd0000        	call	_printf
1035                     ; 152 		welcome++;
1037  01d8 be00          	ldw	x,_welcome
1038  01da 1c0001        	addw	x,#1
1039  01dd bf00          	ldw	_welcome,x
1040  01df               L334:
1041                     ; 155 	for (i = 0; i < nbReadings; i++)
1043  01df 5f            	clrw	x
1044  01e0 1f0a          	ldw	(OFST-1,sp),x
1047  01e2 2039          	jra	L544
1048  01e4               L144:
1049                     ; 157 		t = tempResults[i];
1051  01e4 1e0a          	ldw	x,(OFST-1,sp)
1052  01e6 58            	sllw	x
1053  01e7 58            	sllw	x
1054  01e8 72fb10        	addw	x,(OFST+5,sp)
1055  01eb 9093          	ldw	y,x
1056  01ed ee02          	ldw	x,(2,x)
1057  01ef 1f04          	ldw	(OFST-7,sp),x
1058  01f1 93            	ldw	x,y
1059  01f2 fe            	ldw	x,(x)
1060  01f3 1f02          	ldw	(OFST-9,sp),x
1062                     ; 158 		h = humResults[i];
1064  01f5 1e0a          	ldw	x,(OFST-1,sp)
1065  01f7 58            	sllw	x
1066  01f8 58            	sllw	x
1067  01f9 72fb12        	addw	x,(OFST+7,sp)
1068  01fc 9093          	ldw	y,x
1069  01fe ee02          	ldw	x,(2,x)
1070  0200 1f08          	ldw	(OFST-3,sp),x
1071  0202 93            	ldw	x,y
1072  0203 fe            	ldw	x,(x)
1073  0204 1f06          	ldw	(OFST-5,sp),x
1075                     ; 159 		UART_SendReading(t, h);
1077  0206 1e08          	ldw	x,(OFST-3,sp)
1078  0208 89            	pushw	x
1079  0209 1e08          	ldw	x,(OFST-3,sp)
1080  020b 89            	pushw	x
1081  020c 1e08          	ldw	x,(OFST-3,sp)
1082  020e 89            	pushw	x
1083  020f 1e08          	ldw	x,(OFST-3,sp)
1084  0211 89            	pushw	x
1085  0212 ad12          	call	_UART_SendReading
1087  0214 5b08          	addw	sp,#8
1088                     ; 155 	for (i = 0; i < nbReadings; i++)
1090  0216 1e0a          	ldw	x,(OFST-1,sp)
1091  0218 1c0001        	addw	x,#1
1092  021b 1f0a          	ldw	(OFST-1,sp),x
1094  021d               L544:
1097  021d 1e0a          	ldw	x,(OFST-1,sp)
1098  021f 130c          	cpw	x,(OFST+1,sp)
1099  0221 25c1          	jrult	L144
1100                     ; 161 }
1103  0223 5b0d          	addw	sp,#13
1104  0225 81            	ret
1169                     ; 163 void UART_SendReading(float t, float h)
1169                     ; 164 {
1170                     	switch	.text
1171  0226               _UART_SendReading:
1173  0226 5210          	subw	sp,#16
1174       00000010      OFST:	set	16
1177                     ; 168 		ftoa(t, tempBuff, 1);
1179  0228 ae0001        	ldw	x,#1
1180  022b 89            	pushw	x
1181  022c 96            	ldw	x,sp
1182  022d 1c0003        	addw	x,#OFST-13
1183  0230 89            	pushw	x
1184  0231 1e19          	ldw	x,(OFST+9,sp)
1185  0233 89            	pushw	x
1186  0234 1e19          	ldw	x,(OFST+9,sp)
1187  0236 89            	pushw	x
1188  0237 cd00d1        	call	_ftoa
1190  023a 5b08          	addw	sp,#8
1191                     ; 169 		ftoa(h, humBuff, 1);
1193  023c ae0001        	ldw	x,#1
1194  023f 89            	pushw	x
1195  0240 96            	ldw	x,sp
1196  0241 1c000b        	addw	x,#OFST-5
1197  0244 89            	pushw	x
1198  0245 1e1d          	ldw	x,(OFST+13,sp)
1199  0247 89            	pushw	x
1200  0248 1e1d          	ldw	x,(OFST+13,sp)
1201  024a 89            	pushw	x
1202  024b cd00d1        	call	_ftoa
1204  024e 5b08          	addw	sp,#8
1205                     ; 170 		printf("$%s %s;\n", tempBuff, humBuff);
1207  0250 96            	ldw	x,sp
1208  0251 1c0009        	addw	x,#OFST-7
1209  0254 89            	pushw	x
1210  0255 96            	ldw	x,sp
1211  0256 1c0003        	addw	x,#OFST-13
1212  0259 89            	pushw	x
1213  025a ae0000        	ldw	x,#L305
1214  025d cd0000        	call	_printf
1216  0260 5b04          	addw	sp,#4
1217                     ; 171 }
1220  0262 5b10          	addw	sp,#16
1221  0264 81            	ret
1245                     	xdef	_UART_SendReading
1246                     	xdef	_welcome
1247                     	xdef	_putchar
1248                     	xref	_printf
1249                     	xdef	_getchar
1250                     	xdef	_UART_2PC
1251                     	xdef	_UART_Poll
1252                     	xdef	_UART_RX
1253                     	xdef	_UART_TX
1254                     	xdef	_ftoa
1255                     	xdef	_intToStr
1256                     	xdef	_reverse
1257                     	xdef	_UART_init
1258                     	xref	_GPIO_ReadInputDataBit
1259                     	xref	_GPIO_Init
1260                     .const:	section	.text
1261  0000               L305:
1262  0000 242573202573  	dc.b	"$%s %s;",10,0
1263  0009               L734:
1264  0009 5472616e736d  	dc.b	"Transmitting Data."
1265  001b 2e2e0a00      	dc.b	"..",10,0
1266  001f               L534:
1267  001f 57656c636f6d  	dc.b	"Welcome to the Gre"
1268  0031 656e686f7573  	dc.b	"enhouse Datalogger"
1269  0043 0a00          	dc.b	10,0
1270                     	xref.b	c_x
1290                     	xref	c_fgmul
1291                     	xref	c_bmulx
1292                     	xref	c_fsub
1293                     	xref	c_rtol
1294                     	xref	c_itof
1295                     	xref	c_ftoi
1296                     	xref	c_ltor
1297                     	xref	c_sdivx
1298                     	xref	c_smodx
1299                     	end
