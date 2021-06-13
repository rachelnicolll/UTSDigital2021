   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
 161                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 161                     ; 149 {
 163                     	switch	.text
 164  0000               _USART_DeInit:
 168                     ; 153   (void) USARTx->SR;
 170  0000 f6            	ld	a,(x)
 171                     ; 154   (void) USARTx->DR;
 173  0001 e601          	ld	a,(1,x)
 174                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 176  0003 6f03          	clr	(3,x)
 177                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 179  0005 6f02          	clr	(2,x)
 180                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 182  0007 6f04          	clr	(4,x)
 183                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 185  0009 6f05          	clr	(5,x)
 186                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 188  000b 6f06          	clr	(6,x)
 189                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 191  000d 6f07          	clr	(7,x)
 192                     ; 163 }
 195  000f 81            	ret
 387                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 387                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 387                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 387                     ; 195 {
 388                     	switch	.text
 389  0010               _USART_Init:
 391  0010 89            	pushw	x
 392  0011 5204          	subw	sp,#4
 393       00000004      OFST:	set	4
 396                     ; 196   uint32_t BaudRate_Mantissa = 0;
 398                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 400                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 402                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 404                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 406                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 408                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 410  0013 e604          	ld	a,(4,x)
 411  0015 a4e9          	and	a,#233
 412  0017 e704          	ld	(4,x),a
 413                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 415  0019 7b0d          	ld	a,(OFST+9,sp)
 416  001b 1a0f          	or	a,(OFST+11,sp)
 417  001d ea04          	or	a,(4,x)
 418  001f e704          	ld	(4,x),a
 419                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 421  0021 e606          	ld	a,(6,x)
 422  0023 a4cf          	and	a,#207
 423  0025 e706          	ld	(6,x),a
 424                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 426  0027 e606          	ld	a,(6,x)
 427  0029 1a0e          	or	a,(OFST+10,sp)
 428  002b e706          	ld	(6,x),a
 429                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 431  002d 6f02          	clr	(2,x)
 432                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 434  002f e603          	ld	a,(3,x)
 435  0031 a40f          	and	a,#15
 436  0033 e703          	ld	(3,x),a
 437                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 439  0035 e603          	ld	a,(3,x)
 440  0037 a4f0          	and	a,#240
 441  0039 e703          	ld	(3,x),a
 442                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 444  003b cd0000        	call	_CLK_GetClockFreq
 446  003e 96            	ldw	x,sp
 447  003f 1c0009        	addw	x,#OFST+5
 448  0042 cd0000        	call	c_ludv
 450  0045 96            	ldw	x,sp
 451  0046 1c0001        	addw	x,#OFST-3
 452  0049 cd0000        	call	c_rtol
 455                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 457  004c 7b03          	ld	a,(OFST-1,sp)
 458  004e a4f0          	and	a,#240
 459  0050 1e05          	ldw	x,(OFST+1,sp)
 460  0052 e703          	ld	(3,x),a
 461                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 463  0054 1e05          	ldw	x,(OFST+1,sp)
 464  0056 7b04          	ld	a,(OFST+0,sp)
 465  0058 a40f          	and	a,#15
 466  005a ea03          	or	a,(3,x)
 467  005c e703          	ld	(3,x),a
 468                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 470  005e 96            	ldw	x,sp
 471  005f 1c0001        	addw	x,#OFST-3
 472  0062 cd0000        	call	c_ltor
 474  0065 a604          	ld	a,#4
 475  0067 cd0000        	call	c_lursh
 477  006a b603          	ld	a,c_lreg+3
 478  006c 1e05          	ldw	x,(OFST+1,sp)
 479  006e e702          	ld	(2,x),a
 480                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 482  0070 1e05          	ldw	x,(OFST+1,sp)
 483  0072 e605          	ld	a,(5,x)
 484  0074 a4f3          	and	a,#243
 485  0076 e705          	ld	(5,x),a
 486                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 488  0078 1e05          	ldw	x,(OFST+1,sp)
 489  007a e605          	ld	a,(5,x)
 490  007c 1a10          	or	a,(OFST+12,sp)
 491  007e e705          	ld	(5,x),a
 492                     ; 239 }
 495  0080 5b06          	addw	sp,#6
 496  0082 81            	ret
 656                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 656                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 656                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 656                     ; 267 {
 657                     	switch	.text
 658  0083               _USART_ClockInit:
 660  0083 89            	pushw	x
 661       00000000      OFST:	set	0
 664                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 666                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 668                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 670                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 672                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 674  0084 e606          	ld	a,(6,x)
 675  0086 a4f8          	and	a,#248
 676  0088 e706          	ld	(6,x),a
 677                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 679  008a 7b06          	ld	a,(OFST+6,sp)
 680  008c 1a07          	or	a,(OFST+7,sp)
 681  008e 1a08          	or	a,(OFST+8,sp)
 682  0090 ea06          	or	a,(6,x)
 683  0092 e706          	ld	(6,x),a
 684                     ; 279   if (USART_Clock != USART_Clock_Disable)
 686  0094 0d05          	tnz	(OFST+5,sp)
 687  0096 2708          	jreq	L523
 688                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 690  0098 e606          	ld	a,(6,x)
 691  009a aa08          	or	a,#8
 692  009c e706          	ld	(6,x),a
 694  009e 2008          	jra	L723
 695  00a0               L523:
 696                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 698  00a0 1e01          	ldw	x,(OFST+1,sp)
 699  00a2 e606          	ld	a,(6,x)
 700  00a4 a4f7          	and	a,#247
 701  00a6 e706          	ld	(6,x),a
 702  00a8               L723:
 703                     ; 287 }
 706  00a8 85            	popw	x
 707  00a9 81            	ret
 774                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 774                     ; 297 {
 775                     	switch	.text
 776  00aa               _USART_Cmd:
 778  00aa 89            	pushw	x
 779       00000000      OFST:	set	0
 782                     ; 298   if (NewState != DISABLE)
 784  00ab 0d05          	tnz	(OFST+5,sp)
 785  00ad 2708          	jreq	L563
 786                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 788  00af e604          	ld	a,(4,x)
 789  00b1 a4df          	and	a,#223
 790  00b3 e704          	ld	(4,x),a
 792  00b5 2008          	jra	L763
 793  00b7               L563:
 794                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 796  00b7 1e01          	ldw	x,(OFST+1,sp)
 797  00b9 e604          	ld	a,(4,x)
 798  00bb aa20          	or	a,#32
 799  00bd e704          	ld	(4,x),a
 800  00bf               L763:
 801                     ; 306 }
 804  00bf 85            	popw	x
 805  00c0 81            	ret
 851                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 851                     ; 330 {
 852                     	switch	.text
 853  00c1               _USART_SetPrescaler:
 855  00c1 89            	pushw	x
 856       00000000      OFST:	set	0
 859                     ; 332   USARTx->PSCR = USART_Prescaler;
 861  00c2 7b05          	ld	a,(OFST+5,sp)
 862  00c4 1e01          	ldw	x,(OFST+1,sp)
 863  00c6 e70a          	ld	(10,x),a
 864                     ; 333 }
 867  00c8 85            	popw	x
 868  00c9 81            	ret
 905                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 905                     ; 341 {
 906                     	switch	.text
 907  00ca               _USART_SendBreak:
 911                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 913  00ca e605          	ld	a,(5,x)
 914  00cc aa01          	or	a,#1
 915  00ce e705          	ld	(5,x),a
 916                     ; 343 }
 919  00d0 81            	ret
 956                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 956                     ; 383 {
 957                     	switch	.text
 958  00d1               _USART_ReceiveData8:
 962                     ; 384   return USARTx->DR;
 964  00d1 e601          	ld	a,(1,x)
 967  00d3 81            	ret
1013                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1013                     ; 393 {
1014                     	switch	.text
1015  00d4               _USART_ReceiveData9:
1017  00d4 89            	pushw	x
1018  00d5 89            	pushw	x
1019       00000002      OFST:	set	2
1022                     ; 394   uint16_t temp = 0;
1024                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1026  00d6 e604          	ld	a,(4,x)
1027  00d8 5f            	clrw	x
1028  00d9 a480          	and	a,#128
1029  00db 5f            	clrw	x
1030  00dc 02            	rlwa	x,a
1031  00dd 58            	sllw	x
1032  00de 1f01          	ldw	(OFST-1,sp),x
1034                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1036  00e0 1e03          	ldw	x,(OFST+1,sp)
1037  00e2 e601          	ld	a,(1,x)
1038  00e4 5f            	clrw	x
1039  00e5 97            	ld	xl,a
1040  00e6 01            	rrwa	x,a
1041  00e7 1a02          	or	a,(OFST+0,sp)
1042  00e9 01            	rrwa	x,a
1043  00ea 1a01          	or	a,(OFST-1,sp)
1044  00ec 01            	rrwa	x,a
1045  00ed 01            	rrwa	x,a
1046  00ee a4ff          	and	a,#255
1047  00f0 01            	rrwa	x,a
1048  00f1 a401          	and	a,#1
1049  00f3 01            	rrwa	x,a
1052  00f4 5b04          	addw	sp,#4
1053  00f6 81            	ret
1099                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1099                     ; 406 {
1100                     	switch	.text
1101  00f7               _USART_SendData8:
1103  00f7 89            	pushw	x
1104       00000000      OFST:	set	0
1107                     ; 408   USARTx->DR = Data;
1109  00f8 7b05          	ld	a,(OFST+5,sp)
1110  00fa 1e01          	ldw	x,(OFST+1,sp)
1111  00fc e701          	ld	(1,x),a
1112                     ; 409 }
1115  00fe 85            	popw	x
1116  00ff 81            	ret
1162                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1162                     ; 419 {
1163                     	switch	.text
1164  0100               _USART_SendData9:
1166  0100 89            	pushw	x
1167       00000000      OFST:	set	0
1170                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1172                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1174  0101 e604          	ld	a,(4,x)
1175  0103 a4bf          	and	a,#191
1176  0105 e704          	ld	(4,x),a
1177                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1179  0107 1605          	ldw	y,(OFST+5,sp)
1180  0109 9054          	srlw	y
1181  010b 9054          	srlw	y
1182  010d 909f          	ld	a,yl
1183  010f a440          	and	a,#64
1184  0111 ea04          	or	a,(4,x)
1185  0113 e704          	ld	(4,x),a
1186                     ; 429   USARTx->DR   = (uint8_t)(Data);
1188  0115 7b06          	ld	a,(OFST+6,sp)
1189  0117 1e01          	ldw	x,(OFST+1,sp)
1190  0119 e701          	ld	(1,x),a
1191                     ; 430 }
1194  011b 85            	popw	x
1195  011c 81            	ret
1243                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1243                     ; 474 {
1244                     	switch	.text
1245  011d               _USART_ReceiverWakeUpCmd:
1247  011d 89            	pushw	x
1248       00000000      OFST:	set	0
1251                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1253                     ; 477   if (NewState != DISABLE)
1255  011e 0d05          	tnz	(OFST+5,sp)
1256  0120 2708          	jreq	L575
1257                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1259  0122 e605          	ld	a,(5,x)
1260  0124 aa02          	or	a,#2
1261  0126 e705          	ld	(5,x),a
1263  0128 2008          	jra	L775
1264  012a               L575:
1265                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1267  012a 1e01          	ldw	x,(OFST+1,sp)
1268  012c e605          	ld	a,(5,x)
1269  012e a4fd          	and	a,#253
1270  0130 e705          	ld	(5,x),a
1271  0132               L775:
1272                     ; 487 }
1275  0132 85            	popw	x
1276  0133 81            	ret
1322                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1322                     ; 497 {
1323                     	switch	.text
1324  0134               _USART_SetAddress:
1326  0134 89            	pushw	x
1327       00000000      OFST:	set	0
1330                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1332                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1334  0135 e607          	ld	a,(7,x)
1335  0137 a4f0          	and	a,#240
1336  0139 e707          	ld	(7,x),a
1337                     ; 504   USARTx->CR4 |= USART_Address;
1339  013b e607          	ld	a,(7,x)
1340  013d 1a05          	or	a,(OFST+5,sp)
1341  013f e707          	ld	(7,x),a
1342                     ; 505 }
1345  0141 85            	popw	x
1346  0142 81            	ret
1415                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1415                     ; 516 {
1416                     	switch	.text
1417  0143               _USART_WakeUpConfig:
1419  0143 89            	pushw	x
1420       00000000      OFST:	set	0
1423                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1425                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1427  0144 e604          	ld	a,(4,x)
1428  0146 a4f7          	and	a,#247
1429  0148 e704          	ld	(4,x),a
1430                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1432  014a e604          	ld	a,(4,x)
1433  014c 1a05          	or	a,(OFST+5,sp)
1434  014e e704          	ld	(4,x),a
1435                     ; 521 }
1438  0150 85            	popw	x
1439  0151 81            	ret
1487                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1487                     ; 567 {
1488                     	switch	.text
1489  0152               _USART_HalfDuplexCmd:
1491  0152 89            	pushw	x
1492       00000000      OFST:	set	0
1495                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1497                     ; 570   if (NewState != DISABLE)
1499  0153 0d05          	tnz	(OFST+5,sp)
1500  0155 2708          	jreq	L507
1501                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1503  0157 e608          	ld	a,(8,x)
1504  0159 aa08          	or	a,#8
1505  015b e708          	ld	(8,x),a
1507  015d 2008          	jra	L707
1508  015f               L507:
1509                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1511  015f 1e01          	ldw	x,(OFST+1,sp)
1512  0161 e608          	ld	a,(8,x)
1513  0163 a4f7          	and	a,#247
1514  0165 e708          	ld	(8,x),a
1515  0167               L707:
1516                     ; 578 }
1519  0167 85            	popw	x
1520  0168 81            	ret
1567                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1567                     ; 645 {
1568                     	switch	.text
1569  0169               _USART_SmartCardCmd:
1571  0169 89            	pushw	x
1572       00000000      OFST:	set	0
1575                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1577                     ; 648   if (NewState != DISABLE)
1579  016a 0d05          	tnz	(OFST+5,sp)
1580  016c 2708          	jreq	L537
1581                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1583  016e e608          	ld	a,(8,x)
1584  0170 aa20          	or	a,#32
1585  0172 e708          	ld	(8,x),a
1587  0174 2008          	jra	L737
1588  0176               L537:
1589                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1591  0176 1e01          	ldw	x,(OFST+1,sp)
1592  0178 e608          	ld	a,(8,x)
1593  017a a4df          	and	a,#223
1594  017c e708          	ld	(8,x),a
1595  017e               L737:
1596                     ; 658 }
1599  017e 85            	popw	x
1600  017f 81            	ret
1648                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1648                     ; 668 {
1649                     	switch	.text
1650  0180               _USART_SmartCardNACKCmd:
1652  0180 89            	pushw	x
1653       00000000      OFST:	set	0
1656                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1658                     ; 671   if (NewState != DISABLE)
1660  0181 0d05          	tnz	(OFST+5,sp)
1661  0183 2708          	jreq	L567
1662                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1664  0185 e608          	ld	a,(8,x)
1665  0187 aa10          	or	a,#16
1666  0189 e708          	ld	(8,x),a
1668  018b 2008          	jra	L767
1669  018d               L567:
1670                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1672  018d 1e01          	ldw	x,(OFST+1,sp)
1673  018f e608          	ld	a,(8,x)
1674  0191 a4ef          	and	a,#239
1675  0193 e708          	ld	(8,x),a
1676  0195               L767:
1677                     ; 681 }
1680  0195 85            	popw	x
1681  0196 81            	ret
1727                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1727                     ; 691 {
1728                     	switch	.text
1729  0197               _USART_SetGuardTime:
1731  0197 89            	pushw	x
1732       00000000      OFST:	set	0
1735                     ; 693   USARTx->GTR = USART_GuardTime;
1737  0198 7b05          	ld	a,(OFST+5,sp)
1738  019a 1e01          	ldw	x,(OFST+1,sp)
1739  019c e709          	ld	(9,x),a
1740                     ; 694 }
1743  019e 85            	popw	x
1744  019f 81            	ret
1813                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1813                     ; 752 {
1814                     	switch	.text
1815  01a0               _USART_IrDAConfig:
1817  01a0 89            	pushw	x
1818       00000000      OFST:	set	0
1821                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1823                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1825  01a1 0d05          	tnz	(OFST+5,sp)
1826  01a3 2708          	jreq	L1501
1827                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1829  01a5 e608          	ld	a,(8,x)
1830  01a7 aa04          	or	a,#4
1831  01a9 e708          	ld	(8,x),a
1833  01ab 2008          	jra	L3501
1834  01ad               L1501:
1835                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1837  01ad 1e01          	ldw	x,(OFST+1,sp)
1838  01af e608          	ld	a,(8,x)
1839  01b1 a4fb          	and	a,#251
1840  01b3 e708          	ld	(8,x),a
1841  01b5               L3501:
1842                     ; 763 }
1845  01b5 85            	popw	x
1846  01b6 81            	ret
1893                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1893                     ; 773 {
1894                     	switch	.text
1895  01b7               _USART_IrDACmd:
1897  01b7 89            	pushw	x
1898       00000000      OFST:	set	0
1901                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1903                     ; 778   if (NewState != DISABLE)
1905  01b8 0d05          	tnz	(OFST+5,sp)
1906  01ba 2708          	jreq	L1011
1907                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1909  01bc e608          	ld	a,(8,x)
1910  01be aa02          	or	a,#2
1911  01c0 e708          	ld	(8,x),a
1913  01c2 2008          	jra	L3011
1914  01c4               L1011:
1915                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1917  01c4 1e01          	ldw	x,(OFST+1,sp)
1918  01c6 e608          	ld	a,(8,x)
1919  01c8 a4fd          	and	a,#253
1920  01ca e708          	ld	(8,x),a
1921  01cc               L3011:
1922                     ; 788 }
1925  01cc 85            	popw	x
1926  01cd 81            	ret
2003                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2003                     ; 819                   FunctionalState NewState)
2003                     ; 820 {
2004                     	switch	.text
2005  01ce               _USART_DMACmd:
2007  01ce 89            	pushw	x
2008       00000000      OFST:	set	0
2011                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2013                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2015                     ; 825   if (NewState != DISABLE)
2017  01cf 0d06          	tnz	(OFST+6,sp)
2018  01d1 2708          	jreq	L5411
2019                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2021  01d3 e608          	ld	a,(8,x)
2022  01d5 1a05          	or	a,(OFST+5,sp)
2023  01d7 e708          	ld	(8,x),a
2025  01d9 2009          	jra	L7411
2026  01db               L5411:
2027                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2029  01db 1e01          	ldw	x,(OFST+1,sp)
2030  01dd 7b05          	ld	a,(OFST+5,sp)
2031  01df 43            	cpl	a
2032  01e0 e408          	and	a,(8,x)
2033  01e2 e708          	ld	(8,x),a
2034  01e4               L7411:
2035                     ; 837 }
2038  01e4 85            	popw	x
2039  01e5 81            	ret
2183                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2183                     ; 940 {
2184                     	switch	.text
2185  01e6               _USART_ITConfig:
2187  01e6 89            	pushw	x
2188  01e7 89            	pushw	x
2189       00000002      OFST:	set	2
2192                     ; 941   uint8_t usartreg, itpos = 0x00;
2194                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2196                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2198                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2200  01e8 7b07          	ld	a,(OFST+5,sp)
2201  01ea 6b01          	ld	(OFST-1,sp),a
2203                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2205  01ec 7b08          	ld	a,(OFST+6,sp)
2206  01ee a40f          	and	a,#15
2207  01f0 5f            	clrw	x
2208  01f1 97            	ld	xl,a
2209  01f2 a601          	ld	a,#1
2210  01f4 5d            	tnzw	x
2211  01f5 2704          	jreq	L65
2212  01f7               L06:
2213  01f7 48            	sll	a
2214  01f8 5a            	decw	x
2215  01f9 26fc          	jrne	L06
2216  01fb               L65:
2217  01fb 6b02          	ld	(OFST+0,sp),a
2219                     ; 950   if (NewState != DISABLE)
2221  01fd 0d09          	tnz	(OFST+7,sp)
2222  01ff 272a          	jreq	L7321
2223                     ; 953     if (usartreg == 0x01)
2225  0201 7b01          	ld	a,(OFST-1,sp)
2226  0203 a101          	cp	a,#1
2227  0205 260a          	jrne	L1421
2228                     ; 955       USARTx->CR1 |= itpos;
2230  0207 1e03          	ldw	x,(OFST+1,sp)
2231  0209 e604          	ld	a,(4,x)
2232  020b 1a02          	or	a,(OFST+0,sp)
2233  020d e704          	ld	(4,x),a
2235  020f 2045          	jra	L1521
2236  0211               L1421:
2237                     ; 957     else if (usartreg == 0x05)
2239  0211 7b01          	ld	a,(OFST-1,sp)
2240  0213 a105          	cp	a,#5
2241  0215 260a          	jrne	L5421
2242                     ; 959       USARTx->CR5 |= itpos;
2244  0217 1e03          	ldw	x,(OFST+1,sp)
2245  0219 e608          	ld	a,(8,x)
2246  021b 1a02          	or	a,(OFST+0,sp)
2247  021d e708          	ld	(8,x),a
2249  021f 2035          	jra	L1521
2250  0221               L5421:
2251                     ; 964       USARTx->CR2 |= itpos;
2253  0221 1e03          	ldw	x,(OFST+1,sp)
2254  0223 e605          	ld	a,(5,x)
2255  0225 1a02          	or	a,(OFST+0,sp)
2256  0227 e705          	ld	(5,x),a
2257  0229 202b          	jra	L1521
2258  022b               L7321:
2259                     ; 970     if (usartreg == 0x01)
2261  022b 7b01          	ld	a,(OFST-1,sp)
2262  022d a101          	cp	a,#1
2263  022f 260b          	jrne	L3521
2264                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2266  0231 1e03          	ldw	x,(OFST+1,sp)
2267  0233 7b02          	ld	a,(OFST+0,sp)
2268  0235 43            	cpl	a
2269  0236 e404          	and	a,(4,x)
2270  0238 e704          	ld	(4,x),a
2272  023a 201a          	jra	L1521
2273  023c               L3521:
2274                     ; 974     else if (usartreg == 0x05)
2276  023c 7b01          	ld	a,(OFST-1,sp)
2277  023e a105          	cp	a,#5
2278  0240 260b          	jrne	L7521
2279                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2281  0242 1e03          	ldw	x,(OFST+1,sp)
2282  0244 7b02          	ld	a,(OFST+0,sp)
2283  0246 43            	cpl	a
2284  0247 e408          	and	a,(8,x)
2285  0249 e708          	ld	(8,x),a
2287  024b 2009          	jra	L1521
2288  024d               L7521:
2289                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2291  024d 1e03          	ldw	x,(OFST+1,sp)
2292  024f 7b02          	ld	a,(OFST+0,sp)
2293  0251 43            	cpl	a
2294  0252 e405          	and	a,(5,x)
2295  0254 e705          	ld	(5,x),a
2296  0256               L1521:
2297                     ; 984 }
2300  0256 5b04          	addw	sp,#4
2301  0258 81            	ret
2449                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2449                     ; 1003 {
2450                     	switch	.text
2451  0259               _USART_GetFlagStatus:
2453  0259 89            	pushw	x
2454  025a 88            	push	a
2455       00000001      OFST:	set	1
2458                     ; 1004   FlagStatus status = RESET;
2460                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2462                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2464  025b 1e06          	ldw	x,(OFST+5,sp)
2465  025d a30101        	cpw	x,#257
2466  0260 2612          	jrne	L1531
2467                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2469  0262 1e02          	ldw	x,(OFST+1,sp)
2470  0264 e605          	ld	a,(5,x)
2471  0266 1507          	bcp	a,(OFST+6,sp)
2472  0268 2706          	jreq	L3531
2473                     ; 1014       status = SET;
2475  026a a601          	ld	a,#1
2476  026c 6b01          	ld	(OFST+0,sp),a
2479  026e 2013          	jra	L7531
2480  0270               L3531:
2481                     ; 1019       status = RESET;
2483  0270 0f01          	clr	(OFST+0,sp)
2485  0272 200f          	jra	L7531
2486  0274               L1531:
2487                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2489  0274 1e02          	ldw	x,(OFST+1,sp)
2490  0276 f6            	ld	a,(x)
2491  0277 1507          	bcp	a,(OFST+6,sp)
2492  0279 2706          	jreq	L1631
2493                     ; 1027       status = SET;
2495  027b a601          	ld	a,#1
2496  027d 6b01          	ld	(OFST+0,sp),a
2499  027f 2002          	jra	L7531
2500  0281               L1631:
2501                     ; 1032       status = RESET;
2503  0281 0f01          	clr	(OFST+0,sp)
2505  0283               L7531:
2506                     ; 1036   return status;
2508  0283 7b01          	ld	a,(OFST+0,sp)
2511  0285 5b03          	addw	sp,#3
2512  0287 81            	ret
2559                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2559                     ; 1061 {
2560                     	switch	.text
2561  0288               _USART_ClearFlag:
2563  0288 89            	pushw	x
2564       00000000      OFST:	set	0
2567                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2569                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2571  0289 7b06          	ld	a,(OFST+6,sp)
2572  028b 43            	cpl	a
2573  028c 1e01          	ldw	x,(OFST+1,sp)
2574  028e f7            	ld	(x),a
2575                     ; 1066 }
2578  028f 85            	popw	x
2579  0290 81            	ret
2682                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2682                     ; 1084 {
2683                     	switch	.text
2684  0291               _USART_GetITStatus:
2686  0291 89            	pushw	x
2687  0292 5203          	subw	sp,#3
2688       00000003      OFST:	set	3
2691                     ; 1085   ITStatus pendingbitstatus = RESET;
2693                     ; 1086   uint8_t temp = 0;
2695                     ; 1087   uint8_t itpos = 0;
2697                     ; 1088   uint8_t itmask1 = 0;
2699                     ; 1089   uint8_t itmask2 = 0;
2701                     ; 1090   uint8_t enablestatus = 0;
2703                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2705                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2707  0294 7b09          	ld	a,(OFST+6,sp)
2708  0296 a40f          	and	a,#15
2709  0298 5f            	clrw	x
2710  0299 97            	ld	xl,a
2711  029a a601          	ld	a,#1
2712  029c 5d            	tnzw	x
2713  029d 2704          	jreq	L07
2714  029f               L27:
2715  029f 48            	sll	a
2716  02a0 5a            	decw	x
2717  02a1 26fc          	jrne	L27
2718  02a3               L07:
2719  02a3 6b02          	ld	(OFST-1,sp),a
2721                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2723  02a5 7b09          	ld	a,(OFST+6,sp)
2724  02a7 4e            	swap	a
2725  02a8 a40f          	and	a,#15
2726  02aa 6b03          	ld	(OFST+0,sp),a
2728                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2730  02ac 7b03          	ld	a,(OFST+0,sp)
2731  02ae 5f            	clrw	x
2732  02af 97            	ld	xl,a
2733  02b0 a601          	ld	a,#1
2734  02b2 5d            	tnzw	x
2735  02b3 2704          	jreq	L47
2736  02b5               L67:
2737  02b5 48            	sll	a
2738  02b6 5a            	decw	x
2739  02b7 26fc          	jrne	L67
2740  02b9               L47:
2741  02b9 6b03          	ld	(OFST+0,sp),a
2743                     ; 1103   if (USART_IT == USART_IT_PE)
2745  02bb 1e08          	ldw	x,(OFST+5,sp)
2746  02bd a30100        	cpw	x,#256
2747  02c0 261d          	jrne	L5641
2748                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2750  02c2 1e04          	ldw	x,(OFST+1,sp)
2751  02c4 e604          	ld	a,(4,x)
2752  02c6 1403          	and	a,(OFST+0,sp)
2753  02c8 6b03          	ld	(OFST+0,sp),a
2755                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2757  02ca 1e04          	ldw	x,(OFST+1,sp)
2758  02cc f6            	ld	a,(x)
2759  02cd 1502          	bcp	a,(OFST-1,sp)
2760  02cf 270a          	jreq	L7641
2762  02d1 0d03          	tnz	(OFST+0,sp)
2763  02d3 2706          	jreq	L7641
2764                     ; 1112       pendingbitstatus = SET;
2766  02d5 a601          	ld	a,#1
2767  02d7 6b03          	ld	(OFST+0,sp),a
2770  02d9 204f          	jra	L3741
2771  02db               L7641:
2772                     ; 1117       pendingbitstatus = RESET;
2774  02db 0f03          	clr	(OFST+0,sp)
2776  02dd 204b          	jra	L3741
2777  02df               L5641:
2778                     ; 1121   else if (USART_IT == USART_IT_OR)
2780  02df 1e08          	ldw	x,(OFST+5,sp)
2781  02e1 a30235        	cpw	x,#565
2782  02e4 2629          	jrne	L5741
2783                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2785  02e6 1e04          	ldw	x,(OFST+1,sp)
2786  02e8 e605          	ld	a,(5,x)
2787  02ea 1403          	and	a,(OFST+0,sp)
2788  02ec 6b03          	ld	(OFST+0,sp),a
2790                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2792  02ee 1e04          	ldw	x,(OFST+1,sp)
2793  02f0 e608          	ld	a,(8,x)
2794  02f2 a401          	and	a,#1
2795  02f4 6b01          	ld	(OFST-2,sp),a
2797                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2799  02f6 1e04          	ldw	x,(OFST+1,sp)
2800  02f8 f6            	ld	a,(x)
2801  02f9 1502          	bcp	a,(OFST-1,sp)
2802  02fb 270e          	jreq	L7741
2804  02fd 0d03          	tnz	(OFST+0,sp)
2805  02ff 2604          	jrne	L1051
2807  0301 0d01          	tnz	(OFST-2,sp)
2808  0303 2706          	jreq	L7741
2809  0305               L1051:
2810                     ; 1132       pendingbitstatus = SET;
2812  0305 a601          	ld	a,#1
2813  0307 6b03          	ld	(OFST+0,sp),a
2816  0309 201f          	jra	L3741
2817  030b               L7741:
2818                     ; 1137       pendingbitstatus = RESET;
2820  030b 0f03          	clr	(OFST+0,sp)
2822  030d 201b          	jra	L3741
2823  030f               L5741:
2824                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2826  030f 1e04          	ldw	x,(OFST+1,sp)
2827  0311 e605          	ld	a,(5,x)
2828  0313 1403          	and	a,(OFST+0,sp)
2829  0315 6b03          	ld	(OFST+0,sp),a
2831                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2833  0317 1e04          	ldw	x,(OFST+1,sp)
2834  0319 f6            	ld	a,(x)
2835  031a 1502          	bcp	a,(OFST-1,sp)
2836  031c 270a          	jreq	L7051
2838  031e 0d03          	tnz	(OFST+0,sp)
2839  0320 2706          	jreq	L7051
2840                     ; 1149       pendingbitstatus = SET;
2842  0322 a601          	ld	a,#1
2843  0324 6b03          	ld	(OFST+0,sp),a
2846  0326 2002          	jra	L3741
2847  0328               L7051:
2848                     ; 1154       pendingbitstatus = RESET;
2850  0328 0f03          	clr	(OFST+0,sp)
2852  032a               L3741:
2853                     ; 1159   return  pendingbitstatus;
2855  032a 7b03          	ld	a,(OFST+0,sp)
2858  032c 5b05          	addw	sp,#5
2859  032e 81            	ret
2897                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2897                     ; 1184 {
2898                     	switch	.text
2899  032f               _USART_ClearITPendingBit:
2903                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2905                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2907  032f f6            	ld	a,(x)
2908  0330 a4bf          	and	a,#191
2909  0332 f7            	ld	(x),a
2910                     ; 1189 }
2913  0333 81            	ret
2926                     	xdef	_USART_ClearITPendingBit
2927                     	xdef	_USART_GetITStatus
2928                     	xdef	_USART_ClearFlag
2929                     	xdef	_USART_GetFlagStatus
2930                     	xdef	_USART_ITConfig
2931                     	xdef	_USART_DMACmd
2932                     	xdef	_USART_IrDACmd
2933                     	xdef	_USART_IrDAConfig
2934                     	xdef	_USART_SetGuardTime
2935                     	xdef	_USART_SmartCardNACKCmd
2936                     	xdef	_USART_SmartCardCmd
2937                     	xdef	_USART_HalfDuplexCmd
2938                     	xdef	_USART_SetAddress
2939                     	xdef	_USART_ReceiverWakeUpCmd
2940                     	xdef	_USART_WakeUpConfig
2941                     	xdef	_USART_ReceiveData9
2942                     	xdef	_USART_ReceiveData8
2943                     	xdef	_USART_SendData9
2944                     	xdef	_USART_SendData8
2945                     	xdef	_USART_SendBreak
2946                     	xdef	_USART_SetPrescaler
2947                     	xdef	_USART_Cmd
2948                     	xdef	_USART_ClockInit
2949                     	xdef	_USART_Init
2950                     	xdef	_USART_DeInit
2951                     	xref	_CLK_GetClockFreq
2952                     	xref.b	c_lreg
2953                     	xref.b	c_x
2972                     	xref	c_lursh
2973                     	xref	c_ltor
2974                     	xref	c_rtol
2975                     	xref	c_ludv
2976                     	end
