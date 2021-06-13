   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 119 void SYSCFG_RIDeInit(void)
  41                     ; 120 {
  43                     	switch	.text
  44  0000               _SYSCFG_RIDeInit:
  48                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  50  0000 725f5431      	clr	21553
  51                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  53  0004 725f5432      	clr	21554
  54                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  56  0008 725f5439      	clr	21561
  57                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  59  000c 725f543a      	clr	21562
  60                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  62  0010 725f543b      	clr	21563
  63                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  65  0014 725f5457      	clr	21591
  66                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  68  0018 725f543d      	clr	21565
  69                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  71  001c 725f543e      	clr	21566
  72                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  74  0020 725f543f      	clr	21567
  75                     ; 130 }
  78  0024 81            	ret
 337                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 337                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 337                     ; 144 {
 338                     	switch	.text
 339  0025               _SYSCFG_RITIMInputCaptureConfig:
 341  0025 89            	pushw	x
 342       00000000      OFST:	set	0
 345                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 347                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 349                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 351  0026 9e            	ld	a,xh
 352  0027 a102          	cp	a,#2
 353  0029 2606          	jrne	L531
 354                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 356  002b 9f            	ld	a,xl
 357  002c c75431        	ld	21553,a
 359  002f 2005          	jra	L731
 360  0031               L531:
 361                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 363  0031 7b02          	ld	a,(OFST+2,sp)
 364  0033 c75432        	ld	21554,a
 365  0036               L731:
 366                     ; 161 }
 369  0036 85            	popw	x
 370  0037 81            	ret
 552                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 552                     ; 185                                  FunctionalState NewState)
 552                     ; 186 {
 553                     	switch	.text
 554  0038               _SYSCFG_RIAnalogSwitchConfig:
 556  0038 89            	pushw	x
 557  0039 89            	pushw	x
 558       00000002      OFST:	set	2
 561                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 563                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 565                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 567                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 569  003a 9e            	ld	a,xh
 570  003b a4f0          	and	a,#240
 571  003d 6b01          	ld	(OFST-1,sp),a
 573                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 575  003f 7b03          	ld	a,(OFST+1,sp)
 576  0041 a40f          	and	a,#15
 577  0043 6b02          	ld	(OFST+0,sp),a
 579                     ; 199   if (NewState != DISABLE)
 581  0045 0d04          	tnz	(OFST+2,sp)
 582  0047 2730          	jreq	L142
 583                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 585  0049 7b01          	ld	a,(OFST-1,sp)
 586  004b a110          	cp	a,#16
 587  004d 2615          	jrne	L342
 588                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 590  004f 7b02          	ld	a,(OFST+0,sp)
 591  0051 5f            	clrw	x
 592  0052 97            	ld	xl,a
 593  0053 a601          	ld	a,#1
 594  0055 5d            	tnzw	x
 595  0056 2704          	jreq	L21
 596  0058               L41:
 597  0058 48            	sll	a
 598  0059 5a            	decw	x
 599  005a 26fc          	jrne	L41
 600  005c               L21:
 601  005c ca543d        	or	a,21565
 602  005f c7543d        	ld	21565,a
 604  0062 2045          	jra	L742
 605  0064               L342:
 606                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 608  0064 7b02          	ld	a,(OFST+0,sp)
 609  0066 5f            	clrw	x
 610  0067 97            	ld	xl,a
 611  0068 a601          	ld	a,#1
 612  006a 5d            	tnzw	x
 613  006b 2704          	jreq	L61
 614  006d               L02:
 615  006d 48            	sll	a
 616  006e 5a            	decw	x
 617  006f 26fc          	jrne	L02
 618  0071               L61:
 619  0071 ca543e        	or	a,21566
 620  0074 c7543e        	ld	21566,a
 621  0077 2030          	jra	L742
 622  0079               L142:
 623                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 625  0079 7b01          	ld	a,(OFST-1,sp)
 626  007b a110          	cp	a,#16
 627  007d 2616          	jrne	L152
 628                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 630  007f 7b02          	ld	a,(OFST+0,sp)
 631  0081 5f            	clrw	x
 632  0082 97            	ld	xl,a
 633  0083 a601          	ld	a,#1
 634  0085 5d            	tnzw	x
 635  0086 2704          	jreq	L22
 636  0088               L42:
 637  0088 48            	sll	a
 638  0089 5a            	decw	x
 639  008a 26fc          	jrne	L42
 640  008c               L22:
 641  008c 43            	cpl	a
 642  008d c4543d        	and	a,21565
 643  0090 c7543d        	ld	21565,a
 645  0093 2014          	jra	L742
 646  0095               L152:
 647                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 649  0095 7b02          	ld	a,(OFST+0,sp)
 650  0097 5f            	clrw	x
 651  0098 97            	ld	xl,a
 652  0099 a601          	ld	a,#1
 653  009b 5d            	tnzw	x
 654  009c 2704          	jreq	L62
 655  009e               L03:
 656  009e 48            	sll	a
 657  009f 5a            	decw	x
 658  00a0 26fc          	jrne	L03
 659  00a2               L62:
 660  00a2 43            	cpl	a
 661  00a3 c4543e        	and	a,21566
 662  00a6 c7543e        	ld	21566,a
 663  00a9               L742:
 664                     ; 225 }
 667  00a9 5b04          	addw	sp,#4
 668  00ab 81            	ret
 934                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 934                     ; 235                              FunctionalState NewState)
 934                     ; 236 {
 935                     	switch	.text
 936  00ac               _SYSCFG_RIIOSwitchConfig:
 938  00ac 89            	pushw	x
 939  00ad 89            	pushw	x
 940       00000002      OFST:	set	2
 943                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 945                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 947                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 949                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 951  00ae 9e            	ld	a,xh
 952  00af a40f          	and	a,#15
 953  00b1 6b02          	ld	(OFST+0,sp),a
 955                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 957  00b3 7b03          	ld	a,(OFST+1,sp)
 958  00b5 a4f0          	and	a,#240
 959  00b7 6b01          	ld	(OFST-1,sp),a
 961                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 963  00b9 7b01          	ld	a,(OFST-1,sp)
 964  00bb a110          	cp	a,#16
 965  00bd 2633          	jrne	L304
 966                     ; 252     if (NewState != DISABLE)
 968  00bf 0d04          	tnz	(OFST+2,sp)
 969  00c1 2717          	jreq	L504
 970                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 972  00c3 7b02          	ld	a,(OFST+0,sp)
 973  00c5 5f            	clrw	x
 974  00c6 97            	ld	xl,a
 975  00c7 a601          	ld	a,#1
 976  00c9 5d            	tnzw	x
 977  00ca 2704          	jreq	L43
 978  00cc               L63:
 979  00cc 48            	sll	a
 980  00cd 5a            	decw	x
 981  00ce 26fc          	jrne	L63
 982  00d0               L43:
 983  00d0 ca5439        	or	a,21561
 984  00d3 c75439        	ld	21561,a
 986  00d6 ac890189      	jpf	L114
 987  00da               L504:
 988                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 990  00da 7b02          	ld	a,(OFST+0,sp)
 991  00dc 5f            	clrw	x
 992  00dd 97            	ld	xl,a
 993  00de a601          	ld	a,#1
 994  00e0 5d            	tnzw	x
 995  00e1 2704          	jreq	L04
 996  00e3               L24:
 997  00e3 48            	sll	a
 998  00e4 5a            	decw	x
 999  00e5 26fc          	jrne	L24
1000  00e7               L04:
1001  00e7 43            	cpl	a
1002  00e8 c45439        	and	a,21561
1003  00eb c75439        	ld	21561,a
1004  00ee ac890189      	jpf	L114
1005  00f2               L304:
1006                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1008  00f2 7b01          	ld	a,(OFST-1,sp)
1009  00f4 a120          	cp	a,#32
1010  00f6 262f          	jrne	L314
1011                     ; 267     if (NewState != DISABLE)
1013  00f8 0d04          	tnz	(OFST+2,sp)
1014  00fa 2715          	jreq	L514
1015                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1017  00fc 7b02          	ld	a,(OFST+0,sp)
1018  00fe 5f            	clrw	x
1019  00ff 97            	ld	xl,a
1020  0100 a601          	ld	a,#1
1021  0102 5d            	tnzw	x
1022  0103 2704          	jreq	L44
1023  0105               L64:
1024  0105 48            	sll	a
1025  0106 5a            	decw	x
1026  0107 26fc          	jrne	L64
1027  0109               L44:
1028  0109 ca543a        	or	a,21562
1029  010c c7543a        	ld	21562,a
1031  010f 2078          	jra	L114
1032  0111               L514:
1033                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1035  0111 7b02          	ld	a,(OFST+0,sp)
1036  0113 5f            	clrw	x
1037  0114 97            	ld	xl,a
1038  0115 a601          	ld	a,#1
1039  0117 5d            	tnzw	x
1040  0118 2704          	jreq	L05
1041  011a               L25:
1042  011a 48            	sll	a
1043  011b 5a            	decw	x
1044  011c 26fc          	jrne	L25
1045  011e               L05:
1046  011e 43            	cpl	a
1047  011f c4543a        	and	a,21562
1048  0122 c7543a        	ld	21562,a
1049  0125 2062          	jra	L114
1050  0127               L314:
1051                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1053  0127 7b01          	ld	a,(OFST-1,sp)
1054  0129 a130          	cp	a,#48
1055  012b 262f          	jrne	L324
1056                     ; 282     if (NewState != DISABLE)
1058  012d 0d04          	tnz	(OFST+2,sp)
1059  012f 2715          	jreq	L524
1060                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1062  0131 7b02          	ld	a,(OFST+0,sp)
1063  0133 5f            	clrw	x
1064  0134 97            	ld	xl,a
1065  0135 a601          	ld	a,#1
1066  0137 5d            	tnzw	x
1067  0138 2704          	jreq	L45
1068  013a               L65:
1069  013a 48            	sll	a
1070  013b 5a            	decw	x
1071  013c 26fc          	jrne	L65
1072  013e               L45:
1073  013e ca543b        	or	a,21563
1074  0141 c7543b        	ld	21563,a
1076  0144 2043          	jra	L114
1077  0146               L524:
1078                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1080  0146 7b02          	ld	a,(OFST+0,sp)
1081  0148 5f            	clrw	x
1082  0149 97            	ld	xl,a
1083  014a a601          	ld	a,#1
1084  014c 5d            	tnzw	x
1085  014d 2704          	jreq	L06
1086  014f               L26:
1087  014f 48            	sll	a
1088  0150 5a            	decw	x
1089  0151 26fc          	jrne	L26
1090  0153               L06:
1091  0153 43            	cpl	a
1092  0154 c4543b        	and	a,21563
1093  0157 c7543b        	ld	21563,a
1094  015a 202d          	jra	L114
1095  015c               L324:
1096                     ; 297     if (NewState != DISABLE)
1098  015c 0d04          	tnz	(OFST+2,sp)
1099  015e 2715          	jreq	L334
1100                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1102  0160 7b02          	ld	a,(OFST+0,sp)
1103  0162 5f            	clrw	x
1104  0163 97            	ld	xl,a
1105  0164 a601          	ld	a,#1
1106  0166 5d            	tnzw	x
1107  0167 2704          	jreq	L46
1108  0169               L66:
1109  0169 48            	sll	a
1110  016a 5a            	decw	x
1111  016b 26fc          	jrne	L66
1112  016d               L46:
1113  016d ca5457        	or	a,21591
1114  0170 c75457        	ld	21591,a
1116  0173 2014          	jra	L114
1117  0175               L334:
1118                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1120  0175 7b02          	ld	a,(OFST+0,sp)
1121  0177 5f            	clrw	x
1122  0178 97            	ld	xl,a
1123  0179 a601          	ld	a,#1
1124  017b 5d            	tnzw	x
1125  017c 2704          	jreq	L07
1126  017e               L27:
1127  017e 48            	sll	a
1128  017f 5a            	decw	x
1129  0180 26fc          	jrne	L27
1130  0182               L07:
1131  0182 43            	cpl	a
1132  0183 c45457        	and	a,21591
1133  0186 c75457        	ld	21591,a
1134  0189               L114:
1135                     ; 308 }
1138  0189 5b04          	addw	sp,#4
1139  018b 81            	ret
1219                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1219                     ; 321 {
1220                     	switch	.text
1221  018c               _SYSCFG_RIResistorConfig:
1223  018c 89            	pushw	x
1224       00000000      OFST:	set	0
1227                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1229                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1231                     ; 326   if (NewState != DISABLE)
1233  018d 9f            	ld	a,xl
1234  018e 4d            	tnz	a
1235  018f 2709          	jreq	L574
1236                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1238  0191 9e            	ld	a,xh
1239  0192 ca543f        	or	a,21567
1240  0195 c7543f        	ld	21567,a
1242  0198 2009          	jra	L774
1243  019a               L574:
1244                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1246  019a 7b01          	ld	a,(OFST+1,sp)
1247  019c 43            	cpl	a
1248  019d c4543f        	and	a,21567
1249  01a0 c7543f        	ld	21567,a
1250  01a3               L774:
1251                     ; 336 }
1254  01a3 85            	popw	x
1255  01a4 81            	ret
1278                     ; 368 void SYSCFG_REMAPDeInit(void)
1278                     ; 369 {
1279                     	switch	.text
1280  01a5               _SYSCFG_REMAPDeInit:
1284                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1286  01a5 350c509e      	mov	20638,#12
1287                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1289  01a9 725f509f      	clr	20639
1290                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1292  01ad 725f509d      	clr	20637
1293                     ; 378 }
1296  01b1 81            	ret
1514                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1514                     ; 412 {
1515                     	switch	.text
1516  01b2               _SYSCFG_REMAPPinConfig:
1518  01b2 89            	pushw	x
1519  01b3 88            	push	a
1520       00000001      OFST:	set	1
1523                     ; 413   uint8_t regindex = 0;
1525                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1527                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1529                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1531  01b4 9e            	ld	a,xh
1532  01b5 6b01          	ld	(OFST+0,sp),a
1534                     ; 422   if (regindex == 0x01)
1536  01b7 7b01          	ld	a,(OFST+0,sp)
1537  01b9 a101          	cp	a,#1
1538  01bb 261e          	jrne	L316
1539                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1541  01bd 9f            	ld	a,xl
1542  01be 97            	ld	xl,a
1543  01bf a610          	ld	a,#16
1544  01c1 42            	mul	x,a
1545  01c2 9f            	ld	a,xl
1546  01c3 aa0f          	or	a,#15
1547  01c5 c4509e        	and	a,20638
1548  01c8 c7509e        	ld	20638,a
1549                     ; 425     if (NewState != DISABLE)
1551  01cb 0d06          	tnz	(OFST+5,sp)
1552  01cd 2742          	jreq	L716
1553                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1555  01cf 7b03          	ld	a,(OFST+2,sp)
1556  01d1 a4f0          	and	a,#240
1557  01d3 ca509e        	or	a,20638
1558  01d6 c7509e        	ld	20638,a
1559  01d9 2036          	jra	L716
1560  01db               L316:
1561                     ; 431   else if (regindex == 0x02)
1563  01db 7b01          	ld	a,(OFST+0,sp)
1564  01dd a102          	cp	a,#2
1565  01df 2619          	jrne	L126
1566                     ; 433     if (NewState != DISABLE)
1568  01e1 0d06          	tnz	(OFST+5,sp)
1569  01e3 270a          	jreq	L326
1570                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1572  01e5 c6509f        	ld	a,20639
1573  01e8 1a03          	or	a,(OFST+2,sp)
1574  01ea c7509f        	ld	20639,a
1576  01ed 2022          	jra	L716
1577  01ef               L326:
1578                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1580  01ef 7b03          	ld	a,(OFST+2,sp)
1581  01f1 43            	cpl	a
1582  01f2 c4509f        	and	a,20639
1583  01f5 c7509f        	ld	20639,a
1584  01f8 2017          	jra	L716
1585  01fa               L126:
1586                     ; 445     if (NewState != DISABLE)
1588  01fa 0d06          	tnz	(OFST+5,sp)
1589  01fc 270a          	jreq	L136
1590                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1592  01fe c6509d        	ld	a,20637
1593  0201 1a03          	or	a,(OFST+2,sp)
1594  0203 c7509d        	ld	20637,a
1596  0206 2009          	jra	L716
1597  0208               L136:
1598                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1600  0208 7b03          	ld	a,(OFST+2,sp)
1601  020a 43            	cpl	a
1602  020b c4509d        	and	a,20637
1603  020e c7509d        	ld	20637,a
1604  0211               L716:
1605                     ; 454 }
1608  0211 5b03          	addw	sp,#3
1609  0213 81            	ret
1715                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1715                     ; 471 {
1716                     	switch	.text
1717  0214               _SYSCFG_REMAPDMAChannelConfig:
1719  0214 88            	push	a
1720       00000000      OFST:	set	0
1723                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1725                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1727  0215 a5f0          	bcp	a,#240
1728  0217 270a          	jreq	L776
1729                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1731  0219 c6509e        	ld	a,20638
1732  021c a4f3          	and	a,#243
1733  021e c7509e        	ld	20638,a
1735  0221 2008          	jra	L107
1736  0223               L776:
1737                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1739  0223 c6509e        	ld	a,20638
1740  0226 a4fc          	and	a,#252
1741  0228 c7509e        	ld	20638,a
1742  022b               L107:
1743                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1745  022b 7b01          	ld	a,(OFST+1,sp)
1746  022d a40f          	and	a,#15
1747  022f ca509e        	or	a,20638
1748  0232 c7509e        	ld	20638,a
1749                     ; 489 }
1752  0235 84            	pop	a
1753  0236 81            	ret
1766                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1767                     	xdef	_SYSCFG_REMAPPinConfig
1768                     	xdef	_SYSCFG_REMAPDeInit
1769                     	xdef	_SYSCFG_RIResistorConfig
1770                     	xdef	_SYSCFG_RIIOSwitchConfig
1771                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1772                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1773                     	xdef	_SYSCFG_RIDeInit
1792                     	end
