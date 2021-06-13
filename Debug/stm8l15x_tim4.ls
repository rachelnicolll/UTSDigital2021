   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 130 void TIM4_DeInit(void)
  41                     ; 131 {
  43                     	switch	.text
  44  0000               _TIM4_DeInit:
  48                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  50  0000 725f52e0      	clr	21216
  51                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  53  0004 725f52e1      	clr	21217
  54                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  56  0008 725f52e2      	clr	21218
  57                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  59  000c 725f52e4      	clr	21220
  60                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  62  0010 725f52e7      	clr	21223
  63                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  65  0014 725f52e8      	clr	21224
  66                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  68  0018 35ff52e9      	mov	21225,#255
  69                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  71  001c 725f52e5      	clr	21221
  72                     ; 140 }
  75  0020 81            	ret
 243                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 243                     ; 166                        uint8_t TIM4_Period)
 243                     ; 167 {
 244                     	switch	.text
 245  0021               _TIM4_TimeBaseInit:
 249                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 251                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 253  0021 9f            	ld	a,xl
 254  0022 c752e9        	ld	21225,a
 255                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 257  0025 9e            	ld	a,xh
 258  0026 c752e8        	ld	21224,a
 259                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 261  0029 350152e6      	mov	21222,#1
 262                     ; 177 }
 265  002d 81            	ret
 333                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 333                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 333                     ; 207 {
 334                     	switch	.text
 335  002e               _TIM4_PrescalerConfig:
 339                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 341                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 343                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 345  002e 9e            	ld	a,xh
 346  002f c752e8        	ld	21224,a
 347                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 349  0032 9f            	ld	a,xl
 350  0033 a101          	cp	a,#1
 351  0035 2606          	jrne	L141
 352                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 354  0037 721052e6      	bset	21222,#0
 356  003b 2004          	jra	L341
 357  003d               L141:
 358                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 360  003d 721152e6      	bres	21222,#0
 361  0041               L341:
 362                     ; 224 }
 365  0041 81            	ret
 399                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 399                     ; 233 {
 400                     	switch	.text
 401  0042               _TIM4_SetCounter:
 405                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 407  0042 c752e7        	ld	21223,a
 408                     ; 236 }
 411  0045 81            	ret
 445                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 445                     ; 245 {
 446                     	switch	.text
 447  0046               _TIM4_SetAutoreload:
 451                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 453  0046 c752e9        	ld	21225,a
 454                     ; 248 }
 457  0049 81            	ret
 491                     ; 255 uint8_t TIM4_GetCounter(void)
 491                     ; 256 {
 492                     	switch	.text
 493  004a               _TIM4_GetCounter:
 495  004a 88            	push	a
 496       00000001      OFST:	set	1
 499                     ; 257   uint8_t tmpcntr = 0;
 501                     ; 258   tmpcntr = TIM4->CNTR;
 503  004b c652e7        	ld	a,21223
 504  004e 6b01          	ld	(OFST+0,sp),a
 506                     ; 260   return ((uint8_t)tmpcntr);
 508  0050 7b01          	ld	a,(OFST+0,sp)
 511  0052 5b01          	addw	sp,#1
 512  0054 81            	ret
 536                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 536                     ; 285 {
 537                     	switch	.text
 538  0055               _TIM4_GetPrescaler:
 542                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 544  0055 c652e8        	ld	a,21224
 547  0058 81            	ret
 603                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 603                     ; 297 {
 604                     	switch	.text
 605  0059               _TIM4_UpdateDisableConfig:
 609                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 611                     ; 302   if (NewState != DISABLE)
 613  0059 4d            	tnz	a
 614  005a 2706          	jreq	L552
 615                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 617  005c 721252e0      	bset	21216,#1
 619  0060 2004          	jra	L752
 620  0062               L552:
 621                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 623  0062 721352e0      	bres	21216,#1
 624  0066               L752:
 625                     ; 310 }
 628  0066 81            	ret
 686                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 686                     ; 321 {
 687                     	switch	.text
 688  0067               _TIM4_UpdateRequestConfig:
 692                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 694                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 696  0067 a101          	cp	a,#1
 697  0069 2606          	jrne	L703
 698                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 700  006b 721452e0      	bset	21216,#2
 702  006f 2004          	jra	L113
 703  0071               L703:
 704                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 706  0071 721552e0      	bres	21216,#2
 707  0075               L113:
 708                     ; 334 }
 711  0075 81            	ret
 747                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 747                     ; 343 {
 748                     	switch	.text
 749  0076               _TIM4_ARRPreloadConfig:
 753                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 755                     ; 348   if (NewState != DISABLE)
 757  0076 4d            	tnz	a
 758  0077 2706          	jreq	L133
 759                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 761  0079 721e52e0      	bset	21216,#7
 763  007d 2004          	jra	L333
 764  007f               L133:
 765                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 767  007f 721f52e0      	bres	21216,#7
 768  0083               L333:
 769                     ; 356 }
 772  0083 81            	ret
 829                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 829                     ; 367 {
 830                     	switch	.text
 831  0084               _TIM4_SelectOnePulseMode:
 835                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 837                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 839  0084 a101          	cp	a,#1
 840  0086 2606          	jrne	L363
 841                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 843  0088 721652e0      	bset	21216,#3
 845  008c 2004          	jra	L563
 846  008e               L363:
 847                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 849  008e 721752e0      	bres	21216,#3
 850  0092               L563:
 851                     ; 380 }
 854  0092 81            	ret
 889                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 889                     ; 389 {
 890                     	switch	.text
 891  0093               _TIM4_Cmd:
 895                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 897                     ; 394   if (NewState != DISABLE)
 899  0093 4d            	tnz	a
 900  0094 2706          	jreq	L504
 901                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 903  0096 721052e0      	bset	21216,#0
 905  009a 2004          	jra	L704
 906  009c               L504:
 907                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 909  009c 721152e0      	bres	21216,#0
 910  00a0               L704:
 911                     ; 402 }
 914  00a0 81            	ret
 979                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 979                     ; 431 {
 980                     	switch	.text
 981  00a1               _TIM4_ITConfig:
 983  00a1 89            	pushw	x
 984       00000000      OFST:	set	0
 987                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 989                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 991                     ; 436   if (NewState != DISABLE)
 993  00a2 9f            	ld	a,xl
 994  00a3 4d            	tnz	a
 995  00a4 2709          	jreq	L344
 996                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 998  00a6 9e            	ld	a,xh
 999  00a7 ca52e4        	or	a,21220
1000  00aa c752e4        	ld	21220,a
1002  00ad 2009          	jra	L544
1003  00af               L344:
1004                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1006  00af 7b01          	ld	a,(OFST+1,sp)
1007  00b1 43            	cpl	a
1008  00b2 c452e4        	and	a,21220
1009  00b5 c752e4        	ld	21220,a
1010  00b8               L544:
1011                     ; 446 }
1014  00b8 85            	popw	x
1015  00b9 81            	ret
1072                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1072                     ; 457 {
1073                     	switch	.text
1074  00ba               _TIM4_GenerateEvent:
1078                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1080                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1082  00ba ca52e6        	or	a,21222
1083  00bd c752e6        	ld	21222,a
1084                     ; 463 }
1087  00c0 81            	ret
1173                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1173                     ; 475 {
1174                     	switch	.text
1175  00c1               _TIM4_GetFlagStatus:
1177  00c1 88            	push	a
1178       00000001      OFST:	set	1
1181                     ; 476   FlagStatus bitstatus = RESET;
1183                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1185                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1187  00c2 c452e5        	and	a,21221
1188  00c5 2706          	jreq	L735
1189                     ; 483     bitstatus = SET;
1191  00c7 a601          	ld	a,#1
1192  00c9 6b01          	ld	(OFST+0,sp),a
1195  00cb 2002          	jra	L145
1196  00cd               L735:
1197                     ; 487     bitstatus = RESET;
1199  00cd 0f01          	clr	(OFST+0,sp)
1201  00cf               L145:
1202                     ; 489   return ((FlagStatus)bitstatus);
1204  00cf 7b01          	ld	a,(OFST+0,sp)
1207  00d1 5b01          	addw	sp,#1
1208  00d3 81            	ret
1243                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1243                     ; 501 {
1244                     	switch	.text
1245  00d4               _TIM4_ClearFlag:
1249                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1251                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1253  00d4 43            	cpl	a
1254  00d5 c752e5        	ld	21221,a
1255                     ; 506 }
1258  00d8 81            	ret
1322                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1322                     ; 519 {
1323                     	switch	.text
1324  00d9               _TIM4_GetITStatus:
1326  00d9 88            	push	a
1327  00da 89            	pushw	x
1328       00000002      OFST:	set	2
1331                     ; 520   ITStatus bitstatus = RESET;
1333                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1337                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1339                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1341  00db c452e5        	and	a,21221
1342  00de 6b01          	ld	(OFST-1,sp),a
1344                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1346  00e0 c652e4        	ld	a,21220
1347  00e3 1403          	and	a,(OFST+1,sp)
1348  00e5 6b02          	ld	(OFST+0,sp),a
1350                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1352  00e7 0d01          	tnz	(OFST-1,sp)
1353  00e9 270a          	jreq	L316
1355  00eb 0d02          	tnz	(OFST+0,sp)
1356  00ed 2706          	jreq	L316
1357                     ; 533     bitstatus = (ITStatus)SET;
1359  00ef a601          	ld	a,#1
1360  00f1 6b02          	ld	(OFST+0,sp),a
1363  00f3 2002          	jra	L516
1364  00f5               L316:
1365                     ; 537     bitstatus = (ITStatus)RESET;
1367  00f5 0f02          	clr	(OFST+0,sp)
1369  00f7               L516:
1370                     ; 539   return ((ITStatus)bitstatus);
1372  00f7 7b02          	ld	a,(OFST+0,sp)
1375  00f9 5b03          	addw	sp,#3
1376  00fb 81            	ret
1412                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1412                     ; 551 {
1413                     	switch	.text
1414  00fc               _TIM4_ClearITPendingBit:
1418                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1420                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1422  00fc 43            	cpl	a
1423  00fd c752e5        	ld	21221,a
1424                     ; 557 }
1427  0100 81            	ret
1486                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1486                     ; 569 {
1487                     	switch	.text
1488  0101               _TIM4_DMACmd:
1490  0101 89            	pushw	x
1491       00000000      OFST:	set	0
1494                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1496                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1498                     ; 574   if (NewState != DISABLE)
1500  0102 9f            	ld	a,xl
1501  0103 4d            	tnz	a
1502  0104 2709          	jreq	L566
1503                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1505  0106 9e            	ld	a,xh
1506  0107 ca52e3        	or	a,21219
1507  010a c752e3        	ld	21219,a
1509  010d 2009          	jra	L766
1510  010f               L566:
1511                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1513  010f 7b01          	ld	a,(OFST+1,sp)
1514  0111 43            	cpl	a
1515  0112 c452e3        	and	a,21219
1516  0115 c752e3        	ld	21219,a
1517  0118               L766:
1518                     ; 584 }
1521  0118 85            	popw	x
1522  0119 81            	ret
1546                     ; 607 void TIM4_InternalClockConfig(void)
1546                     ; 608 {
1547                     	switch	.text
1548  011a               _TIM4_InternalClockConfig:
1552                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1554  011a c652e2        	ld	a,21218
1555  011d a4f8          	and	a,#248
1556  011f c752e2        	ld	21218,a
1557                     ; 611 }
1560  0122 81            	ret
1644                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1644                     ; 652 {
1645                     	switch	.text
1646  0123               _TIM4_SelectInputTrigger:
1648  0123 88            	push	a
1649  0124 88            	push	a
1650       00000001      OFST:	set	1
1653                     ; 653   uint8_t tmpsmcr = 0;
1655                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1657                     ; 658   tmpsmcr = TIM4->SMCR;
1659  0125 c652e2        	ld	a,21218
1660  0128 6b01          	ld	(OFST+0,sp),a
1662                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1664  012a 7b01          	ld	a,(OFST+0,sp)
1665  012c a48f          	and	a,#143
1666  012e 6b01          	ld	(OFST+0,sp),a
1668                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1670  0130 7b01          	ld	a,(OFST+0,sp)
1671  0132 1a02          	or	a,(OFST+1,sp)
1672  0134 6b01          	ld	(OFST+0,sp),a
1674                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1676  0136 7b01          	ld	a,(OFST+0,sp)
1677  0138 c752e2        	ld	21218,a
1678                     ; 665 }
1681  013b 85            	popw	x
1682  013c 81            	ret
1757                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1757                     ; 677 {
1758                     	switch	.text
1759  013d               _TIM4_SelectOutputTrigger:
1761  013d 88            	push	a
1762  013e 88            	push	a
1763       00000001      OFST:	set	1
1766                     ; 678   uint8_t tmpcr2 = 0;
1768                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1770                     ; 683   tmpcr2 = TIM4->CR2;
1772  013f c652e1        	ld	a,21217
1773  0142 6b01          	ld	(OFST+0,sp),a
1775                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1777  0144 7b01          	ld	a,(OFST+0,sp)
1778  0146 a48f          	and	a,#143
1779  0148 6b01          	ld	(OFST+0,sp),a
1781                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1783  014a 7b01          	ld	a,(OFST+0,sp)
1784  014c 1a02          	or	a,(OFST+1,sp)
1785  014e 6b01          	ld	(OFST+0,sp),a
1787                     ; 691   TIM4->CR2 = tmpcr2;
1789  0150 7b01          	ld	a,(OFST+0,sp)
1790  0152 c752e1        	ld	21217,a
1791                     ; 692 }
1794  0155 85            	popw	x
1795  0156 81            	ret
1886                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1886                     ; 707 {
1887                     	switch	.text
1888  0157               _TIM4_SelectSlaveMode:
1890  0157 88            	push	a
1891  0158 88            	push	a
1892       00000001      OFST:	set	1
1895                     ; 708   uint8_t tmpsmcr = 0;
1897                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1899                     ; 713   tmpsmcr = TIM4->SMCR;
1901  0159 c652e2        	ld	a,21218
1902  015c 6b01          	ld	(OFST+0,sp),a
1904                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1906  015e 7b01          	ld	a,(OFST+0,sp)
1907  0160 a4f8          	and	a,#248
1908  0162 6b01          	ld	(OFST+0,sp),a
1910                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1912  0164 7b01          	ld	a,(OFST+0,sp)
1913  0166 1a02          	or	a,(OFST+1,sp)
1914  0168 6b01          	ld	(OFST+0,sp),a
1916                     ; 721   TIM4->SMCR = tmpsmcr;
1918  016a 7b01          	ld	a,(OFST+0,sp)
1919  016c c752e2        	ld	21218,a
1920                     ; 722 }
1923  016f 85            	popw	x
1924  0170 81            	ret
1960                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1960                     ; 731 {
1961                     	switch	.text
1962  0171               _TIM4_SelectMasterSlaveMode:
1966                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1968                     ; 736   if (NewState != DISABLE)
1970  0171 4d            	tnz	a
1971  0172 2706          	jreq	L1501
1972                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1974  0174 721e52e2      	bset	21218,#7
1976  0178 2004          	jra	L3501
1977  017a               L1501:
1978                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1980  017a 721f52e2      	bres	21218,#7
1981  017e               L3501:
1982                     ; 744 }
1985  017e 81            	ret
1998                     	xdef	_TIM4_SelectMasterSlaveMode
1999                     	xdef	_TIM4_SelectSlaveMode
2000                     	xdef	_TIM4_SelectOutputTrigger
2001                     	xdef	_TIM4_SelectInputTrigger
2002                     	xdef	_TIM4_InternalClockConfig
2003                     	xdef	_TIM4_DMACmd
2004                     	xdef	_TIM4_ClearITPendingBit
2005                     	xdef	_TIM4_GetITStatus
2006                     	xdef	_TIM4_ClearFlag
2007                     	xdef	_TIM4_GetFlagStatus
2008                     	xdef	_TIM4_GenerateEvent
2009                     	xdef	_TIM4_ITConfig
2010                     	xdef	_TIM4_Cmd
2011                     	xdef	_TIM4_SelectOnePulseMode
2012                     	xdef	_TIM4_ARRPreloadConfig
2013                     	xdef	_TIM4_UpdateRequestConfig
2014                     	xdef	_TIM4_UpdateDisableConfig
2015                     	xdef	_TIM4_GetPrescaler
2016                     	xdef	_TIM4_GetCounter
2017                     	xdef	_TIM4_SetAutoreload
2018                     	xdef	_TIM4_SetCounter
2019                     	xdef	_TIM4_PrescalerConfig
2020                     	xdef	_TIM4_TimeBaseInit
2021                     	xdef	_TIM4_DeInit
2040                     	end
