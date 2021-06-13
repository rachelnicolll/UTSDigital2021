   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 181 void TIM1_DeInit(void)
  41                     ; 182 {
  43                     	switch	.text
  44  0000               _TIM1_DeInit:
  48                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  50  0000 725f52b0      	clr	21168
  51                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  53  0004 725f52b1      	clr	21169
  54                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  56  0008 725f52b2      	clr	21170
  57                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  59  000c 725f52b3      	clr	21171
  60                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  62  0010 725f52b5      	clr	21173
  63                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  65  0014 725f52bd      	clr	21181
  66                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  68  0018 725f52be      	clr	21182
  69                     ; 193   TIM1->CCMR1 = 0x01;
  71  001c 350152b9      	mov	21177,#1
  72                     ; 194   TIM1->CCMR2 = 0x01;
  74  0020 350152ba      	mov	21178,#1
  75                     ; 195   TIM1->CCMR3 = 0x01;
  77  0024 350152bb      	mov	21179,#1
  78                     ; 196   TIM1->CCMR4 = 0x01;
  80  0028 350152bc      	mov	21180,#1
  81                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  83  002c 725f52bd      	clr	21181
  84                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  86  0030 725f52be      	clr	21182
  87                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  89  0034 725f52b9      	clr	21177
  90                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  92  0038 725f52ba      	clr	21178
  93                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  95  003c 725f52bb      	clr	21179
  96                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  98  0040 725f52bc      	clr	21180
  99                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 101  0044 725f52bf      	clr	21183
 102                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 104  0048 725f52c0      	clr	21184
 105                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 107  004c 725f52c1      	clr	21185
 108                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 110  0050 725f52c2      	clr	21186
 111                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 113  0054 35ff52c3      	mov	21187,#255
 114                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 116  0058 35ff52c4      	mov	21188,#255
 117                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 119  005c 725f52c6      	clr	21190
 120                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 122  0060 725f52c7      	clr	21191
 123                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 125  0064 725f52c8      	clr	21192
 126                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 128  0068 725f52c9      	clr	21193
 129                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 131  006c 725f52ca      	clr	21194
 132                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 134  0070 725f52cb      	clr	21195
 135                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 137  0074 725f52cc      	clr	21196
 138                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 140  0078 725f52cd      	clr	21197
 141                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 143  007c 725f52d0      	clr	21200
 144                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 146  0080 350152b8      	mov	21176,#1
 147                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 149  0084 725f52cf      	clr	21199
 150                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 152  0088 725f52ce      	clr	21198
 153                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 155  008c 725f52c5      	clr	21189
 156                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 158  0090 725f52b6      	clr	21174
 159                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 161  0094 725f52b7      	clr	21175
 162                     ; 225 }
 165  0098 81            	ret
 274                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 274                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 274                     ; 243                        uint16_t TIM1_Period,
 274                     ; 244                        uint8_t TIM1_RepetitionCounter)
 274                     ; 245 {
 275                     	switch	.text
 276  0099               _TIM1_TimeBaseInit:
 278  0099 89            	pushw	x
 279       00000000      OFST:	set	0
 282                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 284                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 286  009a 7b06          	ld	a,(OFST+6,sp)
 287  009c c752c3        	ld	21187,a
 288                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 290  009f 7b07          	ld	a,(OFST+7,sp)
 291  00a1 c752c4        	ld	21188,a
 292                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 294  00a4 9e            	ld	a,xh
 295  00a5 c752c1        	ld	21185,a
 296                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 298  00a8 9f            	ld	a,xl
 299  00a9 c752c2        	ld	21186,a
 300                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 300                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 302  00ac c652b0        	ld	a,21168
 303  00af a48f          	and	a,#143
 304  00b1 1a05          	or	a,(OFST+5,sp)
 305  00b3 c752b0        	ld	21168,a
 306                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 308  00b6 7b08          	ld	a,(OFST+8,sp)
 309  00b8 c752c5        	ld	21189,a
 310                     ; 265 }
 313  00bb 85            	popw	x
 314  00bc 81            	ret
 381                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 381                     ; 280 {
 382                     	switch	.text
 383  00bd               _TIM1_PrescalerConfig:
 385  00bd 89            	pushw	x
 386       00000000      OFST:	set	0
 389                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 391                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 393  00be 9e            	ld	a,xh
 394  00bf c752c1        	ld	21185,a
 395                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 397  00c2 9f            	ld	a,xl
 398  00c3 c752c2        	ld	21186,a
 399                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 401  00c6 7b05          	ld	a,(OFST+5,sp)
 402  00c8 c752b8        	ld	21176,a
 403                     ; 290 }
 406  00cb 85            	popw	x
 407  00cc 81            	ret
 443                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 443                     ; 304 {
 444                     	switch	.text
 445  00cd               _TIM1_CounterModeConfig:
 447  00cd 88            	push	a
 448       00000000      OFST:	set	0
 451                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 453                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 453                     ; 311                         | (uint8_t)TIM1_CounterMode);
 455  00ce c652b0        	ld	a,21168
 456  00d1 a48f          	and	a,#143
 457  00d3 1a01          	or	a,(OFST+1,sp)
 458  00d5 c752b0        	ld	21168,a
 459                     ; 312 }
 462  00d8 84            	pop	a
 463  00d9 81            	ret
 497                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 497                     ; 321 {
 498                     	switch	.text
 499  00da               _TIM1_SetCounter:
 503                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 505  00da 9e            	ld	a,xh
 506  00db c752bf        	ld	21183,a
 507                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 509  00de 9f            	ld	a,xl
 510  00df c752c0        	ld	21184,a
 511                     ; 325 }
 514  00e2 81            	ret
 548                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 548                     ; 334 {
 549                     	switch	.text
 550  00e3               _TIM1_SetAutoreload:
 554                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 556  00e3 9e            	ld	a,xh
 557  00e4 c752c3        	ld	21187,a
 558                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 560  00e7 9f            	ld	a,xl
 561  00e8 c752c4        	ld	21188,a
 562                     ; 338 }
 565  00eb 81            	ret
 617                     ; 345 uint16_t TIM1_GetCounter(void)
 617                     ; 346 {
 618                     	switch	.text
 619  00ec               _TIM1_GetCounter:
 621  00ec 5204          	subw	sp,#4
 622       00000004      OFST:	set	4
 625                     ; 348   uint16_t tmpcntr = 0;
 627                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 631                     ; 351   tmpcntrh = TIM1->CNTRH;
 633  00ee c652bf        	ld	a,21183
 634  00f1 6b02          	ld	(OFST-2,sp),a
 636                     ; 352   tmpcntrl = TIM1->CNTRL;
 638  00f3 c652c0        	ld	a,21184
 639  00f6 6b01          	ld	(OFST-3,sp),a
 641                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 643  00f8 7b01          	ld	a,(OFST-3,sp)
 644  00fa 5f            	clrw	x
 645  00fb 97            	ld	xl,a
 646  00fc 1f03          	ldw	(OFST-1,sp),x
 648                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 650  00fe 7b02          	ld	a,(OFST-2,sp)
 651  0100 5f            	clrw	x
 652  0101 97            	ld	xl,a
 653  0102 4f            	clr	a
 654  0103 02            	rlwa	x,a
 655  0104 01            	rrwa	x,a
 656  0105 1a04          	or	a,(OFST+0,sp)
 657  0107 01            	rrwa	x,a
 658  0108 1a03          	or	a,(OFST-1,sp)
 659  010a 01            	rrwa	x,a
 660  010b 1f03          	ldw	(OFST-1,sp),x
 662                     ; 358   return (uint16_t)tmpcntr;
 664  010d 1e03          	ldw	x,(OFST-1,sp)
 667  010f 5b04          	addw	sp,#4
 668  0111 81            	ret
 702                     ; 366 uint16_t TIM1_GetPrescaler(void)
 702                     ; 367 {
 703                     	switch	.text
 704  0112               _TIM1_GetPrescaler:
 706  0112 89            	pushw	x
 707       00000002      OFST:	set	2
 710                     ; 368   uint16_t tmpreg = 0;
 712                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 714  0113 c652c1        	ld	a,21185
 715  0116 5f            	clrw	x
 716  0117 97            	ld	xl,a
 717  0118 4f            	clr	a
 718  0119 02            	rlwa	x,a
 719  011a 1f01          	ldw	(OFST-1,sp),x
 721                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 723  011c c652c2        	ld	a,21186
 724  011f 5f            	clrw	x
 725  0120 97            	ld	xl,a
 726  0121 01            	rrwa	x,a
 727  0122 1a02          	or	a,(OFST+0,sp)
 728  0124 01            	rrwa	x,a
 729  0125 1a01          	or	a,(OFST-1,sp)
 730  0127 01            	rrwa	x,a
 733  0128 5b02          	addw	sp,#2
 734  012a 81            	ret
 790                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 790                     ; 381 {
 791                     	switch	.text
 792  012b               _TIM1_UpdateDisableConfig:
 796                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 798                     ; 386   if (NewState != DISABLE)
 800  012b 4d            	tnz	a
 801  012c 2706          	jreq	L772
 802                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 804  012e 721252b0      	bset	21168,#1
 806  0132 2004          	jra	L103
 807  0134               L772:
 808                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 810  0134 721352b0      	bres	21168,#1
 811  0138               L103:
 812                     ; 394 }
 815  0138 81            	ret
 873                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 873                     ; 405 {
 874                     	switch	.text
 875  0139               _TIM1_UpdateRequestConfig:
 879                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 881                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 883  0139 4d            	tnz	a
 884  013a 2706          	jreq	L133
 885                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 887  013c 721452b0      	bset	21168,#2
 889  0140 2004          	jra	L333
 890  0142               L133:
 891                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 893  0142 721552b0      	bres	21168,#2
 894  0146               L333:
 895                     ; 418 }
 898  0146 81            	ret
 934                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 934                     ; 427 {
 935                     	switch	.text
 936  0147               _TIM1_ARRPreloadConfig:
 940                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 942                     ; 432   if (NewState != DISABLE)
 944  0147 4d            	tnz	a
 945  0148 2706          	jreq	L353
 946                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 948  014a 721e52b0      	bset	21168,#7
 950  014e 2004          	jra	L553
 951  0150               L353:
 952                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 954  0150 721f52b0      	bres	21168,#7
 955  0154               L553:
 956                     ; 440 }
 959  0154 81            	ret
1016                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1016                     ; 451 {
1017                     	switch	.text
1018  0155               _TIM1_SelectOnePulseMode:
1022                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1024                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1026  0155 4d            	tnz	a
1027  0156 2706          	jreq	L504
1028                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1030  0158 721652b0      	bset	21168,#3
1032  015c 2004          	jra	L704
1033  015e               L504:
1034                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1036  015e 721752b0      	bres	21168,#3
1037  0162               L704:
1038                     ; 464 }
1041  0162 81            	ret
1076                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1076                     ; 473 {
1077                     	switch	.text
1078  0163               _TIM1_Cmd:
1082                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1084                     ; 478   if (NewState != DISABLE)
1086  0163 4d            	tnz	a
1087  0164 2706          	jreq	L724
1088                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1090  0166 721052b0      	bset	21168,#0
1092  016a 2004          	jra	L134
1093  016c               L724:
1094                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1096  016c 721152b0      	bres	21168,#0
1097  0170               L134:
1098                     ; 486 }
1101  0170 81            	ret
1386                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1386                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1386                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1386                     ; 580                   uint16_t TIM1_Pulse,
1386                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1386                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1386                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1386                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1386                     ; 585 {
1387                     	switch	.text
1388  0171               _TIM1_OC1Init:
1390  0171 89            	pushw	x
1391  0172 5203          	subw	sp,#3
1392       00000003      OFST:	set	3
1395                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1397                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1399                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1401                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1403                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1405                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1407                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1409                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1409                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1411  0174 c652bd        	ld	a,21181
1412  0177 a4f0          	and	a,#240
1413  0179 c752bd        	ld	21181,a
1414                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1414                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1414                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1414                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1416  017c 7b0c          	ld	a,(OFST+9,sp)
1417  017e a408          	and	a,#8
1418  0180 6b03          	ld	(OFST+0,sp),a
1420  0182 7b0b          	ld	a,(OFST+8,sp)
1421  0184 a402          	and	a,#2
1422  0186 1a03          	or	a,(OFST+0,sp)
1423  0188 6b02          	ld	(OFST-1,sp),a
1425  018a 7b08          	ld	a,(OFST+5,sp)
1426  018c a404          	and	a,#4
1427  018e 6b01          	ld	(OFST-2,sp),a
1429  0190 9f            	ld	a,xl
1430  0191 a401          	and	a,#1
1431  0193 1a01          	or	a,(OFST-2,sp)
1432  0195 1a02          	or	a,(OFST-1,sp)
1433  0197 ca52bd        	or	a,21181
1434  019a c752bd        	ld	21181,a
1435                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1435                     ; 608                           | (uint8_t)TIM1_OCMode);
1437  019d c652b9        	ld	a,21177
1438  01a0 a48f          	and	a,#143
1439  01a2 1a04          	or	a,(OFST+1,sp)
1440  01a4 c752b9        	ld	21177,a
1441                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1443  01a7 c652d0        	ld	a,21200
1444  01aa a4fc          	and	a,#252
1445  01ac c752d0        	ld	21200,a
1446                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1446                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1448  01af 7b0e          	ld	a,(OFST+11,sp)
1449  01b1 a402          	and	a,#2
1450  01b3 6b03          	ld	(OFST+0,sp),a
1452  01b5 7b0d          	ld	a,(OFST+10,sp)
1453  01b7 a401          	and	a,#1
1454  01b9 1a03          	or	a,(OFST+0,sp)
1455  01bb ca52d0        	or	a,21200
1456  01be c752d0        	ld	21200,a
1457                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1459  01c1 7b09          	ld	a,(OFST+6,sp)
1460  01c3 c752c6        	ld	21190,a
1461                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1463  01c6 7b0a          	ld	a,(OFST+7,sp)
1464  01c8 c752c7        	ld	21191,a
1465                     ; 619 }
1468  01cb 5b05          	addw	sp,#5
1469  01cd 81            	ret
1573                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1573                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1573                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1573                     ; 661                   uint16_t TIM1_Pulse,
1573                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1573                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1573                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1573                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1573                     ; 666 {
1574                     	switch	.text
1575  01ce               _TIM1_OC2Init:
1577  01ce 89            	pushw	x
1578  01cf 5203          	subw	sp,#3
1579       00000003      OFST:	set	3
1582                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1584                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1586                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1588                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1590                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1592                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1594                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1596                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1598  01d1 c652bd        	ld	a,21181
1599  01d4 a40f          	and	a,#15
1600  01d6 c752bd        	ld	21181,a
1601                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1601                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1603  01d9 7b0c          	ld	a,(OFST+9,sp)
1604  01db a480          	and	a,#128
1605  01dd 6b03          	ld	(OFST+0,sp),a
1607  01df 7b0b          	ld	a,(OFST+8,sp)
1608  01e1 a420          	and	a,#32
1609  01e3 1a03          	or	a,(OFST+0,sp)
1610  01e5 6b02          	ld	(OFST-1,sp),a
1612  01e7 7b08          	ld	a,(OFST+5,sp)
1613  01e9 a440          	and	a,#64
1614  01eb 6b01          	ld	(OFST-2,sp),a
1616  01ed 9f            	ld	a,xl
1617  01ee a410          	and	a,#16
1618  01f0 1a01          	or	a,(OFST-2,sp)
1619  01f2 1a02          	or	a,(OFST-1,sp)
1620  01f4 ca52bd        	or	a,21181
1621  01f7 c752bd        	ld	21181,a
1622                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1624  01fa c652ba        	ld	a,21178
1625  01fd a48f          	and	a,#143
1626  01ff 1a04          	or	a,(OFST+1,sp)
1627  0201 c752ba        	ld	21178,a
1628                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1630  0204 c652d0        	ld	a,21200
1631  0207 a4f3          	and	a,#243
1632  0209 c752d0        	ld	21200,a
1633                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1635  020c 7b0e          	ld	a,(OFST+11,sp)
1636  020e a408          	and	a,#8
1637  0210 6b03          	ld	(OFST+0,sp),a
1639  0212 7b0d          	ld	a,(OFST+10,sp)
1640  0214 a404          	and	a,#4
1641  0216 1a03          	or	a,(OFST+0,sp)
1642  0218 ca52d0        	or	a,21200
1643  021b c752d0        	ld	21200,a
1644                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1646  021e 7b09          	ld	a,(OFST+6,sp)
1647  0220 c752c8        	ld	21192,a
1648                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1650  0223 7b0a          	ld	a,(OFST+7,sp)
1651  0225 c752c9        	ld	21193,a
1652                     ; 696 }
1655  0228 5b05          	addw	sp,#5
1656  022a 81            	ret
1760                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1760                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1760                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1760                     ; 738                   uint16_t TIM1_Pulse,
1760                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1760                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1760                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1760                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1760                     ; 743 {
1761                     	switch	.text
1762  022b               _TIM1_OC3Init:
1764  022b 89            	pushw	x
1765  022c 5203          	subw	sp,#3
1766       00000003      OFST:	set	3
1769                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1771                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1773                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1775                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1777                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1779                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1781                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1783                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1785  022e c652be        	ld	a,21182
1786  0231 a4f0          	and	a,#240
1787  0233 c752be        	ld	21182,a
1788                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1788                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1790  0236 7b0c          	ld	a,(OFST+9,sp)
1791  0238 a408          	and	a,#8
1792  023a 6b03          	ld	(OFST+0,sp),a
1794  023c 7b0b          	ld	a,(OFST+8,sp)
1795  023e a402          	and	a,#2
1796  0240 1a03          	or	a,(OFST+0,sp)
1797  0242 6b02          	ld	(OFST-1,sp),a
1799  0244 7b08          	ld	a,(OFST+5,sp)
1800  0246 a404          	and	a,#4
1801  0248 6b01          	ld	(OFST-2,sp),a
1803  024a 9f            	ld	a,xl
1804  024b a401          	and	a,#1
1805  024d 1a01          	or	a,(OFST-2,sp)
1806  024f 1a02          	or	a,(OFST-1,sp)
1807  0251 ca52be        	or	a,21182
1808  0254 c752be        	ld	21182,a
1809                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1811  0257 c652bb        	ld	a,21179
1812  025a a48f          	and	a,#143
1813  025c 1a04          	or	a,(OFST+1,sp)
1814  025e c752bb        	ld	21179,a
1815                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1817  0261 c652d0        	ld	a,21200
1818  0264 a4cf          	and	a,#207
1819  0266 c752d0        	ld	21200,a
1820                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1822  0269 7b0e          	ld	a,(OFST+11,sp)
1823  026b a420          	and	a,#32
1824  026d 6b03          	ld	(OFST+0,sp),a
1826  026f 7b0d          	ld	a,(OFST+10,sp)
1827  0271 a410          	and	a,#16
1828  0273 1a03          	or	a,(OFST+0,sp)
1829  0275 ca52d0        	or	a,21200
1830  0278 c752d0        	ld	21200,a
1831                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1833  027b 7b09          	ld	a,(OFST+6,sp)
1834  027d c752ca        	ld	21194,a
1835                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1837  0280 7b0a          	ld	a,(OFST+7,sp)
1838  0282 c752cb        	ld	21195,a
1839                     ; 773 }
1842  0285 5b05          	addw	sp,#5
1843  0287 81            	ret
2050                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2050                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2050                     ; 805                      uint8_t TIM1_DeadTime,
2050                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2050                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2050                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2050                     ; 809 {
2051                     	switch	.text
2052  0288               _TIM1_BDTRConfig:
2054  0288 89            	pushw	x
2055  0289 88            	push	a
2056       00000001      OFST:	set	1
2059                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2061                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2063                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2065                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2067                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2069                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2071  028a 7b06          	ld	a,(OFST+5,sp)
2072  028c c752cf        	ld	21199,a
2073                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2073                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2073                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2075  028f 7b07          	ld	a,(OFST+6,sp)
2076  0291 1a08          	or	a,(OFST+7,sp)
2077  0293 1a09          	or	a,(OFST+8,sp)
2078  0295 6b01          	ld	(OFST+0,sp),a
2080  0297 9f            	ld	a,xl
2081  0298 1a02          	or	a,(OFST+1,sp)
2082  029a 1a01          	or	a,(OFST+0,sp)
2083  029c c752ce        	ld	21198,a
2084                     ; 826 }
2087  029f 5b03          	addw	sp,#3
2088  02a1 81            	ret
2124                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2124                     ; 835 {
2125                     	switch	.text
2126  02a2               _TIM1_CtrlPWMOutputs:
2130                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2132                     ; 841   if (NewState != DISABLE)
2134  02a2 4d            	tnz	a
2135  02a3 2706          	jreq	L5601
2136                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2138  02a5 721e52ce      	bset	21198,#7
2140  02a9 2004          	jra	L7601
2141  02ab               L5601:
2142                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2144  02ab 721f52ce      	bres	21198,#7
2145  02af               L7601:
2146                     ; 849 }
2149  02af 81            	ret
2228                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2228                     ; 872 {
2229                     	switch	.text
2230  02b0               _TIM1_SelectOCxM:
2232  02b0 89            	pushw	x
2233       00000000      OFST:	set	0
2236                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2238                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2240                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2242  02b1 9e            	ld	a,xh
2243  02b2 4d            	tnz	a
2244  02b3 2610          	jrne	L7211
2245                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2247  02b5 721152bd      	bres	21181,#0
2248                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2250  02b9 c652b9        	ld	a,21177
2251  02bc a48f          	and	a,#143
2252  02be 1a02          	or	a,(OFST+2,sp)
2253  02c0 c752b9        	ld	21177,a
2255  02c3 2024          	jra	L1311
2256  02c5               L7211:
2257                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2259  02c5 7b01          	ld	a,(OFST+1,sp)
2260  02c7 a101          	cp	a,#1
2261  02c9 2610          	jrne	L3311
2262                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2264  02cb 721952bd      	bres	21181,#4
2265                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2267  02cf c652ba        	ld	a,21178
2268  02d2 a48f          	and	a,#143
2269  02d4 1a02          	or	a,(OFST+2,sp)
2270  02d6 c752ba        	ld	21178,a
2272  02d9 200e          	jra	L1311
2273  02db               L3311:
2274                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2276  02db 721152be      	bres	21182,#0
2277                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2279  02df c652bb        	ld	a,21179
2280  02e2 a48f          	and	a,#143
2281  02e4 1a02          	or	a,(OFST+2,sp)
2282  02e6 c752bb        	ld	21179,a
2283  02e9               L1311:
2284                     ; 902 }
2287  02e9 85            	popw	x
2288  02ea 81            	ret
2322                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2322                     ; 911 {
2323                     	switch	.text
2324  02eb               _TIM1_SetCompare1:
2328                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2330  02eb 9e            	ld	a,xh
2331  02ec c752c6        	ld	21190,a
2332                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2334  02ef 9f            	ld	a,xl
2335  02f0 c752c7        	ld	21191,a
2336                     ; 916 }
2339  02f3 81            	ret
2373                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2373                     ; 925 {
2374                     	switch	.text
2375  02f4               _TIM1_SetCompare2:
2379                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2381  02f4 9e            	ld	a,xh
2382  02f5 c752c8        	ld	21192,a
2383                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2385  02f8 9f            	ld	a,xl
2386  02f9 c752c9        	ld	21193,a
2387                     ; 929 }
2390  02fc 81            	ret
2424                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2424                     ; 938 {
2425                     	switch	.text
2426  02fd               _TIM1_SetCompare3:
2430                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2432  02fd 9e            	ld	a,xh
2433  02fe c752ca        	ld	21194,a
2434                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2436  0301 9f            	ld	a,xl
2437  0302 c752cb        	ld	21195,a
2438                     ; 942 }
2441  0305 81            	ret
2475                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2475                     ; 951 {
2476                     	switch	.text
2477  0306               _TIM1_SetCompare4:
2481                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2483  0306 9e            	ld	a,xh
2484  0307 c752cc        	ld	21196,a
2485                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2487  030a 9f            	ld	a,xl
2488  030b c752cd        	ld	21197,a
2489                     ; 955 }
2492  030e 81            	ret
2528                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2528                     ; 964 {
2529                     	switch	.text
2530  030f               _TIM1_CCPreloadControl:
2534                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2536                     ; 969   if (NewState != DISABLE)
2538  030f 4d            	tnz	a
2539  0310 2706          	jreq	L5421
2540                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2542  0312 721052b1      	bset	21169,#0
2544  0316 2004          	jra	L7421
2545  0318               L5421:
2546                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2548  0318 721152b1      	bres	21169,#0
2549  031c               L7421:
2550                     ; 977 }
2553  031c 81            	ret
2611                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2611                     ; 988 {
2612                     	switch	.text
2613  031d               _TIM1_ForcedOC1Config:
2615  031d 88            	push	a
2616       00000000      OFST:	set	0
2619                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2621                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2623  031e c652b9        	ld	a,21177
2624  0321 a48f          	and	a,#143
2625  0323 1a01          	or	a,(OFST+1,sp)
2626  0325 c752b9        	ld	21177,a
2627                     ; 994 }
2630  0328 84            	pop	a
2631  0329 81            	ret
2667                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2667                     ; 1005 {
2668                     	switch	.text
2669  032a               _TIM1_ForcedOC2Config:
2671  032a 88            	push	a
2672       00000000      OFST:	set	0
2675                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2677                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2679  032b c652ba        	ld	a,21178
2680  032e a48f          	and	a,#143
2681  0330 1a01          	or	a,(OFST+1,sp)
2682  0332 c752ba        	ld	21178,a
2683                     ; 1011 }
2686  0335 84            	pop	a
2687  0336 81            	ret
2723                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2723                     ; 1022 {
2724                     	switch	.text
2725  0337               _TIM1_ForcedOC3Config:
2727  0337 88            	push	a
2728       00000000      OFST:	set	0
2731                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2733                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2735  0338 c652bb        	ld	a,21179
2736  033b a48f          	and	a,#143
2737  033d 1a01          	or	a,(OFST+1,sp)
2738  033f c752bb        	ld	21179,a
2739                     ; 1028 }
2742  0342 84            	pop	a
2743  0343 81            	ret
2779                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2779                     ; 1037 {
2780                     	switch	.text
2781  0344               _TIM1_OC1PreloadConfig:
2785                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2787                     ; 1042   if (NewState != DISABLE)
2789  0344 4d            	tnz	a
2790  0345 2706          	jreq	L1531
2791                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2793  0347 721652b9      	bset	21177,#3
2795  034b 2004          	jra	L3531
2796  034d               L1531:
2797                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2799  034d 721752b9      	bres	21177,#3
2800  0351               L3531:
2801                     ; 1050 }
2804  0351 81            	ret
2840                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2840                     ; 1059 {
2841                     	switch	.text
2842  0352               _TIM1_OC2PreloadConfig:
2846                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2848                     ; 1064   if (NewState != DISABLE)
2850  0352 4d            	tnz	a
2851  0353 2706          	jreq	L3731
2852                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2854  0355 721652ba      	bset	21178,#3
2856  0359 2004          	jra	L5731
2857  035b               L3731:
2858                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2860  035b 721752ba      	bres	21178,#3
2861  035f               L5731:
2862                     ; 1072 }
2865  035f 81            	ret
2901                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2901                     ; 1081 {
2902                     	switch	.text
2903  0360               _TIM1_OC3PreloadConfig:
2907                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2909                     ; 1086   if (NewState != DISABLE)
2911  0360 4d            	tnz	a
2912  0361 2706          	jreq	L5141
2913                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2915  0363 721652bb      	bset	21179,#3
2917  0367 2004          	jra	L7141
2918  0369               L5141:
2919                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2921  0369 721752bb      	bres	21179,#3
2922  036d               L7141:
2923                     ; 1094 }
2926  036d 81            	ret
2962                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2962                     ; 1103 {
2963                     	switch	.text
2964  036e               _TIM1_OC4PreloadConfig:
2968                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2970                     ; 1108   if (NewState != DISABLE)
2972  036e 4d            	tnz	a
2973  036f 2706          	jreq	L7341
2974                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2976  0371 721652bc      	bset	21180,#3
2978  0375 2004          	jra	L1441
2979  0377               L7341:
2980                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2982  0377 721752bc      	bres	21180,#3
2983  037b               L1441:
2984                     ; 1116 }
2987  037b 81            	ret
3022                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
3022                     ; 1125 {
3023                     	switch	.text
3024  037c               _TIM1_OC1FastConfig:
3028                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
3030                     ; 1130   if (NewState != DISABLE)
3032  037c 4d            	tnz	a
3033  037d 2706          	jreq	L1641
3034                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3036  037f 721452b9      	bset	21177,#2
3038  0383 2004          	jra	L3641
3039  0385               L1641:
3040                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3042  0385 721552b9      	bres	21177,#2
3043  0389               L3641:
3044                     ; 1138 }
3047  0389 81            	ret
3082                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3082                     ; 1147 {
3083                     	switch	.text
3084  038a               _TIM1_OC2FastConfig:
3088                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3090                     ; 1152   if (NewState != DISABLE)
3092  038a 4d            	tnz	a
3093  038b 2706          	jreq	L3051
3094                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3096  038d 721452ba      	bset	21178,#2
3098  0391 2004          	jra	L5051
3099  0393               L3051:
3100                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3102  0393 721552ba      	bres	21178,#2
3103  0397               L5051:
3104                     ; 1160 }
3107  0397 81            	ret
3142                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3142                     ; 1169 {
3143                     	switch	.text
3144  0398               _TIM1_OC3FastConfig:
3148                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3150                     ; 1174   if (NewState != DISABLE)
3152  0398 4d            	tnz	a
3153  0399 2706          	jreq	L5251
3154                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3156  039b 721452bb      	bset	21179,#2
3158  039f 2004          	jra	L7251
3159  03a1               L5251:
3160                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3162  03a1 721552bb      	bres	21179,#2
3163  03a5               L7251:
3164                     ; 1182 }
3167  03a5 81            	ret
3202                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3202                     ; 1191 {
3203                     	switch	.text
3204  03a6               _TIM1_ClearOC1Ref:
3208                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3210                     ; 1196   if (NewState != DISABLE)
3212  03a6 4d            	tnz	a
3213  03a7 2706          	jreq	L7451
3214                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3216  03a9 721e52b9      	bset	21177,#7
3218  03ad 2004          	jra	L1551
3219  03af               L7451:
3220                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3222  03af 721f52b9      	bres	21177,#7
3223  03b3               L1551:
3224                     ; 1204 }
3227  03b3 81            	ret
3262                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3262                     ; 1213 {
3263                     	switch	.text
3264  03b4               _TIM1_ClearOC2Ref:
3268                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3270                     ; 1218   if (NewState != DISABLE)
3272  03b4 4d            	tnz	a
3273  03b5 2706          	jreq	L1751
3274                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3276  03b7 721e52ba      	bset	21178,#7
3278  03bb 2004          	jra	L3751
3279  03bd               L1751:
3280                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3282  03bd 721f52ba      	bres	21178,#7
3283  03c1               L3751:
3284                     ; 1226 }
3287  03c1 81            	ret
3322                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3322                     ; 1235 {
3323                     	switch	.text
3324  03c2               _TIM1_ClearOC3Ref:
3328                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3330                     ; 1240   if (NewState != DISABLE)
3332  03c2 4d            	tnz	a
3333  03c3 2706          	jreq	L3161
3334                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3336  03c5 721e52bb      	bset	21179,#7
3338  03c9 2004          	jra	L5161
3339  03cb               L3161:
3340                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3342  03cb 721f52bb      	bres	21179,#7
3343  03cf               L5161:
3344                     ; 1248 }
3347  03cf 81            	ret
3382                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3382                     ; 1257 {
3383                     	switch	.text
3384  03d0               _TIM1_ClearOC4Ref:
3388                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3390                     ; 1262   if (NewState != DISABLE)
3392  03d0 4d            	tnz	a
3393  03d1 2706          	jreq	L5361
3394                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3396  03d3 721e52bc      	bset	21180,#7
3398  03d7 2004          	jra	L7361
3399  03d9               L5361:
3400                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3402  03d9 721f52bc      	bres	21180,#7
3403  03dd               L7361:
3404                     ; 1270 }
3407  03dd 81            	ret
3443                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3443                     ; 1281 {
3444                     	switch	.text
3445  03de               _TIM1_OC1PolarityConfig:
3449                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3451                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3453  03de 4d            	tnz	a
3454  03df 2706          	jreq	L7561
3455                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3457  03e1 721252bd      	bset	21181,#1
3459  03e5 2004          	jra	L1661
3460  03e7               L7561:
3461                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3463  03e7 721352bd      	bres	21181,#1
3464  03eb               L1661:
3465                     ; 1294 }
3468  03eb 81            	ret
3504                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3504                     ; 1305 {
3505                     	switch	.text
3506  03ec               _TIM1_OC1NPolarityConfig:
3510                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3512                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3514  03ec 4d            	tnz	a
3515  03ed 2706          	jreq	L1071
3516                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3518  03ef 721652bd      	bset	21181,#3
3520  03f3 2004          	jra	L3071
3521  03f5               L1071:
3522                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3524  03f5 721752bd      	bres	21181,#3
3525  03f9               L3071:
3526                     ; 1318 }
3529  03f9 81            	ret
3565                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3565                     ; 1329 {
3566                     	switch	.text
3567  03fa               _TIM1_OC2PolarityConfig:
3571                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3573                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3575  03fa 4d            	tnz	a
3576  03fb 2706          	jreq	L3271
3577                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3579  03fd 721a52bd      	bset	21181,#5
3581  0401 2004          	jra	L5271
3582  0403               L3271:
3583                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3585  0403 721b52bd      	bres	21181,#5
3586  0407               L5271:
3587                     ; 1342 }
3590  0407 81            	ret
3626                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3626                     ; 1353 {
3627                     	switch	.text
3628  0408               _TIM1_OC2NPolarityConfig:
3632                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3634                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3636  0408 4d            	tnz	a
3637  0409 2706          	jreq	L5471
3638                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3640  040b 721e52bd      	bset	21181,#7
3642  040f 2004          	jra	L7471
3643  0411               L5471:
3644                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3646  0411 721f52bd      	bres	21181,#7
3647  0415               L7471:
3648                     ; 1366 }
3651  0415 81            	ret
3687                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3687                     ; 1377 {
3688                     	switch	.text
3689  0416               _TIM1_OC3PolarityConfig:
3693                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3695                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3697  0416 4d            	tnz	a
3698  0417 2706          	jreq	L7671
3699                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3701  0419 721252be      	bset	21182,#1
3703  041d 2004          	jra	L1771
3704  041f               L7671:
3705                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3707  041f 721352be      	bres	21182,#1
3708  0423               L1771:
3709                     ; 1390 }
3712  0423 81            	ret
3748                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3748                     ; 1401 {
3749                     	switch	.text
3750  0424               _TIM1_OC3NPolarityConfig:
3754                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3756                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3758  0424 4d            	tnz	a
3759  0425 2706          	jreq	L1102
3760                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3762  0427 721652be      	bset	21182,#3
3764  042b 2004          	jra	L3102
3765  042d               L1102:
3766                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3768  042d 721752be      	bres	21182,#3
3769  0431               L3102:
3770                     ; 1414 }
3773  0431 81            	ret
3832                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3832                     ; 1425 {
3833                     	switch	.text
3834  0432               _TIM1_SelectOCREFClear:
3838                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3840                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3842  0432 721752b2      	bres	21170,#3
3843                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3845  0436 ca52b2        	or	a,21170
3846  0439 c752b2        	ld	21170,a
3847                     ; 1432 }
3850  043c 81            	ret
3885                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3885                     ; 1441 {
3886                     	switch	.text
3887  043d               _TIM1_SelectCOM:
3891                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3893                     ; 1446   if (NewState != DISABLE)
3895  043d 4d            	tnz	a
3896  043e 2706          	jreq	L1602
3897                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3899  0440 721452b1      	bset	21169,#2
3901  0444 2004          	jra	L3602
3902  0446               L1602:
3903                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3905  0446 721552b1      	bres	21169,#2
3906  044a               L3602:
3907                     ; 1454 }
3910  044a 81            	ret
3955                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3955                     ; 1469 {
3956                     	switch	.text
3957  044b               _TIM1_CCxCmd:
3959  044b 89            	pushw	x
3960       00000000      OFST:	set	0
3963                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3965                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3967                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3969  044c 9e            	ld	a,xh
3970  044d 4d            	tnz	a
3971  044e 2610          	jrne	L7012
3972                     ; 1477     if (NewState != DISABLE)
3974  0450 9f            	ld	a,xl
3975  0451 4d            	tnz	a
3976  0452 2706          	jreq	L1112
3977                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3979  0454 721052bd      	bset	21181,#0
3981  0458 2040          	jra	L5112
3982  045a               L1112:
3983                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3985  045a 721152bd      	bres	21181,#0
3986  045e 203a          	jra	L5112
3987  0460               L7012:
3988                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3990  0460 7b01          	ld	a,(OFST+1,sp)
3991  0462 a101          	cp	a,#1
3992  0464 2610          	jrne	L7112
3993                     ; 1489     if (NewState != DISABLE)
3995  0466 0d02          	tnz	(OFST+2,sp)
3996  0468 2706          	jreq	L1212
3997                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3999  046a 721852bd      	bset	21181,#4
4001  046e 202a          	jra	L5112
4002  0470               L1212:
4003                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
4005  0470 721952bd      	bres	21181,#4
4006  0474 2024          	jra	L5112
4007  0476               L7112:
4008                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
4010  0476 7b01          	ld	a,(OFST+1,sp)
4011  0478 a102          	cp	a,#2
4012  047a 2610          	jrne	L7212
4013                     ; 1501     if (NewState != DISABLE)
4015  047c 0d02          	tnz	(OFST+2,sp)
4016  047e 2706          	jreq	L1312
4017                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
4019  0480 721052be      	bset	21182,#0
4021  0484 2014          	jra	L5112
4022  0486               L1312:
4023                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
4025  0486 721152be      	bres	21182,#0
4026  048a 200e          	jra	L5112
4027  048c               L7212:
4028                     ; 1513     if (NewState != DISABLE)
4030  048c 0d02          	tnz	(OFST+2,sp)
4031  048e 2706          	jreq	L7312
4032                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
4034  0490 721852be      	bset	21182,#4
4036  0494 2004          	jra	L5112
4037  0496               L7312:
4038                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4040  0496 721952be      	bres	21182,#4
4041  049a               L5112:
4042                     ; 1522 }
4045  049a 85            	popw	x
4046  049b 81            	ret
4091                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4091                     ; 1536 {
4092                     	switch	.text
4093  049c               _TIM1_CCxNCmd:
4095  049c 89            	pushw	x
4096       00000000      OFST:	set	0
4099                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4101                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4103                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4105  049d 9e            	ld	a,xh
4106  049e 4d            	tnz	a
4107  049f 2610          	jrne	L5612
4108                     ; 1544     if (NewState != DISABLE)
4110  04a1 9f            	ld	a,xl
4111  04a2 4d            	tnz	a
4112  04a3 2706          	jreq	L7612
4113                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4115  04a5 721452bd      	bset	21181,#2
4117  04a9 202a          	jra	L3712
4118  04ab               L7612:
4119                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4121  04ab 721552bd      	bres	21181,#2
4122  04af 2024          	jra	L3712
4123  04b1               L5612:
4124                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4126  04b1 7b01          	ld	a,(OFST+1,sp)
4127  04b3 a101          	cp	a,#1
4128  04b5 2610          	jrne	L5712
4129                     ; 1556     if (NewState != DISABLE)
4131  04b7 0d02          	tnz	(OFST+2,sp)
4132  04b9 2706          	jreq	L7712
4133                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4135  04bb 721c52bd      	bset	21181,#6
4137  04bf 2014          	jra	L3712
4138  04c1               L7712:
4139                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4141  04c1 721d52bd      	bres	21181,#6
4142  04c5 200e          	jra	L3712
4143  04c7               L5712:
4144                     ; 1568     if (NewState != DISABLE)
4146  04c7 0d02          	tnz	(OFST+2,sp)
4147  04c9 2706          	jreq	L5022
4148                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4150  04cb 721452be      	bset	21182,#2
4152  04cf 2004          	jra	L3712
4153  04d1               L5022:
4154                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4156  04d1 721552be      	bres	21182,#2
4157  04d5               L3712:
4158                     ; 1577 }
4161  04d5 85            	popw	x
4162  04d6 81            	ret
4330                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4330                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4330                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4330                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4330                     ; 1668                  uint8_t TIM1_ICFilter)
4330                     ; 1669 {
4331                     	switch	.text
4332  04d7               _TIM1_ICInit:
4334  04d7 89            	pushw	x
4335       00000000      OFST:	set	0
4338                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4340                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4342                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4344                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4346                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4348                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4350  04d8 9e            	ld	a,xh
4351  04d9 4d            	tnz	a
4352  04da 2614          	jrne	L5032
4353                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4355  04dc 7b07          	ld	a,(OFST+7,sp)
4356  04de 88            	push	a
4357  04df 7b06          	ld	a,(OFST+6,sp)
4358  04e1 97            	ld	xl,a
4359  04e2 7b03          	ld	a,(OFST+3,sp)
4360  04e4 95            	ld	xh,a
4361  04e5 cd080b        	call	L3_TI1_Config
4363  04e8 84            	pop	a
4364                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4366  04e9 7b06          	ld	a,(OFST+6,sp)
4367  04eb cd0640        	call	_TIM1_SetIC1Prescaler
4370  04ee 2046          	jra	L7032
4371  04f0               L5032:
4372                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4374  04f0 7b01          	ld	a,(OFST+1,sp)
4375  04f2 a101          	cp	a,#1
4376  04f4 2614          	jrne	L1132
4377                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4379  04f6 7b07          	ld	a,(OFST+7,sp)
4380  04f8 88            	push	a
4381  04f9 7b06          	ld	a,(OFST+6,sp)
4382  04fb 97            	ld	xl,a
4383  04fc 7b03          	ld	a,(OFST+3,sp)
4384  04fe 95            	ld	xh,a
4385  04ff cd083b        	call	L5_TI2_Config
4387  0502 84            	pop	a
4388                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4390  0503 7b06          	ld	a,(OFST+6,sp)
4391  0505 cd064d        	call	_TIM1_SetIC2Prescaler
4394  0508 202c          	jra	L7032
4395  050a               L1132:
4396                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4398  050a 7b01          	ld	a,(OFST+1,sp)
4399  050c a102          	cp	a,#2
4400  050e 2614          	jrne	L5132
4401                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4403  0510 7b07          	ld	a,(OFST+7,sp)
4404  0512 88            	push	a
4405  0513 7b06          	ld	a,(OFST+6,sp)
4406  0515 97            	ld	xl,a
4407  0516 7b03          	ld	a,(OFST+3,sp)
4408  0518 95            	ld	xh,a
4409  0519 cd086b        	call	L7_TI3_Config
4411  051c 84            	pop	a
4412                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4414  051d 7b06          	ld	a,(OFST+6,sp)
4415  051f cd065a        	call	_TIM1_SetIC3Prescaler
4418  0522 2012          	jra	L7032
4419  0524               L5132:
4420                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4422  0524 7b07          	ld	a,(OFST+7,sp)
4423  0526 88            	push	a
4424  0527 7b06          	ld	a,(OFST+6,sp)
4425  0529 97            	ld	xl,a
4426  052a 7b03          	ld	a,(OFST+3,sp)
4427  052c 95            	ld	xh,a
4428  052d cd089b        	call	L11_TI4_Config
4430  0530 84            	pop	a
4431                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4433  0531 7b06          	ld	a,(OFST+6,sp)
4434  0533 cd0667        	call	_TIM1_SetIC4Prescaler
4436  0536               L7032:
4437                     ; 1706 }
4440  0536 85            	popw	x
4441  0537 81            	ret
4539                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4539                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4539                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4539                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4539                     ; 1737                      uint8_t TIM1_ICFilter)
4539                     ; 1738 {
4540                     	switch	.text
4541  0538               _TIM1_PWMIConfig:
4543  0538 89            	pushw	x
4544  0539 89            	pushw	x
4545       00000002      OFST:	set	2
4548                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4550                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4552                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4554                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4556                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4558                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4560                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4562  053a 9f            	ld	a,xl
4563  053b a101          	cp	a,#1
4564  053d 2706          	jreq	L7632
4565                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4567  053f a601          	ld	a,#1
4568  0541 6b01          	ld	(OFST-1,sp),a
4571  0543 2002          	jra	L1732
4572  0545               L7632:
4573                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4575  0545 0f01          	clr	(OFST-1,sp)
4577  0547               L1732:
4578                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4580  0547 7b07          	ld	a,(OFST+5,sp)
4581  0549 a101          	cp	a,#1
4582  054b 2606          	jrne	L3732
4583                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4585  054d a602          	ld	a,#2
4586  054f 6b02          	ld	(OFST+0,sp),a
4589  0551 2004          	jra	L5732
4590  0553               L3732:
4591                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4593  0553 a601          	ld	a,#1
4594  0555 6b02          	ld	(OFST+0,sp),a
4596  0557               L5732:
4597                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4599  0557 0d03          	tnz	(OFST+1,sp)
4600  0559 2626          	jrne	L7732
4601                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4603  055b 7b09          	ld	a,(OFST+7,sp)
4604  055d 88            	push	a
4605  055e 7b08          	ld	a,(OFST+6,sp)
4606  0560 97            	ld	xl,a
4607  0561 7b05          	ld	a,(OFST+3,sp)
4608  0563 95            	ld	xh,a
4609  0564 cd080b        	call	L3_TI1_Config
4611  0567 84            	pop	a
4612                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4614  0568 7b08          	ld	a,(OFST+6,sp)
4615  056a cd0640        	call	_TIM1_SetIC1Prescaler
4617                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4619  056d 7b09          	ld	a,(OFST+7,sp)
4620  056f 88            	push	a
4621  0570 7b03          	ld	a,(OFST+1,sp)
4622  0572 97            	ld	xl,a
4623  0573 7b02          	ld	a,(OFST+0,sp)
4624  0575 95            	ld	xh,a
4625  0576 cd083b        	call	L5_TI2_Config
4627  0579 84            	pop	a
4628                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4630  057a 7b08          	ld	a,(OFST+6,sp)
4631  057c cd064d        	call	_TIM1_SetIC2Prescaler
4634  057f 2024          	jra	L1042
4635  0581               L7732:
4636                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4638  0581 7b09          	ld	a,(OFST+7,sp)
4639  0583 88            	push	a
4640  0584 7b08          	ld	a,(OFST+6,sp)
4641  0586 97            	ld	xl,a
4642  0587 7b05          	ld	a,(OFST+3,sp)
4643  0589 95            	ld	xh,a
4644  058a cd083b        	call	L5_TI2_Config
4646  058d 84            	pop	a
4647                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4649  058e 7b08          	ld	a,(OFST+6,sp)
4650  0590 cd064d        	call	_TIM1_SetIC2Prescaler
4652                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4654  0593 7b09          	ld	a,(OFST+7,sp)
4655  0595 88            	push	a
4656  0596 7b03          	ld	a,(OFST+1,sp)
4657  0598 97            	ld	xl,a
4658  0599 7b02          	ld	a,(OFST+0,sp)
4659  059b 95            	ld	xh,a
4660  059c cd080b        	call	L3_TI1_Config
4662  059f 84            	pop	a
4663                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4665  05a0 7b08          	ld	a,(OFST+6,sp)
4666  05a2 cd0640        	call	_TIM1_SetIC1Prescaler
4668  05a5               L1042:
4669                     ; 1796 }
4672  05a5 5b04          	addw	sp,#4
4673  05a7 81            	ret
4725                     ; 1803 uint16_t TIM1_GetCapture1(void)
4725                     ; 1804 {
4726                     	switch	.text
4727  05a8               _TIM1_GetCapture1:
4729  05a8 5204          	subw	sp,#4
4730       00000004      OFST:	set	4
4733                     ; 1807   uint16_t tmpccr1 = 0;
4735                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4739                     ; 1810   tmpccr1h = TIM1->CCR1H;
4741  05aa c652c6        	ld	a,21190
4742  05ad 6b02          	ld	(OFST-2,sp),a
4744                     ; 1811   tmpccr1l = TIM1->CCR1L;
4746  05af c652c7        	ld	a,21191
4747  05b2 6b01          	ld	(OFST-3,sp),a
4749                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4751  05b4 7b01          	ld	a,(OFST-3,sp)
4752  05b6 5f            	clrw	x
4753  05b7 97            	ld	xl,a
4754  05b8 1f03          	ldw	(OFST-1,sp),x
4756                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4758  05ba 7b02          	ld	a,(OFST-2,sp)
4759  05bc 5f            	clrw	x
4760  05bd 97            	ld	xl,a
4761  05be 4f            	clr	a
4762  05bf 02            	rlwa	x,a
4763  05c0 01            	rrwa	x,a
4764  05c1 1a04          	or	a,(OFST+0,sp)
4765  05c3 01            	rrwa	x,a
4766  05c4 1a03          	or	a,(OFST-1,sp)
4767  05c6 01            	rrwa	x,a
4768  05c7 1f03          	ldw	(OFST-1,sp),x
4770                     ; 1816   return (uint16_t)tmpccr1;
4772  05c9 1e03          	ldw	x,(OFST-1,sp)
4775  05cb 5b04          	addw	sp,#4
4776  05cd 81            	ret
4828                     ; 1824 uint16_t TIM1_GetCapture2(void)
4828                     ; 1825 {
4829                     	switch	.text
4830  05ce               _TIM1_GetCapture2:
4832  05ce 5204          	subw	sp,#4
4833       00000004      OFST:	set	4
4836                     ; 1828   uint16_t tmpccr2 = 0;
4838                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4842                     ; 1831   tmpccr2h = TIM1->CCR2H;
4844  05d0 c652c8        	ld	a,21192
4845  05d3 6b02          	ld	(OFST-2,sp),a
4847                     ; 1832   tmpccr2l = TIM1->CCR2L;
4849  05d5 c652c9        	ld	a,21193
4850  05d8 6b01          	ld	(OFST-3,sp),a
4852                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4854  05da 7b01          	ld	a,(OFST-3,sp)
4855  05dc 5f            	clrw	x
4856  05dd 97            	ld	xl,a
4857  05de 1f03          	ldw	(OFST-1,sp),x
4859                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4861  05e0 7b02          	ld	a,(OFST-2,sp)
4862  05e2 5f            	clrw	x
4863  05e3 97            	ld	xl,a
4864  05e4 4f            	clr	a
4865  05e5 02            	rlwa	x,a
4866  05e6 01            	rrwa	x,a
4867  05e7 1a04          	or	a,(OFST+0,sp)
4868  05e9 01            	rrwa	x,a
4869  05ea 1a03          	or	a,(OFST-1,sp)
4870  05ec 01            	rrwa	x,a
4871  05ed 1f03          	ldw	(OFST-1,sp),x
4873                     ; 1837   return (uint16_t)tmpccr2;
4875  05ef 1e03          	ldw	x,(OFST-1,sp)
4878  05f1 5b04          	addw	sp,#4
4879  05f3 81            	ret
4931                     ; 1845 uint16_t TIM1_GetCapture3(void)
4931                     ; 1846 {
4932                     	switch	.text
4933  05f4               _TIM1_GetCapture3:
4935  05f4 5204          	subw	sp,#4
4936       00000004      OFST:	set	4
4939                     ; 1848   uint16_t tmpccr3 = 0;
4941                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4945                     ; 1851   tmpccr3h = TIM1->CCR3H;
4947  05f6 c652ca        	ld	a,21194
4948  05f9 6b02          	ld	(OFST-2,sp),a
4950                     ; 1852   tmpccr3l = TIM1->CCR3L;
4952  05fb c652cb        	ld	a,21195
4953  05fe 6b01          	ld	(OFST-3,sp),a
4955                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4957  0600 7b01          	ld	a,(OFST-3,sp)
4958  0602 5f            	clrw	x
4959  0603 97            	ld	xl,a
4960  0604 1f03          	ldw	(OFST-1,sp),x
4962                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4964  0606 7b02          	ld	a,(OFST-2,sp)
4965  0608 5f            	clrw	x
4966  0609 97            	ld	xl,a
4967  060a 4f            	clr	a
4968  060b 02            	rlwa	x,a
4969  060c 01            	rrwa	x,a
4970  060d 1a04          	or	a,(OFST+0,sp)
4971  060f 01            	rrwa	x,a
4972  0610 1a03          	or	a,(OFST-1,sp)
4973  0612 01            	rrwa	x,a
4974  0613 1f03          	ldw	(OFST-1,sp),x
4976                     ; 1857   return (uint16_t)tmpccr3;
4978  0615 1e03          	ldw	x,(OFST-1,sp)
4981  0617 5b04          	addw	sp,#4
4982  0619 81            	ret
5034                     ; 1865 uint16_t TIM1_GetCapture4(void)
5034                     ; 1866 {
5035                     	switch	.text
5036  061a               _TIM1_GetCapture4:
5038  061a 5204          	subw	sp,#4
5039       00000004      OFST:	set	4
5042                     ; 1868   uint16_t tmpccr4 = 0;
5044                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
5048                     ; 1871   tmpccr4h = TIM1->CCR4H;
5050  061c c652cc        	ld	a,21196
5051  061f 6b02          	ld	(OFST-2,sp),a
5053                     ; 1872   tmpccr4l = TIM1->CCR4L;
5055  0621 c652cd        	ld	a,21197
5056  0624 6b01          	ld	(OFST-3,sp),a
5058                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
5060  0626 7b01          	ld	a,(OFST-3,sp)
5061  0628 5f            	clrw	x
5062  0629 97            	ld	xl,a
5063  062a 1f03          	ldw	(OFST-1,sp),x
5065                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5067  062c 7b02          	ld	a,(OFST-2,sp)
5068  062e 5f            	clrw	x
5069  062f 97            	ld	xl,a
5070  0630 4f            	clr	a
5071  0631 02            	rlwa	x,a
5072  0632 01            	rrwa	x,a
5073  0633 1a04          	or	a,(OFST+0,sp)
5074  0635 01            	rrwa	x,a
5075  0636 1a03          	or	a,(OFST-1,sp)
5076  0638 01            	rrwa	x,a
5077  0639 1f03          	ldw	(OFST-1,sp),x
5079                     ; 1877   return (uint16_t)tmpccr4;
5081  063b 1e03          	ldw	x,(OFST-1,sp)
5084  063d 5b04          	addw	sp,#4
5085  063f 81            	ret
5121                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5121                     ; 1891 {
5122                     	switch	.text
5123  0640               _TIM1_SetIC1Prescaler:
5125  0640 88            	push	a
5126       00000000      OFST:	set	0
5129                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5131                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5133  0641 c652b9        	ld	a,21177
5134  0644 a4f3          	and	a,#243
5135  0646 1a01          	or	a,(OFST+1,sp)
5136  0648 c752b9        	ld	21177,a
5137                     ; 1897 }
5140  064b 84            	pop	a
5141  064c 81            	ret
5177                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5177                     ; 1910 {
5178                     	switch	.text
5179  064d               _TIM1_SetIC2Prescaler:
5181  064d 88            	push	a
5182       00000000      OFST:	set	0
5185                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5187                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5189  064e c652ba        	ld	a,21178
5190  0651 a4f3          	and	a,#243
5191  0653 1a01          	or	a,(OFST+1,sp)
5192  0655 c752ba        	ld	21178,a
5193                     ; 1916 }
5196  0658 84            	pop	a
5197  0659 81            	ret
5233                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5233                     ; 1929 {
5234                     	switch	.text
5235  065a               _TIM1_SetIC3Prescaler:
5237  065a 88            	push	a
5238       00000000      OFST:	set	0
5241                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5243                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5245  065b c652bb        	ld	a,21179
5246  065e a4f3          	and	a,#243
5247  0660 1a01          	or	a,(OFST+1,sp)
5248  0662 c752bb        	ld	21179,a
5249                     ; 1936 }
5252  0665 84            	pop	a
5253  0666 81            	ret
5289                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5289                     ; 1949 {
5290                     	switch	.text
5291  0667               _TIM1_SetIC4Prescaler:
5293  0667 88            	push	a
5294       00000000      OFST:	set	0
5297                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5299                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5301  0668 c652bc        	ld	a,21180
5302  066b a4f3          	and	a,#243
5303  066d 1a01          	or	a,(OFST+1,sp)
5304  066f c752bc        	ld	21180,a
5305                     ; 1956 }
5308  0672 84            	pop	a
5309  0673 81            	ret
5416                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5416                     ; 1992 {
5417                     	switch	.text
5418  0674               _TIM1_ITConfig:
5420  0674 89            	pushw	x
5421       00000000      OFST:	set	0
5424                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5426                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5428                     ; 1997   if (NewState != DISABLE)
5430  0675 9f            	ld	a,xl
5431  0676 4d            	tnz	a
5432  0677 2709          	jreq	L1762
5433                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5435  0679 9e            	ld	a,xh
5436  067a ca52b5        	or	a,21173
5437  067d c752b5        	ld	21173,a
5439  0680 2009          	jra	L3762
5440  0682               L1762:
5441                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5443  0682 7b01          	ld	a,(OFST+1,sp)
5444  0684 43            	cpl	a
5445  0685 c452b5        	and	a,21173
5446  0688 c752b5        	ld	21173,a
5447  068b               L3762:
5448                     ; 2007 }
5451  068b 85            	popw	x
5452  068c 81            	ret
5557                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5557                     ; 2024 {
5558                     	switch	.text
5559  068d               _TIM1_GenerateEvent:
5563                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5565                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5567  068d c752b8        	ld	21176,a
5568                     ; 2030 }
5571  0690 81            	ret
5745                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5745                     ; 2050 {
5746                     	switch	.text
5747  0691               _TIM1_GetFlagStatus:
5749  0691 89            	pushw	x
5750  0692 89            	pushw	x
5751       00000002      OFST:	set	2
5754                     ; 2051   FlagStatus bitstatus = RESET;
5756                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5760                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5762                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5764  0693 9f            	ld	a,xl
5765  0694 c452b6        	and	a,21174
5766  0697 6b01          	ld	(OFST-1,sp),a
5768                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5770  0699 c652b7        	ld	a,21175
5771  069c 1403          	and	a,(OFST+1,sp)
5772  069e 6b02          	ld	(OFST+0,sp),a
5774                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5776  06a0 7b01          	ld	a,(OFST-1,sp)
5777  06a2 1a02          	or	a,(OFST+0,sp)
5778  06a4 2706          	jreq	L5303
5779                     ; 2062     bitstatus = SET;
5781  06a6 a601          	ld	a,#1
5782  06a8 6b02          	ld	(OFST+0,sp),a
5785  06aa 2002          	jra	L7303
5786  06ac               L5303:
5787                     ; 2066     bitstatus = RESET;
5789  06ac 0f02          	clr	(OFST+0,sp)
5791  06ae               L7303:
5792                     ; 2068   return (FlagStatus)(bitstatus);
5794  06ae 7b02          	ld	a,(OFST+0,sp)
5797  06b0 5b04          	addw	sp,#4
5798  06b2 81            	ret
5833                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5833                     ; 2090 {
5834                     	switch	.text
5835  06b3               _TIM1_ClearFlag:
5837  06b3 89            	pushw	x
5838       00000000      OFST:	set	0
5841                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5843                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5845  06b4 9f            	ld	a,xl
5846  06b5 43            	cpl	a
5847  06b6 c752b6        	ld	21174,a
5848                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5850  06b9 7b01          	ld	a,(OFST+1,sp)
5851  06bb 43            	cpl	a
5852  06bc a41e          	and	a,#30
5853  06be c752b7        	ld	21175,a
5854                     ; 2097 }
5857  06c1 85            	popw	x
5858  06c2 81            	ret
5922                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5922                     ; 2115 {
5923                     	switch	.text
5924  06c3               _TIM1_GetITStatus:
5926  06c3 88            	push	a
5927  06c4 89            	pushw	x
5928       00000002      OFST:	set	2
5931                     ; 2116   ITStatus bitstatus = RESET;
5933                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5937                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5939                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5941  06c5 c452b6        	and	a,21174
5942  06c8 6b01          	ld	(OFST-1,sp),a
5944                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5946  06ca c652b5        	ld	a,21173
5947  06cd 1403          	and	a,(OFST+1,sp)
5948  06cf 6b02          	ld	(OFST+0,sp),a
5950                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5952  06d1 0d01          	tnz	(OFST-1,sp)
5953  06d3 270a          	jreq	L1113
5955  06d5 0d02          	tnz	(OFST+0,sp)
5956  06d7 2706          	jreq	L1113
5957                     ; 2129     bitstatus = SET;
5959  06d9 a601          	ld	a,#1
5960  06db 6b02          	ld	(OFST+0,sp),a
5963  06dd 2002          	jra	L3113
5964  06df               L1113:
5965                     ; 2133     bitstatus = RESET;
5967  06df 0f02          	clr	(OFST+0,sp)
5969  06e1               L3113:
5970                     ; 2135   return (ITStatus)(bitstatus);
5972  06e1 7b02          	ld	a,(OFST+0,sp)
5975  06e3 5b03          	addw	sp,#3
5976  06e5 81            	ret
6012                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6012                     ; 2153 {
6013                     	switch	.text
6014  06e6               _TIM1_ClearITPendingBit:
6018                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
6020                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6022  06e6 43            	cpl	a
6023  06e7 c752b6        	ld	21174,a
6024                     ; 2159 }
6027  06ea 81            	ret
6565                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6565                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6565                     ; 2169 {
6566                     	switch	.text
6567  06eb               _TIM1_DMAConfig:
6571                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6573                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6575                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6577  06eb 9e            	ld	a,xh
6578  06ec c752d1        	ld	21201,a
6579                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6581  06ef 9f            	ld	a,xl
6582  06f0 c752d2        	ld	21202,a
6583                     ; 2177 }
6586  06f3 81            	ret
6680                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6680                     ; 2190 {
6681                     	switch	.text
6682  06f4               _TIM1_DMACmd:
6684  06f4 89            	pushw	x
6685       00000000      OFST:	set	0
6688                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6690                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6692                     ; 2195   if (NewState != DISABLE)
6694  06f5 9f            	ld	a,xl
6695  06f6 4d            	tnz	a
6696  06f7 2709          	jreq	L7243
6697                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6699  06f9 9e            	ld	a,xh
6700  06fa ca52b4        	or	a,21172
6701  06fd c752b4        	ld	21172,a
6703  0700 2009          	jra	L1343
6704  0702               L7243:
6705                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6707  0702 7b01          	ld	a,(OFST+1,sp)
6708  0704 43            	cpl	a
6709  0705 c452b4        	and	a,21172
6710  0708 c752b4        	ld	21172,a
6711  070b               L1343:
6712                     ; 2205 }
6715  070b 85            	popw	x
6716  070c 81            	ret
6751                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6751                     ; 2214 {
6752                     	switch	.text
6753  070d               _TIM1_SelectCCDMA:
6757                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6759                     ; 2218   if (NewState != DISABLE)
6761  070d 4d            	tnz	a
6762  070e 2706          	jreq	L1543
6763                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6765  0710 721652b1      	bset	21169,#3
6767  0714 2004          	jra	L3543
6768  0716               L1543:
6769                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6771  0716 721752b1      	bres	21169,#3
6772  071a               L3543:
6773                     ; 2228 }
6776  071a 81            	ret
6800                     ; 2251 void TIM1_InternalClockConfig(void)
6800                     ; 2252 {
6801                     	switch	.text
6802  071b               _TIM1_InternalClockConfig:
6806                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6808  071b c652b2        	ld	a,21170
6809  071e a4f8          	and	a,#248
6810  0720 c752b2        	ld	21170,a
6811                     ; 2255 }
6814  0723 81            	ret
6903                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6903                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6903                     ; 2274                                  uint8_t ICFilter)
6903                     ; 2275 {
6904                     	switch	.text
6905  0724               _TIM1_TIxExternalClockConfig:
6907  0724 89            	pushw	x
6908       00000000      OFST:	set	0
6911                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6913                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6915                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6917                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6919  0725 9e            	ld	a,xh
6920  0726 a160          	cp	a,#96
6921  0728 260e          	jrne	L5253
6922                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6924  072a 7b05          	ld	a,(OFST+5,sp)
6925  072c 88            	push	a
6926  072d 9f            	ld	a,xl
6927  072e ae0001        	ldw	x,#1
6928  0731 95            	ld	xh,a
6929  0732 cd083b        	call	L5_TI2_Config
6931  0735 84            	pop	a
6933  0736 200d          	jra	L7253
6934  0738               L5253:
6935                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6937  0738 7b05          	ld	a,(OFST+5,sp)
6938  073a 88            	push	a
6939  073b 7b03          	ld	a,(OFST+3,sp)
6940  073d ae0001        	ldw	x,#1
6941  0740 95            	ld	xh,a
6942  0741 cd080b        	call	L3_TI1_Config
6944  0744 84            	pop	a
6945  0745               L7253:
6946                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6948  0745 7b01          	ld	a,(OFST+1,sp)
6949  0747 ad34          	call	_TIM1_SelectInputTrigger
6951                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6953  0749 c652b2        	ld	a,21170
6954  074c aa07          	or	a,#7
6955  074e c752b2        	ld	21170,a
6956                     ; 2296 }
6959  0751 85            	popw	x
6960  0752 81            	ret
7077                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7077                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7077                     ; 2316                               uint8_t ExtTRGFilter)
7077                     ; 2317 {
7078                     	switch	.text
7079  0753               _TIM1_ETRClockMode1Config:
7081  0753 89            	pushw	x
7082       00000000      OFST:	set	0
7085                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7087                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7089                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7091                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7093  0754 7b05          	ld	a,(OFST+5,sp)
7094  0756 88            	push	a
7095  0757 9f            	ld	a,xl
7096  0758 97            	ld	xl,a
7097  0759 7b02          	ld	a,(OFST+2,sp)
7098  075b 95            	ld	xh,a
7099  075c ad54          	call	_TIM1_ETRConfig
7101  075e 84            	pop	a
7102                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7102                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7104  075f c652b2        	ld	a,21170
7105  0762 a488          	and	a,#136
7106  0764 aa77          	or	a,#119
7107  0766 c752b2        	ld	21170,a
7108                     ; 2329 }
7111  0769 85            	popw	x
7112  076a 81            	ret
7170                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7170                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7170                     ; 2349                               uint8_t ExtTRGFilter)
7170                     ; 2350 {
7171                     	switch	.text
7172  076b               _TIM1_ETRClockMode2Config:
7174  076b 89            	pushw	x
7175       00000000      OFST:	set	0
7178                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7180                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7182                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7184  076c 7b05          	ld	a,(OFST+5,sp)
7185  076e 88            	push	a
7186  076f 9f            	ld	a,xl
7187  0770 97            	ld	xl,a
7188  0771 7b02          	ld	a,(OFST+2,sp)
7189  0773 95            	ld	xh,a
7190  0774 ad3c          	call	_TIM1_ETRConfig
7192  0776 84            	pop	a
7193                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7195  0777 721c52b3      	bset	21171,#6
7196                     ; 2360 }
7199  077b 85            	popw	x
7200  077c 81            	ret
7307                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7307                     ; 2411 {
7308                     	switch	.text
7309  077d               _TIM1_SelectInputTrigger:
7311  077d 88            	push	a
7312       00000000      OFST:	set	0
7315                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7317                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7319  077e c652b2        	ld	a,21170
7320  0781 a48f          	and	a,#143
7321  0783 1a01          	or	a,(OFST+1,sp)
7322  0785 c752b2        	ld	21170,a
7323                     ; 2417 }
7326  0788 84            	pop	a
7327  0789 81            	ret
7433                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7433                     ; 2434 {
7434                     	switch	.text
7435  078a               _TIM1_SelectOutputTrigger:
7437  078a 88            	push	a
7438       00000000      OFST:	set	0
7441                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7443                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7445  078b c652b1        	ld	a,21169
7446  078e a48f          	and	a,#143
7447  0790 1a01          	or	a,(OFST+1,sp)
7448  0792 c752b1        	ld	21169,a
7449                     ; 2439 }
7452  0795 84            	pop	a
7453  0796 81            	ret
7527                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7527                     ; 2452 {
7528                     	switch	.text
7529  0797               _TIM1_SelectSlaveMode:
7531  0797 88            	push	a
7532       00000000      OFST:	set	0
7535                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7537                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7539  0798 c652b2        	ld	a,21170
7540  079b a4f8          	and	a,#248
7541  079d 1a01          	or	a,(OFST+1,sp)
7542  079f c752b2        	ld	21170,a
7543                     ; 2459 }
7546  07a2 84            	pop	a
7547  07a3 81            	ret
7583                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7583                     ; 2468 {
7584                     	switch	.text
7585  07a4               _TIM1_SelectMasterSlaveMode:
7589                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7591                     ; 2473   if (NewState != DISABLE)
7593  07a4 4d            	tnz	a
7594  07a5 2706          	jreq	L5004
7595                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7597  07a7 721e52b2      	bset	21170,#7
7599  07ab 2004          	jra	L7004
7600  07ad               L5004:
7601                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7603  07ad 721f52b2      	bres	21170,#7
7604  07b1               L7004:
7605                     ; 2481 }
7608  07b1 81            	ret
7664                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7664                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7664                     ; 2501                     uint8_t ExtTRGFilter)
7664                     ; 2502 {
7665                     	switch	.text
7666  07b2               _TIM1_ETRConfig:
7668  07b2 89            	pushw	x
7669       00000000      OFST:	set	0
7672                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7674                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7674                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7674                     ; 2508                          | (uint8_t) ExtTRGFilter);
7676  07b3 9f            	ld	a,xl
7677  07b4 1a01          	or	a,(OFST+1,sp)
7678  07b6 1a05          	or	a,(OFST+5,sp)
7679  07b8 ca52b3        	or	a,21171
7680  07bb c752b3        	ld	21171,a
7681                     ; 2509 }
7684  07be 85            	popw	x
7685  07bf 81            	ret
7771                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7771                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7771                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7771                     ; 2550 {
7772                     	switch	.text
7773  07c0               _TIM1_EncoderInterfaceConfig:
7775  07c0 89            	pushw	x
7776       00000000      OFST:	set	0
7779                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7781                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7783                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7785                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7787  07c1 9f            	ld	a,xl
7788  07c2 4d            	tnz	a
7789  07c3 2706          	jreq	L7704
7790                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7792  07c5 721252bd      	bset	21181,#1
7794  07c9 2004          	jra	L1014
7795  07cb               L7704:
7796                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7798  07cb 721352bd      	bres	21181,#1
7799  07cf               L1014:
7800                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7802  07cf 0d05          	tnz	(OFST+5,sp)
7803  07d1 2706          	jreq	L3014
7804                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7806  07d3 721a52bd      	bset	21181,#5
7808  07d7 2004          	jra	L5014
7809  07d9               L3014:
7810                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7812  07d9 721b52bd      	bres	21181,#5
7813  07dd               L5014:
7814                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7816  07dd c652b2        	ld	a,21170
7817  07e0 a4f0          	and	a,#240
7818  07e2 1a01          	or	a,(OFST+1,sp)
7819  07e4 c752b2        	ld	21170,a
7820                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7822  07e7 c652b9        	ld	a,21177
7823  07ea a4fc          	and	a,#252
7824  07ec aa01          	or	a,#1
7825  07ee c752b9        	ld	21177,a
7826                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7828  07f1 c652ba        	ld	a,21178
7829  07f4 a4fc          	and	a,#252
7830  07f6 aa01          	or	a,#1
7831  07f8 c752ba        	ld	21178,a
7832                     ; 2581 }
7835  07fb 85            	popw	x
7836  07fc 81            	ret
7872                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7872                     ; 2590 {
7873                     	switch	.text
7874  07fd               _TIM1_SelectHallSensor:
7878                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7880                     ; 2595   if (NewState != DISABLE)
7882  07fd 4d            	tnz	a
7883  07fe 2706          	jreq	L5214
7884                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7886  0800 721e52b1      	bset	21169,#7
7888  0804 2004          	jra	L7214
7889  0806               L5214:
7890                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7892  0806 721f52b1      	bres	21169,#7
7893  080a               L7214:
7894                     ; 2603 }
7897  080a 81            	ret
7949                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7949                     ; 2624 {
7950                     	switch	.text
7951  080b               L3_TI1_Config:
7953  080b 89            	pushw	x
7954  080c 88            	push	a
7955       00000001      OFST:	set	1
7958                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7960  080d 721152bd      	bres	21181,#0
7961                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7961                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7963  0811 7b06          	ld	a,(OFST+5,sp)
7964  0813 97            	ld	xl,a
7965  0814 a610          	ld	a,#16
7966  0816 42            	mul	x,a
7967  0817 9f            	ld	a,xl
7968  0818 1a03          	or	a,(OFST+2,sp)
7969  081a 6b01          	ld	(OFST+0,sp),a
7971  081c c652b9        	ld	a,21177
7972  081f a40c          	and	a,#12
7973  0821 1a01          	or	a,(OFST+0,sp)
7974  0823 c752b9        	ld	21177,a
7975                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7977  0826 0d02          	tnz	(OFST+1,sp)
7978  0828 2706          	jreq	L7514
7979                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7981  082a 721252bd      	bset	21181,#1
7983  082e 2004          	jra	L1614
7984  0830               L7514:
7985                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7987  0830 721352bd      	bres	21181,#1
7988  0834               L1614:
7989                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7991  0834 721052bd      	bset	21181,#0
7992                     ; 2647 }
7995  0838 5b03          	addw	sp,#3
7996  083a 81            	ret
8048                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8048                     ; 2664 {
8049                     	switch	.text
8050  083b               L5_TI2_Config:
8052  083b 89            	pushw	x
8053  083c 88            	push	a
8054       00000001      OFST:	set	1
8057                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8059  083d 721952bd      	bres	21181,#4
8060                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8060                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8062  0841 7b06          	ld	a,(OFST+5,sp)
8063  0843 97            	ld	xl,a
8064  0844 a610          	ld	a,#16
8065  0846 42            	mul	x,a
8066  0847 9f            	ld	a,xl
8067  0848 1a03          	or	a,(OFST+2,sp)
8068  084a 6b01          	ld	(OFST+0,sp),a
8070  084c c652ba        	ld	a,21178
8071  084f a40c          	and	a,#12
8072  0851 1a01          	or	a,(OFST+0,sp)
8073  0853 c752ba        	ld	21178,a
8074                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8076  0856 0d02          	tnz	(OFST+1,sp)
8077  0858 2706          	jreq	L1124
8078                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8080  085a 721a52bd      	bset	21181,#5
8082  085e 2004          	jra	L3124
8083  0860               L1124:
8084                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8086  0860 721b52bd      	bres	21181,#5
8087  0864               L3124:
8088                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8090  0864 721852bd      	bset	21181,#4
8091                     ; 2682 }
8094  0868 5b03          	addw	sp,#3
8095  086a 81            	ret
8147                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8147                     ; 2699 {
8148                     	switch	.text
8149  086b               L7_TI3_Config:
8151  086b 89            	pushw	x
8152  086c 88            	push	a
8153       00000001      OFST:	set	1
8156                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8158  086d 721152be      	bres	21182,#0
8159                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8159                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8161  0871 7b06          	ld	a,(OFST+5,sp)
8162  0873 97            	ld	xl,a
8163  0874 a610          	ld	a,#16
8164  0876 42            	mul	x,a
8165  0877 9f            	ld	a,xl
8166  0878 1a03          	or	a,(OFST+2,sp)
8167  087a 6b01          	ld	(OFST+0,sp),a
8169  087c c652bb        	ld	a,21179
8170  087f a40c          	and	a,#12
8171  0881 1a01          	or	a,(OFST+0,sp)
8172  0883 c752bb        	ld	21179,a
8173                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8175  0886 0d02          	tnz	(OFST+1,sp)
8176  0888 2706          	jreq	L3424
8177                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8179  088a 721252be      	bset	21182,#1
8181  088e 2004          	jra	L5424
8182  0890               L3424:
8183                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8185  0890 721352be      	bres	21182,#1
8186  0894               L5424:
8187                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8189  0894 721052be      	bset	21182,#0
8190                     ; 2718 }
8193  0898 5b03          	addw	sp,#3
8194  089a 81            	ret
8246                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8246                     ; 2734 {
8247                     	switch	.text
8248  089b               L11_TI4_Config:
8250  089b 89            	pushw	x
8251  089c 88            	push	a
8252       00000001      OFST:	set	1
8255                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8257  089d 721952be      	bres	21182,#4
8258                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8258                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8260  08a1 7b06          	ld	a,(OFST+5,sp)
8261  08a3 97            	ld	xl,a
8262  08a4 a610          	ld	a,#16
8263  08a6 42            	mul	x,a
8264  08a7 9f            	ld	a,xl
8265  08a8 1a03          	or	a,(OFST+2,sp)
8266  08aa 6b01          	ld	(OFST+0,sp),a
8268  08ac c652bc        	ld	a,21180
8269  08af a40c          	and	a,#12
8270  08b1 1a01          	or	a,(OFST+0,sp)
8271  08b3 c752bc        	ld	21180,a
8272                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8274  08b6 0d02          	tnz	(OFST+1,sp)
8275  08b8 2706          	jreq	L5724
8276                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8278  08ba 721a52be      	bset	21182,#5
8280  08be 2004          	jra	L7724
8281  08c0               L5724:
8282                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8284  08c0 721b52be      	bres	21182,#5
8285  08c4               L7724:
8286                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8288  08c4 721852be      	bset	21182,#4
8289                     ; 2755 }
8292  08c8 5b03          	addw	sp,#3
8293  08ca 81            	ret
8306                     	xdef	_TIM1_SelectHallSensor
8307                     	xdef	_TIM1_EncoderInterfaceConfig
8308                     	xdef	_TIM1_ETRConfig
8309                     	xdef	_TIM1_SelectMasterSlaveMode
8310                     	xdef	_TIM1_SelectSlaveMode
8311                     	xdef	_TIM1_SelectOutputTrigger
8312                     	xdef	_TIM1_SelectInputTrigger
8313                     	xdef	_TIM1_ETRClockMode2Config
8314                     	xdef	_TIM1_ETRClockMode1Config
8315                     	xdef	_TIM1_TIxExternalClockConfig
8316                     	xdef	_TIM1_InternalClockConfig
8317                     	xdef	_TIM1_SelectCCDMA
8318                     	xdef	_TIM1_DMACmd
8319                     	xdef	_TIM1_DMAConfig
8320                     	xdef	_TIM1_ClearITPendingBit
8321                     	xdef	_TIM1_GetITStatus
8322                     	xdef	_TIM1_ClearFlag
8323                     	xdef	_TIM1_GetFlagStatus
8324                     	xdef	_TIM1_GenerateEvent
8325                     	xdef	_TIM1_ITConfig
8326                     	xdef	_TIM1_SetIC4Prescaler
8327                     	xdef	_TIM1_SetIC3Prescaler
8328                     	xdef	_TIM1_SetIC2Prescaler
8329                     	xdef	_TIM1_SetIC1Prescaler
8330                     	xdef	_TIM1_GetCapture4
8331                     	xdef	_TIM1_GetCapture3
8332                     	xdef	_TIM1_GetCapture2
8333                     	xdef	_TIM1_GetCapture1
8334                     	xdef	_TIM1_PWMIConfig
8335                     	xdef	_TIM1_ICInit
8336                     	xdef	_TIM1_CCxNCmd
8337                     	xdef	_TIM1_CCxCmd
8338                     	xdef	_TIM1_SelectCOM
8339                     	xdef	_TIM1_SelectOCREFClear
8340                     	xdef	_TIM1_OC3NPolarityConfig
8341                     	xdef	_TIM1_OC3PolarityConfig
8342                     	xdef	_TIM1_OC2NPolarityConfig
8343                     	xdef	_TIM1_OC2PolarityConfig
8344                     	xdef	_TIM1_OC1NPolarityConfig
8345                     	xdef	_TIM1_OC1PolarityConfig
8346                     	xdef	_TIM1_ClearOC4Ref
8347                     	xdef	_TIM1_ClearOC3Ref
8348                     	xdef	_TIM1_ClearOC2Ref
8349                     	xdef	_TIM1_ClearOC1Ref
8350                     	xdef	_TIM1_OC3FastConfig
8351                     	xdef	_TIM1_OC2FastConfig
8352                     	xdef	_TIM1_OC1FastConfig
8353                     	xdef	_TIM1_OC4PreloadConfig
8354                     	xdef	_TIM1_OC3PreloadConfig
8355                     	xdef	_TIM1_OC2PreloadConfig
8356                     	xdef	_TIM1_OC1PreloadConfig
8357                     	xdef	_TIM1_ForcedOC3Config
8358                     	xdef	_TIM1_ForcedOC2Config
8359                     	xdef	_TIM1_ForcedOC1Config
8360                     	xdef	_TIM1_CCPreloadControl
8361                     	xdef	_TIM1_SetCompare4
8362                     	xdef	_TIM1_SetCompare3
8363                     	xdef	_TIM1_SetCompare2
8364                     	xdef	_TIM1_SetCompare1
8365                     	xdef	_TIM1_SelectOCxM
8366                     	xdef	_TIM1_CtrlPWMOutputs
8367                     	xdef	_TIM1_BDTRConfig
8368                     	xdef	_TIM1_OC3Init
8369                     	xdef	_TIM1_OC2Init
8370                     	xdef	_TIM1_OC1Init
8371                     	xdef	_TIM1_Cmd
8372                     	xdef	_TIM1_SelectOnePulseMode
8373                     	xdef	_TIM1_ARRPreloadConfig
8374                     	xdef	_TIM1_UpdateRequestConfig
8375                     	xdef	_TIM1_UpdateDisableConfig
8376                     	xdef	_TIM1_GetPrescaler
8377                     	xdef	_TIM1_GetCounter
8378                     	xdef	_TIM1_SetAutoreload
8379                     	xdef	_TIM1_SetCounter
8380                     	xdef	_TIM1_CounterModeConfig
8381                     	xdef	_TIM1_PrescalerConfig
8382                     	xdef	_TIM1_TimeBaseInit
8383                     	xdef	_TIM1_DeInit
8402                     	end
