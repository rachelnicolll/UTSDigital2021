   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  52                     ; 121 void LCD_DeInit(void)
  52                     ; 122 {
  54                     	switch	.text
  55  0000               _LCD_DeInit:
  57  0000 88            	push	a
  58       00000001      OFST:	set	1
  61                     ; 123   uint8_t counter = 0;
  63                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  65  0001 725f5400      	clr	21504
  66                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  68  0005 725f5401      	clr	21505
  69                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  71  0009 725f5402      	clr	21506
  72                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  74  000d 725f5403      	clr	21507
  75                     ; 130   for (counter = 0;counter < 0x05; counter++)
  77  0011 0f01          	clr	(OFST+0,sp)
  79  0013               L72:
  80                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  82  0013 7b01          	ld	a,(OFST+0,sp)
  83  0015 5f            	clrw	x
  84  0016 97            	ld	xl,a
  85  0017 724f5404      	clr	(21508,x)
  86                     ; 130   for (counter = 0;counter < 0x05; counter++)
  88  001b 0c01          	inc	(OFST+0,sp)
  92  001d 7b01          	ld	a,(OFST+0,sp)
  93  001f a105          	cp	a,#5
  94  0021 25f0          	jrult	L72
  95                     ; 135   for (counter = 0;counter < 0x16; counter++)
  97  0023 0f01          	clr	(OFST+0,sp)
  99  0025               L53:
 100                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 102  0025 7b01          	ld	a,(OFST+0,sp)
 103  0027 5f            	clrw	x
 104  0028 97            	ld	xl,a
 105  0029 724f540c      	clr	(21516,x)
 106                     ; 135   for (counter = 0;counter < 0x16; counter++)
 108  002d 0c01          	inc	(OFST+0,sp)
 112  002f 7b01          	ld	a,(OFST+0,sp)
 113  0031 a116          	cp	a,#22
 114  0033 25f0          	jrult	L53
 115                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 117  0035 725f542f      	clr	21551
 118                     ; 142 }
 121  0039 84            	pop	a
 122  003a 81            	ret
 525                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 525                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 525                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 525                     ; 203 {
 526                     	switch	.text
 527  003b               _LCD_Init:
 529  003b 89            	pushw	x
 530       00000000      OFST:	set	0
 533                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 535                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 537                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 539                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 541                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 543                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 545  003c c65403        	ld	a,21507
 546  003f a40f          	and	a,#15
 547  0041 c75403        	ld	21507,a
 548                     ; 212   LCD->FRQ |= LCD_Prescaler;
 550  0044 9e            	ld	a,xh
 551  0045 ca5403        	or	a,21507
 552  0048 c75403        	ld	21507,a
 553                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 555  004b c65403        	ld	a,21507
 556  004e a4f0          	and	a,#240
 557  0050 c75403        	ld	21507,a
 558                     ; 215   LCD->FRQ |= LCD_Divider;
 560  0053 9f            	ld	a,xl
 561  0054 ca5403        	or	a,21507
 562  0057 c75403        	ld	21507,a
 563                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 565  005a c65400        	ld	a,21504
 566  005d a4f9          	and	a,#249
 567  005f c75400        	ld	21504,a
 568                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 570  0062 7213542f      	bres	21551,#1
 571                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 573  0066 7b05          	ld	a,(OFST+5,sp)
 574  0068 a120          	cp	a,#32
 575  006a 260f          	jrne	L152
 576                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 578  006c 7b05          	ld	a,(OFST+5,sp)
 579  006e a4f0          	and	a,#240
 580  0070 4e            	swap	a
 581  0071 a40f          	and	a,#15
 582  0073 ca542f        	or	a,21551
 583  0076 c7542f        	ld	21551,a
 585  0079 200a          	jra	L352
 586  007b               L152:
 587                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 589  007b 7b05          	ld	a,(OFST+5,sp)
 590  007d a40f          	and	a,#15
 591  007f ca5400        	or	a,21504
 592  0082 c75400        	ld	21504,a
 593  0085               L352:
 594                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 596  0085 72115400      	bres	21504,#0
 597                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 599  0089 7211542f      	bres	21551,#0
 600                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 602  008d 7b06          	ld	a,(OFST+6,sp)
 603  008f a110          	cp	a,#16
 604  0091 2619          	jrne	L552
 605                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 607  0093 7b06          	ld	a,(OFST+6,sp)
 608  0095 a40f          	and	a,#15
 609  0097 ca5400        	or	a,21504
 610  009a c75400        	ld	21504,a
 611                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 613  009d 7b06          	ld	a,(OFST+6,sp)
 614  009f a4f0          	and	a,#240
 615  00a1 4e            	swap	a
 616  00a2 a40f          	and	a,#15
 617  00a4 ca542f        	or	a,21551
 618  00a7 c7542f        	ld	21551,a
 620  00aa 200a          	jra	L752
 621  00ac               L552:
 622                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 624  00ac 7b06          	ld	a,(OFST+6,sp)
 625  00ae a40f          	and	a,#15
 626  00b0 ca5400        	or	a,21504
 627  00b3 c75400        	ld	21504,a
 628  00b6               L752:
 629                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 631  00b6 72115401      	bres	21505,#0
 632                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 634  00ba c65401        	ld	a,21505
 635  00bd 1a07          	or	a,(OFST+7,sp)
 636  00bf c75401        	ld	21505,a
 637                     ; 247 }
 640  00c2 85            	popw	x
 641  00c3 81            	ret
 740                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 740                     ; 263 {
 741                     	switch	.text
 742  00c4               _LCD_PortMaskConfig:
 744  00c4 89            	pushw	x
 745       00000000      OFST:	set	0
 748                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 750                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 752  00c5 9e            	ld	a,xh
 753  00c6 5f            	clrw	x
 754  00c7 97            	ld	xl,a
 755  00c8 7b02          	ld	a,(OFST+2,sp)
 756  00ca d75404        	ld	(21508,x),a
 757                     ; 270 }
 760  00cd 85            	popw	x
 761  00ce 81            	ret
 816                     ; 279 void LCD_Cmd(FunctionalState NewState)
 816                     ; 280 {
 817                     	switch	.text
 818  00cf               _LCD_Cmd:
 822                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 824                     ; 284   if (NewState != DISABLE)
 826  00cf 4d            	tnz	a
 827  00d0 2706          	jreq	L153
 828                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 830  00d2 721c5402      	bset	21506,#6
 832  00d6 2004          	jra	L353
 833  00d8               L153:
 834                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 836  00d8 721d5402      	bres	21506,#6
 837  00dc               L353:
 838                     ; 292 }
 841  00dc 81            	ret
 876                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 876                     ; 306 {
 877                     	switch	.text
 878  00dd               _LCD_HighDriveCmd:
 882                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 884                     ; 310   if (NewState != DISABLE)
 886  00dd 4d            	tnz	a
 887  00de 2706          	jreq	L373
 888                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 890  00e0 72185401      	bset	21505,#4
 892  00e4 2004          	jra	L573
 893  00e6               L373:
 894                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 896  00e6 72195401      	bres	21505,#4
 897  00ea               L573:
 898                     ; 318 }
 901  00ea 81            	ret
1008                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1008                     ; 336 {
1009                     	switch	.text
1010  00eb               _LCD_PulseOnDurationConfig:
1012  00eb 88            	push	a
1013       00000000      OFST:	set	0
1016                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1018                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1020  00ec c65401        	ld	a,21505
1021  00ef a41f          	and	a,#31
1022  00f1 c75401        	ld	21505,a
1023                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1025  00f4 c65401        	ld	a,21505
1026  00f7 1a01          	or	a,(OFST+1,sp)
1027  00f9 c75401        	ld	21505,a
1028                     ; 342 }
1031  00fc 84            	pop	a
1032  00fd 81            	ret
1129                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1129                     ; 359 {
1130                     	switch	.text
1131  00fe               _LCD_DeadTimeConfig:
1133  00fe 88            	push	a
1134       00000000      OFST:	set	0
1137                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1139                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1141  00ff c65402        	ld	a,21506
1142  0102 a4f8          	and	a,#248
1143  0104 c75402        	ld	21506,a
1144                     ; 365   LCD->CR3 |= LCD_DeadTime;
1146  0107 c65402        	ld	a,21506
1147  010a 1a01          	or	a,(OFST+1,sp)
1148  010c c75402        	ld	21506,a
1149                     ; 367 }
1152  010f 84            	pop	a
1153  0110 81            	ret
1305                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1305                     ; 392 {
1306                     	switch	.text
1307  0111               _LCD_BlinkConfig:
1311                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1313                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1315                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1317  0111 c65400        	ld	a,21504
1318  0114 a43f          	and	a,#63
1319  0116 c75400        	ld	21504,a
1320                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1322  0119 9e            	ld	a,xh
1323  011a ca5400        	or	a,21504
1324  011d c75400        	ld	21504,a
1325                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1327  0120 c65400        	ld	a,21504
1328  0123 a4c7          	and	a,#199
1329  0125 c75400        	ld	21504,a
1330                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1332  0128 9f            	ld	a,xl
1333  0129 ca5400        	or	a,21504
1334  012c c75400        	ld	21504,a
1335                     ; 403 }
1338  012f 81            	ret
1443                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1443                     ; 420 {
1444                     	switch	.text
1445  0130               _LCD_ContrastConfig:
1447  0130 88            	push	a
1448       00000000      OFST:	set	0
1451                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1453                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1455  0131 c65401        	ld	a,21505
1456  0134 a4f1          	and	a,#241
1457  0136 c75401        	ld	21505,a
1458                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1460  0139 c65401        	ld	a,21505
1461  013c 1a01          	or	a,(OFST+1,sp)
1462  013e c75401        	ld	21505,a
1463                     ; 427 }
1466  0141 84            	pop	a
1467  0142 81            	ret
1671                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1671                     ; 475 {
1672                     	switch	.text
1673  0143               _LCD_WriteRAM:
1675  0143 89            	pushw	x
1676       00000000      OFST:	set	0
1679                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1681                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1683  0144 9e            	ld	a,xh
1684  0145 5f            	clrw	x
1685  0146 97            	ld	xl,a
1686  0147 7b02          	ld	a,(OFST+2,sp)
1687  0149 d7540c        	ld	(21516,x),a
1688                     ; 482 }
1691  014c 85            	popw	x
1692  014d 81            	ret
1749                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1749                     ; 493 {
1750                     	switch	.text
1751  014e               _LCD_PageSelect:
1755                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1757                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1759  014e 7215542f      	bres	21551,#2
1760                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1762  0152 ca542f        	or	a,21551
1763  0155 c7542f        	ld	21551,a
1764                     ; 500 }
1767  0158 81            	ret
1802                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1802                     ; 526 {
1803                     	switch	.text
1804  0159               _LCD_ITConfig:
1808                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1810                     ; 530   if (NewState != DISABLE)
1812  0159 4d            	tnz	a
1813  015a 2706          	jreq	L577
1814                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1816  015c 721a5402      	bset	21506,#5
1818  0160 2004          	jra	L777
1819  0162               L577:
1820                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1822  0162 721b5402      	bres	21506,#5
1823  0166               L777:
1824                     ; 539 }
1827  0166 81            	ret
1883                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1883                     ; 547 {
1884                     	switch	.text
1885  0167               _LCD_GetFlagStatus:
1887  0167 88            	push	a
1888       00000001      OFST:	set	1
1891                     ; 548   FlagStatus status = RESET;
1893                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1895  0168 c65402        	ld	a,21506
1896  016b a510          	bcp	a,#16
1897  016d 2706          	jreq	L7201
1898                     ; 553     status = SET; /* Flag is set */
1900  016f a601          	ld	a,#1
1901  0171 6b01          	ld	(OFST+0,sp),a
1904  0173 2002          	jra	L1301
1905  0175               L7201:
1906                     ; 557     status = RESET; /* Flag is reset*/
1908  0175 0f01          	clr	(OFST+0,sp)
1910  0177               L1301:
1911                     ; 560   return status;
1913  0177 7b01          	ld	a,(OFST+0,sp)
1916  0179 5b01          	addw	sp,#1
1917  017b 81            	ret
1940                     ; 569 void LCD_ClearFlag(void)
1940                     ; 570 {
1941                     	switch	.text
1942  017c               _LCD_ClearFlag:
1946                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1948  017c 72165402      	bset	21506,#3
1949                     ; 574 }
1952  0180 81            	ret
1997                     ; 582 ITStatus LCD_GetITStatus(void)
1997                     ; 583 {
1998                     	switch	.text
1999  0181               _LCD_GetITStatus:
2001  0181 88            	push	a
2002       00000001      OFST:	set	1
2005                     ; 584   ITStatus pendingbitstatus = RESET;
2007                     ; 585   uint8_t enablestatus = 0;
2009                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2011  0182 c65402        	ld	a,21506
2012  0185 a420          	and	a,#32
2013  0187 6b01          	ld	(OFST+0,sp),a
2015                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2017  0189 c65402        	ld	a,21506
2018  018c a510          	bcp	a,#16
2019  018e 270a          	jreq	L5601
2021  0190 0d01          	tnz	(OFST+0,sp)
2022  0192 2706          	jreq	L5601
2023                     ; 592     pendingbitstatus = SET;
2025  0194 a601          	ld	a,#1
2026  0196 6b01          	ld	(OFST+0,sp),a
2029  0198 2002          	jra	L7601
2030  019a               L5601:
2031                     ; 597     pendingbitstatus = RESET;
2033  019a 0f01          	clr	(OFST+0,sp)
2035  019c               L7601:
2036                     ; 600   return  pendingbitstatus;
2038  019c 7b01          	ld	a,(OFST+0,sp)
2041  019e 5b01          	addw	sp,#1
2042  01a0 81            	ret
2066                     ; 609 void LCD_ClearITPendingBit(void)
2066                     ; 610 {
2067                     	switch	.text
2068  01a1               _LCD_ClearITPendingBit:
2072                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2074  01a1 72165402      	bset	21506,#3
2075                     ; 614 }
2078  01a5 81            	ret
2091                     	xdef	_LCD_ClearITPendingBit
2092                     	xdef	_LCD_GetITStatus
2093                     	xdef	_LCD_ClearFlag
2094                     	xdef	_LCD_GetFlagStatus
2095                     	xdef	_LCD_ITConfig
2096                     	xdef	_LCD_PageSelect
2097                     	xdef	_LCD_WriteRAM
2098                     	xdef	_LCD_ContrastConfig
2099                     	xdef	_LCD_BlinkConfig
2100                     	xdef	_LCD_DeadTimeConfig
2101                     	xdef	_LCD_PulseOnDurationConfig
2102                     	xdef	_LCD_HighDriveCmd
2103                     	xdef	_LCD_Cmd
2104                     	xdef	_LCD_PortMaskConfig
2105                     	xdef	_LCD_Init
2106                     	xdef	_LCD_DeInit
2125                     	end
