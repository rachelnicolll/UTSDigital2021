   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 111 void COMP_DeInit(void)
  41                     ; 112 {
  43                     	switch	.text
  44  0000               _COMP_DeInit:
  48                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  50  0000 725f5440      	clr	21568
  51                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  53  0004 725f5441      	clr	21569
  54                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  56  0008 35c05442      	mov	21570,#192
  57                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  59  000c 725f5443      	clr	21571
  60                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  62  0010 725f5444      	clr	21572
  63                     ; 127 }
  66  0014 81            	ret
 242                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 242                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 242                     ; 155 {
 243                     	switch	.text
 244  0015               _COMP_Init:
 246  0015 89            	pushw	x
 247       00000000      OFST:	set	0
 250                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 252                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 254                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 256                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 258  0016 c65442        	ld	a,21570
 259  0019 a4c7          	and	a,#199
 260  001b c75442        	ld	21570,a
 261                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 263  001e 9e            	ld	a,xh
 264  001f ca5442        	or	a,21570
 265  0022 c75442        	ld	21570,a
 266                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 268  0025 c65442        	ld	a,21570
 269  0028 a43f          	and	a,#63
 270  002a c75442        	ld	21570,a
 271                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 273  002d 9f            	ld	a,xl
 274  002e ca5442        	or	a,21570
 275  0031 c75442        	ld	21570,a
 276                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 278  0034 72155441      	bres	21569,#2
 279                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 281  0038 c65441        	ld	a,21569
 282  003b 1a05          	or	a,(OFST+5,sp)
 283  003d c75441        	ld	21569,a
 284                     ; 175 }
 287  0040 85            	popw	x
 288  0041 81            	ret
 344                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 344                     ; 184 {
 345                     	switch	.text
 346  0042               _COMP_VrefintToCOMP1Connect:
 350                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 352                     ; 188   if (NewState != DISABLE)
 354  0042 4d            	tnz	a
 355  0043 2706          	jreq	L341
 356                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 358  0045 72145442      	bset	21570,#2
 360  0049 2004          	jra	L541
 361  004b               L341:
 362                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 364  004b 72155442      	bres	21570,#2
 365  004f               L541:
 366                     ; 198 }
 369  004f 81            	ret
 464                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 464                     ; 213 {
 465                     	switch	.text
 466  0050               _COMP_EdgeConfig:
 468  0050 89            	pushw	x
 469       00000000      OFST:	set	0
 472                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 474                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 476                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 478  0051 9e            	ld	a,xh
 479  0052 a101          	cp	a,#1
 480  0054 2611          	jrne	L312
 481                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 483  0056 c65440        	ld	a,21568
 484  0059 a4fc          	and	a,#252
 485  005b c75440        	ld	21568,a
 486                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 488  005e 9f            	ld	a,xl
 489  005f ca5440        	or	a,21568
 490  0062 c75440        	ld	21568,a
 492  0065 2010          	jra	L512
 493  0067               L312:
 494                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 496  0067 c65441        	ld	a,21569
 497  006a a4fc          	and	a,#252
 498  006c c75441        	ld	21569,a
 499                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 501  006f c65441        	ld	a,21569
 502  0072 1a02          	or	a,(OFST+2,sp)
 503  0074 c75441        	ld	21569,a
 504  0077               L512:
 505                     ; 236 }
 508  0077 85            	popw	x
 509  0078 81            	ret
 577                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 577                     ; 252 {
 578                     	switch	.text
 579  0079               _COMP_GetOutputLevel:
 581  0079 88            	push	a
 582       00000001      OFST:	set	1
 585                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 587                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 589  007a a101          	cp	a,#1
 590  007c 2611          	jrne	L152
 591                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 593  007e c65440        	ld	a,21568
 594  0081 a508          	bcp	a,#8
 595  0083 2706          	jreq	L352
 596                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 598  0085 a601          	ld	a,#1
 599  0087 6b01          	ld	(OFST+0,sp),a
 602  0089 2013          	jra	L752
 603  008b               L352:
 604                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 606  008b 0f01          	clr	(OFST+0,sp)
 608  008d 200f          	jra	L752
 609  008f               L152:
 610                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 612  008f c65441        	ld	a,21569
 613  0092 a508          	bcp	a,#8
 614  0094 2706          	jreq	L162
 615                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 617  0096 a601          	ld	a,#1
 618  0098 6b01          	ld	(OFST+0,sp),a
 621  009a 2002          	jra	L752
 622  009c               L162:
 623                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 625  009c 0f01          	clr	(OFST+0,sp)
 627  009e               L752:
 628                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 630  009e 7b01          	ld	a,(OFST+0,sp)
 633  00a0 5b01          	addw	sp,#1
 634  00a2 81            	ret
 669                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 669                     ; 325 {
 670                     	switch	.text
 671  00a3               _COMP_WindowCmd:
 675                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 677                     ; 329   if (NewState != DISABLE)
 679  00a3 4d            	tnz	a
 680  00a4 2706          	jreq	L303
 681                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 683  00a6 72125442      	bset	21570,#1
 685  00aa 2004          	jra	L503
 686  00ac               L303:
 687                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 689  00ac 72135442      	bres	21570,#1
 690  00b0               L503:
 691                     ; 339 }
 694  00b0 81            	ret
 730                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 730                     ; 363 {
 731                     	switch	.text
 732  00b1               _COMP_VrefintOutputCmd:
 736                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 738                     ; 367   if (NewState != DISABLE)
 740  00b1 4d            	tnz	a
 741  00b2 2706          	jreq	L523
 742                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 744  00b4 72105442      	bset	21570,#0
 746  00b8 2004          	jra	L723
 747  00ba               L523:
 748                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 750  00ba 72115442      	bres	21570,#0
 751  00be               L723:
 752                     ; 377 }
 755  00be 81            	ret
 791                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 791                     ; 402 {
 792                     	switch	.text
 793  00bf               _COMP_SchmittTriggerCmd:
 797                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 799                     ; 406   if (NewState != DISABLE)
 801  00bf 4d            	tnz	a
 802  00c0 2706          	jreq	L743
 803                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 805  00c2 72145440      	bset	21568,#2
 807  00c6 2004          	jra	L153
 808  00c8               L743:
 809                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 811  00c8 72155440      	bres	21568,#2
 812  00cc               L153:
 813                     ; 416 }
 816  00cc 81            	ret
 936                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 936                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 936                     ; 437                         FunctionalState NewState)
 936                     ; 438 {
 937                     	switch	.text
 938  00cd               _COMP_TriggerConfig:
 940  00cd 89            	pushw	x
 941       00000000      OFST:	set	0
 944                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 946                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 948                     ; 443   switch (COMP_TriggerGroup)
 950  00ce 9e            	ld	a,xh
 952                     ; 490     default:
 952                     ; 491       break;
 953  00cf 4a            	dec	a
 954  00d0 270b          	jreq	L353
 955  00d2 4a            	dec	a
 956  00d3 2721          	jreq	L553
 957  00d5 4a            	dec	a
 958  00d6 273d          	jreq	L753
 959  00d8 4a            	dec	a
 960  00d9 2753          	jreq	L163
 961  00db 206e          	jra	L344
 962  00dd               L353:
 963                     ; 445     case COMP_TriggerGroup_InvertingInput:
 963                     ; 446 
 963                     ; 447       if (NewState != DISABLE)
 965  00dd 0d05          	tnz	(OFST+5,sp)
 966  00df 270b          	jreq	L544
 967                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 969  00e1 7b02          	ld	a,(OFST+2,sp)
 970  00e3 43            	cpl	a
 971  00e4 c45443        	and	a,21571
 972  00e7 c75443        	ld	21571,a
 974  00ea 205f          	jra	L344
 975  00ec               L544:
 976                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 978  00ec c65443        	ld	a,21571
 979  00ef 1a02          	or	a,(OFST+2,sp)
 980  00f1 c75443        	ld	21571,a
 981  00f4 2055          	jra	L344
 982  00f6               L553:
 983                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 983                     ; 458       if (NewState != DISABLE)
 985  00f6 0d05          	tnz	(OFST+5,sp)
 986  00f8 270e          	jreq	L154
 987                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 989  00fa 7b02          	ld	a,(OFST+2,sp)
 990  00fc 48            	sll	a
 991  00fd 48            	sll	a
 992  00fe 48            	sll	a
 993  00ff 43            	cpl	a
 994  0100 c45443        	and	a,21571
 995  0103 c75443        	ld	21571,a
 997  0106 2043          	jra	L344
 998  0108               L154:
 999                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
1001  0108 7b02          	ld	a,(OFST+2,sp)
1002  010a 48            	sll	a
1003  010b 48            	sll	a
1004  010c 48            	sll	a
1005  010d ca5443        	or	a,21571
1006  0110 c75443        	ld	21571,a
1007  0113 2036          	jra	L344
1008  0115               L753:
1009                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1009                     ; 469       if (NewState != DISABLE)
1011  0115 0d05          	tnz	(OFST+5,sp)
1012  0117 270b          	jreq	L554
1013                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1015  0119 7b02          	ld	a,(OFST+2,sp)
1016  011b 43            	cpl	a
1017  011c c45444        	and	a,21572
1018  011f c75444        	ld	21572,a
1020  0122 2027          	jra	L344
1021  0124               L554:
1022                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1024  0124 c65444        	ld	a,21572
1025  0127 1a02          	or	a,(OFST+2,sp)
1026  0129 c75444        	ld	21572,a
1027  012c 201d          	jra	L344
1028  012e               L163:
1029                     ; 479     case COMP_TriggerGroup_DACOutput:
1029                     ; 480       if (NewState != DISABLE)
1031  012e 0d05          	tnz	(OFST+5,sp)
1032  0130 270e          	jreq	L164
1033                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1035  0132 7b02          	ld	a,(OFST+2,sp)
1036  0134 48            	sll	a
1037  0135 48            	sll	a
1038  0136 48            	sll	a
1039  0137 43            	cpl	a
1040  0138 c45444        	and	a,21572
1041  013b c75444        	ld	21572,a
1043  013e 200b          	jra	L344
1044  0140               L164:
1045                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1047  0140 7b02          	ld	a,(OFST+2,sp)
1048  0142 48            	sll	a
1049  0143 48            	sll	a
1050  0144 48            	sll	a
1051  0145 ca5444        	or	a,21572
1052  0148 c75444        	ld	21572,a
1053  014b               L363:
1054                     ; 490     default:
1054                     ; 491       break;
1056  014b               L344:
1057                     ; 493 }
1060  014b 85            	popw	x
1061  014c 81            	ret
1106                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1106                     ; 522 {
1107                     	switch	.text
1108  014d               _COMP_ITConfig:
1110  014d 89            	pushw	x
1111       00000000      OFST:	set	0
1114                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1116                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1118                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1120  014e 9e            	ld	a,xh
1121  014f a101          	cp	a,#1
1122  0151 2610          	jrne	L705
1123                     ; 530     if (NewState != DISABLE)
1125  0153 9f            	ld	a,xl
1126  0154 4d            	tnz	a
1127  0155 2706          	jreq	L115
1128                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1130  0157 721a5440      	bset	21568,#5
1132  015b 2014          	jra	L515
1133  015d               L115:
1134                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1136  015d 721b5440      	bres	21568,#5
1137  0161 200e          	jra	L515
1138  0163               L705:
1139                     ; 543     if (NewState != DISABLE)
1141  0163 0d02          	tnz	(OFST+2,sp)
1142  0165 2706          	jreq	L715
1143                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1145  0167 721a5441      	bset	21569,#5
1147  016b 2004          	jra	L515
1148  016d               L715:
1149                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1151  016d 721b5441      	bres	21569,#5
1152  0171               L515:
1153                     ; 554 }
1156  0171 85            	popw	x
1157  0172 81            	ret
1223                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1223                     ; 565 {
1224                     	switch	.text
1225  0173               _COMP_GetFlagStatus:
1227  0173 88            	push	a
1228       00000001      OFST:	set	1
1231                     ; 566   FlagStatus bitstatus = RESET;
1233                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1235                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1237  0174 a101          	cp	a,#1
1238  0176 2611          	jrne	L555
1239                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1241  0178 c65440        	ld	a,21568
1242  017b a510          	bcp	a,#16
1243  017d 2706          	jreq	L755
1244                     ; 577       bitstatus = SET;
1246  017f a601          	ld	a,#1
1247  0181 6b01          	ld	(OFST+0,sp),a
1250  0183 2013          	jra	L365
1251  0185               L755:
1252                     ; 582       bitstatus = RESET;
1254  0185 0f01          	clr	(OFST+0,sp)
1256  0187 200f          	jra	L365
1257  0189               L555:
1258                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1260  0189 c65441        	ld	a,21569
1261  018c a510          	bcp	a,#16
1262  018e 2706          	jreq	L565
1263                     ; 590       bitstatus = SET;
1265  0190 a601          	ld	a,#1
1266  0192 6b01          	ld	(OFST+0,sp),a
1269  0194 2002          	jra	L365
1270  0196               L565:
1271                     ; 595       bitstatus = RESET;
1273  0196 0f01          	clr	(OFST+0,sp)
1275  0198               L365:
1276                     ; 600   return (FlagStatus)(bitstatus);
1278  0198 7b01          	ld	a,(OFST+0,sp)
1281  019a 5b01          	addw	sp,#1
1282  019c 81            	ret
1317                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1317                     ; 612 {
1318                     	switch	.text
1319  019d               _COMP_ClearFlag:
1323                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1325                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1327  019d a101          	cp	a,#1
1328  019f 2606          	jrne	L706
1329                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1331  01a1 72195440      	bres	21568,#4
1333  01a5 2004          	jra	L116
1334  01a7               L706:
1335                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1337  01a7 72195441      	bres	21569,#4
1338  01ab               L116:
1339                     ; 626 }
1342  01ab 81            	ret
1406                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1406                     ; 637 {
1407                     	switch	.text
1408  01ac               _COMP_GetITStatus:
1410  01ac 89            	pushw	x
1411       00000002      OFST:	set	2
1414                     ; 638   ITStatus bitstatus = RESET;
1416                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1420                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1422                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1424  01ad a101          	cp	a,#1
1425  01af 2620          	jrne	L546
1426                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1428  01b1 c65440        	ld	a,21568
1429  01b4 a410          	and	a,#16
1430  01b6 6b01          	ld	(OFST-1,sp),a
1432                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1434  01b8 c65440        	ld	a,21568
1435  01bb a420          	and	a,#32
1436  01bd 6b02          	ld	(OFST+0,sp),a
1438                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1440  01bf 0d01          	tnz	(OFST-1,sp)
1441  01c1 270a          	jreq	L746
1443  01c3 0d02          	tnz	(OFST+0,sp)
1444  01c5 2706          	jreq	L746
1445                     ; 655       bitstatus = SET;
1447  01c7 a601          	ld	a,#1
1448  01c9 6b02          	ld	(OFST+0,sp),a
1451  01cb 2022          	jra	L356
1452  01cd               L746:
1453                     ; 660       bitstatus = RESET;
1455  01cd 0f02          	clr	(OFST+0,sp)
1457  01cf 201e          	jra	L356
1458  01d1               L546:
1459                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1461  01d1 c65441        	ld	a,21569
1462  01d4 a410          	and	a,#16
1463  01d6 6b01          	ld	(OFST-1,sp),a
1465                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1467  01d8 c65441        	ld	a,21569
1468  01db a420          	and	a,#32
1469  01dd 6b02          	ld	(OFST+0,sp),a
1471                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1473  01df 0d01          	tnz	(OFST-1,sp)
1474  01e1 270a          	jreq	L556
1476  01e3 0d02          	tnz	(OFST+0,sp)
1477  01e5 2706          	jreq	L556
1478                     ; 674       bitstatus = SET;
1480  01e7 a601          	ld	a,#1
1481  01e9 6b02          	ld	(OFST+0,sp),a
1484  01eb 2002          	jra	L356
1485  01ed               L556:
1486                     ; 679       bitstatus = RESET;
1488  01ed 0f02          	clr	(OFST+0,sp)
1490  01ef               L356:
1491                     ; 684   return (ITStatus) bitstatus;
1493  01ef 7b02          	ld	a,(OFST+0,sp)
1496  01f1 85            	popw	x
1497  01f2 81            	ret
1533                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1533                     ; 696 {
1534                     	switch	.text
1535  01f3               _COMP_ClearITPendingBit:
1539                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1541                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1543  01f3 a101          	cp	a,#1
1544  01f5 2606          	jrne	L776
1545                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1547  01f7 72195440      	bres	21568,#4
1549  01fb 2004          	jra	L107
1550  01fd               L776:
1551                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1553  01fd 72195441      	bres	21569,#4
1554  0201               L107:
1555                     ; 710 }
1558  0201 81            	ret
1571                     	xdef	_COMP_ClearITPendingBit
1572                     	xdef	_COMP_GetITStatus
1573                     	xdef	_COMP_ClearFlag
1574                     	xdef	_COMP_GetFlagStatus
1575                     	xdef	_COMP_ITConfig
1576                     	xdef	_COMP_TriggerConfig
1577                     	xdef	_COMP_SchmittTriggerCmd
1578                     	xdef	_COMP_VrefintOutputCmd
1579                     	xdef	_COMP_WindowCmd
1580                     	xdef	_COMP_GetOutputLevel
1581                     	xdef	_COMP_EdgeConfig
1582                     	xdef	_COMP_VrefintToCOMP1Connect
1583                     	xdef	_COMP_Init
1584                     	xdef	_COMP_DeInit
1603                     	end
