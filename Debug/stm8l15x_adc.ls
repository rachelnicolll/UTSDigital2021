   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
 172                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 172                     ; 136 {
 174                     	switch	.text
 175  0000               _ADC_DeInit:
 179                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 181  0000 7f            	clr	(x)
 182                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 184  0001 6f01          	clr	(1,x)
 185                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 187  0003 a61f          	ld	a,#31
 188  0005 e702          	ld	(2,x),a
 189                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 191  0007 a6ff          	ld	a,#255
 192  0009 e703          	ld	(3,x),a
 193                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 195  000b a60f          	ld	a,#15
 196  000d e706          	ld	(6,x),a
 197                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 199  000f a6ff          	ld	a,#255
 200  0011 e707          	ld	(7,x),a
 201                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 203  0013 6f08          	clr	(8,x)
 204                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 206  0015 6f09          	clr	(9,x)
 207                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 209  0017 6f0a          	clr	(10,x)
 210                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 212  0019 6f0b          	clr	(11,x)
 213                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 215  001b 6f0c          	clr	(12,x)
 216                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 218  001d 6f0d          	clr	(13,x)
 219                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 221  001f 6f0e          	clr	(14,x)
 222                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 224  0021 6f0f          	clr	(15,x)
 225                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 227  0023 6f10          	clr	(16,x)
 228                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 230  0025 6f11          	clr	(17,x)
 231                     ; 164 }
 234  0027 81            	ret
 381                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 381                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 381                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 381                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 381                     ; 190 {
 382                     	switch	.text
 383  0028               _ADC_Init:
 385  0028 89            	pushw	x
 386       00000000      OFST:	set	0
 389                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 391                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 393                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 395                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 397  0029 f6            	ld	a,(x)
 398  002a a49b          	and	a,#155
 399  002c f7            	ld	(x),a
 400                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 402  002d 7b05          	ld	a,(OFST+5,sp)
 403  002f 1a06          	or	a,(OFST+6,sp)
 404  0031 fa            	or	a,(x)
 405  0032 f7            	ld	(x),a
 406                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 408  0033 e601          	ld	a,(1,x)
 409  0035 a47f          	and	a,#127
 410  0037 e701          	ld	(1,x),a
 411                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 413  0039 e601          	ld	a,(1,x)
 414  003b 1a07          	or	a,(OFST+7,sp)
 415  003d e701          	ld	(1,x),a
 416                     ; 207 }
 419  003f 85            	popw	x
 420  0040 81            	ret
 487                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 487                     ; 217              FunctionalState NewState)
 487                     ; 218 {
 488                     	switch	.text
 489  0041               _ADC_Cmd:
 491  0041 89            	pushw	x
 492       00000000      OFST:	set	0
 495                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 497                     ; 222   if (NewState != DISABLE)
 499  0042 0d05          	tnz	(OFST+5,sp)
 500  0044 2706          	jreq	L142
 501                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 503  0046 f6            	ld	a,(x)
 504  0047 aa01          	or	a,#1
 505  0049 f7            	ld	(x),a
 507  004a 2006          	jra	L342
 508  004c               L142:
 509                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 511  004c 1e01          	ldw	x,(OFST+1,sp)
 512  004e f6            	ld	a,(x)
 513  004f a4fe          	and	a,#254
 514  0051 f7            	ld	(x),a
 515  0052               L342:
 516                     ; 232 }
 519  0052 85            	popw	x
 520  0053 81            	ret
 558                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 558                     ; 240 {
 559                     	switch	.text
 560  0054               _ADC_SoftwareStartConv:
 564                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 566  0054 f6            	ld	a,(x)
 567  0055 aa02          	or	a,#2
 568  0057 f7            	ld	(x),a
 569                     ; 243 }
 572  0058 81            	ret
 700                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 700                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 700                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 700                     ; 264 {
 701                     	switch	.text
 702  0059               _ADC_ExternalTrigConfig:
 704  0059 89            	pushw	x
 705       00000000      OFST:	set	0
 708                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 710                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 712                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 714  005a e601          	ld	a,(1,x)
 715  005c a487          	and	a,#135
 716  005e e701          	ld	(1,x),a
 717                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 717                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 719  0060 7b06          	ld	a,(OFST+6,sp)
 720  0062 1a05          	or	a,(OFST+5,sp)
 721  0064 ea01          	or	a,(1,x)
 722  0066 e701          	ld	(1,x),a
 723                     ; 276 }
 726  0068 85            	popw	x
 727  0069 81            	ret
1041                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1041                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1041                     ; 341 {
1042                     	switch	.text
1043  006a               _ADC_AnalogWatchdogChannelSelect:
1045  006a 89            	pushw	x
1046       00000000      OFST:	set	0
1049                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1051                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1053  006b e602          	ld	a,(2,x)
1054  006d a4e0          	and	a,#224
1055  006f e702          	ld	(2,x),a
1056                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1058  0071 e602          	ld	a,(2,x)
1059  0073 1a05          	or	a,(OFST+5,sp)
1060  0075 e702          	ld	(2,x),a
1061                     ; 350 }
1064  0077 85            	popw	x
1065  0078 81            	ret
1121                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1121                     ; 362 {
1122                     	switch	.text
1123  0079               _ADC_AnalogWatchdogThresholdsConfig:
1125  0079 89            	pushw	x
1126       00000000      OFST:	set	0
1129                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1131                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1133                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1135  007a 7b05          	ld	a,(OFST+5,sp)
1136  007c 1e01          	ldw	x,(OFST+1,sp)
1137  007e e706          	ld	(6,x),a
1138                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1140  0080 7b06          	ld	a,(OFST+6,sp)
1141  0082 1e01          	ldw	x,(OFST+1,sp)
1142  0084 e707          	ld	(7,x),a
1143                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1145  0086 7b07          	ld	a,(OFST+7,sp)
1146  0088 1e01          	ldw	x,(OFST+1,sp)
1147  008a e708          	ld	(8,x),a
1148                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1150  008c 7b08          	ld	a,(OFST+8,sp)
1151  008e 1e01          	ldw	x,(OFST+1,sp)
1152  0090 e709          	ld	(9,x),a
1153                     ; 374 }
1156  0092 85            	popw	x
1157  0093 81            	ret
1224                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1224                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1224                     ; 414                               uint16_t HighThreshold,
1224                     ; 415                               uint16_t LowThreshold)
1224                     ; 416 {
1225                     	switch	.text
1226  0094               _ADC_AnalogWatchdogConfig:
1228  0094 89            	pushw	x
1229       00000000      OFST:	set	0
1232                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1234                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1236                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1238                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1240  0095 e602          	ld	a,(2,x)
1241  0097 a4e0          	and	a,#224
1242  0099 e702          	ld	(2,x),a
1243                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1245  009b e602          	ld	a,(2,x)
1246  009d 1a05          	or	a,(OFST+5,sp)
1247  009f e702          	ld	(2,x),a
1248                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1250  00a1 7b06          	ld	a,(OFST+6,sp)
1251  00a3 1e01          	ldw	x,(OFST+1,sp)
1252  00a5 e706          	ld	(6,x),a
1253                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1255  00a7 7b07          	ld	a,(OFST+7,sp)
1256  00a9 1e01          	ldw	x,(OFST+1,sp)
1257  00ab e707          	ld	(7,x),a
1258                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1260  00ad 7b08          	ld	a,(OFST+8,sp)
1261  00af 1e01          	ldw	x,(OFST+1,sp)
1262  00b1 e708          	ld	(8,x),a
1263                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1265  00b3 7b09          	ld	a,(OFST+9,sp)
1266  00b5 1e01          	ldw	x,(OFST+1,sp)
1267  00b7 e709          	ld	(9,x),a
1268                     ; 435 }
1271  00b9 85            	popw	x
1272  00ba 81            	ret
1307                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1307                     ; 475 {
1308                     	switch	.text
1309  00bb               _ADC_TempSensorCmd:
1313                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1315                     ; 479   if (NewState != DISABLE)
1317  00bb 4d            	tnz	a
1318  00bc 2706          	jreq	L175
1319                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1321  00be 721a534e      	bset	21326,#5
1323  00c2 2004          	jra	L375
1324  00c4               L175:
1325                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1327  00c4 721b534e      	bres	21326,#5
1328  00c8               L375:
1329                     ; 489 }
1332  00c8 81            	ret
1367                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1367                     ; 498 {
1368                     	switch	.text
1369  00c9               _ADC_VrefintCmd:
1373                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1375                     ; 502   if (NewState != DISABLE)
1377  00c9 4d            	tnz	a
1378  00ca 2706          	jreq	L316
1379                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1381  00cc 7218534e      	bset	21326,#4
1383  00d0 2004          	jra	L516
1384  00d2               L316:
1385                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1387  00d2 7219534e      	bres	21326,#4
1388  00d6               L516:
1389                     ; 512 }
1392  00d6 81            	ret
1704                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1704                     ; 584 {
1705                     	switch	.text
1706  00d7               _ADC_ChannelCmd:
1708  00d7 89            	pushw	x
1709  00d8 88            	push	a
1710       00000001      OFST:	set	1
1713                     ; 585   uint8_t regindex = 0;
1715                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1717                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1719  00d9 7b06          	ld	a,(OFST+5,sp)
1720  00db 6b01          	ld	(OFST+0,sp),a
1722                     ; 591   if (NewState != DISABLE)
1724  00dd 0d08          	tnz	(OFST+7,sp)
1725  00df 270f          	jreq	L367
1726                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1728  00e1 01            	rrwa	x,a
1729  00e2 1b01          	add	a,(OFST+0,sp)
1730  00e4 2401          	jrnc	L23
1731  00e6 5c            	incw	x
1732  00e7               L23:
1733  00e7 02            	rlwa	x,a
1734  00e8 e60a          	ld	a,(10,x)
1735  00ea 1a07          	or	a,(OFST+6,sp)
1736  00ec e70a          	ld	(10,x),a
1738  00ee 200e          	jra	L567
1739  00f0               L367:
1740                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1742  00f0 7b01          	ld	a,(OFST+0,sp)
1743  00f2 5f            	clrw	x
1744  00f3 97            	ld	xl,a
1745  00f4 72fb02        	addw	x,(OFST+1,sp)
1746  00f7 7b07          	ld	a,(OFST+6,sp)
1747  00f9 43            	cpl	a
1748  00fa e40a          	and	a,(10,x)
1749  00fc e70a          	ld	(10,x),a
1750  00fe               L567:
1751                     ; 601 }
1754  00fe 5b03          	addw	sp,#3
1755  0100 81            	ret
1905                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1905                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1905                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1905                     ; 628 {
1906                     	switch	.text
1907  0101               _ADC_SamplingTimeConfig:
1909  0101 89            	pushw	x
1910       00000000      OFST:	set	0
1913                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1915                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1917                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1919  0102 0d05          	tnz	(OFST+5,sp)
1920  0104 2712          	jreq	L3501
1921                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1923  0106 e602          	ld	a,(2,x)
1924  0108 a41f          	and	a,#31
1925  010a e702          	ld	(2,x),a
1926                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1928  010c 7b06          	ld	a,(OFST+6,sp)
1929  010e 4e            	swap	a
1930  010f 48            	sll	a
1931  0110 a4e0          	and	a,#224
1932  0112 ea02          	or	a,(2,x)
1933  0114 e702          	ld	(2,x),a
1935  0116 2010          	jra	L5501
1936  0118               L3501:
1937                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1939  0118 1e01          	ldw	x,(OFST+1,sp)
1940  011a e601          	ld	a,(1,x)
1941  011c a4f8          	and	a,#248
1942  011e e701          	ld	(1,x),a
1943                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1945  0120 1e01          	ldw	x,(OFST+1,sp)
1946  0122 e601          	ld	a,(1,x)
1947  0124 1a06          	or	a,(OFST+6,sp)
1948  0126 e701          	ld	(1,x),a
1949  0128               L5501:
1950                     ; 645 }
1953  0128 85            	popw	x
1954  0129 81            	ret
2021                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2021                     ; 692                               FunctionalState NewState)
2021                     ; 693 {
2022                     	switch	.text
2023  012a               _ADC_SchmittTriggerConfig:
2025  012a 89            	pushw	x
2026  012b 88            	push	a
2027       00000001      OFST:	set	1
2030                     ; 694   uint8_t regindex = 0;
2032                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2034                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2036  012c 7b06          	ld	a,(OFST+5,sp)
2037  012e 6b01          	ld	(OFST+0,sp),a
2039                     ; 700   if (NewState != DISABLE)
2041  0130 0d08          	tnz	(OFST+7,sp)
2042  0132 2710          	jreq	L3111
2043                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2045  0134 01            	rrwa	x,a
2046  0135 1b01          	add	a,(OFST+0,sp)
2047  0137 2401          	jrnc	L04
2048  0139 5c            	incw	x
2049  013a               L04:
2050  013a 02            	rlwa	x,a
2051  013b 7b07          	ld	a,(OFST+6,sp)
2052  013d 43            	cpl	a
2053  013e e40e          	and	a,(14,x)
2054  0140 e70e          	ld	(14,x),a
2056  0142 200d          	jra	L5111
2057  0144               L3111:
2058                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2060  0144 7b01          	ld	a,(OFST+0,sp)
2061  0146 5f            	clrw	x
2062  0147 97            	ld	xl,a
2063  0148 72fb02        	addw	x,(OFST+1,sp)
2064  014b e60e          	ld	a,(14,x)
2065  014d 1a07          	or	a,(OFST+6,sp)
2066  014f e70e          	ld	(14,x),a
2067  0151               L5111:
2068                     ; 710 }
2071  0151 5b03          	addw	sp,#3
2072  0153 81            	ret
2119                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2119                     ; 718 {
2120                     	switch	.text
2121  0154               _ADC_GetConversionValue:
2123  0154 89            	pushw	x
2124  0155 89            	pushw	x
2125       00000002      OFST:	set	2
2128                     ; 719   uint16_t tmpreg = 0;
2130                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2132  0156 e604          	ld	a,(4,x)
2133  0158 5f            	clrw	x
2134  0159 97            	ld	xl,a
2135  015a 1f01          	ldw	(OFST-1,sp),x
2137                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2139  015c 1e01          	ldw	x,(OFST-1,sp)
2140  015e 1603          	ldw	y,(OFST+1,sp)
2141  0160 90e605        	ld	a,(5,y)
2142  0163 02            	rlwa	x,a
2143  0164 1f01          	ldw	(OFST-1,sp),x
2145                     ; 726   return (uint16_t)(tmpreg) ;
2147  0166 1e01          	ldw	x,(OFST-1,sp)
2150  0168 5b04          	addw	sp,#4
2151  016a 81            	ret
2198                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2198                     ; 761 {
2199                     	switch	.text
2200  016b               _ADC_DMACmd:
2202  016b 89            	pushw	x
2203       00000000      OFST:	set	0
2206                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2208                     ; 765   if (NewState != DISABLE)
2210  016c 0d05          	tnz	(OFST+5,sp)
2211  016e 2708          	jreq	L7611
2212                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2214  0170 e60a          	ld	a,(10,x)
2215  0172 a47f          	and	a,#127
2216  0174 e70a          	ld	(10,x),a
2218  0176 2008          	jra	L1711
2219  0178               L7611:
2220                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2222  0178 1e01          	ldw	x,(OFST+1,sp)
2223  017a e60a          	ld	a,(10,x)
2224  017c aa80          	or	a,#128
2225  017e e70a          	ld	(10,x),a
2226  0180               L1711:
2227                     ; 775 }
2230  0180 85            	popw	x
2231  0181 81            	ret
2315                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2315                     ; 832 {
2316                     	switch	.text
2317  0182               _ADC_ITConfig:
2319  0182 89            	pushw	x
2320       00000000      OFST:	set	0
2323                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2325                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2327                     ; 837   if (NewState != DISABLE)
2329  0183 0d06          	tnz	(OFST+6,sp)
2330  0185 2706          	jreq	L5321
2331                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2333  0187 f6            	ld	a,(x)
2334  0188 1a05          	or	a,(OFST+5,sp)
2335  018a f7            	ld	(x),a
2337  018b 2007          	jra	L7321
2338  018d               L5321:
2339                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2341  018d 1e01          	ldw	x,(OFST+1,sp)
2342  018f 7b05          	ld	a,(OFST+5,sp)
2343  0191 43            	cpl	a
2344  0192 f4            	and	a,(x)
2345  0193 f7            	ld	(x),a
2346  0194               L7321:
2347                     ; 847 }
2350  0194 85            	popw	x
2351  0195 81            	ret
2456                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2456                     ; 860 {
2457                     	switch	.text
2458  0196               _ADC_GetFlagStatus:
2460  0196 89            	pushw	x
2461  0197 88            	push	a
2462       00000001      OFST:	set	1
2465                     ; 861   FlagStatus flagstatus = RESET;
2467                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2469                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2471  0198 e603          	ld	a,(3,x)
2472  019a 1506          	bcp	a,(OFST+5,sp)
2473  019c 2706          	jreq	L3131
2474                     ; 870     flagstatus = SET;
2476  019e a601          	ld	a,#1
2477  01a0 6b01          	ld	(OFST+0,sp),a
2480  01a2 2002          	jra	L5131
2481  01a4               L3131:
2482                     ; 875     flagstatus = RESET;
2484  01a4 0f01          	clr	(OFST+0,sp)
2486  01a6               L5131:
2487                     ; 879   return  flagstatus;
2489  01a6 7b01          	ld	a,(OFST+0,sp)
2492  01a8 5b03          	addw	sp,#3
2493  01aa 81            	ret
2540                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2540                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2540                     ; 894 {
2541                     	switch	.text
2542  01ab               _ADC_ClearFlag:
2544  01ab 89            	pushw	x
2545       00000000      OFST:	set	0
2548                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2550                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2552  01ac 7b05          	ld	a,(OFST+5,sp)
2553  01ae 43            	cpl	a
2554  01af 1e01          	ldw	x,(OFST+1,sp)
2555  01b1 e703          	ld	(3,x),a
2556                     ; 900 }
2559  01b3 85            	popw	x
2560  01b4 81            	ret
2636                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2636                     ; 913                          ADC_IT_TypeDef ADC_IT)
2636                     ; 914 {
2637                     	switch	.text
2638  01b5               _ADC_GetITStatus:
2640  01b5 89            	pushw	x
2641  01b6 5203          	subw	sp,#3
2642       00000003      OFST:	set	3
2645                     ; 915   ITStatus itstatus = RESET;
2647                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2651                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2653                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2655  01b8 7b08          	ld	a,(OFST+5,sp)
2656  01ba 44            	srl	a
2657  01bb 44            	srl	a
2658  01bc 44            	srl	a
2659  01bd 6b03          	ld	(OFST+0,sp),a
2661                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2661                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2663  01bf 7b03          	ld	a,(OFST+0,sp)
2664  01c1 a403          	and	a,#3
2665  01c3 6b01          	ld	(OFST-2,sp),a
2667  01c5 7b03          	ld	a,(OFST+0,sp)
2668  01c7 a410          	and	a,#16
2669  01c9 44            	srl	a
2670  01ca 44            	srl	a
2671  01cb 1a01          	or	a,(OFST-2,sp)
2672  01cd 6b03          	ld	(OFST+0,sp),a
2674                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2676  01cf f6            	ld	a,(x)
2677  01d0 1408          	and	a,(OFST+5,sp)
2678  01d2 6b02          	ld	(OFST-1,sp),a
2680                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2682  01d4 e603          	ld	a,(3,x)
2683  01d6 1503          	bcp	a,(OFST+0,sp)
2684  01d8 270a          	jreq	L3041
2686  01da 0d02          	tnz	(OFST-1,sp)
2687  01dc 2706          	jreq	L3041
2688                     ; 933     itstatus = SET;
2690  01de a601          	ld	a,#1
2691  01e0 6b03          	ld	(OFST+0,sp),a
2694  01e2 2002          	jra	L5041
2695  01e4               L3041:
2696                     ; 938     itstatus = RESET;
2698  01e4 0f03          	clr	(OFST+0,sp)
2700  01e6               L5041:
2701                     ; 942   return  itstatus;
2703  01e6 7b03          	ld	a,(OFST+0,sp)
2706  01e8 5b05          	addw	sp,#5
2707  01ea 81            	ret
2764                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2764                     ; 956                            ADC_IT_TypeDef ADC_IT)
2764                     ; 957 {
2765                     	switch	.text
2766  01eb               _ADC_ClearITPendingBit:
2768  01eb 89            	pushw	x
2769  01ec 89            	pushw	x
2770       00000002      OFST:	set	2
2773                     ; 958   uint8_t itmask = 0;
2775                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2777                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2779  01ed 7b07          	ld	a,(OFST+5,sp)
2780  01ef 44            	srl	a
2781  01f0 44            	srl	a
2782  01f1 44            	srl	a
2783  01f2 6b02          	ld	(OFST+0,sp),a
2785                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2785                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2787  01f4 7b02          	ld	a,(OFST+0,sp)
2788  01f6 a403          	and	a,#3
2789  01f8 6b01          	ld	(OFST-1,sp),a
2791  01fa 7b02          	ld	a,(OFST+0,sp)
2792  01fc a410          	and	a,#16
2793  01fe 44            	srl	a
2794  01ff 44            	srl	a
2795  0200 1a01          	or	a,(OFST-1,sp)
2796  0202 6b02          	ld	(OFST+0,sp),a
2798                     ; 969   ADCx->SR = (uint8_t)~itmask;
2800  0204 7b02          	ld	a,(OFST+0,sp)
2801  0206 43            	cpl	a
2802  0207 1e03          	ldw	x,(OFST+1,sp)
2803  0209 e703          	ld	(3,x),a
2804                     ; 970 }
2807  020b 5b04          	addw	sp,#4
2808  020d 81            	ret
2821                     	xdef	_ADC_ClearITPendingBit
2822                     	xdef	_ADC_GetITStatus
2823                     	xdef	_ADC_ClearFlag
2824                     	xdef	_ADC_GetFlagStatus
2825                     	xdef	_ADC_ITConfig
2826                     	xdef	_ADC_DMACmd
2827                     	xdef	_ADC_GetConversionValue
2828                     	xdef	_ADC_SchmittTriggerConfig
2829                     	xdef	_ADC_SamplingTimeConfig
2830                     	xdef	_ADC_ChannelCmd
2831                     	xdef	_ADC_VrefintCmd
2832                     	xdef	_ADC_TempSensorCmd
2833                     	xdef	_ADC_AnalogWatchdogConfig
2834                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2835                     	xdef	_ADC_AnalogWatchdogChannelSelect
2836                     	xdef	_ADC_ExternalTrigConfig
2837                     	xdef	_ADC_SoftwareStartConv
2838                     	xdef	_ADC_Cmd
2839                     	xdef	_ADC_Init
2840                     	xdef	_ADC_DeInit
2859                     	end
