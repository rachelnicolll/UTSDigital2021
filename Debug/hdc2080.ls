   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               L3_HDC2080_state:
  15  0000 00            	dc.b	0
  16  0001 00            	dc.b	0
  17  0002 00            	dc.b	0
  18  0003 ff            	dc.b	255
  19  0004 00            	dc.b	0
  20  0005 ff            	dc.b	255
  21  0006 00            	dc.b	0
  22  0007 80            	dc.b	128
  23  0008 00            	dc.b	0
  24  0009 00            	dc.b	0
  25  000a 40            	dc.b	64
  26  000b 0001          	dc.w	1
  27  000d 0001          	dc.w	1
 308                     ; 22 void HDC2080_config(HDC2080_Handle sensor)
 308                     ; 23 {
 310                     	switch	.text
 311  0000               _HDC2080_config:
 313  0000 89            	pushw	x
 314  0001 5209          	subw	sp,#9
 315       00000009      OFST:	set	9
 318                     ; 27     mcu_i2cInit(sensor->busId);
 320  0003 e609          	ld	a,(9,x)
 321  0005 cd0000        	call	_mcu_i2cInit
 323                     ; 30     txBuf[0] = HDC2080_INT_CONFIG;
 325  0008 a607          	ld	a,#7
 326  000a 6b01          	ld	(OFST-8,sp),a
 328                     ; 31     memcpy(&txBuf[1], &sensor->intConfig, 8);
 330  000c 96            	ldw	x,sp
 331  000d 1c0002        	addw	x,#OFST-7
 332  0010 bf00          	ldw	c_x,x
 333  0012 160a          	ldw	y,(OFST+1,sp)
 334  0014 90bf00        	ldw	c_y,y
 335  0017 ae0008        	ldw	x,#8
 336  001a               L6:
 337  001a 5a            	decw	x
 338  001b 92d600        	ld	a,([c_y.w],x)
 339  001e 92d700        	ld	([c_x.w],x),a
 340  0021 5d            	tnzw	x
 341  0022 26f6          	jrne	L6
 342                     ; 32     mcu_i2cTransfer(sensor->busId, sensor->devAddr,
 342                     ; 33                     txBuf, 9, NULL, 0);
 344  0024 4b00          	push	#0
 345  0026 5f            	clrw	x
 346  0027 89            	pushw	x
 347  0028 4b09          	push	#9
 348  002a 96            	ldw	x,sp
 349  002b 1c0005        	addw	x,#OFST-4
 350  002e 89            	pushw	x
 351  002f 1e10          	ldw	x,(OFST+7,sp)
 352  0031 e60a          	ld	a,(10,x)
 353  0033 97            	ld	xl,a
 354  0034 1610          	ldw	y,(OFST+7,sp)
 355  0036 90e609        	ld	a,(9,y)
 356  0039 95            	ld	xh,a
 357  003a cd0000        	call	_mcu_i2cTransfer
 359  003d 5b06          	addw	sp,#6
 360                     ; 36     txBuf[0] = HDC2080_MEAS_CONFIG;
 362  003f a60f          	ld	a,#15
 363  0041 6b01          	ld	(OFST-8,sp),a
 365                     ; 37     if (sensor->config & HDC2080_CONFIG_AMM_MASK)
 367  0043 1e0a          	ldw	x,(OFST+1,sp)
 368  0045 e607          	ld	a,(7,x)
 369  0047 a570          	bcp	a,#112
 370  0049 270a          	jreq	L741
 371                     ; 39         txBuf[1] = sensor->measConfig | HDC2080_MEAS_CONFIG_MEAS_TRIG_START;
 373  004b 1e0a          	ldw	x,(OFST+1,sp)
 374  004d e608          	ld	a,(8,x)
 375  004f aa01          	or	a,#1
 376  0051 6b02          	ld	(OFST-7,sp),a
 379  0053 2006          	jra	L151
 380  0055               L741:
 381                     ; 43         txBuf[1] = sensor->measConfig;
 383  0055 1e0a          	ldw	x,(OFST+1,sp)
 384  0057 e608          	ld	a,(8,x)
 385  0059 6b02          	ld	(OFST-7,sp),a
 387  005b               L151:
 388                     ; 45     mcu_i2cTransfer(sensor->busId, sensor->devAddr, txBuf, 2, NULL, 0);
 390  005b 4b00          	push	#0
 391  005d 5f            	clrw	x
 392  005e 89            	pushw	x
 393  005f 4b02          	push	#2
 394  0061 96            	ldw	x,sp
 395  0062 1c0005        	addw	x,#OFST-4
 396  0065 89            	pushw	x
 397  0066 1e10          	ldw	x,(OFST+7,sp)
 398  0068 e60a          	ld	a,(10,x)
 399  006a 97            	ld	xl,a
 400  006b 1610          	ldw	y,(OFST+7,sp)
 401  006d 90e609        	ld	a,(9,y)
 402  0070 95            	ld	xh,a
 403  0071 cd0000        	call	_mcu_i2cTransfer
 405  0074 5b06          	addw	sp,#6
 406                     ; 46 }
 409  0076 5b0b          	addw	sp,#11
 410  0078 81            	ret
 413                     .const:	section	.text
 414  0000               L351_rxBuf:
 415  0000 00            	dc.b	0
 416  0001 000000        	ds.b	3
 483                     ; 52 void HDC2080_read(HDC2080_Handle sensor, uint32_t result[])
 483                     ; 53 {
 484                     	switch	.text
 485  0079               _HDC2080_read:
 487  0079 89            	pushw	x
 488  007a 5206          	subw	sp,#6
 489       00000006      OFST:	set	6
 492                     ; 55     uint8_t rxBuf[4] = {0};
 494  007c 96            	ldw	x,sp
 495  007d 1c0003        	addw	x,#OFST-3
 496  0080 90ae0000      	ldw	y,#L351_rxBuf
 497  0084 a604          	ld	a,#4
 498  0086 cd0000        	call	c_xymov
 500                     ; 58     if (!(sensor->config & HDC2080_CONFIG_AMM_MASK))
 502  0089 1e07          	ldw	x,(OFST+1,sp)
 503  008b e607          	ld	a,(7,x)
 504  008d a570          	bcp	a,#112
 505  008f 2639          	jrne	L112
 506                     ; 61         txBuf[0] = HDC2080_MEAS_CONFIG;
 508  0091 a60f          	ld	a,#15
 509  0093 6b01          	ld	(OFST-5,sp),a
 511                     ; 62         txBuf[1] = sensor->measConfig | HDC2080_MEAS_CONFIG_MEAS_TRIG_START;
 513  0095 1e07          	ldw	x,(OFST+1,sp)
 514  0097 e608          	ld	a,(8,x)
 515  0099 aa01          	or	a,#1
 516  009b 6b02          	ld	(OFST-4,sp),a
 518                     ; 63         mcu_i2cTransfer(sensor->busId, sensor->devAddr, txBuf, 2, NULL, 0);
 520  009d 4b00          	push	#0
 521  009f 5f            	clrw	x
 522  00a0 89            	pushw	x
 523  00a1 4b02          	push	#2
 524  00a3 96            	ldw	x,sp
 525  00a4 1c0005        	addw	x,#OFST-1
 526  00a7 89            	pushw	x
 527  00a8 1e0d          	ldw	x,(OFST+7,sp)
 528  00aa e60a          	ld	a,(10,x)
 529  00ac 97            	ld	xl,a
 530  00ad 160d          	ldw	y,(OFST+7,sp)
 531  00af 90e609        	ld	a,(9,y)
 532  00b2 95            	ld	xh,a
 533  00b3 cd0000        	call	_mcu_i2cTransfer
 535  00b6 5b06          	addw	sp,#6
 536                     ; 66         mcu_msWait(sensor->convWaitHum);
 538  00b8 1e07          	ldw	x,(OFST+1,sp)
 539  00ba ee0d          	ldw	x,(13,x)
 540  00bc cd0000        	call	c_uitolx
 542  00bf be02          	ldw	x,c_lreg+2
 543  00c1 89            	pushw	x
 544  00c2 be00          	ldw	x,c_lreg
 545  00c4 89            	pushw	x
 546  00c5 cd0000        	call	_mcu_msWait
 548  00c8 5b04          	addw	sp,#4
 549  00ca               L112:
 550                     ; 70     txBuf[0] = HDC2080_TEMP_LOW;
 552  00ca 0f01          	clr	(OFST-5,sp)
 554                     ; 71     mcu_i2cTransfer(sensor->busId, sensor->devAddr, txBuf, 1, rxBuf, 4);
 556  00cc 4b04          	push	#4
 557  00ce 96            	ldw	x,sp
 558  00cf 1c0004        	addw	x,#OFST-2
 559  00d2 89            	pushw	x
 560  00d3 4b01          	push	#1
 561  00d5 96            	ldw	x,sp
 562  00d6 1c0005        	addw	x,#OFST-1
 563  00d9 89            	pushw	x
 564  00da 1e0d          	ldw	x,(OFST+7,sp)
 565  00dc e60a          	ld	a,(10,x)
 566  00de 97            	ld	xl,a
 567  00df 160d          	ldw	y,(OFST+7,sp)
 568  00e1 90e609        	ld	a,(9,y)
 569  00e4 95            	ld	xh,a
 570  00e5 cd0000        	call	_mcu_i2cTransfer
 572  00e8 5b06          	addw	sp,#6
 573                     ; 73     result[0] = (uint16_t)rxBuf[1] << 8 | rxBuf[0];
 575  00ea 7b04          	ld	a,(OFST-2,sp)
 576  00ec 5f            	clrw	x
 577  00ed 97            	ld	xl,a
 578  00ee 7b03          	ld	a,(OFST-3,sp)
 579  00f0 02            	rlwa	x,a
 580  00f1 cd0000        	call	c_uitolx
 582  00f4 1e0b          	ldw	x,(OFST+5,sp)
 583  00f6 cd0000        	call	c_rtol
 585                     ; 74     result[1] = (uint16_t)rxBuf[3] << 8 | rxBuf[2];
 587  00f9 7b06          	ld	a,(OFST+0,sp)
 588  00fb 5f            	clrw	x
 589  00fc 97            	ld	xl,a
 590  00fd 7b05          	ld	a,(OFST-1,sp)
 591  00ff 02            	rlwa	x,a
 592  0100 cd0000        	call	c_uitolx
 594  0103 1e0b          	ldw	x,(OFST+5,sp)
 595  0105 1c0004        	addw	x,#4
 596  0108 cd0000        	call	c_rtol
 598                     ; 75 }
 601  010b 5b08          	addw	sp,#8
 602  010d 81            	ret
 605                     	switch	.const
 606  0004               L312_rxBuf:
 607  0004 00            	dc.b	0
 608  0005 00            	ds.b	1
 674                     ; 81 uint16_t HDC2080_humRead(HDC2080_Handle sensor)
 674                     ; 82 {
 675                     	switch	.text
 676  010e               _HDC2080_humRead:
 678  010e 89            	pushw	x
 679  010f 5208          	subw	sp,#8
 680       00000008      OFST:	set	8
 683                     ; 84     uint8_t rxBuf[2] = {0};
 685  0111 c60004        	ld	a,L312_rxBuf
 686  0114 6b05          	ld	(OFST-3,sp),a
 687  0116 c60005        	ld	a,L312_rxBuf+1
 688  0119 6b06          	ld	(OFST-2,sp),a
 689                     ; 88     if (!(sensor->config & HDC2080_CONFIG_AMM_MASK))
 691  011b e607          	ld	a,(7,x)
 692  011d a570          	bcp	a,#112
 693  011f 2637          	jrne	L152
 694                     ; 91         txBuf[0] = HDC2080_MEAS_CONFIG;
 696  0121 a60f          	ld	a,#15
 697  0123 6b07          	ld	(OFST-1,sp),a
 699                     ; 92         txBuf[1] = sensor->measConfig | HDC2080_MEAS_CONFIG_MEAS_TRIG_START;
 701  0125 e608          	ld	a,(8,x)
 702  0127 aa01          	or	a,#1
 703  0129 6b08          	ld	(OFST+0,sp),a
 705                     ; 93         mcu_i2cTransfer(sensor->busId, sensor->devAddr, txBuf, 2, NULL, 0);
 707  012b 4b00          	push	#0
 708  012d 5f            	clrw	x
 709  012e 89            	pushw	x
 710  012f 4b02          	push	#2
 711  0131 96            	ldw	x,sp
 712  0132 1c000b        	addw	x,#OFST+3
 713  0135 89            	pushw	x
 714  0136 1e0f          	ldw	x,(OFST+7,sp)
 715  0138 e60a          	ld	a,(10,x)
 716  013a 97            	ld	xl,a
 717  013b 160f          	ldw	y,(OFST+7,sp)
 718  013d 90e609        	ld	a,(9,y)
 719  0140 95            	ld	xh,a
 720  0141 cd0000        	call	_mcu_i2cTransfer
 722  0144 5b06          	addw	sp,#6
 723                     ; 96         mcu_msWait(sensor->convWaitHum);
 725  0146 1e09          	ldw	x,(OFST+1,sp)
 726  0148 ee0d          	ldw	x,(13,x)
 727  014a cd0000        	call	c_uitolx
 729  014d be02          	ldw	x,c_lreg+2
 730  014f 89            	pushw	x
 731  0150 be00          	ldw	x,c_lreg
 732  0152 89            	pushw	x
 733  0153 cd0000        	call	_mcu_msWait
 735  0156 5b04          	addw	sp,#4
 736  0158               L152:
 737                     ; 100     txBuf[0] = HDC2080_HUM_LOW;
 739  0158 a602          	ld	a,#2
 740  015a 6b07          	ld	(OFST-1,sp),a
 742                     ; 101     mcu_i2cTransfer(sensor->busId, sensor->devAddr, txBuf, 1, rxBuf, 2);
 744  015c 4b02          	push	#2
 745  015e 96            	ldw	x,sp
 746  015f 1c0006        	addw	x,#OFST-2
 747  0162 89            	pushw	x
 748  0163 4b01          	push	#1
 749  0165 96            	ldw	x,sp
 750  0166 1c000b        	addw	x,#OFST+3
 751  0169 89            	pushw	x
 752  016a 1e0f          	ldw	x,(OFST+7,sp)
 753  016c e60a          	ld	a,(10,x)
 754  016e 97            	ld	xl,a
 755  016f 160f          	ldw	y,(OFST+7,sp)
 756  0171 90e609        	ld	a,(9,y)
 757  0174 95            	ld	xh,a
 758  0175 cd0000        	call	_mcu_i2cTransfer
 760  0178 5b06          	addw	sp,#6
 761                     ; 103     hum = (uint16_t)rxBuf[1] << 8 | rxBuf[0];
 763  017a 7b06          	ld	a,(OFST-2,sp)
 764  017c 5f            	clrw	x
 765  017d 97            	ld	xl,a
 766  017e 7b05          	ld	a,(OFST-3,sp)
 767  0180 02            	rlwa	x,a
 768  0181 cd0000        	call	c_uitolx
 770  0184 96            	ldw	x,sp
 771  0185 1c0001        	addw	x,#OFST-7
 772  0188 cd0000        	call	c_rtol
 775                     ; 105     return (hum);
 777  018b 1e03          	ldw	x,(OFST-5,sp)
 780  018d 5b0a          	addw	sp,#10
 781  018f 81            	ret
 816                     ; 112 float HDC2080_humToFloatRelative(uint16_t x)
 816                     ; 113 {
 817                     	switch	.text
 818  0190               _HDC2080_humToFloatRelative:
 822                     ; 114     return ((float)x * (100.0f / 65536.0f));
 824  0190 cd0000        	call	c_uitof
 826  0193 ae001c        	ldw	x,#L572
 827  0196 cd0000        	call	c_fmul
 831  0199 81            	ret
 866                     	switch	.const
 867  0006               L02:
 868  0006 00002000      	dc.l	8192
 869                     ; 122 uint32_t HDC2080_humToIntRelative(uint16_t x)
 869                     ; 123 {
 870                     	switch	.text
 871  019a               _HDC2080_humToIntRelative:
 875                     ; 125     return ((25 * (uint32_t)x + 0x2000) >> 14);
 877  019a a619          	ld	a,#25
 878  019c cd0000        	call	c_cmulx
 880  019f ae0006        	ldw	x,#L02
 881  01a2 cd0000        	call	c_ladd
 883  01a5 a60e          	ld	a,#14
 884  01a7 cd0000        	call	c_lursh
 888  01aa 81            	ret
 923                     ; 133 uint32_t HDC2080_humToPermille(uint16_t x)
 923                     ; 134 {
 924                     	switch	.text
 925  01ab               _HDC2080_humToPermille:
 929                     ; 136     return ((125 * (uint32_t)x) >> 13);
 931  01ab a67d          	ld	a,#125
 932  01ad cd0000        	call	c_cmulx
 934  01b0 a60d          	ld	a,#13
 935  01b2 cd0000        	call	c_lursh
 939  01b5 81            	ret
 942                     	switch	.const
 943  000a               L533_rxBuf:
 944  000a 00            	dc.b	0
 945  000b 00            	ds.b	1
1011                     ; 143 uint16_t HDC2080_tempRead(HDC2080_Handle sensor)
1011                     ; 144 {
1012                     	switch	.text
1013  01b6               _HDC2080_tempRead:
1015  01b6 89            	pushw	x
1016  01b7 5206          	subw	sp,#6
1017       00000006      OFST:	set	6
1020                     ; 146     uint8_t rxBuf[2] = {0};
1022  01b9 c6000a        	ld	a,L533_rxBuf
1023  01bc 6b03          	ld	(OFST-3,sp),a
1024  01be c6000b        	ld	a,L533_rxBuf+1
1025  01c1 6b04          	ld	(OFST-2,sp),a
1026                     ; 150     if (!(sensor->config & HDC2080_CONFIG_AMM_MASK))
1028  01c3 e607          	ld	a,(7,x)
1029  01c5 a570          	bcp	a,#112
1030  01c7 2637          	jrne	L373
1031                     ; 153         txBuf[0] = HDC2080_MEAS_CONFIG;
1033  01c9 a60f          	ld	a,#15
1034  01cb 6b05          	ld	(OFST-1,sp),a
1036                     ; 154         txBuf[1] = sensor->measConfig | HDC2080_MEAS_CONFIG_MEAS_TRIG_START;
1038  01cd e608          	ld	a,(8,x)
1039  01cf aa01          	or	a,#1
1040  01d1 6b06          	ld	(OFST+0,sp),a
1042                     ; 155         mcu_i2cTransfer(sensor->busId, sensor->devAddr, txBuf, 2, NULL, 0);
1044  01d3 4b00          	push	#0
1045  01d5 5f            	clrw	x
1046  01d6 89            	pushw	x
1047  01d7 4b02          	push	#2
1048  01d9 96            	ldw	x,sp
1049  01da 1c0009        	addw	x,#OFST+3
1050  01dd 89            	pushw	x
1051  01de 1e0d          	ldw	x,(OFST+7,sp)
1052  01e0 e60a          	ld	a,(10,x)
1053  01e2 97            	ld	xl,a
1054  01e3 160d          	ldw	y,(OFST+7,sp)
1055  01e5 90e609        	ld	a,(9,y)
1056  01e8 95            	ld	xh,a
1057  01e9 cd0000        	call	_mcu_i2cTransfer
1059  01ec 5b06          	addw	sp,#6
1060                     ; 158         mcu_msWait(sensor->convWaitTemp);
1062  01ee 1e07          	ldw	x,(OFST+1,sp)
1063  01f0 ee0b          	ldw	x,(11,x)
1064  01f2 cd0000        	call	c_uitolx
1066  01f5 be02          	ldw	x,c_lreg+2
1067  01f7 89            	pushw	x
1068  01f8 be00          	ldw	x,c_lreg
1069  01fa 89            	pushw	x
1070  01fb cd0000        	call	_mcu_msWait
1072  01fe 5b04          	addw	sp,#4
1073  0200               L373:
1074                     ; 162     txBuf[0] = HDC2080_TEMP_LOW;
1076  0200 0f05          	clr	(OFST-1,sp)
1078                     ; 163     mcu_i2cTransfer(sensor->busId, sensor->devAddr, txBuf, 1, rxBuf, 2);
1080  0202 4b02          	push	#2
1081  0204 96            	ldw	x,sp
1082  0205 1c0004        	addw	x,#OFST-2
1083  0208 89            	pushw	x
1084  0209 4b01          	push	#1
1085  020b 96            	ldw	x,sp
1086  020c 1c0009        	addw	x,#OFST+3
1087  020f 89            	pushw	x
1088  0210 1e0d          	ldw	x,(OFST+7,sp)
1089  0212 e60a          	ld	a,(10,x)
1090  0214 97            	ld	xl,a
1091  0215 160d          	ldw	y,(OFST+7,sp)
1092  0217 90e609        	ld	a,(9,y)
1093  021a 95            	ld	xh,a
1094  021b cd0000        	call	_mcu_i2cTransfer
1096  021e 5b06          	addw	sp,#6
1097                     ; 165     tmp = (uint16_t)rxBuf[1] << 8 | rxBuf[0];
1099  0220 7b04          	ld	a,(OFST-2,sp)
1100  0222 5f            	clrw	x
1101  0223 97            	ld	xl,a
1102  0224 7b03          	ld	a,(OFST-3,sp)
1103  0226 02            	rlwa	x,a
1104  0227 1f01          	ldw	(OFST-5,sp),x
1106                     ; 167     return (tmp);
1108  0229 1e01          	ldw	x,(OFST-5,sp)
1111  022b 5b08          	addw	sp,#8
1112  022d 81            	ret
1147                     ; 174 float HDC2080_tempToFloatCelsius(uint16_t x)
1147                     ; 175 {
1148                     	switch	.text
1149  022e               _HDC2080_tempToFloatCelsius:
1153                     ; 176     return ((float)x * (165.0f / 65536.0f) - 40.0f);
1155  022e cd0000        	call	c_uitof
1157  0231 ae0018        	ldw	x,#L714
1158  0234 cd0000        	call	c_fmul
1160  0237 ae0014        	ldw	x,#L724
1161  023a cd0000        	call	c_fsub
1165  023d 81            	ret
1209                     	switch	.const
1210  000c               L23:
1211  000c 00008000      	dc.l	32768
1212                     ; 183 int32_t HDC2080_tempToIntCelsius(uint16_t raw)
1212                     ; 184 {
1213                     	switch	.text
1214  023e               _HDC2080_tempToIntCelsius:
1216  023e 5204          	subw	sp,#4
1217       00000004      OFST:	set	4
1220                     ; 188     x = ((int32_t)raw * 165 + 32768) >> 16;
1222  0240 a6a5          	ld	a,#165
1223  0242 cd0000        	call	c_cmulx
1225  0245 ae000c        	ldw	x,#L23
1226  0248 cd0000        	call	c_ladd
1228  024b a610          	ld	a,#16
1229  024d cd0000        	call	c_lrsh
1231  0250 96            	ldw	x,sp
1232  0251 1c0001        	addw	x,#OFST-3
1233  0254 cd0000        	call	c_rtol
1236                     ; 191     return (x - 40);
1238  0257 96            	ldw	x,sp
1239  0258 1c0001        	addw	x,#OFST-3
1240  025b cd0000        	call	c_ltor
1242  025e a628          	ld	a,#40
1243  0260 cd0000        	call	c_lsbc
1247  0263 5b04          	addw	sp,#4
1248  0265 81            	ret
1283                     	switch	.const
1284  0010               L63:
1285  0010 00009c40      	dc.l	40000
1286                     ; 198 int32_t HDC2080_tempToMilliCelsius(uint16_t x)
1286                     ; 199 {
1287                     	switch	.text
1288  0266               _HDC2080_tempToMilliCelsius:
1292                     ; 201     return ((20625 * (int32_t)x) >> 13) - 40000;
1294  0266 90ae5091      	ldw	y,#20625
1295  026a cd0000        	call	c_umul
1297  026d a60d          	ld	a,#13
1298  026f cd0000        	call	c_lrsh
1300  0272 ae0010        	ldw	x,#L63
1301  0275 cd0000        	call	c_lsub
1305  0278 81            	ret
1318                     	xref	_mcu_msWait
1319                     	xref	_mcu_i2cTransfer
1320                     	xref	_mcu_i2cInit
1321                     	xdef	_HDC2080_tempToMilliCelsius
1322                     	xdef	_HDC2080_tempToIntCelsius
1323                     	xdef	_HDC2080_tempToFloatCelsius
1324                     	xdef	_HDC2080_tempRead
1325                     	xdef	_HDC2080_humToPermille
1326                     	xdef	_HDC2080_humToIntRelative
1327                     	xdef	_HDC2080_humToFloatRelative
1328                     	xdef	_HDC2080_humRead
1329                     	xdef	_HDC2080_read
1330                     	xdef	_HDC2080_config
1331                     	switch	.const
1332  0014               L724:
1333  0014 42200000      	dc.w	16928,0
1334  0018               L714:
1335  0018 3b250000      	dc.w	15141,0
1336  001c               L572:
1337  001c 3ac80000      	dc.w	15048,0
1338                     	xref.b	c_lreg
1339                     	xref.b	c_x
1340                     	xref.b	c_y
1360                     	xref	c_lsub
1361                     	xref	c_umul
1362                     	xref	c_lsbc
1363                     	xref	c_ltor
1364                     	xref	c_lrsh
1365                     	xref	c_fsub
1366                     	xref	c_lursh
1367                     	xref	c_ladd
1368                     	xref	c_cmulx
1369                     	xref	c_fmul
1370                     	xref	c_uitof
1371                     	xref	c_rtol
1372                     	xref	c_uitolx
1373                     	xref	c_xymov
1374                     	end
