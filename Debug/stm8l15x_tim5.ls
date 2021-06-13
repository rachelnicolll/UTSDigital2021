   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 168 void TIM5_DeInit(void)
  41                     ; 169 {
  43                     	switch	.text
  44  0000               _TIM5_DeInit:
  48                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  50  0000 725f5300      	clr	21248
  51                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  53  0004 725f5301      	clr	21249
  54                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  56  0008 725f5302      	clr	21250
  57                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  59  000c 725f5303      	clr	21251
  60                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  62  0010 725f5305      	clr	21253
  63                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  65  0014 725f5307      	clr	21255
  66                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  68  0018 725f530b      	clr	21259
  69                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  71  001c 35015309      	mov	21257,#1
  72                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  74  0020 3501530a      	mov	21258,#1
  75                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  77  0024 725f530b      	clr	21259
  78                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  80  0028 725f5309      	clr	21257
  81                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  83  002c 725f530a      	clr	21258
  84                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  86  0030 725f530c      	clr	21260
  87                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  89  0034 725f530d      	clr	21261
  90                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  92  0038 725f530e      	clr	21262
  93                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  95  003c 35ff530f      	mov	21263,#255
  96                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
  98  0040 35ff5310      	mov	21264,#255
  99                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 101  0044 725f5311      	clr	21265
 102                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 104  0048 725f5312      	clr	21266
 105                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 107  004c 725f5313      	clr	21267
 108                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 110  0050 725f5314      	clr	21268
 111                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 113  0054 725f5316      	clr	21270
 114                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 116  0058 35015308      	mov	21256,#1
 117                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 119  005c 725f5315      	clr	21269
 120                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 122  0060 725f5306      	clr	21254
 123                     ; 206 }
 126  0064 81            	ret
 288                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 288                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 288                     ; 233                        uint16_t TIM5_Period)
 288                     ; 234 {
 289                     	switch	.text
 290  0065               _TIM5_TimeBaseInit:
 292  0065 89            	pushw	x
 293       00000000      OFST:	set	0
 296                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 298                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 300                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 302  0066 7b05          	ld	a,(OFST+5,sp)
 303  0068 c7530f        	ld	21263,a
 304                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 306  006b 7b06          	ld	a,(OFST+6,sp)
 307  006d c75310        	ld	21264,a
 308                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 310  0070 9e            	ld	a,xh
 311  0071 c7530e        	ld	21262,a
 312                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 314  0074 c65300        	ld	a,21248
 315  0077 a48f          	and	a,#143
 316  0079 c75300        	ld	21248,a
 317                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 319  007c 9f            	ld	a,xl
 320  007d ca5300        	or	a,21248
 321  0080 c75300        	ld	21248,a
 322                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 324  0083 35015308      	mov	21256,#1
 325                     ; 254 }
 328  0087 85            	popw	x
 329  0088 81            	ret
 397                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 397                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 397                     ; 276 {
 398                     	switch	.text
 399  0089               _TIM5_PrescalerConfig:
 403                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 405                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 407                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 409  0089 9e            	ld	a,xh
 410  008a c7530e        	ld	21262,a
 411                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 413  008d 9f            	ld	a,xl
 414  008e a101          	cp	a,#1
 415  0090 2606          	jrne	L741
 416                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 418  0092 72105308      	bset	21256,#0
 420  0096 2004          	jra	L151
 421  0098               L741:
 422                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 424  0098 72115308      	bres	21256,#0
 425  009c               L151:
 426                     ; 293 }
 429  009c 81            	ret
 474                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 474                     ; 307 {
 475                     	switch	.text
 476  009d               _TIM5_CounterModeConfig:
 478  009d 88            	push	a
 479  009e 88            	push	a
 480       00000001      OFST:	set	1
 483                     ; 308   uint8_t tmpcr1 = 0;
 485                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 487                     ; 313   tmpcr1 = TIM5->CR1;
 489  009f c65300        	ld	a,21248
 490  00a2 6b01          	ld	(OFST+0,sp),a
 492                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 494  00a4 7b01          	ld	a,(OFST+0,sp)
 495  00a6 a48f          	and	a,#143
 496  00a8 6b01          	ld	(OFST+0,sp),a
 498                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 500  00aa 7b01          	ld	a,(OFST+0,sp)
 501  00ac 1a02          	or	a,(OFST+1,sp)
 502  00ae 6b01          	ld	(OFST+0,sp),a
 504                     ; 321   TIM5->CR1 = tmpcr1;
 506  00b0 7b01          	ld	a,(OFST+0,sp)
 507  00b2 c75300        	ld	21248,a
 508                     ; 322 }
 511  00b5 85            	popw	x
 512  00b6 81            	ret
 546                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 546                     ; 331 {
 547                     	switch	.text
 548  00b7               _TIM5_SetCounter:
 552                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 554  00b7 9e            	ld	a,xh
 555  00b8 c7530c        	ld	21260,a
 556                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 558  00bb 9f            	ld	a,xl
 559  00bc c7530d        	ld	21261,a
 560                     ; 336 }
 563  00bf 81            	ret
 597                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 597                     ; 345 {
 598                     	switch	.text
 599  00c0               _TIM5_SetAutoreload:
 603                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 605  00c0 9e            	ld	a,xh
 606  00c1 c7530f        	ld	21263,a
 607                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 609  00c4 9f            	ld	a,xl
 610  00c5 c75310        	ld	21264,a
 611                     ; 349 }
 614  00c8 81            	ret
 666                     ; 356 uint16_t TIM5_GetCounter(void)
 666                     ; 357 {
 667                     	switch	.text
 668  00c9               _TIM5_GetCounter:
 670  00c9 5204          	subw	sp,#4
 671       00000004      OFST:	set	4
 674                     ; 358   uint16_t tmpcnt = 0;
 676                     ; 361   tmpcntrh = TIM5->CNTRH;
 678  00cb c6530c        	ld	a,21260
 679  00ce 6b02          	ld	(OFST-2,sp),a
 681                     ; 362   tmpcntrl = TIM5->CNTRL;
 683  00d0 c6530d        	ld	a,21261
 684  00d3 6b01          	ld	(OFST-3,sp),a
 686                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 688  00d5 7b01          	ld	a,(OFST-3,sp)
 689  00d7 5f            	clrw	x
 690  00d8 97            	ld	xl,a
 691  00d9 1f03          	ldw	(OFST-1,sp),x
 693                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 695  00db 7b02          	ld	a,(OFST-2,sp)
 696  00dd 5f            	clrw	x
 697  00de 97            	ld	xl,a
 698  00df 4f            	clr	a
 699  00e0 02            	rlwa	x,a
 700  00e1 01            	rrwa	x,a
 701  00e2 1a04          	or	a,(OFST+0,sp)
 702  00e4 01            	rrwa	x,a
 703  00e5 1a03          	or	a,(OFST-1,sp)
 704  00e7 01            	rrwa	x,a
 705  00e8 1f03          	ldw	(OFST-1,sp),x
 707                     ; 367   return ((uint16_t)tmpcnt);
 709  00ea 1e03          	ldw	x,(OFST-1,sp)
 712  00ec 5b04          	addw	sp,#4
 713  00ee 81            	ret
 737                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 737                     ; 384 {
 738                     	switch	.text
 739  00ef               _TIM5_GetPrescaler:
 743                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 745  00ef c6530e        	ld	a,21262
 748  00f2 81            	ret
 804                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 804                     ; 397 {
 805                     	switch	.text
 806  00f3               _TIM5_UpdateDisableConfig:
 810                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 812                     ; 402   if (NewState != DISABLE)
 814  00f3 4d            	tnz	a
 815  00f4 2706          	jreq	L513
 816                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 818  00f6 72125300      	bset	21248,#1
 820  00fa 2004          	jra	L713
 821  00fc               L513:
 822                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 824  00fc 72135300      	bres	21248,#1
 825  0100               L713:
 826                     ; 410 }
 829  0100 81            	ret
 887                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 887                     ; 421 {
 888                     	switch	.text
 889  0101               _TIM5_UpdateRequestConfig:
 893                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 895                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 897  0101 a101          	cp	a,#1
 898  0103 2606          	jrne	L743
 899                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 901  0105 72145300      	bset	21248,#2
 903  0109 2004          	jra	L153
 904  010b               L743:
 905                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 907  010b 72155300      	bres	21248,#2
 908  010f               L153:
 909                     ; 434 }
 912  010f 81            	ret
 948                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 948                     ; 443 {
 949                     	switch	.text
 950  0110               _TIM5_ARRPreloadConfig:
 954                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 956                     ; 448   if (NewState != DISABLE)
 958  0110 4d            	tnz	a
 959  0111 2706          	jreq	L173
 960                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 962  0113 721e5300      	bset	21248,#7
 964  0117 2004          	jra	L373
 965  0119               L173:
 966                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 968  0119 721f5300      	bres	21248,#7
 969  011d               L373:
 970                     ; 456 }
 973  011d 81            	ret
1030                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1030                     ; 467 {
1031                     	switch	.text
1032  011e               _TIM5_SelectOnePulseMode:
1036                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1038                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1040  011e a101          	cp	a,#1
1041  0120 2606          	jrne	L324
1042                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1044  0122 72165300      	bset	21248,#3
1046  0126 2004          	jra	L524
1047  0128               L324:
1048                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1050  0128 72175300      	bres	21248,#3
1051  012c               L524:
1052                     ; 480 }
1055  012c 81            	ret
1090                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1090                     ; 489 {
1091                     	switch	.text
1092  012d               _TIM5_Cmd:
1096                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1098                     ; 494   if (NewState != DISABLE)
1100  012d 4d            	tnz	a
1101  012e 2706          	jreq	L544
1102                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1104  0130 72105300      	bset	21248,#0
1106  0134 2004          	jra	L744
1107  0136               L544:
1108                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1110  0136 72115300      	bres	21248,#0
1111  013a               L744:
1112                     ; 502 }
1115  013a 81            	ret
1313                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1313                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1313                     ; 580                   uint16_t TIM5_Pulse,
1313                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1313                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1313                     ; 583 {
1314                     	switch	.text
1315  013b               _TIM5_OC1Init:
1317  013b 89            	pushw	x
1318  013c 88            	push	a
1319       00000001      OFST:	set	1
1322                     ; 584   uint8_t tmpccmr1 = 0;
1324                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1326                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1328                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1330                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1332                     ; 592   tmpccmr1 = TIM5->CCMR1;
1334  013d c65309        	ld	a,21257
1335  0140 6b01          	ld	(OFST+0,sp),a
1337                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1339  0142 7211530b      	bres	21259,#0
1340                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1342  0146 7b01          	ld	a,(OFST+0,sp)
1343  0148 a48f          	and	a,#143
1344  014a 6b01          	ld	(OFST+0,sp),a
1346                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1348  014c 9e            	ld	a,xh
1349  014d 1a01          	or	a,(OFST+0,sp)
1350  014f 6b01          	ld	(OFST+0,sp),a
1352                     ; 602   TIM5->CCMR1 = tmpccmr1;
1354  0151 7b01          	ld	a,(OFST+0,sp)
1355  0153 c75309        	ld	21257,a
1356                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1358  0156 9f            	ld	a,xl
1359  0157 a101          	cp	a,#1
1360  0159 2606          	jrne	L365
1361                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1363  015b 7210530b      	bset	21259,#0
1365  015f 2004          	jra	L565
1366  0161               L365:
1367                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1369  0161 7211530b      	bres	21259,#0
1370  0165               L565:
1371                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1373  0165 7b08          	ld	a,(OFST+7,sp)
1374  0167 a101          	cp	a,#1
1375  0169 2606          	jrne	L765
1376                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1378  016b 7212530b      	bset	21259,#1
1380  016f 2004          	jra	L175
1381  0171               L765:
1382                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1384  0171 7213530b      	bres	21259,#1
1385  0175               L175:
1386                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1388  0175 7b09          	ld	a,(OFST+8,sp)
1389  0177 a101          	cp	a,#1
1390  0179 2606          	jrne	L375
1391                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1393  017b 72105316      	bset	21270,#0
1395  017f 2004          	jra	L575
1396  0181               L375:
1397                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1399  0181 72115316      	bres	21270,#0
1400  0185               L575:
1401                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1403  0185 7b06          	ld	a,(OFST+5,sp)
1404  0187 c75311        	ld	21265,a
1405                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1407  018a 7b07          	ld	a,(OFST+6,sp)
1408  018c c75312        	ld	21266,a
1409                     ; 637 }
1412  018f 5b03          	addw	sp,#3
1413  0191 81            	ret
1496                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1496                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1496                     ; 666                   uint16_t TIM5_Pulse,
1496                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1496                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1496                     ; 669 {
1497                     	switch	.text
1498  0192               _TIM5_OC2Init:
1500  0192 89            	pushw	x
1501  0193 88            	push	a
1502       00000001      OFST:	set	1
1505                     ; 670   uint8_t tmpccmr2 = 0;
1507                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1509                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1511                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1513                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1515                     ; 678   tmpccmr2 = TIM5->CCMR2;
1517  0194 c6530a        	ld	a,21258
1518  0197 6b01          	ld	(OFST+0,sp),a
1520                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1522  0199 7219530b      	bres	21259,#4
1523                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1525  019d 7b01          	ld	a,(OFST+0,sp)
1526  019f a48f          	and	a,#143
1527  01a1 6b01          	ld	(OFST+0,sp),a
1529                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1531  01a3 9e            	ld	a,xh
1532  01a4 1a01          	or	a,(OFST+0,sp)
1533  01a6 6b01          	ld	(OFST+0,sp),a
1535                     ; 689   TIM5->CCMR2 = tmpccmr2;
1537  01a8 7b01          	ld	a,(OFST+0,sp)
1538  01aa c7530a        	ld	21258,a
1539                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1541  01ad 9f            	ld	a,xl
1542  01ae a101          	cp	a,#1
1543  01b0 2606          	jrne	L146
1544                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1546  01b2 7218530b      	bset	21259,#4
1548  01b6 2004          	jra	L346
1549  01b8               L146:
1550                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1552  01b8 7219530b      	bres	21259,#4
1553  01bc               L346:
1554                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1556  01bc 7b08          	ld	a,(OFST+7,sp)
1557  01be a101          	cp	a,#1
1558  01c0 2606          	jrne	L546
1559                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1561  01c2 721a530b      	bset	21259,#5
1563  01c6 2004          	jra	L746
1564  01c8               L546:
1565                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1567  01c8 721b530b      	bres	21259,#5
1568  01cc               L746:
1569                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1571  01cc 7b09          	ld	a,(OFST+8,sp)
1572  01ce a101          	cp	a,#1
1573  01d0 2606          	jrne	L156
1574                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1576  01d2 72145316      	bset	21270,#2
1578  01d6 2004          	jra	L356
1579  01d8               L156:
1580                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1582  01d8 72155316      	bres	21270,#2
1583  01dc               L356:
1584                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1586  01dc 7b06          	ld	a,(OFST+5,sp)
1587  01de c75313        	ld	21267,a
1588                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1590  01e1 7b07          	ld	a,(OFST+6,sp)
1591  01e3 c75314        	ld	21268,a
1592                     ; 725 }
1595  01e6 5b03          	addw	sp,#3
1596  01e8 81            	ret
1794                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1794                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1794                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1794                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1794                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1794                     ; 759 
1794                     ; 760 {
1795                     	switch	.text
1796  01e9               _TIM5_BKRConfig:
1798  01e9 89            	pushw	x
1799  01ea 88            	push	a
1800       00000001      OFST:	set	1
1803                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1805                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1807                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1809                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1811                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1813                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1813                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1813                     ; 774                                   TIM5_AutomaticOutput));
1815  01eb 7b06          	ld	a,(OFST+5,sp)
1816  01ed 1a07          	or	a,(OFST+6,sp)
1817  01ef 6b01          	ld	(OFST+0,sp),a
1819  01f1 9f            	ld	a,xl
1820  01f2 1a02          	or	a,(OFST+1,sp)
1821  01f4 1a01          	or	a,(OFST+0,sp)
1822  01f6 1a08          	or	a,(OFST+7,sp)
1823  01f8 c75315        	ld	21269,a
1824                     ; 775 }
1827  01fb 5b03          	addw	sp,#3
1828  01fd 81            	ret
1864                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1864                     ; 784 {
1865                     	switch	.text
1866  01fe               _TIM5_CtrlPWMOutputs:
1870                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1872                     ; 790   if (NewState != DISABLE)
1874  01fe 4d            	tnz	a
1875  01ff 2706          	jreq	L5001
1876                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1878  0201 721e5315      	bset	21269,#7
1880  0205 2004          	jra	L7001
1881  0207               L5001:
1882                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1884  0207 721f5315      	bres	21269,#7
1885  020b               L7001:
1886                     ; 798 }
1889  020b 81            	ret
1954                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1954                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1954                     ; 820 {
1955                     	switch	.text
1956  020c               _TIM5_SelectOCxM:
1958  020c 89            	pushw	x
1959       00000000      OFST:	set	0
1962                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1964                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1966                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1968  020d 9e            	ld	a,xh
1969  020e 4d            	tnz	a
1970  020f 2615          	jrne	L3401
1971                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1973  0211 7211530b      	bres	21259,#0
1974                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1976  0215 c65309        	ld	a,21257
1977  0218 a48f          	and	a,#143
1978  021a c75309        	ld	21257,a
1979                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1981  021d 9f            	ld	a,xl
1982  021e ca5309        	or	a,21257
1983  0221 c75309        	ld	21257,a
1985  0224 2014          	jra	L5401
1986  0226               L3401:
1987                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1989  0226 7219530b      	bres	21259,#4
1990                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1992  022a c6530a        	ld	a,21258
1993  022d a48f          	and	a,#143
1994  022f c7530a        	ld	21258,a
1995                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1997  0232 c6530a        	ld	a,21258
1998  0235 1a02          	or	a,(OFST+2,sp)
1999  0237 c7530a        	ld	21258,a
2000  023a               L5401:
2001                     ; 847 }
2004  023a 85            	popw	x
2005  023b 81            	ret
2039                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
2039                     ; 856 {
2040                     	switch	.text
2041  023c               _TIM5_SetCompare1:
2045                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2047  023c 9e            	ld	a,xh
2048  023d c75311        	ld	21265,a
2049                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2051  0240 9f            	ld	a,xl
2052  0241 c75312        	ld	21266,a
2053                     ; 860 }
2056  0244 81            	ret
2090                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2090                     ; 869 {
2091                     	switch	.text
2092  0245               _TIM5_SetCompare2:
2096                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2098  0245 9e            	ld	a,xh
2099  0246 c75313        	ld	21267,a
2100                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2102  0249 9f            	ld	a,xl
2103  024a c75314        	ld	21268,a
2104                     ; 873 }
2107  024d 81            	ret
2174                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2174                     ; 884 {
2175                     	switch	.text
2176  024e               _TIM5_ForcedOC1Config:
2178  024e 88            	push	a
2179  024f 88            	push	a
2180       00000001      OFST:	set	1
2183                     ; 885   uint8_t tmpccmr1 = 0;
2185                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2187                     ; 890   tmpccmr1 = TIM5->CCMR1;
2189  0250 c65309        	ld	a,21257
2190  0253 6b01          	ld	(OFST+0,sp),a
2192                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2194  0255 7b01          	ld	a,(OFST+0,sp)
2195  0257 a48f          	and	a,#143
2196  0259 6b01          	ld	(OFST+0,sp),a
2198                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2200  025b 7b01          	ld	a,(OFST+0,sp)
2201  025d 1a02          	or	a,(OFST+1,sp)
2202  025f 6b01          	ld	(OFST+0,sp),a
2204                     ; 898   TIM5->CCMR1 = tmpccmr1;
2206  0261 7b01          	ld	a,(OFST+0,sp)
2207  0263 c75309        	ld	21257,a
2208                     ; 899 }
2211  0266 85            	popw	x
2212  0267 81            	ret
2257                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2257                     ; 910 {
2258                     	switch	.text
2259  0268               _TIM5_ForcedOC2Config:
2261  0268 88            	push	a
2262  0269 88            	push	a
2263       00000001      OFST:	set	1
2266                     ; 911   uint8_t tmpccmr2 = 0;
2268                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2270                     ; 916   tmpccmr2 = TIM5->CCMR2;
2272  026a c6530a        	ld	a,21258
2273  026d 6b01          	ld	(OFST+0,sp),a
2275                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2277  026f 7b01          	ld	a,(OFST+0,sp)
2278  0271 a48f          	and	a,#143
2279  0273 6b01          	ld	(OFST+0,sp),a
2281                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2283  0275 7b01          	ld	a,(OFST+0,sp)
2284  0277 1a02          	or	a,(OFST+1,sp)
2285  0279 6b01          	ld	(OFST+0,sp),a
2287                     ; 924   TIM5->CCMR2 = tmpccmr2;
2289  027b 7b01          	ld	a,(OFST+0,sp)
2290  027d c7530a        	ld	21258,a
2291                     ; 925 }
2294  0280 85            	popw	x
2295  0281 81            	ret
2331                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2331                     ; 934 {
2332                     	switch	.text
2333  0282               _TIM5_OC1PreloadConfig:
2337                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2339                     ; 939   if (NewState != DISABLE)
2341  0282 4d            	tnz	a
2342  0283 2706          	jreq	L5711
2343                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2345  0285 72165309      	bset	21257,#3
2347  0289 2004          	jra	L7711
2348  028b               L5711:
2349                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2351  028b 72175309      	bres	21257,#3
2352  028f               L7711:
2353                     ; 947 }
2356  028f 81            	ret
2392                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2392                     ; 956 {
2393                     	switch	.text
2394  0290               _TIM5_OC2PreloadConfig:
2398                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2400                     ; 961   if (NewState != DISABLE)
2402  0290 4d            	tnz	a
2403  0291 2706          	jreq	L7121
2404                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2406  0293 7216530a      	bset	21258,#3
2408  0297 2004          	jra	L1221
2409  0299               L7121:
2410                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2412  0299 7217530a      	bres	21258,#3
2413  029d               L1221:
2414                     ; 969 }
2417  029d 81            	ret
2452                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2452                     ; 978 {
2453                     	switch	.text
2454  029e               _TIM5_OC1FastConfig:
2458                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2460                     ; 983   if (NewState != DISABLE)
2462  029e 4d            	tnz	a
2463  029f 2706          	jreq	L1421
2464                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2466  02a1 72145309      	bset	21257,#2
2468  02a5 2004          	jra	L3421
2469  02a7               L1421:
2470                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2472  02a7 72155309      	bres	21257,#2
2473  02ab               L3421:
2474                     ; 991 }
2477  02ab 81            	ret
2512                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2512                     ; 1001 {
2513                     	switch	.text
2514  02ac               _TIM5_OC2FastConfig:
2518                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2520                     ; 1006   if (NewState != DISABLE)
2522  02ac 4d            	tnz	a
2523  02ad 2706          	jreq	L3621
2524                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2526  02af 7214530a      	bset	21258,#2
2528  02b3 2004          	jra	L5621
2529  02b5               L3621:
2530                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2532  02b5 7215530a      	bres	21258,#2
2533  02b9               L5621:
2534                     ; 1014 }
2537  02b9 81            	ret
2573                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2573                     ; 1025 {
2574                     	switch	.text
2575  02ba               _TIM5_OC1PolarityConfig:
2579                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2581                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2583  02ba a101          	cp	a,#1
2584  02bc 2606          	jrne	L5031
2585                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2587  02be 7212530b      	bset	21259,#1
2589  02c2 2004          	jra	L7031
2590  02c4               L5031:
2591                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2593  02c4 7213530b      	bres	21259,#1
2594  02c8               L7031:
2595                     ; 1038 }
2598  02c8 81            	ret
2634                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2634                     ; 1049 {
2635                     	switch	.text
2636  02c9               _TIM5_OC2PolarityConfig:
2640                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2642                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2644  02c9 a101          	cp	a,#1
2645  02cb 2606          	jrne	L7231
2646                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2648  02cd 721a530b      	bset	21259,#5
2650  02d1 2004          	jra	L1331
2651  02d3               L7231:
2652                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2654  02d3 721b530b      	bres	21259,#5
2655  02d7               L1331:
2656                     ; 1062 }
2659  02d7 81            	ret
2704                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2704                     ; 1075                  FunctionalState NewState)
2704                     ; 1076 {
2705                     	switch	.text
2706  02d8               _TIM5_CCxCmd:
2708  02d8 89            	pushw	x
2709       00000000      OFST:	set	0
2712                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2714                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2716                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2718  02d9 9e            	ld	a,xh
2719  02da 4d            	tnz	a
2720  02db 2610          	jrne	L5531
2721                     ; 1084     if (NewState != DISABLE)
2723  02dd 9f            	ld	a,xl
2724  02de 4d            	tnz	a
2725  02df 2706          	jreq	L7531
2726                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2728  02e1 7210530b      	bset	21259,#0
2730  02e5 2014          	jra	L3631
2731  02e7               L7531:
2732                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2734  02e7 7211530b      	bres	21259,#0
2735  02eb 200e          	jra	L3631
2736  02ed               L5531:
2737                     ; 1097     if (NewState != DISABLE)
2739  02ed 0d02          	tnz	(OFST+2,sp)
2740  02ef 2706          	jreq	L5631
2741                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2743  02f1 7218530b      	bset	21259,#4
2745  02f5 2004          	jra	L3631
2746  02f7               L5631:
2747                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2749  02f7 7219530b      	bres	21259,#4
2750  02fb               L3631:
2751                     ; 1106 }
2754  02fb 85            	popw	x
2755  02fc 81            	ret
2919                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2919                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2919                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2919                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2919                     ; 1188                  uint8_t TIM5_ICFilter)
2919                     ; 1189 {
2920                     	switch	.text
2921  02fd               _TIM5_ICInit:
2923  02fd 89            	pushw	x
2924       00000000      OFST:	set	0
2927                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2929                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2931  02fe 9e            	ld	a,xh
2932  02ff 4d            	tnz	a
2933  0300 2614          	jrne	L5641
2934                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2936  0302 7b07          	ld	a,(OFST+7,sp)
2937  0304 88            	push	a
2938  0305 7b06          	ld	a,(OFST+6,sp)
2939  0307 97            	ld	xl,a
2940  0308 7b03          	ld	a,(OFST+3,sp)
2941  030a 95            	ld	xh,a
2942  030b cd060d        	call	L3_TI1_Config
2944  030e 84            	pop	a
2945                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2947  030f 7b06          	ld	a,(OFST+6,sp)
2948  0311 cd03e3        	call	_TIM5_SetIC1Prescaler
2951  0314 2012          	jra	L7641
2952  0316               L5641:
2953                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2955  0316 7b07          	ld	a,(OFST+7,sp)
2956  0318 88            	push	a
2957  0319 7b06          	ld	a,(OFST+6,sp)
2958  031b 97            	ld	xl,a
2959  031c 7b03          	ld	a,(OFST+3,sp)
2960  031e 95            	ld	xh,a
2961  031f cd064a        	call	L5_TI2_Config
2963  0322 84            	pop	a
2964                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2966  0323 7b06          	ld	a,(OFST+6,sp)
2967  0325 cd03fd        	call	_TIM5_SetIC2Prescaler
2969  0328               L7641:
2970                     ; 1209 }
2973  0328 85            	popw	x
2974  0329 81            	ret
3070                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3070                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3070                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3070                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3070                     ; 1239                      uint8_t TIM5_ICFilter)
3070                     ; 1240 {
3071                     	switch	.text
3072  032a               _TIM5_PWMIConfig:
3074  032a 89            	pushw	x
3075  032b 89            	pushw	x
3076       00000002      OFST:	set	2
3079                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3081                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3083                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3085                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3087  032c 9f            	ld	a,xl
3088  032d 4d            	tnz	a
3089  032e 2606          	jrne	L7351
3090                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3092  0330 a601          	ld	a,#1
3093  0332 6b01          	ld	(OFST-1,sp),a
3096  0334 2002          	jra	L1451
3097  0336               L7351:
3098                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3100  0336 0f01          	clr	(OFST-1,sp)
3102  0338               L1451:
3103                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3105  0338 7b07          	ld	a,(OFST+5,sp)
3106  033a a101          	cp	a,#1
3107  033c 2606          	jrne	L3451
3108                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3110  033e a602          	ld	a,#2
3111  0340 6b02          	ld	(OFST+0,sp),a
3114  0342 2004          	jra	L5451
3115  0344               L3451:
3116                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3118  0344 a601          	ld	a,#1
3119  0346 6b02          	ld	(OFST+0,sp),a
3121  0348               L5451:
3122                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3124  0348 0d03          	tnz	(OFST+1,sp)
3125  034a 2626          	jrne	L7451
3126                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3126                     ; 1271                TIM5_ICFilter);
3128  034c 7b09          	ld	a,(OFST+7,sp)
3129  034e 88            	push	a
3130  034f 7b08          	ld	a,(OFST+6,sp)
3131  0351 97            	ld	xl,a
3132  0352 7b05          	ld	a,(OFST+3,sp)
3133  0354 95            	ld	xh,a
3134  0355 cd060d        	call	L3_TI1_Config
3136  0358 84            	pop	a
3137                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3139  0359 7b08          	ld	a,(OFST+6,sp)
3140  035b cd03e3        	call	_TIM5_SetIC1Prescaler
3142                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3144  035e 7b09          	ld	a,(OFST+7,sp)
3145  0360 88            	push	a
3146  0361 7b03          	ld	a,(OFST+1,sp)
3147  0363 97            	ld	xl,a
3148  0364 7b02          	ld	a,(OFST+0,sp)
3149  0366 95            	ld	xh,a
3150  0367 cd064a        	call	L5_TI2_Config
3152  036a 84            	pop	a
3153                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3155  036b 7b08          	ld	a,(OFST+6,sp)
3156  036d cd03fd        	call	_TIM5_SetIC2Prescaler
3159  0370 2022          	jra	L1551
3160  0372               L7451:
3161                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3161                     ; 1286                TIM5_ICFilter);
3163  0372 7b09          	ld	a,(OFST+7,sp)
3164  0374 88            	push	a
3165  0375 7b08          	ld	a,(OFST+6,sp)
3166  0377 97            	ld	xl,a
3167  0378 7b05          	ld	a,(OFST+3,sp)
3168  037a 95            	ld	xh,a
3169  037b cd064a        	call	L5_TI2_Config
3171  037e 84            	pop	a
3172                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3174  037f 7b08          	ld	a,(OFST+6,sp)
3175  0381 ad7a          	call	_TIM5_SetIC2Prescaler
3177                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3179  0383 7b09          	ld	a,(OFST+7,sp)
3180  0385 88            	push	a
3181  0386 7b03          	ld	a,(OFST+1,sp)
3182  0388 97            	ld	xl,a
3183  0389 7b02          	ld	a,(OFST+0,sp)
3184  038b 95            	ld	xh,a
3185  038c cd060d        	call	L3_TI1_Config
3187  038f 84            	pop	a
3188                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3190  0390 7b08          	ld	a,(OFST+6,sp)
3191  0392 ad4f          	call	_TIM5_SetIC1Prescaler
3193  0394               L1551:
3194                     ; 1297 }
3197  0394 5b04          	addw	sp,#4
3198  0396 81            	ret
3250                     ; 1304 uint16_t TIM5_GetCapture1(void)
3250                     ; 1305 {
3251                     	switch	.text
3252  0397               _TIM5_GetCapture1:
3254  0397 5204          	subw	sp,#4
3255       00000004      OFST:	set	4
3258                     ; 1306   uint16_t tmpccr1 = 0;
3260                     ; 1309   tmpccr1h = TIM5->CCR1H;
3262  0399 c65311        	ld	a,21265
3263  039c 6b02          	ld	(OFST-2,sp),a
3265                     ; 1310   tmpccr1l = TIM5->CCR1L;
3267  039e c65312        	ld	a,21266
3268  03a1 6b01          	ld	(OFST-3,sp),a
3270                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3272  03a3 7b01          	ld	a,(OFST-3,sp)
3273  03a5 5f            	clrw	x
3274  03a6 97            	ld	xl,a
3275  03a7 1f03          	ldw	(OFST-1,sp),x
3277                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3279  03a9 7b02          	ld	a,(OFST-2,sp)
3280  03ab 5f            	clrw	x
3281  03ac 97            	ld	xl,a
3282  03ad 4f            	clr	a
3283  03ae 02            	rlwa	x,a
3284  03af 01            	rrwa	x,a
3285  03b0 1a04          	or	a,(OFST+0,sp)
3286  03b2 01            	rrwa	x,a
3287  03b3 1a03          	or	a,(OFST-1,sp)
3288  03b5 01            	rrwa	x,a
3289  03b6 1f03          	ldw	(OFST-1,sp),x
3291                     ; 1315   return ((uint16_t)tmpccr1);
3293  03b8 1e03          	ldw	x,(OFST-1,sp)
3296  03ba 5b04          	addw	sp,#4
3297  03bc 81            	ret
3349                     ; 1323 uint16_t TIM5_GetCapture2(void)
3349                     ; 1324 {
3350                     	switch	.text
3351  03bd               _TIM5_GetCapture2:
3353  03bd 5204          	subw	sp,#4
3354       00000004      OFST:	set	4
3357                     ; 1325   uint16_t tmpccr2 = 0;
3359                     ; 1328   tmpccr2h = TIM5->CCR2H;
3361  03bf c65313        	ld	a,21267
3362  03c2 6b02          	ld	(OFST-2,sp),a
3364                     ; 1329   tmpccr2l = TIM5->CCR2L;
3366  03c4 c65314        	ld	a,21268
3367  03c7 6b01          	ld	(OFST-3,sp),a
3369                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3371  03c9 7b01          	ld	a,(OFST-3,sp)
3372  03cb 5f            	clrw	x
3373  03cc 97            	ld	xl,a
3374  03cd 1f03          	ldw	(OFST-1,sp),x
3376                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3378  03cf 7b02          	ld	a,(OFST-2,sp)
3379  03d1 5f            	clrw	x
3380  03d2 97            	ld	xl,a
3381  03d3 4f            	clr	a
3382  03d4 02            	rlwa	x,a
3383  03d5 01            	rrwa	x,a
3384  03d6 1a04          	or	a,(OFST+0,sp)
3385  03d8 01            	rrwa	x,a
3386  03d9 1a03          	or	a,(OFST-1,sp)
3387  03db 01            	rrwa	x,a
3388  03dc 1f03          	ldw	(OFST-1,sp),x
3390                     ; 1334   return ((uint16_t)tmpccr2);
3392  03de 1e03          	ldw	x,(OFST-1,sp)
3395  03e0 5b04          	addw	sp,#4
3396  03e2 81            	ret
3441                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3441                     ; 1348 {
3442                     	switch	.text
3443  03e3               _TIM5_SetIC1Prescaler:
3445  03e3 88            	push	a
3446  03e4 88            	push	a
3447       00000001      OFST:	set	1
3450                     ; 1349   uint8_t tmpccmr1 = 0;
3452                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3454                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3456  03e5 c65309        	ld	a,21257
3457  03e8 6b01          	ld	(OFST+0,sp),a
3459                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3461  03ea 7b01          	ld	a,(OFST+0,sp)
3462  03ec a4f3          	and	a,#243
3463  03ee 6b01          	ld	(OFST+0,sp),a
3465                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3467  03f0 7b01          	ld	a,(OFST+0,sp)
3468  03f2 1a02          	or	a,(OFST+1,sp)
3469  03f4 6b01          	ld	(OFST+0,sp),a
3471                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3473  03f6 7b01          	ld	a,(OFST+0,sp)
3474  03f8 c75309        	ld	21257,a
3475                     ; 1363 }
3478  03fb 85            	popw	x
3479  03fc 81            	ret
3524                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3524                     ; 1376 {
3525                     	switch	.text
3526  03fd               _TIM5_SetIC2Prescaler:
3528  03fd 88            	push	a
3529  03fe 88            	push	a
3530       00000001      OFST:	set	1
3533                     ; 1377   uint8_t tmpccmr2 = 0;
3535                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3537                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3539  03ff c6530a        	ld	a,21258
3540  0402 6b01          	ld	(OFST+0,sp),a
3542                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3544  0404 7b01          	ld	a,(OFST+0,sp)
3545  0406 a4f3          	and	a,#243
3546  0408 6b01          	ld	(OFST+0,sp),a
3548                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3550  040a 7b01          	ld	a,(OFST+0,sp)
3551  040c 1a02          	or	a,(OFST+1,sp)
3552  040e 6b01          	ld	(OFST+0,sp),a
3554                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3556  0410 7b01          	ld	a,(OFST+0,sp)
3557  0412 c7530a        	ld	21258,a
3558                     ; 1391 }
3561  0415 85            	popw	x
3562  0416 81            	ret
3648                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3648                     ; 1423 {
3649                     	switch	.text
3650  0417               _TIM5_ITConfig:
3652  0417 89            	pushw	x
3653       00000000      OFST:	set	0
3656                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3658                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3660                     ; 1428   if (NewState != DISABLE)
3662  0418 9f            	ld	a,xl
3663  0419 4d            	tnz	a
3664  041a 2709          	jreq	L3371
3665                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3667  041c 9e            	ld	a,xh
3668  041d ca5305        	or	a,21253
3669  0420 c75305        	ld	21253,a
3671  0423 2009          	jra	L5371
3672  0425               L3371:
3673                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3675  0425 7b01          	ld	a,(OFST+1,sp)
3676  0427 43            	cpl	a
3677  0428 c45305        	and	a,21253
3678  042b c75305        	ld	21253,a
3679  042e               L5371:
3680                     ; 1438 }
3683  042e 85            	popw	x
3684  042f 81            	ret
3765                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3765                     ; 1452 {
3766                     	switch	.text
3767  0430               _TIM5_GenerateEvent:
3771                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3773                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3775  0430 ca5308        	or	a,21256
3776  0433 c75308        	ld	21256,a
3777                     ; 1458 }
3780  0436 81            	ret
3919                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3919                     ; 1474 {
3920                     	switch	.text
3921  0437               _TIM5_GetFlagStatus:
3923  0437 89            	pushw	x
3924  0438 89            	pushw	x
3925       00000002      OFST:	set	2
3928                     ; 1475   FlagStatus bitstatus = RESET;
3930                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3934                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3936                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3938  0439 9f            	ld	a,xl
3939  043a c45306        	and	a,21254
3940  043d 6b01          	ld	(OFST-1,sp),a
3942                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3944  043f c65307        	ld	a,21255
3945  0442 1403          	and	a,(OFST+1,sp)
3946  0444 6b02          	ld	(OFST+0,sp),a
3948                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3950  0446 7b01          	ld	a,(OFST-1,sp)
3951  0448 1a02          	or	a,(OFST+0,sp)
3952  044a 2706          	jreq	L7502
3953                     ; 1486     bitstatus = SET;
3955  044c a601          	ld	a,#1
3956  044e 6b02          	ld	(OFST+0,sp),a
3959  0450 2002          	jra	L1602
3960  0452               L7502:
3961                     ; 1490     bitstatus = RESET;
3963  0452 0f02          	clr	(OFST+0,sp)
3965  0454               L1602:
3966                     ; 1492   return ((FlagStatus)bitstatus);
3968  0454 7b02          	ld	a,(OFST+0,sp)
3971  0456 5b04          	addw	sp,#4
3972  0458 81            	ret
4007                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
4007                     ; 1507 {
4008                     	switch	.text
4009  0459               _TIM5_ClearFlag:
4011  0459 89            	pushw	x
4012       00000000      OFST:	set	0
4015                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
4017                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
4019  045a 9f            	ld	a,xl
4020  045b 43            	cpl	a
4021  045c c75306        	ld	21254,a
4022                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
4024  045f 7b01          	ld	a,(OFST+1,sp)
4025  0461 43            	cpl	a
4026  0462 c75307        	ld	21255,a
4027                     ; 1513 }
4030  0465 85            	popw	x
4031  0466 81            	ret
4095                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
4095                     ; 1527 {
4096                     	switch	.text
4097  0467               _TIM5_GetITStatus:
4099  0467 88            	push	a
4100  0468 89            	pushw	x
4101       00000002      OFST:	set	2
4104                     ; 1528   ITStatus bitstatus = RESET;
4106                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4110                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4112                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4114  0469 c45306        	and	a,21254
4115  046c 6b01          	ld	(OFST-1,sp),a
4117                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4119  046e c65305        	ld	a,21253
4120  0471 1403          	and	a,(OFST+1,sp)
4121  0473 6b02          	ld	(OFST+0,sp),a
4123                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4125  0475 0d01          	tnz	(OFST-1,sp)
4126  0477 270a          	jreq	L3312
4128  0479 0d02          	tnz	(OFST+0,sp)
4129  047b 2706          	jreq	L3312
4130                     ; 1541     bitstatus = (ITStatus)SET;
4132  047d a601          	ld	a,#1
4133  047f 6b02          	ld	(OFST+0,sp),a
4136  0481 2002          	jra	L5312
4137  0483               L3312:
4138                     ; 1545     bitstatus = (ITStatus)RESET;
4140  0483 0f02          	clr	(OFST+0,sp)
4142  0485               L5312:
4143                     ; 1547   return ((ITStatus)bitstatus);
4145  0485 7b02          	ld	a,(OFST+0,sp)
4148  0487 5b03          	addw	sp,#3
4149  0489 81            	ret
4185                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4185                     ; 1562 {
4186                     	switch	.text
4187  048a               _TIM5_ClearITPendingBit:
4191                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4193                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4195  048a 43            	cpl	a
4196  048b c75306        	ld	21254,a
4197                     ; 1568 }
4200  048e 81            	ret
4273                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4273                     ; 1582 {
4274                     	switch	.text
4275  048f               _TIM5_DMACmd:
4277  048f 89            	pushw	x
4278       00000000      OFST:	set	0
4281                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4283                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4285                     ; 1587   if (NewState != DISABLE)
4287  0490 9f            	ld	a,xl
4288  0491 4d            	tnz	a
4289  0492 2709          	jreq	L1122
4290                     ; 1590     TIM5->DER |= TIM5_DMASource;
4292  0494 9e            	ld	a,xh
4293  0495 ca5304        	or	a,21252
4294  0498 c75304        	ld	21252,a
4296  049b 2009          	jra	L3122
4297  049d               L1122:
4298                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4300  049d 7b01          	ld	a,(OFST+1,sp)
4301  049f 43            	cpl	a
4302  04a0 c45304        	and	a,21252
4303  04a3 c75304        	ld	21252,a
4304  04a6               L3122:
4305                     ; 1597 }
4308  04a6 85            	popw	x
4309  04a7 81            	ret
4344                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4344                     ; 1606 {
4345                     	switch	.text
4346  04a8               _TIM5_SelectCCDMA:
4350                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4352                     ; 1610   if (NewState != DISABLE)
4354  04a8 4d            	tnz	a
4355  04a9 2706          	jreq	L3322
4356                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4358  04ab 72165301      	bset	21249,#3
4360  04af 2004          	jra	L5322
4361  04b1               L3322:
4362                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4364  04b1 72175301      	bres	21249,#3
4365  04b5               L5322:
4366                     ; 1620 }
4369  04b5 81            	ret
4393                     ; 1644 void TIM5_InternalClockConfig(void)
4393                     ; 1645 {
4394                     	switch	.text
4395  04b6               _TIM5_InternalClockConfig:
4399                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4401  04b6 c65302        	ld	a,21250
4402  04b9 a4f8          	and	a,#248
4403  04bb c75302        	ld	21250,a
4404                     ; 1648 }
4407  04be 81            	ret
4496                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4496                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4496                     ; 1667                                  uint8_t ICFilter)
4496                     ; 1668 {
4497                     	switch	.text
4498  04bf               _TIM5_TIxExternalClockConfig:
4500  04bf 89            	pushw	x
4501       00000000      OFST:	set	0
4504                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4506                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4508                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4510                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4512  04c0 9e            	ld	a,xh
4513  04c1 a160          	cp	a,#96
4514  04c3 260e          	jrne	L7032
4515                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4517  04c5 7b05          	ld	a,(OFST+5,sp)
4518  04c7 88            	push	a
4519  04c8 9f            	ld	a,xl
4520  04c9 ae0001        	ldw	x,#1
4521  04cc 95            	ld	xh,a
4522  04cd cd064a        	call	L5_TI2_Config
4524  04d0 84            	pop	a
4526  04d1 200d          	jra	L1132
4527  04d3               L7032:
4528                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4530  04d3 7b05          	ld	a,(OFST+5,sp)
4531  04d5 88            	push	a
4532  04d6 7b03          	ld	a,(OFST+3,sp)
4533  04d8 ae0001        	ldw	x,#1
4534  04db 95            	ld	xh,a
4535  04dc cd060d        	call	L3_TI1_Config
4537  04df 84            	pop	a
4538  04e0               L1132:
4539                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4541  04e0 7b01          	ld	a,(OFST+1,sp)
4542  04e2 ad4b          	call	_TIM5_SelectInputTrigger
4544                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4546  04e4 c65302        	ld	a,21250
4547  04e7 aa07          	or	a,#7
4548  04e9 c75302        	ld	21250,a
4549                     ; 1689 }
4552  04ec 85            	popw	x
4553  04ed 81            	ret
4670                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4670                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4670                     ; 1709                               uint8_t ExtTRGFilter)
4670                     ; 1710 {
4671                     	switch	.text
4672  04ee               _TIM5_ETRClockMode1Config:
4674  04ee 89            	pushw	x
4675       00000000      OFST:	set	0
4678                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4680  04ef 7b05          	ld	a,(OFST+5,sp)
4681  04f1 88            	push	a
4682  04f2 9f            	ld	a,xl
4683  04f3 97            	ld	xl,a
4684  04f4 7b02          	ld	a,(OFST+2,sp)
4685  04f6 95            	ld	xh,a
4686  04f7 cd058b        	call	_TIM5_ETRConfig
4688  04fa 84            	pop	a
4689                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4691  04fb c65302        	ld	a,21250
4692  04fe a4f8          	and	a,#248
4693  0500 c75302        	ld	21250,a
4694                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4696  0503 c65302        	ld	a,21250
4697  0506 aa07          	or	a,#7
4698  0508 c75302        	ld	21250,a
4699                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4701  050b c65302        	ld	a,21250
4702  050e a48f          	and	a,#143
4703  0510 c75302        	ld	21250,a
4704                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4706  0513 c65302        	ld	a,21250
4707  0516 aa70          	or	a,#112
4708  0518 c75302        	ld	21250,a
4709                     ; 1721 }
4712  051b 85            	popw	x
4713  051c 81            	ret
4771                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4771                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4771                     ; 1741                               uint8_t ExtTRGFilter)
4771                     ; 1742 {
4772                     	switch	.text
4773  051d               _TIM5_ETRClockMode2Config:
4775  051d 89            	pushw	x
4776       00000000      OFST:	set	0
4779                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4781  051e 7b05          	ld	a,(OFST+5,sp)
4782  0520 88            	push	a
4783  0521 9f            	ld	a,xl
4784  0522 97            	ld	xl,a
4785  0523 7b02          	ld	a,(OFST+2,sp)
4786  0525 95            	ld	xh,a
4787  0526 ad63          	call	_TIM5_ETRConfig
4789  0528 84            	pop	a
4790                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4792  0529 721c5303      	bset	21251,#6
4793                     ; 1748 }
4796  052d 85            	popw	x
4797  052e 81            	ret
4913                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4913                     ; 1800 {
4914                     	switch	.text
4915  052f               _TIM5_SelectInputTrigger:
4917  052f 88            	push	a
4918  0530 88            	push	a
4919       00000001      OFST:	set	1
4922                     ; 1801   uint8_t tmpsmcr = 0;
4924                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4926                     ; 1806   tmpsmcr = TIM5->SMCR;
4928  0531 c65302        	ld	a,21250
4929  0534 6b01          	ld	(OFST+0,sp),a
4931                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4933  0536 7b01          	ld	a,(OFST+0,sp)
4934  0538 a48f          	and	a,#143
4935  053a 6b01          	ld	(OFST+0,sp),a
4937                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4939  053c 7b01          	ld	a,(OFST+0,sp)
4940  053e 1a02          	or	a,(OFST+1,sp)
4941  0540 6b01          	ld	(OFST+0,sp),a
4943                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4945  0542 7b01          	ld	a,(OFST+0,sp)
4946  0544 c75302        	ld	21250,a
4947                     ; 1813 }
4950  0547 85            	popw	x
4951  0548 81            	ret
5050                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
5050                     ; 1828 {
5051                     	switch	.text
5052  0549               _TIM5_SelectOutputTrigger:
5054  0549 88            	push	a
5055  054a 88            	push	a
5056       00000001      OFST:	set	1
5059                     ; 1829   uint8_t tmpcr2 = 0;
5061                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
5063                     ; 1834   tmpcr2 = TIM5->CR2;
5065  054b c65301        	ld	a,21249
5066  054e 6b01          	ld	(OFST+0,sp),a
5068                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
5070  0550 7b01          	ld	a,(OFST+0,sp)
5071  0552 a48f          	and	a,#143
5072  0554 6b01          	ld	(OFST+0,sp),a
5074                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
5076  0556 7b01          	ld	a,(OFST+0,sp)
5077  0558 1a02          	or	a,(OFST+1,sp)
5078  055a 6b01          	ld	(OFST+0,sp),a
5080                     ; 1842   TIM5->CR2 = tmpcr2;
5082  055c 7b01          	ld	a,(OFST+0,sp)
5083  055e c75301        	ld	21249,a
5084                     ; 1843 }
5087  0561 85            	popw	x
5088  0562 81            	ret
5171                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5171                     ; 1856 {
5172                     	switch	.text
5173  0563               _TIM5_SelectSlaveMode:
5175  0563 88            	push	a
5176  0564 88            	push	a
5177       00000001      OFST:	set	1
5180                     ; 1857   uint8_t tmpsmcr = 0;
5182                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5184                     ; 1862   tmpsmcr = TIM5->SMCR;
5186  0565 c65302        	ld	a,21250
5187  0568 6b01          	ld	(OFST+0,sp),a
5189                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5191  056a 7b01          	ld	a,(OFST+0,sp)
5192  056c a4f8          	and	a,#248
5193  056e 6b01          	ld	(OFST+0,sp),a
5195                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5197  0570 7b01          	ld	a,(OFST+0,sp)
5198  0572 1a02          	or	a,(OFST+1,sp)
5199  0574 6b01          	ld	(OFST+0,sp),a
5201                     ; 1870   TIM5->SMCR = tmpsmcr;
5203  0576 7b01          	ld	a,(OFST+0,sp)
5204  0578 c75302        	ld	21250,a
5205                     ; 1871 }
5208  057b 85            	popw	x
5209  057c 81            	ret
5245                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5245                     ; 1880 {
5246                     	switch	.text
5247  057d               _TIM5_SelectMasterSlaveMode:
5251                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5253                     ; 1885   if (NewState != DISABLE)
5255  057d 4d            	tnz	a
5256  057e 2706          	jreq	L7752
5257                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5259  0580 721e5302      	bset	21250,#7
5261  0584 2004          	jra	L1062
5262  0586               L7752:
5263                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5265  0586 721f5302      	bres	21250,#7
5266  058a               L1062:
5267                     ; 1893 }
5270  058a 81            	ret
5326                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5326                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5326                     ; 1913                     uint8_t ExtTRGFilter)
5326                     ; 1914 {
5327                     	switch	.text
5328  058b               _TIM5_ETRConfig:
5330  058b 89            	pushw	x
5331       00000000      OFST:	set	0
5334                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5336                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5338                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5340                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5340                     ; 1922                          | (uint8_t)ExtTRGFilter);
5342  058c 9f            	ld	a,xl
5343  058d 1a01          	or	a,(OFST+1,sp)
5344  058f 1a05          	or	a,(OFST+5,sp)
5345  0591 ca5303        	or	a,21251
5346  0594 c75303        	ld	21251,a
5347                     ; 1923 }
5350  0597 85            	popw	x
5351  0598 81            	ret
5464                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5464                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5464                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5464                     ; 1961 {
5465                     	switch	.text
5466  0599               _TIM5_EncoderInterfaceConfig:
5468  0599 89            	pushw	x
5469  059a 5203          	subw	sp,#3
5470       00000003      OFST:	set	3
5473                     ; 1962   uint8_t tmpsmcr = 0;
5475                     ; 1963   uint8_t tmpccmr1 = 0;
5477                     ; 1964   uint8_t tmpccmr2 = 0;
5479                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5481                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5483                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5485                     ; 1971   tmpsmcr = TIM5->SMCR;
5487  059c c65302        	ld	a,21250
5488  059f 6b01          	ld	(OFST-2,sp),a
5490                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5492  05a1 c65309        	ld	a,21257
5493  05a4 6b02          	ld	(OFST-1,sp),a
5495                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5497  05a6 c6530a        	ld	a,21258
5498  05a9 6b03          	ld	(OFST+0,sp),a
5500                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5502  05ab 7b01          	ld	a,(OFST-2,sp)
5503  05ad a4f0          	and	a,#240
5504  05af 6b01          	ld	(OFST-2,sp),a
5506                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5508  05b1 9e            	ld	a,xh
5509  05b2 1a01          	or	a,(OFST-2,sp)
5510  05b4 6b01          	ld	(OFST-2,sp),a
5512                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5514  05b6 7b02          	ld	a,(OFST-1,sp)
5515  05b8 a4fc          	and	a,#252
5516  05ba 6b02          	ld	(OFST-1,sp),a
5518                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5520  05bc 7b03          	ld	a,(OFST+0,sp)
5521  05be a4fc          	and	a,#252
5522  05c0 6b03          	ld	(OFST+0,sp),a
5524                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5526  05c2 7b02          	ld	a,(OFST-1,sp)
5527  05c4 aa01          	or	a,#1
5528  05c6 6b02          	ld	(OFST-1,sp),a
5530                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5532  05c8 7b03          	ld	a,(OFST+0,sp)
5533  05ca aa01          	or	a,#1
5534  05cc 6b03          	ld	(OFST+0,sp),a
5536                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5538  05ce 9f            	ld	a,xl
5539  05cf a101          	cp	a,#1
5540  05d1 2606          	jrne	L5072
5541                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5543  05d3 7212530b      	bset	21259,#1
5545  05d7 2004          	jra	L7072
5546  05d9               L5072:
5547                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5549  05d9 7213530b      	bres	21259,#1
5550  05dd               L7072:
5551                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5553  05dd 7b08          	ld	a,(OFST+5,sp)
5554  05df a101          	cp	a,#1
5555  05e1 2606          	jrne	L1172
5556                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5558  05e3 721a530b      	bset	21259,#5
5560  05e7 2004          	jra	L3172
5561  05e9               L1172:
5562                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5564  05e9 721b530b      	bres	21259,#5
5565  05ed               L3172:
5566                     ; 2004   TIM5->SMCR = tmpsmcr;
5568  05ed 7b01          	ld	a,(OFST-2,sp)
5569  05ef c75302        	ld	21250,a
5570                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5572  05f2 7b02          	ld	a,(OFST-1,sp)
5573  05f4 c75309        	ld	21257,a
5574                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5576  05f7 7b03          	ld	a,(OFST+0,sp)
5577  05f9 c7530a        	ld	21258,a
5578                     ; 2007 }
5581  05fc 5b05          	addw	sp,#5
5582  05fe 81            	ret
5618                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5618                     ; 2016 {
5619                     	switch	.text
5620  05ff               _TIM5_SelectHallSensor:
5624                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5626                     ; 2021   if (NewState != DISABLE)
5628  05ff 4d            	tnz	a
5629  0600 2706          	jreq	L3372
5630                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5632  0602 721e5301      	bset	21249,#7
5634  0606 2004          	jra	L5372
5635  0608               L3372:
5636                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5638  0608 721f5301      	bres	21249,#7
5639  060c               L5372:
5640                     ; 2029 }
5643  060c 81            	ret
5715                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5715                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5715                     ; 2052                        uint8_t TIM5_ICFilter)
5715                     ; 2053 {
5716                     	switch	.text
5717  060d               L3_TI1_Config:
5719  060d 89            	pushw	x
5720  060e 89            	pushw	x
5721       00000002      OFST:	set	2
5724                     ; 2054   uint8_t tmpccmr1 = 0;
5726                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5728  060f 9e            	ld	a,xh
5729  0610 6b01          	ld	(OFST-1,sp),a
5731                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5733  0612 c65309        	ld	a,21257
5734  0615 6b02          	ld	(OFST+0,sp),a
5736                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5738                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5740                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5742                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5744  0617 7211530b      	bres	21259,#0
5745                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5747  061b 7b02          	ld	a,(OFST+0,sp)
5748  061d a40c          	and	a,#12
5749  061f 6b02          	ld	(OFST+0,sp),a
5751                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5753  0621 7b07          	ld	a,(OFST+5,sp)
5754  0623 97            	ld	xl,a
5755  0624 a610          	ld	a,#16
5756  0626 42            	mul	x,a
5757  0627 9f            	ld	a,xl
5758  0628 1a04          	or	a,(OFST+2,sp)
5759  062a 1a02          	or	a,(OFST+0,sp)
5760  062c 6b02          	ld	(OFST+0,sp),a
5762                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5764  062e 7b02          	ld	a,(OFST+0,sp)
5765  0630 c75309        	ld	21257,a
5766                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5768  0633 7b01          	ld	a,(OFST-1,sp)
5769  0635 a101          	cp	a,#1
5770  0637 2606          	jrne	L5772
5771                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5773  0639 7212530b      	bset	21259,#1
5775  063d 2004          	jra	L7772
5776  063f               L5772:
5777                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5779  063f 7213530b      	bres	21259,#1
5780  0643               L7772:
5781                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5783  0643 7210530b      	bset	21259,#0
5784                     ; 2084 }
5787  0647 5b04          	addw	sp,#4
5788  0649 81            	ret
5860                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5860                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5860                     ; 2103                        uint8_t TIM5_ICFilter)
5860                     ; 2104 {
5861                     	switch	.text
5862  064a               L5_TI2_Config:
5864  064a 89            	pushw	x
5865  064b 89            	pushw	x
5866       00000002      OFST:	set	2
5869                     ; 2105   uint8_t tmpccmr2 = 0;
5871                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5873  064c 9e            	ld	a,xh
5874  064d 6b01          	ld	(OFST-1,sp),a
5876                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5878                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5880                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5882                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5884  064f c6530a        	ld	a,21258
5885  0652 6b02          	ld	(OFST+0,sp),a
5887                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5889  0654 7219530b      	bres	21259,#4
5890                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5892  0658 7b02          	ld	a,(OFST+0,sp)
5893  065a a40c          	and	a,#12
5894  065c 6b02          	ld	(OFST+0,sp),a
5896                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5898  065e 7b07          	ld	a,(OFST+5,sp)
5899  0660 97            	ld	xl,a
5900  0661 a610          	ld	a,#16
5901  0663 42            	mul	x,a
5902  0664 9f            	ld	a,xl
5903  0665 1a04          	or	a,(OFST+2,sp)
5904  0667 1a02          	or	a,(OFST+0,sp)
5905  0669 6b02          	ld	(OFST+0,sp),a
5907                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5909  066b 7b02          	ld	a,(OFST+0,sp)
5910  066d c7530a        	ld	21258,a
5911                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5913  0670 7b01          	ld	a,(OFST-1,sp)
5914  0672 a101          	cp	a,#1
5915  0674 2606          	jrne	L7303
5916                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5918  0676 721a530b      	bset	21259,#5
5920  067a 2004          	jra	L1403
5921  067c               L7303:
5922                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5924  067c 721b530b      	bres	21259,#5
5925  0680               L1403:
5926                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5928  0680 7218530b      	bset	21259,#4
5929                     ; 2136 }
5932  0684 5b04          	addw	sp,#4
5933  0686 81            	ret
5946                     	xdef	_TIM5_SelectHallSensor
5947                     	xdef	_TIM5_EncoderInterfaceConfig
5948                     	xdef	_TIM5_ETRConfig
5949                     	xdef	_TIM5_SelectMasterSlaveMode
5950                     	xdef	_TIM5_SelectSlaveMode
5951                     	xdef	_TIM5_SelectOutputTrigger
5952                     	xdef	_TIM5_SelectInputTrigger
5953                     	xdef	_TIM5_ETRClockMode2Config
5954                     	xdef	_TIM5_ETRClockMode1Config
5955                     	xdef	_TIM5_TIxExternalClockConfig
5956                     	xdef	_TIM5_InternalClockConfig
5957                     	xdef	_TIM5_SelectCCDMA
5958                     	xdef	_TIM5_DMACmd
5959                     	xdef	_TIM5_ClearITPendingBit
5960                     	xdef	_TIM5_GetITStatus
5961                     	xdef	_TIM5_ClearFlag
5962                     	xdef	_TIM5_GetFlagStatus
5963                     	xdef	_TIM5_GenerateEvent
5964                     	xdef	_TIM5_ITConfig
5965                     	xdef	_TIM5_SetIC2Prescaler
5966                     	xdef	_TIM5_SetIC1Prescaler
5967                     	xdef	_TIM5_GetCapture2
5968                     	xdef	_TIM5_GetCapture1
5969                     	xdef	_TIM5_PWMIConfig
5970                     	xdef	_TIM5_ICInit
5971                     	xdef	_TIM5_CCxCmd
5972                     	xdef	_TIM5_OC2PolarityConfig
5973                     	xdef	_TIM5_OC1PolarityConfig
5974                     	xdef	_TIM5_OC2FastConfig
5975                     	xdef	_TIM5_OC1FastConfig
5976                     	xdef	_TIM5_OC2PreloadConfig
5977                     	xdef	_TIM5_OC1PreloadConfig
5978                     	xdef	_TIM5_ForcedOC2Config
5979                     	xdef	_TIM5_ForcedOC1Config
5980                     	xdef	_TIM5_SetCompare2
5981                     	xdef	_TIM5_SetCompare1
5982                     	xdef	_TIM5_SelectOCxM
5983                     	xdef	_TIM5_CtrlPWMOutputs
5984                     	xdef	_TIM5_BKRConfig
5985                     	xdef	_TIM5_OC2Init
5986                     	xdef	_TIM5_OC1Init
5987                     	xdef	_TIM5_Cmd
5988                     	xdef	_TIM5_SelectOnePulseMode
5989                     	xdef	_TIM5_ARRPreloadConfig
5990                     	xdef	_TIM5_UpdateRequestConfig
5991                     	xdef	_TIM5_UpdateDisableConfig
5992                     	xdef	_TIM5_GetPrescaler
5993                     	xdef	_TIM5_GetCounter
5994                     	xdef	_TIM5_SetAutoreload
5995                     	xdef	_TIM5_SetCounter
5996                     	xdef	_TIM5_CounterModeConfig
5997                     	xdef	_TIM5_PrescalerConfig
5998                     	xdef	_TIM5_TimeBaseInit
5999                     	xdef	_TIM5_DeInit
6018                     	end
