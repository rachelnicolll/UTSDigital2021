   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  76                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  76                     ; 175 {
  78                     	switch	.text
  79  0000               _FLASH_SetProgrammingTime:
  83                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  85                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  87  0000 72115050      	bres	20560,#0
  88                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  90  0004 ca5050        	or	a,20560
  91  0007 c75050        	ld	20560,a
  92                     ; 181 }
  95  000a 81            	ret
 120                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 120                     ; 189 {
 121                     	switch	.text
 122  000b               _FLASH_GetProgrammingTime:
 126                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 128  000b c65050        	ld	a,20560
 129  000e a401          	and	a,#1
 132  0010 81            	ret
 188                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 188                     ; 204 {
 189                     	switch	.text
 190  0011               _FLASH_PowerWaitModeConfig:
 194                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 196                     ; 209   if(FLASH_Power != FLASH_Power_On)
 198  0011 a101          	cp	a,#1
 199  0013 2706          	jreq	L57
 200                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 202  0015 72145050      	bset	20560,#2
 204  0019 2004          	jra	L77
 205  001b               L57:
 206                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 208  001b 72155050      	bres	20560,#2
 209  001f               L77:
 210                     ; 218 }
 213  001f 81            	ret
 236                     ; 259 void FLASH_DeInit(void)
 236                     ; 260 {
 237                     	switch	.text
 238  0020               _FLASH_DeInit:
 242                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 244  0020 725f5050      	clr	20560
 245                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 247  0024 725f5051      	clr	20561
 248                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 250  0028 35405054      	mov	20564,#64
 251                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 253  002c c65054        	ld	a,20564
 254                     ; 265 }
 257  002f 81            	ret
 313                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 313                     ; 276 {
 314                     	switch	.text
 315  0030               _FLASH_Unlock:
 317  0030 88            	push	a
 318       00000000      OFST:	set	0
 321                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 323                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 325  0031 a1fd          	cp	a,#253
 326  0033 2608          	jrne	L731
 327                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 329  0035 35565052      	mov	20562,#86
 330                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 332  0039 35ae5052      	mov	20562,#174
 333  003d               L731:
 334                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 336  003d 7b01          	ld	a,(OFST+1,sp)
 337  003f a1f7          	cp	a,#247
 338  0041 2608          	jrne	L141
 339                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 341  0043 35ae5053      	mov	20563,#174
 342                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 344  0047 35565053      	mov	20563,#86
 345  004b               L141:
 346                     ; 293 }
 349  004b 84            	pop	a
 350  004c 81            	ret
 385                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 385                     ; 304 {
 386                     	switch	.text
 387  004d               _FLASH_Lock:
 391                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 393                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 395  004d c45054        	and	a,20564
 396  0050 c75054        	ld	20564,a
 397                     ; 310 }
 400  0053 81            	ret
 443                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 443                     ; 319 {
 444                     	switch	.text
 445  0054               _FLASH_ProgramByte:
 447       00000000      OFST:	set	0
 450                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 452                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 454  0054 7b07          	ld	a,(OFST+7,sp)
 455  0056 1e05          	ldw	x,(OFST+5,sp)
 456  0058 f7            	ld	(x),a
 457                     ; 324 }
 460  0059 81            	ret
 494                     ; 331 void FLASH_EraseByte(uint32_t Address)
 494                     ; 332 {
 495                     	switch	.text
 496  005a               _FLASH_EraseByte:
 498       00000000      OFST:	set	0
 501                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 503                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 505  005a 1e05          	ldw	x,(OFST+5,sp)
 506  005c 7f            	clr	(x)
 507                     ; 337 }
 510  005d 81            	ret
 553                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 553                     ; 346 {
 554                     	switch	.text
 555  005e               _FLASH_ProgramWord:
 557       00000000      OFST:	set	0
 560                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 562                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 564  005e 721c5051      	bset	20561,#6
 565                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 567  0062 7b07          	ld	a,(OFST+7,sp)
 568  0064 1e05          	ldw	x,(OFST+5,sp)
 569  0066 f7            	ld	(x),a
 570                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 572  0067 7b08          	ld	a,(OFST+8,sp)
 573  0069 1e05          	ldw	x,(OFST+5,sp)
 574  006b e701          	ld	(1,x),a
 575                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 577  006d 7b09          	ld	a,(OFST+9,sp)
 578  006f 1e05          	ldw	x,(OFST+5,sp)
 579  0071 e702          	ld	(2,x),a
 580                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 582  0073 7b0a          	ld	a,(OFST+10,sp)
 583  0075 1e05          	ldw	x,(OFST+5,sp)
 584  0077 e703          	ld	(3,x),a
 585                     ; 360 }
 588  0079 81            	ret
 622                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 622                     ; 368 {
 623                     	switch	.text
 624  007a               _FLASH_ReadByte:
 626       00000000      OFST:	set	0
 629                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 631  007a 1e05          	ldw	x,(OFST+5,sp)
 632  007c f6            	ld	a,(x)
 635  007d 81            	ret
 680                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 680                     ; 418 {
 681                     	switch	.text
 682  007e               _FLASH_ProgramOptionByte:
 684  007e 89            	pushw	x
 685       00000000      OFST:	set	0
 688                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 690                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 692  007f 721e5051      	bset	20561,#7
 693                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 695  0083 7b05          	ld	a,(OFST+5,sp)
 696  0085 1e01          	ldw	x,(OFST+1,sp)
 697  0087 f7            	ld	(x),a
 698                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 700  0088 a6fd          	ld	a,#253
 701  008a cd01cb        	call	_FLASH_WaitForLastOperation
 703                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 705  008d 721f5051      	bres	20561,#7
 706                     ; 432 }
 709  0091 85            	popw	x
 710  0092 81            	ret
 746                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 746                     ; 440 {
 747                     	switch	.text
 748  0093               _FLASH_EraseOptionByte:
 752                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 754                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 756  0093 721e5051      	bset	20561,#7
 757                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 759  0097 7f            	clr	(x)
 760                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 762  0098 a6fd          	ld	a,#253
 763  009a cd01cb        	call	_FLASH_WaitForLastOperation
 765                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 767  009d 721f5051      	bres	20561,#7
 768                     ; 454 }
 771  00a1 81            	ret
 828                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 828                     ; 463 {
 829                     	switch	.text
 830  00a2               _FLASH_GetReadOutProtectionStatus:
 832  00a2 88            	push	a
 833       00000001      OFST:	set	1
 836                     ; 464   FunctionalState state = DISABLE;
 838                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 840  00a3 c64800        	ld	a,18432
 841  00a6 a1aa          	cp	a,#170
 842  00a8 2606          	jrne	L743
 843                     ; 469     state =  ENABLE;
 845  00aa a601          	ld	a,#1
 846  00ac 6b01          	ld	(OFST+0,sp),a
 849  00ae 2002          	jra	L153
 850  00b0               L743:
 851                     ; 474     state =  DISABLE;
 853  00b0 0f01          	clr	(OFST+0,sp)
 855  00b2               L153:
 856                     ; 477   return state;
 858  00b2 7b01          	ld	a,(OFST+0,sp)
 861  00b4 5b01          	addw	sp,#1
 862  00b6 81            	ret
 896                     ; 485 uint16_t FLASH_GetBootSize(void)
 896                     ; 486 {
 897                     	switch	.text
 898  00b7               _FLASH_GetBootSize:
 900  00b7 89            	pushw	x
 901       00000002      OFST:	set	2
 904                     ; 487   uint16_t temp = 0;
 906                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 908  00b8 c64802        	ld	a,18434
 909  00bb 5f            	clrw	x
 910  00bc 97            	ld	xl,a
 911  00bd 4f            	clr	a
 912  00be 02            	rlwa	x,a
 913  00bf 44            	srl	a
 914  00c0 56            	rrcw	x
 915  00c1 1f01          	ldw	(OFST-1,sp),x
 917                     ; 493   if(OPT->UBC > 0x7F)
 919  00c3 c64802        	ld	a,18434
 920  00c6 a180          	cp	a,#128
 921  00c8 2505          	jrult	L173
 922                     ; 495     temp = 8192;
 924  00ca ae2000        	ldw	x,#8192
 925  00cd 1f01          	ldw	(OFST-1,sp),x
 927  00cf               L173:
 928                     ; 499   return(temp);
 930  00cf 1e01          	ldw	x,(OFST-1,sp)
 933  00d1 5b02          	addw	sp,#2
 934  00d3 81            	ret
 968                     ; 508 uint16_t FLASH_GetCodeSize(void)
 968                     ; 509 {
 969                     	switch	.text
 970  00d4               _FLASH_GetCodeSize:
 972  00d4 89            	pushw	x
 973       00000002      OFST:	set	2
 976                     ; 510   uint16_t temp = 0;
 978                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 980  00d5 c64807        	ld	a,18439
 981  00d8 5f            	clrw	x
 982  00d9 97            	ld	xl,a
 983  00da 4f            	clr	a
 984  00db 02            	rlwa	x,a
 985  00dc 44            	srl	a
 986  00dd 56            	rrcw	x
 987  00de 1f01          	ldw	(OFST-1,sp),x
 989                     ; 516   if(OPT->PCODESIZE > 0x7F)
 991  00e0 c64807        	ld	a,18439
 992  00e3 a180          	cp	a,#128
 993  00e5 2505          	jrult	L114
 994                     ; 518     temp = 8192;
 996  00e7 ae2000        	ldw	x,#8192
 997  00ea 1f01          	ldw	(OFST-1,sp),x
 999  00ec               L114:
1000                     ; 522   return(temp);
1002  00ec 1e01          	ldw	x,(OFST-1,sp)
1005  00ee 5b02          	addw	sp,#2
1006  00f0 81            	ret
1041                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1041                     ; 548 {
1042                     	switch	.text
1043  00f1               _FLASH_ITConfig:
1047                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1049                     ; 552   if(NewState != DISABLE)
1051  00f1 4d            	tnz	a
1052  00f2 2706          	jreq	L134
1053                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1055  00f4 72125050      	bset	20560,#1
1057  00f8 2004          	jra	L334
1058  00fa               L134:
1059                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1061  00fa 72135050      	bres	20560,#1
1062  00fe               L334:
1063                     ; 562 }
1066  00fe 81            	ret
1175                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1175                     ; 577 {
1176                     	switch	.text
1177  00ff               _FLASH_GetFlagStatus:
1179  00ff 88            	push	a
1180       00000001      OFST:	set	1
1183                     ; 578   FlagStatus status = RESET;
1185                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1187                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1189  0100 c45054        	and	a,20564
1190  0103 2706          	jreq	L505
1191                     ; 584     status = SET; /* Flash_FLAG is set*/
1193  0105 a601          	ld	a,#1
1194  0107 6b01          	ld	(OFST+0,sp),a
1197  0109 2002          	jra	L705
1198  010b               L505:
1199                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1201  010b 0f01          	clr	(OFST+0,sp)
1203  010d               L705:
1204                     ; 592   return status;
1206  010d 7b01          	ld	a,(OFST+0,sp)
1209  010f 5b01          	addw	sp,#1
1210  0111 81            	ret
1246                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1246                     ; 720 {
1247                     	switch	.text
1248  0112               _FLASH_PowerRunModeConfig:
1252                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1254                     ; 724   if(FLASH_Power != FLASH_Power_On)
1256  0112 a101          	cp	a,#1
1257  0114 2706          	jreq	L725
1258                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1260  0116 72165050      	bset	20560,#3
1262  011a 2004          	jra	L135
1263  011c               L725:
1264                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1266  011c 72175050      	bres	20560,#3
1267  0120               L135:
1268                     ; 732 }
1271  0120 81            	ret
1335                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1335                     ; 746 {
1336                     	switch	.text
1337  0121               _FLASH_GetPowerStatus:
1341                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1343  0121 c65050        	ld	a,20560
1344  0124 a40c          	and	a,#12
1347  0126 81            	ret
1451                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1451                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1451                     ; 767 {
1452                     	switch	.text
1453  0127               _FLASH_ProgramBlock:
1455  0127 89            	pushw	x
1456  0128 5206          	subw	sp,#6
1457       00000006      OFST:	set	6
1460                     ; 768   uint16_t Count = 0;
1462                     ; 769   uint32_t startaddress = 0;
1464                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1466                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1468                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1470  012a 7b0b          	ld	a,(OFST+5,sp)
1471  012c a1fd          	cp	a,#253
1472  012e 260c          	jrne	L136
1473                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1475                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1477  0130 ae8000        	ldw	x,#32768
1478  0133 1f03          	ldw	(OFST-3,sp),x
1479  0135 ae0000        	ldw	x,#0
1480  0138 1f01          	ldw	(OFST-5,sp),x
1483  013a 200a          	jra	L336
1484  013c               L136:
1485                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1487                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1489  013c ae1000        	ldw	x,#4096
1490  013f 1f03          	ldw	(OFST-3,sp),x
1491  0141 ae0000        	ldw	x,#0
1492  0144 1f01          	ldw	(OFST-5,sp),x
1494  0146               L336:
1495                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1497  0146 1e07          	ldw	x,(OFST+1,sp)
1498  0148 a680          	ld	a,#128
1499  014a cd0000        	call	c_cmulx
1501  014d 96            	ldw	x,sp
1502  014e 1c0001        	addw	x,#OFST-5
1503  0151 cd0000        	call	c_lgadd
1506                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1508  0154 0d0c          	tnz	(OFST+6,sp)
1509  0156 2606          	jrne	L536
1510                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1512  0158 72105051      	bset	20561,#0
1514  015c 2004          	jra	L736
1515  015e               L536:
1516                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1518  015e 72185051      	bset	20561,#4
1519  0162               L736:
1520                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1522  0162 5f            	clrw	x
1523  0163 1f05          	ldw	(OFST-1,sp),x
1525  0165               L146:
1526                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1528  0165 1e0d          	ldw	x,(OFST+7,sp)
1529  0167 72fb05        	addw	x,(OFST-1,sp)
1530  016a f6            	ld	a,(x)
1531  016b 1e03          	ldw	x,(OFST-3,sp)
1532  016d 72fb05        	addw	x,(OFST-1,sp)
1533  0170 f7            	ld	(x),a
1534                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1536  0171 1e05          	ldw	x,(OFST-1,sp)
1537  0173 1c0001        	addw	x,#1
1538  0176 1f05          	ldw	(OFST-1,sp),x
1542  0178 1e05          	ldw	x,(OFST-1,sp)
1543  017a a30080        	cpw	x,#128
1544  017d 25e6          	jrult	L146
1545                     ; 805 }
1548  017f 5b08          	addw	sp,#8
1549  0181 81            	ret
1612                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1612                     ; 818 {
1613                     	switch	.text
1614  0182               _FLASH_EraseBlock:
1616  0182 89            	pushw	x
1617  0183 5206          	subw	sp,#6
1618       00000006      OFST:	set	6
1621                     ; 819   uint32_t startaddress = 0;
1623                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1625                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1627  0185 7b0b          	ld	a,(OFST+5,sp)
1628  0187 a1fd          	cp	a,#253
1629  0189 260c          	jrne	L107
1630                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1632                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1634  018b ae8000        	ldw	x,#32768
1635  018e 1f05          	ldw	(OFST-1,sp),x
1636  0190 ae0000        	ldw	x,#0
1637  0193 1f03          	ldw	(OFST-3,sp),x
1640  0195 200a          	jra	L307
1641  0197               L107:
1642                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1644                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1646  0197 ae1000        	ldw	x,#4096
1647  019a 1f05          	ldw	(OFST-1,sp),x
1648  019c ae0000        	ldw	x,#0
1649  019f 1f03          	ldw	(OFST-3,sp),x
1651  01a1               L307:
1652                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1654  01a1 1e07          	ldw	x,(OFST+1,sp)
1655  01a3 a680          	ld	a,#128
1656  01a5 cd0000        	call	c_cmulx
1658  01a8 96            	ldw	x,sp
1659  01a9 1c0003        	addw	x,#OFST-3
1660  01ac cd0000        	call	c_ladd
1662  01af be02          	ldw	x,c_lreg+2
1663  01b1 1f01          	ldw	(OFST-5,sp),x
1665                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1667  01b3 721a5051      	bset	20561,#5
1668                     ; 855     *pwFlash = (uint32_t)0;  
1670  01b7 1e01          	ldw	x,(OFST-5,sp)
1671  01b9 a600          	ld	a,#0
1672  01bb e703          	ld	(3,x),a
1673  01bd a600          	ld	a,#0
1674  01bf e702          	ld	(2,x),a
1675  01c1 a600          	ld	a,#0
1676  01c3 e701          	ld	(1,x),a
1677  01c5 a600          	ld	a,#0
1678  01c7 f7            	ld	(x),a
1679                     ; 863 }
1682  01c8 5b08          	addw	sp,#8
1683  01ca 81            	ret
1768                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1768                     ; 876 {
1769                     	switch	.text
1770  01cb               _FLASH_WaitForLastOperation:
1772  01cb 5203          	subw	sp,#3
1773       00000003      OFST:	set	3
1776                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1778  01cd aeffff        	ldw	x,#65535
1779  01d0 1f01          	ldw	(OFST-2,sp),x
1781                     ; 878   uint8_t flagstatus = 0x00;
1783  01d2 0f03          	clr	(OFST+0,sp)
1785                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1787  01d4 a1fd          	cp	a,#253
1788  01d6 2628          	jrne	L367
1790  01d8 200e          	jra	L157
1791  01da               L747:
1792                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1792                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1794  01da c65054        	ld	a,20564
1795  01dd a405          	and	a,#5
1796  01df 6b03          	ld	(OFST+0,sp),a
1798                     ; 887       timeout--;
1800  01e1 1e01          	ldw	x,(OFST-2,sp)
1801  01e3 1d0001        	subw	x,#1
1802  01e6 1f01          	ldw	(OFST-2,sp),x
1804  01e8               L157:
1805                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1807  01e8 0d03          	tnz	(OFST+0,sp)
1808  01ea 261c          	jrne	L757
1810  01ec 1e01          	ldw	x,(OFST-2,sp)
1811  01ee 26ea          	jrne	L747
1812  01f0 2016          	jra	L757
1813  01f2               L167:
1814                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1814                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1816  01f2 c65054        	ld	a,20564
1817  01f5 a441          	and	a,#65
1818  01f7 6b03          	ld	(OFST+0,sp),a
1820                     ; 896       timeout--;
1822  01f9 1e01          	ldw	x,(OFST-2,sp)
1823  01fb 1d0001        	subw	x,#1
1824  01fe 1f01          	ldw	(OFST-2,sp),x
1826  0200               L367:
1827                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1829  0200 0d03          	tnz	(OFST+0,sp)
1830  0202 2604          	jrne	L757
1832  0204 1e01          	ldw	x,(OFST-2,sp)
1833  0206 26ea          	jrne	L167
1834  0208               L757:
1835                     ; 900   if(timeout == 0x00)
1837  0208 1e01          	ldw	x,(OFST-2,sp)
1838  020a 2604          	jrne	L177
1839                     ; 902     flagstatus = FLASH_Status_TimeOut;
1841  020c a602          	ld	a,#2
1842  020e 6b03          	ld	(OFST+0,sp),a
1844  0210               L177:
1845                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1847  0210 7b03          	ld	a,(OFST+0,sp)
1850  0212 5b03          	addw	sp,#3
1851  0214 81            	ret
1864                     	xdef	_FLASH_WaitForLastOperation
1865                     	xdef	_FLASH_EraseBlock
1866                     	xdef	_FLASH_ProgramBlock
1867                     	xdef	_FLASH_GetPowerStatus
1868                     	xdef	_FLASH_PowerRunModeConfig
1869                     	xdef	_FLASH_GetFlagStatus
1870                     	xdef	_FLASH_ITConfig
1871                     	xdef	_FLASH_EraseOptionByte
1872                     	xdef	_FLASH_ProgramOptionByte
1873                     	xdef	_FLASH_GetReadOutProtectionStatus
1874                     	xdef	_FLASH_GetCodeSize
1875                     	xdef	_FLASH_GetBootSize
1876                     	xdef	_FLASH_ReadByte
1877                     	xdef	_FLASH_ProgramWord
1878                     	xdef	_FLASH_EraseByte
1879                     	xdef	_FLASH_ProgramByte
1880                     	xdef	_FLASH_Lock
1881                     	xdef	_FLASH_Unlock
1882                     	xdef	_FLASH_DeInit
1883                     	xdef	_FLASH_PowerWaitModeConfig
1884                     	xdef	_FLASH_SetProgrammingTime
1885                     	xdef	_FLASH_GetProgrammingTime
1886                     	xref.b	c_lreg
1905                     	xref	c_ladd
1906                     	xref	c_lgadd
1907                     	xref	c_cmulx
1908                     	end
