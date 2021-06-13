   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
 134                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 134                     ; 129 {
 136                     	switch	.text
 137  0000               _SPI_DeInit:
 141                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 143  0000 7f            	clr	(x)
 144                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 146  0001 6f01          	clr	(1,x)
 147                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 149  0003 6f02          	clr	(2,x)
 150                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 152  0005 a602          	ld	a,#2
 153  0007 e703          	ld	(3,x),a
 154                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 156  0009 a607          	ld	a,#7
 157  000b e705          	ld	(5,x),a
 158                     ; 135 }
 161  000d 81            	ret
 487                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 487                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 487                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 487                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 487                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 487                     ; 182 {
 488                     	switch	.text
 489  000e               _SPI_Init:
 491  000e 89            	pushw	x
 492  000f 88            	push	a
 493       00000001      OFST:	set	1
 496                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 498                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 500                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 502                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 504                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 506                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 508                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 510                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 512                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 512                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 512                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 512                     ; 197                                   SPI_CPHA));
 514  0010 7b09          	ld	a,(OFST+8,sp)
 515  0012 1a0a          	or	a,(OFST+9,sp)
 516  0014 6b01          	ld	(OFST+0,sp),a
 518  0016 7b06          	ld	a,(OFST+5,sp)
 519  0018 1a07          	or	a,(OFST+6,sp)
 520  001a 1a01          	or	a,(OFST+0,sp)
 521  001c 1e02          	ldw	x,(OFST+1,sp)
 522  001e f7            	ld	(x),a
 523                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 525  001f 7b0b          	ld	a,(OFST+10,sp)
 526  0021 1a0c          	or	a,(OFST+11,sp)
 527  0023 1e02          	ldw	x,(OFST+1,sp)
 528  0025 e701          	ld	(1,x),a
 529                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 531  0027 7b08          	ld	a,(OFST+7,sp)
 532  0029 a104          	cp	a,#4
 533  002b 260a          	jrne	L562
 534                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 536  002d 1e02          	ldw	x,(OFST+1,sp)
 537  002f e601          	ld	a,(1,x)
 538  0031 aa01          	or	a,#1
 539  0033 e701          	ld	(1,x),a
 541  0035 2008          	jra	L762
 542  0037               L562:
 543                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 545  0037 1e02          	ldw	x,(OFST+1,sp)
 546  0039 e601          	ld	a,(1,x)
 547  003b a4fe          	and	a,#254
 548  003d e701          	ld	(1,x),a
 549  003f               L762:
 550                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 552  003f 1e02          	ldw	x,(OFST+1,sp)
 553  0041 f6            	ld	a,(x)
 554  0042 1a08          	or	a,(OFST+7,sp)
 555  0044 f7            	ld	(x),a
 556                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 558  0045 7b0d          	ld	a,(OFST+12,sp)
 559  0047 1e02          	ldw	x,(OFST+1,sp)
 560  0049 e705          	ld	(5,x),a
 561                     ; 216 }
 564  004b 5b03          	addw	sp,#3
 565  004d 81            	ret
 632                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 632                     ; 226 {
 633                     	switch	.text
 634  004e               _SPI_Cmd:
 636  004e 89            	pushw	x
 637       00000000      OFST:	set	0
 640                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 642                     ; 230   if (NewState != DISABLE)
 644  004f 0d05          	tnz	(OFST+5,sp)
 645  0051 2706          	jreq	L523
 646                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 648  0053 f6            	ld	a,(x)
 649  0054 aa40          	or	a,#64
 650  0056 f7            	ld	(x),a
 652  0057 2006          	jra	L723
 653  0059               L523:
 654                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 656  0059 1e01          	ldw	x,(OFST+1,sp)
 657  005b f6            	ld	a,(x)
 658  005c a4bf          	and	a,#191
 659  005e f7            	ld	(x),a
 660  005f               L723:
 661                     ; 238 }
 664  005f 85            	popw	x
 665  0060 81            	ret
 713                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 713                     ; 248 {
 714                     	switch	.text
 715  0061               _SPI_NSSInternalSoftwareCmd:
 717  0061 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 723                     ; 252   if (NewState != DISABLE)
 725  0062 0d05          	tnz	(OFST+5,sp)
 726  0064 2708          	jreq	L553
 727                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 729  0066 e601          	ld	a,(1,x)
 730  0068 aa01          	or	a,#1
 731  006a e701          	ld	(1,x),a
 733  006c 2008          	jra	L753
 734  006e               L553:
 735                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 737  006e 1e01          	ldw	x,(OFST+1,sp)
 738  0070 e601          	ld	a,(1,x)
 739  0072 a4fe          	and	a,#254
 740  0074 e701          	ld	(1,x),a
 741  0076               L753:
 742                     ; 260 }
 745  0076 85            	popw	x
 746  0077 81            	ret
 814                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 814                     ; 272 {
 815                     	switch	.text
 816  0078               _SPI_BiDirectionalLineConfig:
 818  0078 89            	pushw	x
 819       00000000      OFST:	set	0
 822                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 824                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 826  0079 0d05          	tnz	(OFST+5,sp)
 827  007b 2708          	jreq	L514
 828                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 830  007d e601          	ld	a,(1,x)
 831  007f aa40          	or	a,#64
 832  0081 e701          	ld	(1,x),a
 834  0083 2008          	jra	L714
 835  0085               L514:
 836                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 838  0085 1e01          	ldw	x,(OFST+1,sp)
 839  0087 e601          	ld	a,(1,x)
 840  0089 a4bf          	and	a,#191
 841  008b e701          	ld	(1,x),a
 842  008d               L714:
 843                     ; 284 }
 846  008d 85            	popw	x
 847  008e 81            	ret
 893                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 893                     ; 320 {
 894                     	switch	.text
 895  008f               _SPI_SendData:
 897  008f 89            	pushw	x
 898       00000000      OFST:	set	0
 901                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 903  0090 7b05          	ld	a,(OFST+5,sp)
 904  0092 1e01          	ldw	x,(OFST+1,sp)
 905  0094 e704          	ld	(4,x),a
 906                     ; 322 }
 909  0096 85            	popw	x
 910  0097 81            	ret
 947                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 947                     ; 330 {
 948                     	switch	.text
 949  0098               _SPI_ReceiveData:
 953                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 955  0098 e604          	ld	a,(4,x)
 958  009a 81            	ret
 995                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 995                     ; 415 {
 996                     	switch	.text
 997  009b               _SPI_TransmitCRC:
1001                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1003  009b e601          	ld	a,(1,x)
1004  009d aa10          	or	a,#16
1005  009f e701          	ld	(1,x),a
1006                     ; 417 }
1009  00a1 81            	ret
1058                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1058                     ; 427 {
1059                     	switch	.text
1060  00a2               _SPI_CalculateCRCCmd:
1062  00a2 89            	pushw	x
1063       00000000      OFST:	set	0
1066                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1068                     ; 432   SPI_Cmd(SPI1, DISABLE);
1070  00a3 4b00          	push	#0
1071  00a5 ae5200        	ldw	x,#20992
1072  00a8 ada4          	call	_SPI_Cmd
1074  00aa 84            	pop	a
1075                     ; 434   if (NewState != DISABLE)
1077  00ab 0d05          	tnz	(OFST+5,sp)
1078  00ad 270a          	jreq	L135
1079                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1081  00af 1e01          	ldw	x,(OFST+1,sp)
1082  00b1 e601          	ld	a,(1,x)
1083  00b3 aa20          	or	a,#32
1084  00b5 e701          	ld	(1,x),a
1086  00b7 2008          	jra	L335
1087  00b9               L135:
1088                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1090  00b9 1e01          	ldw	x,(OFST+1,sp)
1091  00bb e601          	ld	a,(1,x)
1092  00bd a4df          	and	a,#223
1093  00bf e701          	ld	(1,x),a
1094  00c1               L335:
1095                     ; 442 }
1098  00c1 85            	popw	x
1099  00c2 81            	ret
1175                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1175                     ; 454 {
1176                     	switch	.text
1177  00c3               _SPI_GetCRC:
1179  00c3 89            	pushw	x
1180  00c4 88            	push	a
1181       00000001      OFST:	set	1
1184                     ; 455   uint8_t crcreg = 0;
1186                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1188                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1190  00c5 0d06          	tnz	(OFST+5,sp)
1191  00c7 2706          	jreq	L575
1192                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1194  00c9 e607          	ld	a,(7,x)
1195  00cb 6b01          	ld	(OFST+0,sp),a
1198  00cd 2006          	jra	L775
1199  00cf               L575:
1200                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1202  00cf 1e02          	ldw	x,(OFST+1,sp)
1203  00d1 e606          	ld	a,(6,x)
1204  00d3 6b01          	ld	(OFST+0,sp),a
1206  00d5               L775:
1207                     ; 470   return crcreg;
1209  00d5 7b01          	ld	a,(OFST+0,sp)
1212  00d7 5b03          	addw	sp,#3
1213  00d9 81            	ret
1252                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1252                     ; 479 {
1253                     	switch	.text
1254  00da               _SPI_ResetCRC:
1256  00da 89            	pushw	x
1257       00000000      OFST:	set	0
1260                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1262  00db 4b01          	push	#1
1263  00dd adc3          	call	_SPI_CalculateCRCCmd
1265  00df 84            	pop	a
1266                     ; 485   SPI_Cmd(SPIx, ENABLE);
1268  00e0 4b01          	push	#1
1269  00e2 1e02          	ldw	x,(OFST+2,sp)
1270  00e4 cd004e        	call	_SPI_Cmd
1272  00e7 84            	pop	a
1273                     ; 486 }
1276  00e8 85            	popw	x
1277  00e9 81            	ret
1315                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1315                     ; 494 {
1316                     	switch	.text
1317  00ea               _SPI_GetCRCPolynomial:
1321                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1323  00ea e605          	ld	a,(5,x)
1326  00ec 81            	ret
1403                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1403                     ; 526 {
1404                     	switch	.text
1405  00ed               _SPI_DMACmd:
1407  00ed 89            	pushw	x
1408       00000000      OFST:	set	0
1411                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1413                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1415                     ; 531   if (NewState != DISABLE)
1417  00ee 0d06          	tnz	(OFST+6,sp)
1418  00f0 2708          	jreq	L107
1419                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1421  00f2 e602          	ld	a,(2,x)
1422  00f4 1a05          	or	a,(OFST+5,sp)
1423  00f6 e702          	ld	(2,x),a
1425  00f8 2009          	jra	L307
1426  00fa               L107:
1427                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1429  00fa 1e01          	ldw	x,(OFST+1,sp)
1430  00fc 7b05          	ld	a,(OFST+5,sp)
1431  00fe 43            	cpl	a
1432  00ff e402          	and	a,(2,x)
1433  0101 e702          	ld	(2,x),a
1434  0103               L307:
1435                     ; 541 }
1438  0103 85            	popw	x
1439  0104 81            	ret
1560                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1560                     ; 627 {
1561                     	switch	.text
1562  0105               _SPI_ITConfig:
1564  0105 89            	pushw	x
1565  0106 88            	push	a
1566       00000001      OFST:	set	1
1569                     ; 628   uint8_t itpos = 0;
1571                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1573                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1575                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1577  0107 7b06          	ld	a,(OFST+5,sp)
1578  0109 a40f          	and	a,#15
1579  010b 5f            	clrw	x
1580  010c 97            	ld	xl,a
1581  010d a601          	ld	a,#1
1582  010f 5d            	tnzw	x
1583  0110 2704          	jreq	L04
1584  0112               L24:
1585  0112 48            	sll	a
1586  0113 5a            	decw	x
1587  0114 26fc          	jrne	L24
1588  0116               L04:
1589  0116 6b01          	ld	(OFST+0,sp),a
1591                     ; 636   if (NewState != DISABLE)
1593  0118 0d07          	tnz	(OFST+6,sp)
1594  011a 270a          	jreq	L367
1595                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1597  011c 1e02          	ldw	x,(OFST+1,sp)
1598  011e e602          	ld	a,(2,x)
1599  0120 1a01          	or	a,(OFST+0,sp)
1600  0122 e702          	ld	(2,x),a
1602  0124 2009          	jra	L567
1603  0126               L367:
1604                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1606  0126 1e02          	ldw	x,(OFST+1,sp)
1607  0128 7b01          	ld	a,(OFST+0,sp)
1608  012a 43            	cpl	a
1609  012b e402          	and	a,(2,x)
1610  012d e702          	ld	(2,x),a
1611  012f               L567:
1612                     ; 644 }
1615  012f 5b03          	addw	sp,#3
1616  0131 81            	ret
1749                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1749                     ; 662 {
1750                     	switch	.text
1751  0132               _SPI_GetFlagStatus:
1753  0132 89            	pushw	x
1754  0133 88            	push	a
1755       00000001      OFST:	set	1
1758                     ; 663   FlagStatus status = RESET;
1760                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1762                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1764  0134 e603          	ld	a,(3,x)
1765  0136 1506          	bcp	a,(OFST+5,sp)
1766  0138 2706          	jreq	L1501
1767                     ; 670     status = SET; /* SPI_FLAG is set */
1769  013a a601          	ld	a,#1
1770  013c 6b01          	ld	(OFST+0,sp),a
1773  013e 2002          	jra	L3501
1774  0140               L1501:
1775                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1777  0140 0f01          	clr	(OFST+0,sp)
1779  0142               L3501:
1780                     ; 678   return status;
1782  0142 7b01          	ld	a,(OFST+0,sp)
1785  0144 5b03          	addw	sp,#3
1786  0146 81            	ret
1833                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1833                     ; 697 {
1834                     	switch	.text
1835  0147               _SPI_ClearFlag:
1837  0147 89            	pushw	x
1838       00000000      OFST:	set	0
1841                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1843                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1845  0148 7b05          	ld	a,(OFST+5,sp)
1846  014a 43            	cpl	a
1847  014b 1e01          	ldw	x,(OFST+1,sp)
1848  014d e703          	ld	(3,x),a
1849                     ; 701 }
1852  014f 85            	popw	x
1853  0150 81            	ret
1947                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1947                     ; 718 {
1948                     	switch	.text
1949  0151               _SPI_GetITStatus:
1951  0151 89            	pushw	x
1952  0152 5203          	subw	sp,#3
1953       00000003      OFST:	set	3
1956                     ; 719   ITStatus pendingbitstatus = RESET;
1958                     ; 720   uint8_t itpos = 0;
1960                     ; 721   uint8_t itmask1 = 0;
1962                     ; 722   uint8_t itmask2 = 0;
1964                     ; 723   __IO uint8_t enablestatus = 0;
1966  0154 0f02          	clr	(OFST-1,sp)
1968                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1970                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1972  0156 7b08          	ld	a,(OFST+5,sp)
1973  0158 a40f          	and	a,#15
1974  015a 5f            	clrw	x
1975  015b 97            	ld	xl,a
1976  015c a601          	ld	a,#1
1977  015e 5d            	tnzw	x
1978  015f 2704          	jreq	L25
1979  0161               L45:
1980  0161 48            	sll	a
1981  0162 5a            	decw	x
1982  0163 26fc          	jrne	L45
1983  0165               L25:
1984  0165 6b01          	ld	(OFST-2,sp),a
1986                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1988  0167 7b08          	ld	a,(OFST+5,sp)
1989  0169 4e            	swap	a
1990  016a a40f          	and	a,#15
1991  016c 6b03          	ld	(OFST+0,sp),a
1993                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1995  016e 7b03          	ld	a,(OFST+0,sp)
1996  0170 5f            	clrw	x
1997  0171 97            	ld	xl,a
1998  0172 a601          	ld	a,#1
1999  0174 5d            	tnzw	x
2000  0175 2704          	jreq	L65
2001  0177               L06:
2002  0177 48            	sll	a
2003  0178 5a            	decw	x
2004  0179 26fc          	jrne	L06
2005  017b               L65:
2006  017b 6b03          	ld	(OFST+0,sp),a
2008                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2010  017d 1e04          	ldw	x,(OFST+1,sp)
2011  017f e603          	ld	a,(3,x)
2012  0181 1403          	and	a,(OFST+0,sp)
2013  0183 6b02          	ld	(OFST-1,sp),a
2015                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2017  0185 1e04          	ldw	x,(OFST+1,sp)
2018  0187 e602          	ld	a,(2,x)
2019  0189 1501          	bcp	a,(OFST-2,sp)
2020  018b 270a          	jreq	L1511
2022  018d 0d02          	tnz	(OFST-1,sp)
2023  018f 2706          	jreq	L1511
2024                     ; 738     pendingbitstatus = SET;
2026  0191 a601          	ld	a,#1
2027  0193 6b03          	ld	(OFST+0,sp),a
2030  0195 2002          	jra	L3511
2031  0197               L1511:
2032                     ; 743     pendingbitstatus = RESET;
2034  0197 0f03          	clr	(OFST+0,sp)
2036  0199               L3511:
2037                     ; 746   return  pendingbitstatus;
2039  0199 7b03          	ld	a,(OFST+0,sp)
2042  019b 5b05          	addw	sp,#5
2043  019d 81            	ret
2100                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2100                     ; 765 {
2101                     	switch	.text
2102  019e               _SPI_ClearITPendingBit:
2104  019e 89            	pushw	x
2105  019f 88            	push	a
2106       00000001      OFST:	set	1
2109                     ; 766   uint8_t itpos = 0;
2111                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2113                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2115  01a0 7b06          	ld	a,(OFST+5,sp)
2116  01a2 a4f0          	and	a,#240
2117  01a4 4e            	swap	a
2118  01a5 a40f          	and	a,#15
2119  01a7 5f            	clrw	x
2120  01a8 97            	ld	xl,a
2121  01a9 a601          	ld	a,#1
2122  01ab 5d            	tnzw	x
2123  01ac 2704          	jreq	L46
2124  01ae               L66:
2125  01ae 48            	sll	a
2126  01af 5a            	decw	x
2127  01b0 26fc          	jrne	L66
2128  01b2               L46:
2129  01b2 6b01          	ld	(OFST+0,sp),a
2131                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2133  01b4 7b01          	ld	a,(OFST+0,sp)
2134  01b6 43            	cpl	a
2135  01b7 1e02          	ldw	x,(OFST+1,sp)
2136  01b9 e703          	ld	(3,x),a
2137                     ; 776 }
2140  01bb 5b03          	addw	sp,#3
2141  01bd 81            	ret
2154                     	xdef	_SPI_ClearITPendingBit
2155                     	xdef	_SPI_GetITStatus
2156                     	xdef	_SPI_ClearFlag
2157                     	xdef	_SPI_GetFlagStatus
2158                     	xdef	_SPI_ITConfig
2159                     	xdef	_SPI_DMACmd
2160                     	xdef	_SPI_GetCRCPolynomial
2161                     	xdef	_SPI_ResetCRC
2162                     	xdef	_SPI_GetCRC
2163                     	xdef	_SPI_CalculateCRCCmd
2164                     	xdef	_SPI_TransmitCRC
2165                     	xdef	_SPI_ReceiveData
2166                     	xdef	_SPI_SendData
2167                     	xdef	_SPI_BiDirectionalLineConfig
2168                     	xdef	_SPI_NSSInternalSoftwareCmd
2169                     	xdef	_SPI_Cmd
2170                     	xdef	_SPI_Init
2171                     	xdef	_SPI_DeInit
2190                     	end
