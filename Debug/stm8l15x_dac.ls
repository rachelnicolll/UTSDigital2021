   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 142 void DAC_DeInit(void)
  41                     ; 143 {
  43                     	switch	.text
  44  0000               _DAC_DeInit:
  48                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  50  0000 725f5380      	clr	21376
  51                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  53  0004 725f5381      	clr	21377
  54                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  56  0008 725f5382      	clr	21378
  57                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  59  000c 725f5383      	clr	21379
  60                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  62  0010 725f5384      	clr	21380
  63                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  65  0014 35ff5385      	mov	21381,#255
  66                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  68  0018 725f5388      	clr	21384
  69                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  71  001c 725f5389      	clr	21385
  72                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  74  0020 725f538c      	clr	21388
  75                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  77  0024 725f538d      	clr	21389
  78                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  80  0028 725f5390      	clr	21392
  81                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  83  002c 725f5394      	clr	21396
  84                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  86  0030 725f5395      	clr	21397
  87                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  89  0034 725f5398      	clr	21400
  90                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  92  0038 725f5399      	clr	21401
  93                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  95  003c 725f539c      	clr	21404
  96                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  98  0040 725f53a0      	clr	21408
  99                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 101  0044 725f53a1      	clr	21409
 102                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 104  0048 725f53a2      	clr	21410
 105                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 107  004c 725f53a3      	clr	21411
 108                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 110  0050 725f53a4      	clr	21412
 111                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 113  0054 725f53a5      	clr	21413
 114                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 116  0058 725f53a6      	clr	21414
 117                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 119  005c 725f53a7      	clr	21415
 120                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 122  0060 725f53a8      	clr	21416
 123                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 125  0064 725f53a9      	clr	21417
 126                     ; 187 }
 129  0068 81            	ret
 288                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 288                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 288                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 288                     ; 211 {
 289                     	switch	.text
 290  0069               _DAC_Init:
 292  0069 89            	pushw	x
 293  006a 5203          	subw	sp,#3
 294       00000003      OFST:	set	3
 297                     ; 212   uint8_t tmpreg = 0;
 299                     ; 213   uint16_t tmpreg2 = 0;
 301                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 303                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 305                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 307                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 309  006c 9e            	ld	a,xh
 310  006d 48            	sll	a
 311  006e 5f            	clrw	x
 312  006f 97            	ld	xl,a
 313  0070 1f01          	ldw	(OFST-2,sp),x
 315                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 317  0072 1e01          	ldw	x,(OFST-2,sp)
 318  0074 d65380        	ld	a,(21376,x)
 319  0077 6b03          	ld	(OFST+0,sp),a
 321                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 323  0079 7b03          	ld	a,(OFST+0,sp)
 324  007b a4c1          	and	a,#193
 325  007d 6b03          	ld	(OFST+0,sp),a
 327                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 329  007f 7b03          	ld	a,(OFST+0,sp)
 330  0081 1a08          	or	a,(OFST+5,sp)
 331  0083 6b03          	ld	(OFST+0,sp),a
 333                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 335  0085 7b05          	ld	a,(OFST+2,sp)
 336  0087 a130          	cp	a,#48
 337  0089 2708          	jreq	L511
 338                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 340  008b 7b05          	ld	a,(OFST+2,sp)
 341  008d aa04          	or	a,#4
 342  008f 1a03          	or	a,(OFST+0,sp)
 343  0091 6b03          	ld	(OFST+0,sp),a
 345  0093               L511:
 346                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 348  0093 7b03          	ld	a,(OFST+0,sp)
 349  0095 1e01          	ldw	x,(OFST-2,sp)
 350  0097 d75380        	ld	(21376,x),a
 351                     ; 240 }
 354  009a 5b05          	addw	sp,#5
 355  009c 81            	ret
 429                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 429                     ; 255 {
 430                     	switch	.text
 431  009d               _DAC_Cmd:
 433  009d 89            	pushw	x
 434  009e 89            	pushw	x
 435       00000002      OFST:	set	2
 438                     ; 256   uint16_t cr1addr = 0;
 440                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 442                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 444                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 446  009f 9e            	ld	a,xh
 447  00a0 48            	sll	a
 448  00a1 5f            	clrw	x
 449  00a2 97            	ld	xl,a
 450  00a3 1c5380        	addw	x,#21376
 451  00a6 1f01          	ldw	(OFST-1,sp),x
 453                     ; 264   if (NewState != DISABLE)
 455  00a8 0d04          	tnz	(OFST+2,sp)
 456  00aa 2708          	jreq	L551
 457                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 459  00ac 1e01          	ldw	x,(OFST-1,sp)
 460  00ae f6            	ld	a,(x)
 461  00af aa01          	or	a,#1
 462  00b1 f7            	ld	(x),a
 464  00b2 2006          	jra	L751
 465  00b4               L551:
 466                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 468  00b4 1e01          	ldw	x,(OFST-1,sp)
 469  00b6 f6            	ld	a,(x)
 470  00b7 a4fe          	and	a,#254
 471  00b9 f7            	ld	(x),a
 472  00ba               L751:
 473                     ; 274 }
 476  00ba 5b04          	addw	sp,#4
 477  00bc 81            	ret
 523                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 523                     ; 287 {
 524                     	switch	.text
 525  00bd               _DAC_SoftwareTriggerCmd:
 527  00bd 89            	pushw	x
 528       00000000      OFST:	set	0
 531                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 533                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 535                     ; 292   if (NewState != DISABLE)
 537  00be 9f            	ld	a,xl
 538  00bf 4d            	tnz	a
 539  00c0 2714          	jreq	L302
 540                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 542  00c2 9e            	ld	a,xh
 543  00c3 5f            	clrw	x
 544  00c4 97            	ld	xl,a
 545  00c5 a601          	ld	a,#1
 546  00c7 5d            	tnzw	x
 547  00c8 2704          	jreq	L41
 548  00ca               L61:
 549  00ca 48            	sll	a
 550  00cb 5a            	decw	x
 551  00cc 26fc          	jrne	L61
 552  00ce               L41:
 553  00ce ca5384        	or	a,21380
 554  00d1 c75384        	ld	21380,a
 556  00d4 2014          	jra	L502
 557  00d6               L302:
 558                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 560  00d6 7b01          	ld	a,(OFST+1,sp)
 561  00d8 5f            	clrw	x
 562  00d9 97            	ld	xl,a
 563  00da a601          	ld	a,#1
 564  00dc 5d            	tnzw	x
 565  00dd 2704          	jreq	L02
 566  00df               L22:
 567  00df 48            	sll	a
 568  00e0 5a            	decw	x
 569  00e1 26fc          	jrne	L22
 570  00e3               L02:
 571  00e3 43            	cpl	a
 572  00e4 c45384        	and	a,21380
 573  00e7 c75384        	ld	21380,a
 574  00ea               L502:
 575                     ; 302 }
 578  00ea 85            	popw	x
 579  00eb 81            	ret
 615                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 615                     ; 312 {
 616                     	switch	.text
 617  00ec               _DAC_DualSoftwareTriggerCmd:
 621                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 623                     ; 316   if (NewState != DISABLE)
 625  00ec 4d            	tnz	a
 626  00ed 270a          	jreq	L522
 627                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 629  00ef c65384        	ld	a,21380
 630  00f2 aa03          	or	a,#3
 631  00f4 c75384        	ld	21380,a
 633  00f7 2008          	jra	L722
 634  00f9               L522:
 635                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 637  00f9 c65384        	ld	a,21380
 638  00fc a4fc          	and	a,#252
 639  00fe c75384        	ld	21380,a
 640  0101               L722:
 641                     ; 326 }
 644  0101 81            	ret
 729                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 729                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 729                     ; 344                            FunctionalState NewState)
 729                     ; 345 {
 730                     	switch	.text
 731  0102               _DAC_WaveGenerationCmd:
 733  0102 89            	pushw	x
 734  0103 88            	push	a
 735       00000001      OFST:	set	1
 738                     ; 346   uint8_t tmpreg = 0;
 740                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 742                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 744                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 746                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 748  0104 9e            	ld	a,xh
 749  0105 48            	sll	a
 750  0106 5f            	clrw	x
 751  0107 97            	ld	xl,a
 752  0108 d65380        	ld	a,(21376,x)
 753  010b a43f          	and	a,#63
 754  010d 6b01          	ld	(OFST+0,sp),a
 756                     ; 356   if (NewState != DISABLE)
 758  010f 0d06          	tnz	(OFST+5,sp)
 759  0111 2706          	jreq	L372
 760                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 762  0113 7b01          	ld	a,(OFST+0,sp)
 763  0115 1a03          	or	a,(OFST+2,sp)
 764  0117 6b01          	ld	(OFST+0,sp),a
 766  0119               L372:
 767                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 769  0119 7b02          	ld	a,(OFST+1,sp)
 770  011b 48            	sll	a
 771  011c 5f            	clrw	x
 772  011d 97            	ld	xl,a
 773  011e 7b01          	ld	a,(OFST+0,sp)
 774  0120 d75380        	ld	(21376,x),a
 775                     ; 364 }
 778  0123 5b03          	addw	sp,#3
 779  0125 81            	ret
 945                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 945                     ; 389 {
 946                     	switch	.text
 947  0126               _DAC_SetNoiseWaveLFSR:
 949  0126 89            	pushw	x
 950  0127 5203          	subw	sp,#3
 951       00000003      OFST:	set	3
 954                     ; 390   uint8_t tmpreg = 0;
 956                     ; 391   uint16_t cr2addr = 0;
 958                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 960                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 962                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 964  0129 9e            	ld	a,xh
 965  012a 48            	sll	a
 966  012b 5f            	clrw	x
 967  012c 97            	ld	xl,a
 968  012d 1c5381        	addw	x,#21377
 969  0130 1f02          	ldw	(OFST-1,sp),x
 971                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 973  0132 1e02          	ldw	x,(OFST-1,sp)
 974  0134 f6            	ld	a,(x)
 975  0135 a4f0          	and	a,#240
 976  0137 6b01          	ld	(OFST-2,sp),a
 978                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 980  0139 7b01          	ld	a,(OFST-2,sp)
 981  013b 1a05          	or	a,(OFST+2,sp)
 982  013d 1e02          	ldw	x,(OFST-1,sp)
 983  013f f7            	ld	(x),a
 984                     ; 403 }
 987  0140 5b05          	addw	sp,#5
 988  0142 81            	ret
1155                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1155                     ; 428 {
1156                     	switch	.text
1157  0143               _DAC_SetTriangleWaveAmplitude:
1159  0143 89            	pushw	x
1160  0144 5203          	subw	sp,#3
1161       00000003      OFST:	set	3
1164                     ; 429   uint8_t tmpreg = 0;
1166                     ; 430   uint16_t cr2addr = 0;
1168                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1170                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1172                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1174  0146 9e            	ld	a,xh
1175  0147 48            	sll	a
1176  0148 5f            	clrw	x
1177  0149 97            	ld	xl,a
1178  014a 1c5381        	addw	x,#21377
1179  014d 1f02          	ldw	(OFST-1,sp),x
1181                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1183  014f 1e02          	ldw	x,(OFST-1,sp)
1184  0151 f6            	ld	a,(x)
1185  0152 a4f0          	and	a,#240
1186  0154 6b01          	ld	(OFST-2,sp),a
1188                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1190  0156 7b01          	ld	a,(OFST-2,sp)
1191  0158 1a05          	or	a,(OFST+2,sp)
1192  015a 1e02          	ldw	x,(OFST-1,sp)
1193  015c f7            	ld	(x),a
1194                     ; 443 }
1197  015d 5b05          	addw	sp,#5
1198  015f 81            	ret
1270                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1270                     ; 456 {
1271                     	switch	.text
1272  0160               _DAC_SetChannel1Data:
1274  0160 88            	push	a
1275       00000000      OFST:	set	0
1278                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1280                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1282  0161 a108          	cp	a,#8
1283  0163 2712          	jreq	L505
1284                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1286  0165 5f            	clrw	x
1287  0166 97            	ld	xl,a
1288  0167 7b04          	ld	a,(OFST+4,sp)
1289  0169 d75388        	ld	(21384,x),a
1290                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1292  016c 7b01          	ld	a,(OFST+1,sp)
1293  016e 5f            	clrw	x
1294  016f 97            	ld	xl,a
1295  0170 7b05          	ld	a,(OFST+5,sp)
1296  0172 d75389        	ld	(21385,x),a
1298  0175 2005          	jra	L705
1299  0177               L505:
1300                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1302                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1304  0177 7b05          	ld	a,(OFST+5,sp)
1305  0179 c75390        	ld	21392,a
1306  017c               L705:
1307                     ; 474 }
1310  017c 84            	pop	a
1311  017d 81            	ret
1356                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1356                     ; 487 {
1357                     	switch	.text
1358  017e               _DAC_SetChannel2Data:
1360  017e 88            	push	a
1361       00000000      OFST:	set	0
1364                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1366                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1368  017f a108          	cp	a,#8
1369  0181 2712          	jreq	L335
1370                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1372  0183 5f            	clrw	x
1373  0184 97            	ld	xl,a
1374  0185 7b04          	ld	a,(OFST+4,sp)
1375  0187 d75394        	ld	(21396,x),a
1376                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1378  018a 7b01          	ld	a,(OFST+1,sp)
1379  018c 5f            	clrw	x
1380  018d 97            	ld	xl,a
1381  018e 7b05          	ld	a,(OFST+5,sp)
1382  0190 d75395        	ld	(21397,x),a
1384  0193 2005          	jra	L535
1385  0195               L335:
1386                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1388                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1390  0195 7b05          	ld	a,(OFST+5,sp)
1391  0197 c7539c        	ld	21404,a
1392  019a               L535:
1393                     ; 505 }
1396  019a 84            	pop	a
1397  019b 81            	ret
1460                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1460                     ; 523 {
1461                     	switch	.text
1462  019c               _DAC_SetDualChannelData:
1464  019c 88            	push	a
1465  019d 89            	pushw	x
1466       00000002      OFST:	set	2
1469                     ; 524   uint16_t dchxrdhrhaddr = 0;
1471                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1473                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1475  019e a108          	cp	a,#8
1476  01a0 2720          	jreq	L175
1477                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1479  01a2 5f            	clrw	x
1480  01a3 97            	ld	xl,a
1481  01a4 1c53a0        	addw	x,#21408
1482  01a7 1f01          	ldw	(OFST-1,sp),x
1484                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1486  01a9 7b08          	ld	a,(OFST+6,sp)
1487  01ab 1e01          	ldw	x,(OFST-1,sp)
1488  01ad f7            	ld	(x),a
1489                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1491  01ae 7b09          	ld	a,(OFST+7,sp)
1492  01b0 1e01          	ldw	x,(OFST-1,sp)
1493  01b2 e701          	ld	(1,x),a
1494                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1496  01b4 7b06          	ld	a,(OFST+4,sp)
1497  01b6 1e01          	ldw	x,(OFST-1,sp)
1498  01b8 e702          	ld	(2,x),a
1499                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1501  01ba 7b07          	ld	a,(OFST+5,sp)
1502  01bc 1e01          	ldw	x,(OFST-1,sp)
1503  01be e703          	ld	(3,x),a
1505  01c0 200a          	jra	L375
1506  01c2               L175:
1507                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1509                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1511  01c2 7b09          	ld	a,(OFST+7,sp)
1512  01c4 c753a8        	ld	21416,a
1513                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1515  01c7 7b07          	ld	a,(OFST+5,sp)
1516  01c9 c753a9        	ld	21417,a
1517  01cc               L375:
1518                     ; 549 }
1521  01cc 5b03          	addw	sp,#3
1522  01ce 81            	ret
1576                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1576                     ; 560 {
1577                     	switch	.text
1578  01cf               _DAC_GetDataOutputValue:
1580  01cf 89            	pushw	x
1581       00000002      OFST:	set	2
1584                     ; 561   uint16_t outputdata = 0;
1586                     ; 562   uint16_t tmp = 0;
1588                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1590                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1592  01d0 4d            	tnz	a
1593  01d1 2619          	jrne	L326
1594                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1596  01d3 c653ac        	ld	a,21420
1597  01d6 5f            	clrw	x
1598  01d7 97            	ld	xl,a
1599  01d8 4f            	clr	a
1600  01d9 02            	rlwa	x,a
1601  01da 1f01          	ldw	(OFST-1,sp),x
1603                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1605  01dc c653ad        	ld	a,21421
1606  01df 5f            	clrw	x
1607  01e0 97            	ld	xl,a
1608  01e1 01            	rrwa	x,a
1609  01e2 1a02          	or	a,(OFST+0,sp)
1610  01e4 01            	rrwa	x,a
1611  01e5 1a01          	or	a,(OFST-1,sp)
1612  01e7 01            	rrwa	x,a
1613  01e8 1f01          	ldw	(OFST-1,sp),x
1616  01ea 2017          	jra	L526
1617  01ec               L326:
1618                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1620  01ec c653b0        	ld	a,21424
1621  01ef 5f            	clrw	x
1622  01f0 97            	ld	xl,a
1623  01f1 4f            	clr	a
1624  01f2 02            	rlwa	x,a
1625  01f3 1f01          	ldw	(OFST-1,sp),x
1627                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1629  01f5 c653b1        	ld	a,21425
1630  01f8 5f            	clrw	x
1631  01f9 97            	ld	xl,a
1632  01fa 01            	rrwa	x,a
1633  01fb 1a02          	or	a,(OFST+0,sp)
1634  01fd 01            	rrwa	x,a
1635  01fe 1a01          	or	a,(OFST-1,sp)
1636  0200 01            	rrwa	x,a
1637  0201 1f01          	ldw	(OFST-1,sp),x
1639  0203               L526:
1640                     ; 581   return (uint16_t)outputdata;
1642  0203 1e01          	ldw	x,(OFST-1,sp)
1645  0205 5b02          	addw	sp,#2
1646  0207 81            	ret
1700                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1700                     ; 614 {
1701                     	switch	.text
1702  0208               _DAC_DMACmd:
1704  0208 89            	pushw	x
1705  0209 89            	pushw	x
1706       00000002      OFST:	set	2
1709                     ; 615   uint16_t cr2addr = 0;
1711                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1713                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1715                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1717  020a 9e            	ld	a,xh
1718  020b 48            	sll	a
1719  020c 5f            	clrw	x
1720  020d 97            	ld	xl,a
1721  020e 1c5381        	addw	x,#21377
1722  0211 1f01          	ldw	(OFST-1,sp),x
1724                     ; 624   if (NewState != DISABLE)
1726  0213 0d04          	tnz	(OFST+2,sp)
1727  0215 2708          	jreq	L556
1728                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1730  0217 1e01          	ldw	x,(OFST-1,sp)
1731  0219 f6            	ld	a,(x)
1732  021a aa10          	or	a,#16
1733  021c f7            	ld	(x),a
1735  021d 2006          	jra	L756
1736  021f               L556:
1737                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1739  021f 1e01          	ldw	x,(OFST-1,sp)
1740  0221 f6            	ld	a,(x)
1741  0222 a4ef          	and	a,#239
1742  0224 f7            	ld	(x),a
1743  0225               L756:
1744                     ; 634 }
1747  0225 5b04          	addw	sp,#4
1748  0227 81            	ret
1825                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1825                     ; 668 {
1826                     	switch	.text
1827  0228               _DAC_ITConfig:
1829  0228 89            	pushw	x
1830  0229 89            	pushw	x
1831       00000002      OFST:	set	2
1834                     ; 669   uint16_t cr2addr = 0;
1836                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1838                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1840                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1842                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1844  022a 9e            	ld	a,xh
1845  022b 48            	sll	a
1846  022c 5f            	clrw	x
1847  022d 97            	ld	xl,a
1848  022e 1c5381        	addw	x,#21377
1849  0231 1f01          	ldw	(OFST-1,sp),x
1851                     ; 679   if (NewState != DISABLE)
1853  0233 0d07          	tnz	(OFST+5,sp)
1854  0235 2708          	jreq	L127
1855                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1857  0237 1e01          	ldw	x,(OFST-1,sp)
1858  0239 f6            	ld	a,(x)
1859  023a 1a04          	or	a,(OFST+2,sp)
1860  023c f7            	ld	(x),a
1862  023d 2007          	jra	L327
1863  023f               L127:
1864                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1866  023f 1e01          	ldw	x,(OFST-1,sp)
1867  0241 7b04          	ld	a,(OFST+2,sp)
1868  0243 43            	cpl	a
1869  0244 f4            	and	a,(x)
1870  0245 f7            	ld	(x),a
1871  0246               L327:
1872                     ; 689 }
1875  0246 5b04          	addw	sp,#4
1876  0248 81            	ret
1974                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1974                     ; 705 {
1975                     	switch	.text
1976  0249               _DAC_GetFlagStatus:
1978  0249 89            	pushw	x
1979  024a 88            	push	a
1980       00000001      OFST:	set	1
1983                     ; 706   FlagStatus flagstatus = RESET;
1985                     ; 707   uint8_t flag = 0;
1987                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1989                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1991                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1993  024b 9e            	ld	a,xh
1994  024c 5f            	clrw	x
1995  024d 97            	ld	xl,a
1996  024e 7b03          	ld	a,(OFST+2,sp)
1997  0250 5d            	tnzw	x
1998  0251 2704          	jreq	L25
1999  0253               L45:
2000  0253 48            	sll	a
2001  0254 5a            	decw	x
2002  0255 26fc          	jrne	L45
2003  0257               L25:
2004  0257 6b01          	ld	(OFST+0,sp),a
2006                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
2008  0259 c65385        	ld	a,21381
2009  025c 1501          	bcp	a,(OFST+0,sp)
2010  025e 2706          	jreq	L577
2011                     ; 719     flagstatus = SET;
2013  0260 a601          	ld	a,#1
2014  0262 6b01          	ld	(OFST+0,sp),a
2017  0264 2002          	jra	L777
2018  0266               L577:
2019                     ; 724     flagstatus = RESET;
2021  0266 0f01          	clr	(OFST+0,sp)
2023  0268               L777:
2024                     ; 728   return  flagstatus;
2026  0268 7b01          	ld	a,(OFST+0,sp)
2029  026a 5b03          	addw	sp,#3
2030  026c 81            	ret
2084                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2084                     ; 743 {
2085                     	switch	.text
2086  026d               _DAC_ClearFlag:
2088  026d 89            	pushw	x
2089  026e 88            	push	a
2090       00000001      OFST:	set	1
2093                     ; 744   uint8_t flag = 0;
2095                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2097                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2099                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2101  026f 9e            	ld	a,xh
2102  0270 5f            	clrw	x
2103  0271 97            	ld	xl,a
2104  0272 7b03          	ld	a,(OFST+2,sp)
2105  0274 5d            	tnzw	x
2106  0275 2704          	jreq	L06
2107  0277               L26:
2108  0277 48            	sll	a
2109  0278 5a            	decw	x
2110  0279 26fc          	jrne	L26
2111  027b               L06:
2112  027b 6b01          	ld	(OFST+0,sp),a
2114                     ; 754   DAC->SR = (uint8_t)(~flag);
2116  027d 7b01          	ld	a,(OFST+0,sp)
2117  027f 43            	cpl	a
2118  0280 c75385        	ld	21381,a
2119                     ; 755 }
2122  0283 5b03          	addw	sp,#3
2123  0285 81            	ret
2206                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2206                     ; 771 {
2207                     	switch	.text
2208  0286               _DAC_GetITStatus:
2210  0286 89            	pushw	x
2211  0287 89            	pushw	x
2212       00000002      OFST:	set	2
2215                     ; 772   ITStatus itstatus = RESET;
2217                     ; 773   uint8_t enablestatus = 0;
2219                     ; 774   uint8_t flagstatus = 0;
2221                     ; 775   uint8_t tempreg = 0;
2223                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2225                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2227                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2229  0288 9e            	ld	a,xh
2230  0289 48            	sll	a
2231  028a 48            	sll	a
2232  028b 5f            	clrw	x
2233  028c 97            	ld	xl,a
2234  028d d65381        	ld	a,(21377,x)
2235  0290 6b02          	ld	(OFST+0,sp),a
2237                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2239  0292 7b03          	ld	a,(OFST+1,sp)
2240  0294 5f            	clrw	x
2241  0295 97            	ld	xl,a
2242  0296 7b04          	ld	a,(OFST+2,sp)
2243  0298 5d            	tnzw	x
2244  0299 2704          	jreq	L66
2245  029b               L07:
2246  029b 48            	sll	a
2247  029c 5a            	decw	x
2248  029d 26fc          	jrne	L07
2249  029f               L66:
2250  029f 1402          	and	a,(OFST+0,sp)
2251  02a1 6b01          	ld	(OFST-1,sp),a
2253                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2255  02a3 a605          	ld	a,#5
2256  02a5 1003          	sub	a,(OFST+1,sp)
2257  02a7 5f            	clrw	x
2258  02a8 97            	ld	xl,a
2259  02a9 7b04          	ld	a,(OFST+2,sp)
2260  02ab 5d            	tnzw	x
2261  02ac 2704          	jreq	L27
2262  02ae               L47:
2263  02ae 44            	srl	a
2264  02af 5a            	decw	x
2265  02b0 26fc          	jrne	L47
2266  02b2               L27:
2267  02b2 c45385        	and	a,21381
2268  02b5 6b02          	ld	(OFST+0,sp),a
2270                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2272  02b7 0d02          	tnz	(OFST+0,sp)
2273  02b9 270a          	jreq	L1701
2275  02bb 0d01          	tnz	(OFST-1,sp)
2276  02bd 2706          	jreq	L1701
2277                     ; 790     itstatus = SET;
2279  02bf a601          	ld	a,#1
2280  02c1 6b02          	ld	(OFST+0,sp),a
2283  02c3 2002          	jra	L3701
2284  02c5               L1701:
2285                     ; 795     itstatus = RESET;
2287  02c5 0f02          	clr	(OFST+0,sp)
2289  02c7               L3701:
2290                     ; 799   return  itstatus;
2292  02c7 7b02          	ld	a,(OFST+0,sp)
2295  02c9 5b04          	addw	sp,#4
2296  02cb 81            	ret
2342                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2342                     ; 814 {
2343                     	switch	.text
2344  02cc               _DAC_ClearITPendingBit:
2346  02cc 89            	pushw	x
2347       00000000      OFST:	set	0
2350                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2352                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2354                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2356  02cd 9e            	ld	a,xh
2357  02ce a005          	sub	a,#5
2358  02d0 40            	neg	a
2359  02d1 5f            	clrw	x
2360  02d2 97            	ld	xl,a
2361  02d3 7b02          	ld	a,(OFST+2,sp)
2362  02d5 5d            	tnzw	x
2363  02d6 2704          	jreq	L001
2364  02d8               L201:
2365  02d8 44            	srl	a
2366  02d9 5a            	decw	x
2367  02da 26fc          	jrne	L201
2368  02dc               L001:
2369  02dc 43            	cpl	a
2370  02dd c75385        	ld	21381,a
2371                     ; 821 }
2374  02e0 85            	popw	x
2375  02e1 81            	ret
2388                     	xdef	_DAC_ClearITPendingBit
2389                     	xdef	_DAC_GetITStatus
2390                     	xdef	_DAC_ClearFlag
2391                     	xdef	_DAC_GetFlagStatus
2392                     	xdef	_DAC_ITConfig
2393                     	xdef	_DAC_DMACmd
2394                     	xdef	_DAC_GetDataOutputValue
2395                     	xdef	_DAC_SetDualChannelData
2396                     	xdef	_DAC_SetChannel2Data
2397                     	xdef	_DAC_SetChannel1Data
2398                     	xdef	_DAC_SetTriangleWaveAmplitude
2399                     	xdef	_DAC_SetNoiseWaveLFSR
2400                     	xdef	_DAC_WaveGenerationCmd
2401                     	xdef	_DAC_DualSoftwareTriggerCmd
2402                     	xdef	_DAC_SoftwareTriggerCmd
2403                     	xdef	_DAC_Cmd
2404                     	xdef	_DAC_Init
2405                     	xdef	_DAC_DeInit
2424                     	end
