   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 140 void DMA_GlobalDeInit(void)
  41                     ; 141 {
  43                     	switch	.text
  44  0000               _DMA_GlobalDeInit:
  48                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  50  0000 72115070      	bres	20592,#0
  51                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  53  0004 35fc5070      	mov	20592,#252
  54                     ; 147 }
  57  0008 81            	ret
 173                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 173                     ; 156 {
 174                     	switch	.text
 175  0009               _DMA_DeInit:
 177  0009 89            	pushw	x
 178       00000000      OFST:	set	0
 181                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 183                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 185  000a f6            	ld	a,(x)
 186  000b a4fe          	and	a,#254
 187  000d f7            	ld	(x),a
 188                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 190  000e 7f            	clr	(x)
 191                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 193  000f 6f02          	clr	(2,x)
 194                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 196  0011 a35093        	cpw	x,#20627
 197  0014 2608          	jrne	L501
 198                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 200  0016 a640          	ld	a,#64
 201  0018 e703          	ld	(3,x),a
 202                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 204  001a 6f05          	clr	(5,x)
 206  001c 2006          	jra	L701
 207  001e               L501:
 208                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 210  001e 1e01          	ldw	x,(OFST+1,sp)
 211  0020 a652          	ld	a,#82
 212  0022 e703          	ld	(3,x),a
 213  0024               L701:
 214                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 216  0024 1e01          	ldw	x,(OFST+1,sp)
 217  0026 6f04          	clr	(4,x)
 218                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 220  0028 1e01          	ldw	x,(OFST+1,sp)
 221  002a 6f06          	clr	(6,x)
 222                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 224  002c 1e01          	ldw	x,(OFST+1,sp)
 225  002e 6f07          	clr	(7,x)
 226                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 228  0030 1e01          	ldw	x,(OFST+1,sp)
 229  0032 6f01          	clr	(1,x)
 230                     ; 187 }
 233  0034 85            	popw	x
 234  0035 81            	ret
 480                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 480                     ; 225               uint32_t DMA_Memory0BaseAddr,
 480                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 480                     ; 227               uint8_t DMA_BufferSize,
 480                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 480                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 480                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 480                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 480                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 480                     ; 233 {
 481                     	switch	.text
 482  0036               _DMA_Init:
 484  0036 89            	pushw	x
 485       00000000      OFST:	set	0
 488                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 490                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 492                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 494                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 496                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 498                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 500                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 502  0037 f6            	ld	a,(x)
 503  0038 a4fe          	and	a,#254
 504  003a f7            	ld	(x),a
 505                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 507  003b 7f            	clr	(x)
 508                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 508                     ; 251                                            (uint8_t)DMA_Mode) | \
 508                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 510  003c 7b0c          	ld	a,(OFST+12,sp)
 511  003e 1a0d          	or	a,(OFST+13,sp)
 512  0040 1a0e          	or	a,(OFST+14,sp)
 513  0042 fa            	or	a,(x)
 514  0043 f7            	ld	(x),a
 515                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 517  0044 e601          	ld	a,(1,x)
 518  0046 a4c7          	and	a,#199
 519  0048 e701          	ld	(1,x),a
 520                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 520                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 522  004a 7b0f          	ld	a,(OFST+15,sp)
 523  004c 1a10          	or	a,(OFST+16,sp)
 524  004e ea01          	or	a,(1,x)
 525  0050 e701          	ld	(1,x),a
 526                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 528  0052 7b0b          	ld	a,(OFST+11,sp)
 529  0054 1e01          	ldw	x,(OFST+1,sp)
 530  0056 e702          	ld	(2,x),a
 531                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 533  0058 7b09          	ld	a,(OFST+9,sp)
 534  005a 1e01          	ldw	x,(OFST+1,sp)
 535  005c e703          	ld	(3,x),a
 536                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 538  005e 7b0a          	ld	a,(OFST+10,sp)
 539  0060 1e01          	ldw	x,(OFST+1,sp)
 540  0062 e704          	ld	(4,x),a
 541                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 543  0064 1e01          	ldw	x,(OFST+1,sp)
 544  0066 a35093        	cpw	x,#20627
 545  0069 2606          	jrne	L742
 546                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 548  006b 7b06          	ld	a,(OFST+6,sp)
 549  006d 1e01          	ldw	x,(OFST+1,sp)
 550  006f e705          	ld	(5,x),a
 551  0071               L742:
 552                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 554  0071 7b07          	ld	a,(OFST+7,sp)
 555  0073 1e01          	ldw	x,(OFST+1,sp)
 556  0075 e706          	ld	(6,x),a
 557                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 559  0077 7b08          	ld	a,(OFST+8,sp)
 560  0079 1e01          	ldw	x,(OFST+1,sp)
 561  007b e707          	ld	(7,x),a
 562                     ; 280 }
 565  007d 85            	popw	x
 566  007e 81            	ret
 621                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 621                     ; 289 {
 622                     	switch	.text
 623  007f               _DMA_GlobalCmd:
 627                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 629                     ; 293   if (NewState != DISABLE)
 631  007f 4d            	tnz	a
 632  0080 2706          	jreq	L772
 633                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 635  0082 72105070      	bset	20592,#0
 637  0086 2004          	jra	L103
 638  0088               L772:
 639                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 641  0088 72115070      	bres	20592,#0
 642  008c               L103:
 643                     ; 303 }
 646  008c 81            	ret
 693                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 693                     ; 315 {
 694                     	switch	.text
 695  008d               _DMA_Cmd:
 697  008d 89            	pushw	x
 698       00000000      OFST:	set	0
 701                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 703                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 705                     ; 320   if (NewState != DISABLE)
 707  008e 0d05          	tnz	(OFST+5,sp)
 708  0090 2706          	jreq	L723
 709                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 711  0092 f6            	ld	a,(x)
 712  0093 aa01          	or	a,#1
 713  0095 f7            	ld	(x),a
 715  0096 2006          	jra	L133
 716  0098               L723:
 717                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 719  0098 1e01          	ldw	x,(OFST+1,sp)
 720  009a f6            	ld	a,(x)
 721  009b a4fe          	and	a,#254
 722  009d f7            	ld	(x),a
 723  009e               L133:
 724                     ; 330 }
 727  009e 85            	popw	x
 728  009f 81            	ret
 762                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 762                     ; 343 {
 763                     	switch	.text
 764  00a0               _DMA_SetTimeOut:
 768                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 770                     ; 348   DMA1->GCSR = 0;
 772  00a0 725f5070      	clr	20592
 773                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 775  00a4 48            	sll	a
 776  00a5 48            	sll	a
 777  00a6 c75070        	ld	20592,a
 778                     ; 351 }
 781  00a9 81            	ret
 828                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 828                     ; 402 {
 829                     	switch	.text
 830  00aa               _DMA_SetCurrDataCounter:
 832  00aa 89            	pushw	x
 833       00000000      OFST:	set	0
 836                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 838                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 840  00ab 7b05          	ld	a,(OFST+5,sp)
 841  00ad 1e01          	ldw	x,(OFST+1,sp)
 842  00af e702          	ld	(2,x),a
 843                     ; 408 }
 846  00b1 85            	popw	x
 847  00b2 81            	ret
 885                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 885                     ; 416 {
 886                     	switch	.text
 887  00b3               _DMA_GetCurrDataCounter:
 891                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 893                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 895  00b3 e602          	ld	a,(2,x)
 898  00b5 81            	ret
 975                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 975                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 975                     ; 484                   FunctionalState NewState)
 975                     ; 485 {
 976                     	switch	.text
 977  00b6               _DMA_ITConfig:
 979  00b6 89            	pushw	x
 980       00000000      OFST:	set	0
 983                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 985                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 987                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 989                     ; 491   if (NewState != DISABLE)
 991  00b7 0d06          	tnz	(OFST+6,sp)
 992  00b9 2706          	jreq	L554
 993                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 995  00bb f6            	ld	a,(x)
 996  00bc 1a05          	or	a,(OFST+5,sp)
 997  00be f7            	ld	(x),a
 999  00bf 2007          	jra	L754
1000  00c1               L554:
1001                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
1003  00c1 1e01          	ldw	x,(OFST+1,sp)
1004  00c3 7b05          	ld	a,(OFST+5,sp)
1005  00c5 43            	cpl	a
1006  00c6 f4            	and	a,(x)
1007  00c7 f7            	ld	(x),a
1008  00c8               L754:
1009                     ; 501 }
1012  00c8 85            	popw	x
1013  00c9 81            	ret
1262                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1262                     ; 531 {
1263                     	switch	.text
1264  00ca               _DMA_GetFlagStatus:
1266  00ca 89            	pushw	x
1267  00cb 5204          	subw	sp,#4
1268       00000004      OFST:	set	4
1271                     ; 532   FlagStatus flagstatus = RESET;
1273                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1275                     ; 534   uint8_t tmpgir1 = 0;
1277                     ; 535   uint8_t tmpgcsr = 0;
1279                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1281                     ; 541   tmpgcsr = DMA1->GCSR;
1283  00cd c65070        	ld	a,20592
1284  00d0 6b04          	ld	(OFST+0,sp),a
1286                     ; 542   tmpgir1 = DMA1->GIR1;
1288  00d2 c65071        	ld	a,20593
1289  00d5 6b01          	ld	(OFST-3,sp),a
1291                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1293  00d7 01            	rrwa	x,a
1294  00d8 9f            	ld	a,xl
1295  00d9 a40f          	and	a,#15
1296  00db 97            	ld	xl,a
1297  00dc 4f            	clr	a
1298  00dd 02            	rlwa	x,a
1299  00de 5d            	tnzw	x
1300  00df 2736          	jreq	L706
1301                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1303  00e1 7b05          	ld	a,(OFST+1,sp)
1304  00e3 a501          	bcp	a,#1
1305  00e5 2707          	jreq	L116
1306                     ; 549       DMA_Channelx = DMA1_Channel0;
1308  00e7 ae5075        	ldw	x,#20597
1309  00ea 1f02          	ldw	(OFST-2,sp),x
1312  00ec 201f          	jra	L316
1313  00ee               L116:
1314                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1316  00ee 7b05          	ld	a,(OFST+1,sp)
1317  00f0 a502          	bcp	a,#2
1318  00f2 2707          	jreq	L516
1319                     ; 553       DMA_Channelx = DMA1_Channel1;
1321  00f4 ae507f        	ldw	x,#20607
1322  00f7 1f02          	ldw	(OFST-2,sp),x
1325  00f9 2012          	jra	L316
1326  00fb               L516:
1327                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1329  00fb 7b05          	ld	a,(OFST+1,sp)
1330  00fd a504          	bcp	a,#4
1331  00ff 2707          	jreq	L126
1332                     ; 557       DMA_Channelx = DMA1_Channel2;
1334  0101 ae5089        	ldw	x,#20617
1335  0104 1f02          	ldw	(OFST-2,sp),x
1338  0106 2005          	jra	L316
1339  0108               L126:
1340                     ; 561       DMA_Channelx = DMA1_Channel3;
1342  0108 ae5093        	ldw	x,#20627
1343  010b 1f02          	ldw	(OFST-2,sp),x
1345  010d               L316:
1346                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1348  010d 1e02          	ldw	x,(OFST-2,sp)
1349  010f e601          	ld	a,(1,x)
1350  0111 1406          	and	a,(OFST+2,sp)
1351  0113 6b04          	ld	(OFST+0,sp),a
1354  0115 2014          	jra	L526
1355  0117               L706:
1356                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1358  0117 7b05          	ld	a,(OFST+1,sp)
1359  0119 a510          	bcp	a,#16
1360  011b 2708          	jreq	L726
1361                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1363  011d 7b06          	ld	a,(OFST+2,sp)
1364  011f 1401          	and	a,(OFST-3,sp)
1365  0121 6b04          	ld	(OFST+0,sp),a
1368  0123 2006          	jra	L526
1369  0125               L726:
1370                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1372  0125 7b04          	ld	a,(OFST+0,sp)
1373  0127 a402          	and	a,#2
1374  0129 6b04          	ld	(OFST+0,sp),a
1376  012b               L526:
1377                     ; 579   return (flagstatus);
1379  012b 7b04          	ld	a,(OFST+0,sp)
1382  012d 5b06          	addw	sp,#6
1383  012f 81            	ret
1430                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1430                     ; 598 {
1431                     	switch	.text
1432  0130               _DMA_ClearFlag:
1434  0130 89            	pushw	x
1435  0131 89            	pushw	x
1436       00000002      OFST:	set	2
1439                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1441                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1443                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1445  0132 01            	rrwa	x,a
1446  0133 9f            	ld	a,xl
1447  0134 a401          	and	a,#1
1448  0136 97            	ld	xl,a
1449  0137 4f            	clr	a
1450  0138 02            	rlwa	x,a
1451  0139 5d            	tnzw	x
1452  013a 2707          	jreq	L756
1453                     ; 607     DMA_Channelx = DMA1_Channel0;
1455  013c ae5075        	ldw	x,#20597
1456  013f 1f01          	ldw	(OFST-1,sp),x
1459  0141 201f          	jra	L166
1460  0143               L756:
1461                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1463  0143 7b03          	ld	a,(OFST+1,sp)
1464  0145 a502          	bcp	a,#2
1465  0147 2707          	jreq	L366
1466                     ; 613       DMA_Channelx = DMA1_Channel1;
1468  0149 ae507f        	ldw	x,#20607
1469  014c 1f01          	ldw	(OFST-1,sp),x
1472  014e 2012          	jra	L166
1473  0150               L366:
1474                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1476  0150 7b03          	ld	a,(OFST+1,sp)
1477  0152 a504          	bcp	a,#4
1478  0154 2707          	jreq	L766
1479                     ; 619         DMA_Channelx = DMA1_Channel2;
1481  0156 ae5089        	ldw	x,#20617
1482  0159 1f01          	ldw	(OFST-1,sp),x
1485  015b 2005          	jra	L166
1486  015d               L766:
1487                     ; 623         DMA_Channelx = DMA1_Channel3;
1489  015d ae5093        	ldw	x,#20627
1490  0160 1f01          	ldw	(OFST-1,sp),x
1492  0162               L166:
1493                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1495  0162 1e01          	ldw	x,(OFST-1,sp)
1496  0164 7b04          	ld	a,(OFST+2,sp)
1497  0166 a406          	and	a,#6
1498  0168 43            	cpl	a
1499  0169 e401          	and	a,(1,x)
1500  016b e701          	ld	(1,x),a
1501                     ; 630 }
1504  016d 5b04          	addw	sp,#4
1505  016f 81            	ret
1643                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1643                     ; 647 {
1644                     	switch	.text
1645  0170               _DMA_GetITStatus:
1647  0170 88            	push	a
1648  0171 5204          	subw	sp,#4
1649       00000004      OFST:	set	4
1652                     ; 648   ITStatus itstatus = RESET;
1654                     ; 649   uint8_t tmpreg = 0;
1656                     ; 650   uint8_t tmp2 = 0;
1658                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1660                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1662                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1664  0173 a510          	bcp	a,#16
1665  0175 2707          	jreq	L757
1666                     ; 659     DMA_Channelx = DMA1_Channel0;
1668  0177 ae5075        	ldw	x,#20597
1669  017a 1f03          	ldw	(OFST-1,sp),x
1672  017c 201f          	jra	L167
1673  017e               L757:
1674                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1676  017e 7b05          	ld	a,(OFST+1,sp)
1677  0180 a520          	bcp	a,#32
1678  0182 2707          	jreq	L367
1679                     ; 665       DMA_Channelx = DMA1_Channel1;
1681  0184 ae507f        	ldw	x,#20607
1682  0187 1f03          	ldw	(OFST-1,sp),x
1685  0189 2012          	jra	L167
1686  018b               L367:
1687                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1689  018b 7b05          	ld	a,(OFST+1,sp)
1690  018d a540          	bcp	a,#64
1691  018f 2707          	jreq	L767
1692                     ; 671         DMA_Channelx = DMA1_Channel2;
1694  0191 ae5089        	ldw	x,#20617
1695  0194 1f03          	ldw	(OFST-1,sp),x
1698  0196 2005          	jra	L167
1699  0198               L767:
1700                     ; 675         DMA_Channelx = DMA1_Channel3;
1702  0198 ae5093        	ldw	x,#20627
1703  019b 1f03          	ldw	(OFST-1,sp),x
1705  019d               L167:
1706                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1708  019d 1e03          	ldw	x,(OFST-1,sp)
1709  019f e601          	ld	a,(1,x)
1710  01a1 6b01          	ld	(OFST-3,sp),a
1712                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1714  01a3 1e03          	ldw	x,(OFST-1,sp)
1715  01a5 7b01          	ld	a,(OFST-3,sp)
1716  01a7 f4            	and	a,(x)
1717  01a8 6b01          	ld	(OFST-3,sp),a
1719                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1721  01aa 7b05          	ld	a,(OFST+1,sp)
1722  01ac a406          	and	a,#6
1723  01ae 6b02          	ld	(OFST-2,sp),a
1725                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1727  01b0 7b01          	ld	a,(OFST-3,sp)
1728  01b2 1402          	and	a,(OFST-2,sp)
1729  01b4 6b02          	ld	(OFST-2,sp),a
1731                     ; 686   return (itstatus);
1733  01b6 7b02          	ld	a,(OFST-2,sp)
1736  01b8 5b05          	addw	sp,#5
1737  01ba 81            	ret
1785                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1785                     ; 705 {
1786                     	switch	.text
1787  01bb               _DMA_ClearITPendingBit:
1789  01bb 88            	push	a
1790  01bc 89            	pushw	x
1791       00000002      OFST:	set	2
1794                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1796                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1798                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1800  01bd a510          	bcp	a,#16
1801  01bf 2707          	jreq	L7101
1802                     ; 713     DMA_Channelx = DMA1_Channel0;
1804  01c1 ae5075        	ldw	x,#20597
1805  01c4 1f01          	ldw	(OFST-1,sp),x
1808  01c6 201f          	jra	L1201
1809  01c8               L7101:
1810                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1812  01c8 7b03          	ld	a,(OFST+1,sp)
1813  01ca a520          	bcp	a,#32
1814  01cc 2707          	jreq	L3201
1815                     ; 719       DMA_Channelx = DMA1_Channel1;
1817  01ce ae507f        	ldw	x,#20607
1818  01d1 1f01          	ldw	(OFST-1,sp),x
1821  01d3 2012          	jra	L1201
1822  01d5               L3201:
1823                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1825  01d5 7b03          	ld	a,(OFST+1,sp)
1826  01d7 a540          	bcp	a,#64
1827  01d9 2707          	jreq	L7201
1828                     ; 725         DMA_Channelx = DMA1_Channel2;
1830  01db ae5089        	ldw	x,#20617
1831  01de 1f01          	ldw	(OFST-1,sp),x
1834  01e0 2005          	jra	L1201
1835  01e2               L7201:
1836                     ; 729         DMA_Channelx = DMA1_Channel3;
1838  01e2 ae5093        	ldw	x,#20627
1839  01e5 1f01          	ldw	(OFST-1,sp),x
1841  01e7               L1201:
1842                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1844  01e7 1e01          	ldw	x,(OFST-1,sp)
1845  01e9 7b03          	ld	a,(OFST+1,sp)
1846  01eb a406          	and	a,#6
1847  01ed 43            	cpl	a
1848  01ee e401          	and	a,(1,x)
1849  01f0 e701          	ld	(1,x),a
1850                     ; 735 }
1853  01f2 5b03          	addw	sp,#3
1854  01f4 81            	ret
1867                     	xdef	_DMA_ClearITPendingBit
1868                     	xdef	_DMA_GetITStatus
1869                     	xdef	_DMA_ClearFlag
1870                     	xdef	_DMA_GetFlagStatus
1871                     	xdef	_DMA_ITConfig
1872                     	xdef	_DMA_GetCurrDataCounter
1873                     	xdef	_DMA_SetCurrDataCounter
1874                     	xdef	_DMA_SetTimeOut
1875                     	xdef	_DMA_Cmd
1876                     	xdef	_DMA_GlobalCmd
1877                     	xdef	_DMA_Init
1878                     	xdef	_DMA_DeInit
1879                     	xdef	_DMA_GlobalDeInit
1898                     	end
