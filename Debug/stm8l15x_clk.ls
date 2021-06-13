   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     .const:	section	.text
  14  0000               _SYSDivFactor:
  15  0000 01            	dc.b	1
  16  0001 02            	dc.b	2
  17  0002 04            	dc.b	4
  18  0003 08            	dc.b	8
  19  0004 10            	dc.b	16
  48                     ; 120 void CLK_DeInit(void)
  48                     ; 121 {
  50                     	switch	.text
  51  0000               _CLK_DeInit:
  55                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  57  0000 351150c2      	mov	20674,#17
  58                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  60  0004 725f50c6      	clr	20678
  61                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  63  0008 725f50c1      	clr	20673
  64                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  66  000c 725f50cb      	clr	20683
  67                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  69  0010 350150c8      	mov	20680,#1
  70                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  72  0014 725f50c9      	clr	20681
  73                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  75  0018 350350c0      	mov	20672,#3
  76                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  78  001c 725f50c3      	clr	20675
  79                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  81  0020 358050c4      	mov	20676,#128
  82                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  84  0024 725f50d0      	clr	20688
  85                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  87  0028 725f50ca      	clr	20682
  88                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  90  002c 725f50c5      	clr	20677
  91                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  93  0030 725f50cd      	clr	20685
  94                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  96  0034 725f50cc      	clr	20684
  97                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  99  0038 725f50ce      	clr	20686
 100                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 102  003c 35b950cf      	mov	20687,#185
 103                     ; 138 }
 106  0040 81            	ret
 161                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 161                     ; 161 {
 162                     	switch	.text
 163  0041               _CLK_HSICmd:
 167                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 169                     ; 165   if (NewState != DISABLE)
 171  0041 4d            	tnz	a
 172  0042 2706          	jreq	L74
 173                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 175  0044 721050c2      	bset	20674,#0
 177  0048 2004          	jra	L15
 178  004a               L74:
 179                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 181  004a 721150c2      	bres	20674,#0
 182  004e               L15:
 183                     ; 175 }
 186  004e 81            	ret
 222                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 222                     ; 189 {
 223                     	switch	.text
 224  004f               _CLK_AdjustHSICalibrationValue:
 228                     ; 191   CLK->HSIUNLCKR = 0xAC;
 230  004f 35ac50ce      	mov	20686,#172
 231                     ; 192   CLK->HSIUNLCKR = 0x35;
 233  0053 353550ce      	mov	20686,#53
 234                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 236  0057 c750cd        	ld	20685,a
 237                     ; 196 }
 240  005a 81            	ret
 275                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 275                     ; 213 {
 276                     	switch	.text
 277  005b               _CLK_LSICmd:
 281                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 283                     ; 218   if (NewState != DISABLE)
 285  005b 4d            	tnz	a
 286  005c 2706          	jreq	L701
 287                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 289  005e 721450c2      	bset	20674,#2
 291  0062 2004          	jra	L111
 292  0064               L701:
 293                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 295  0064 721550c2      	bres	20674,#2
 296  0068               L111:
 297                     ; 228 }
 300  0068 81            	ret
 362                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 362                     ; 250 {
 363                     	switch	.text
 364  0069               _CLK_HSEConfig:
 368                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 370                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 372  0069 721150c6      	bres	20678,#0
 373                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 375  006d 721950c6      	bres	20678,#4
 376                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 378  0071 ca50c6        	or	a,20678
 379  0074 c750c6        	ld	20678,a
 380                     ; 263 }
 383  0077 81            	ret
 445                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 445                     ; 281 {
 446                     	switch	.text
 447  0078               _CLK_LSEConfig:
 451                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 453                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 455  0078 721550c6      	bres	20678,#2
 456                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 458  007c 721b50c6      	bres	20678,#5
 459                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 461  0080 ca50c6        	or	a,20678
 462  0083 c750c6        	ld	20678,a
 463                     ; 295 }
 466  0086 81            	ret
 490                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 490                     ; 307 {
 491                     	switch	.text
 492  0087               _CLK_ClockSecuritySystemEnable:
 496                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 498  0087 721050ca      	bset	20682,#0
 499                     ; 310 }
 502  008b 81            	ret
 538                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 538                     ; 318 {
 539                     	switch	.text
 540  008c               _CLK_ClockSecuritySytemDeglitchCmd:
 544                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 546                     ; 322   if (NewState != DISABLE)
 548  008c 4d            	tnz	a
 549  008d 2706          	jreq	L122
 550                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 552  008f 721850ca      	bset	20682,#4
 554  0093 2004          	jra	L322
 555  0095               L122:
 556                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 558  0095 721950ca      	bres	20682,#4
 559  0099               L322:
 560                     ; 332 }
 563  0099 81            	ret
 704                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 704                     ; 357 {
 705                     	switch	.text
 706  009a               _CLK_CCOConfig:
 708  009a 89            	pushw	x
 709       00000000      OFST:	set	0
 712                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 714                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 716                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 718  009b 9f            	ld	a,xl
 719  009c 1a01          	or	a,(OFST+1,sp)
 720  009e c750c5        	ld	20677,a
 721                     ; 364 }
 724  00a1 85            	popw	x
 725  00a2 81            	ret
 799                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 799                     ; 417 {
 800                     	switch	.text
 801  00a3               _CLK_SYSCLKSourceConfig:
 805                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 807                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 809  00a3 c750c8        	ld	20680,a
 810                     ; 423 }
 813  00a6 81            	ret
 838                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 838                     ; 436 {
 839                     	switch	.text
 840  00a7               _CLK_GetSYSCLKSource:
 844                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 846  00a7 c650c7        	ld	a,20679
 849  00aa 81            	ret
 921                     ; 478 uint32_t CLK_GetClockFreq(void)
 921                     ; 479 {
 922                     	switch	.text
 923  00ab               _CLK_GetClockFreq:
 925  00ab 5209          	subw	sp,#9
 926       00000009      OFST:	set	9
 929                     ; 480   uint32_t clockfrequency = 0;
 931                     ; 481   uint32_t sourcefrequency = 0;
 933  00ad ae0000        	ldw	x,#0
 934  00b0 1f07          	ldw	(OFST-2,sp),x
 935  00b2 ae0000        	ldw	x,#0
 936  00b5 1f05          	ldw	(OFST-4,sp),x
 938                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 940                     ; 483   uint8_t tmp = 0, presc = 0;
 944                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 946  00b7 c650c7        	ld	a,20679
 947  00ba 6b09          	ld	(OFST+0,sp),a
 949                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 951  00bc 7b09          	ld	a,(OFST+0,sp)
 952  00be a101          	cp	a,#1
 953  00c0 260c          	jrne	L704
 954                     ; 490     sourcefrequency = HSI_VALUE;
 956  00c2 ae2400        	ldw	x,#9216
 957  00c5 1f07          	ldw	(OFST-2,sp),x
 958  00c7 ae00f4        	ldw	x,#244
 959  00ca 1f05          	ldw	(OFST-4,sp),x
 962  00cc 2022          	jra	L114
 963  00ce               L704:
 964                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 966  00ce 7b09          	ld	a,(OFST+0,sp)
 967  00d0 a102          	cp	a,#2
 968  00d2 260c          	jrne	L314
 969                     ; 494     sourcefrequency = LSI_VALUE;
 971  00d4 ae9470        	ldw	x,#38000
 972  00d7 1f07          	ldw	(OFST-2,sp),x
 973  00d9 ae0000        	ldw	x,#0
 974  00dc 1f05          	ldw	(OFST-4,sp),x
 977  00de 2010          	jra	L114
 978  00e0               L314:
 979                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 981  00e0 7b09          	ld	a,(OFST+0,sp)
 982  00e2 a104          	cp	a,#4
 983  00e4 260a          	jrne	L714
 984                     ; 498     sourcefrequency = HSE_VALUE;
 986  00e6 ae2400        	ldw	x,#9216
 987  00e9 1f07          	ldw	(OFST-2,sp),x
 988  00eb ae00f4        	ldw	x,#244
 989  00ee 1f05          	ldw	(OFST-4,sp),x
 992  00f0               L714:
 993                     ; 502     clockfrequency = LSE_VALUE;
 995  00f0               L114:
 996                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 998  00f0 c650c0        	ld	a,20672
 999  00f3 a407          	and	a,#7
1000  00f5 6b09          	ld	(OFST+0,sp),a
1002                     ; 507   presc = SYSDivFactor[tmp];
1004  00f7 7b09          	ld	a,(OFST+0,sp)
1005  00f9 5f            	clrw	x
1006  00fa 97            	ld	xl,a
1007  00fb d60000        	ld	a,(_SYSDivFactor,x)
1008  00fe 6b09          	ld	(OFST+0,sp),a
1010                     ; 510   clockfrequency = sourcefrequency / presc;
1012  0100 7b09          	ld	a,(OFST+0,sp)
1013  0102 b703          	ld	c_lreg+3,a
1014  0104 3f02          	clr	c_lreg+2
1015  0106 3f01          	clr	c_lreg+1
1016  0108 3f00          	clr	c_lreg
1017  010a 96            	ldw	x,sp
1018  010b 1c0001        	addw	x,#OFST-8
1019  010e cd0000        	call	c_rtol
1022  0111 96            	ldw	x,sp
1023  0112 1c0005        	addw	x,#OFST-4
1024  0115 cd0000        	call	c_ltor
1026  0118 96            	ldw	x,sp
1027  0119 1c0001        	addw	x,#OFST-8
1028  011c cd0000        	call	c_ludv
1030  011f 96            	ldw	x,sp
1031  0120 1c0005        	addw	x,#OFST-4
1032  0123 cd0000        	call	c_rtol
1035                     ; 512   return((uint32_t)clockfrequency);
1037  0126 96            	ldw	x,sp
1038  0127 1c0005        	addw	x,#OFST-4
1039  012a cd0000        	call	c_ltor
1043  012d 5b09          	addw	sp,#9
1044  012f 81            	ret
1142                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1142                     ; 529 {
1143                     	switch	.text
1144  0130               _CLK_SYSCLKDivConfig:
1148                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1150                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1152  0130 c750c0        	ld	20672,a
1153                     ; 534 }
1156  0133 81            	ret
1192                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1192                     ; 542 {
1193                     	switch	.text
1194  0134               _CLK_SYSCLKSourceSwitchCmd:
1198                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1200                     ; 546   if (NewState != DISABLE)
1202  0134 4d            	tnz	a
1203  0135 2706          	jreq	L305
1204                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1206  0137 721250c9      	bset	20681,#1
1208  013b 2004          	jra	L505
1209  013d               L305:
1210                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1212  013d 721350c9      	bres	20681,#1
1213  0141               L505:
1214                     ; 556 }
1217  0141 81            	ret
1363                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1363                     ; 617 {
1364                     	switch	.text
1365  0142               _CLK_RTCClockConfig:
1367  0142 89            	pushw	x
1368       00000000      OFST:	set	0
1371                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1373                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1375                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1377  0143 9f            	ld	a,xl
1378  0144 1a01          	or	a,(OFST+1,sp)
1379  0146 c750c1        	ld	20673,a
1380                     ; 624 }
1383  0149 85            	popw	x
1384  014a 81            	ret
1450                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1450                     ; 636 {
1451                     	switch	.text
1452  014b               _CLK_BEEPClockConfig:
1456                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1458                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1460  014b c750cb        	ld	20683,a
1461                     ; 643 }
1464  014e 81            	ret
1689                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1689                     ; 678 {
1690                     	switch	.text
1691  014f               _CLK_PeripheralClockConfig:
1693  014f 89            	pushw	x
1694  0150 88            	push	a
1695       00000001      OFST:	set	1
1698                     ; 679   uint8_t reg = 0;
1700                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1702                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1704                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1706  0151 9e            	ld	a,xh
1707  0152 a4f0          	and	a,#240
1708  0154 6b01          	ld	(OFST+0,sp),a
1710                     ; 688   if ( reg == 0x00)
1712  0156 0d01          	tnz	(OFST+0,sp)
1713  0158 2635          	jrne	L527
1714                     ; 690     if (NewState != DISABLE)
1716  015a 0d03          	tnz	(OFST+2,sp)
1717  015c 2719          	jreq	L727
1718                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1720  015e 7b02          	ld	a,(OFST+1,sp)
1721  0160 a40f          	and	a,#15
1722  0162 5f            	clrw	x
1723  0163 97            	ld	xl,a
1724  0164 a601          	ld	a,#1
1725  0166 5d            	tnzw	x
1726  0167 2704          	jreq	L64
1727  0169               L05:
1728  0169 48            	sll	a
1729  016a 5a            	decw	x
1730  016b 26fc          	jrne	L05
1731  016d               L64:
1732  016d ca50c3        	or	a,20675
1733  0170 c750c3        	ld	20675,a
1735  0173 acf901f9      	jpf	L337
1736  0177               L727:
1737                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1739  0177 7b02          	ld	a,(OFST+1,sp)
1740  0179 a40f          	and	a,#15
1741  017b 5f            	clrw	x
1742  017c 97            	ld	xl,a
1743  017d a601          	ld	a,#1
1744  017f 5d            	tnzw	x
1745  0180 2704          	jreq	L25
1746  0182               L45:
1747  0182 48            	sll	a
1748  0183 5a            	decw	x
1749  0184 26fc          	jrne	L45
1750  0186               L25:
1751  0186 43            	cpl	a
1752  0187 c450c3        	and	a,20675
1753  018a c750c3        	ld	20675,a
1754  018d 206a          	jra	L337
1755  018f               L527:
1756                     ; 701   else if (reg == 0x10)
1758  018f 7b01          	ld	a,(OFST+0,sp)
1759  0191 a110          	cp	a,#16
1760  0193 2633          	jrne	L537
1761                     ; 703     if (NewState != DISABLE)
1763  0195 0d03          	tnz	(OFST+2,sp)
1764  0197 2717          	jreq	L737
1765                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1767  0199 7b02          	ld	a,(OFST+1,sp)
1768  019b a40f          	and	a,#15
1769  019d 5f            	clrw	x
1770  019e 97            	ld	xl,a
1771  019f a601          	ld	a,#1
1772  01a1 5d            	tnzw	x
1773  01a2 2704          	jreq	L65
1774  01a4               L06:
1775  01a4 48            	sll	a
1776  01a5 5a            	decw	x
1777  01a6 26fc          	jrne	L06
1778  01a8               L65:
1779  01a8 ca50c4        	or	a,20676
1780  01ab c750c4        	ld	20676,a
1782  01ae 2049          	jra	L337
1783  01b0               L737:
1784                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1786  01b0 7b02          	ld	a,(OFST+1,sp)
1787  01b2 a40f          	and	a,#15
1788  01b4 5f            	clrw	x
1789  01b5 97            	ld	xl,a
1790  01b6 a601          	ld	a,#1
1791  01b8 5d            	tnzw	x
1792  01b9 2704          	jreq	L26
1793  01bb               L46:
1794  01bb 48            	sll	a
1795  01bc 5a            	decw	x
1796  01bd 26fc          	jrne	L46
1797  01bf               L26:
1798  01bf 43            	cpl	a
1799  01c0 c450c4        	and	a,20676
1800  01c3 c750c4        	ld	20676,a
1801  01c6 2031          	jra	L337
1802  01c8               L537:
1803                     ; 716     if (NewState != DISABLE)
1805  01c8 0d03          	tnz	(OFST+2,sp)
1806  01ca 2717          	jreq	L547
1807                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1809  01cc 7b02          	ld	a,(OFST+1,sp)
1810  01ce a40f          	and	a,#15
1811  01d0 5f            	clrw	x
1812  01d1 97            	ld	xl,a
1813  01d2 a601          	ld	a,#1
1814  01d4 5d            	tnzw	x
1815  01d5 2704          	jreq	L66
1816  01d7               L07:
1817  01d7 48            	sll	a
1818  01d8 5a            	decw	x
1819  01d9 26fc          	jrne	L07
1820  01db               L66:
1821  01db ca50d0        	or	a,20688
1822  01de c750d0        	ld	20688,a
1824  01e1 2016          	jra	L337
1825  01e3               L547:
1826                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1828  01e3 7b02          	ld	a,(OFST+1,sp)
1829  01e5 a40f          	and	a,#15
1830  01e7 5f            	clrw	x
1831  01e8 97            	ld	xl,a
1832  01e9 a601          	ld	a,#1
1833  01eb 5d            	tnzw	x
1834  01ec 2704          	jreq	L27
1835  01ee               L47:
1836  01ee 48            	sll	a
1837  01ef 5a            	decw	x
1838  01f0 26fc          	jrne	L47
1839  01f2               L27:
1840  01f2 43            	cpl	a
1841  01f3 c450d0        	and	a,20688
1842  01f6 c750d0        	ld	20688,a
1843  01f9               L337:
1844                     ; 727 }
1847  01f9 5b03          	addw	sp,#3
1848  01fb 81            	ret
1872                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1872                     ; 766 {
1873                     	switch	.text
1874  01fc               _CLK_LSEClockSecuritySystemEnable:
1878                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1880  01fc 72105190      	bset	20880,#0
1881                     ; 769 }
1884  0200 81            	ret
1908                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1908                     ; 778 {
1909                     	switch	.text
1910  0201               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1914                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1916  0201 72125190      	bset	20880,#1
1917                     ; 781 }
1920  0205 81            	ret
1995                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1995                     ; 808 {
1996                     	switch	.text
1997  0206               _CLK_HaltConfig:
1999  0206 89            	pushw	x
2000       00000000      OFST:	set	0
2003                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
2005                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
2007                     ; 813   if (NewState != DISABLE)
2009  0207 9f            	ld	a,xl
2010  0208 4d            	tnz	a
2011  0209 2709          	jreq	L5201
2012                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2014  020b 9e            	ld	a,xh
2015  020c ca50c2        	or	a,20674
2016  020f c750c2        	ld	20674,a
2018  0212 2009          	jra	L7201
2019  0214               L5201:
2020                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2022  0214 7b01          	ld	a,(OFST+1,sp)
2023  0216 43            	cpl	a
2024  0217 c450c2        	and	a,20674
2025  021a c750c2        	ld	20674,a
2026  021d               L7201:
2027                     ; 821 }
2030  021d 85            	popw	x
2031  021e 81            	ret
2067                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2067                     ; 832 {
2068                     	switch	.text
2069  021f               _CLK_MainRegulatorCmd:
2073                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2075                     ; 836   if (NewState != DISABLE)
2077  021f 4d            	tnz	a
2078  0220 2706          	jreq	L7401
2079                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2081  0222 721350cf      	bres	20687,#1
2083  0226 2004          	jra	L1501
2084  0228               L7401:
2085                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2087  0228 721250cf      	bset	20687,#1
2088  022c               L1501:
2089                     ; 846 }
2092  022c 81            	ret
2164                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2164                     ; 876 {
2165                     	switch	.text
2166  022d               _CLK_ITConfig:
2168  022d 89            	pushw	x
2169       00000000      OFST:	set	0
2172                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2174                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2176                     ; 882   if (NewState != DISABLE)
2178  022e 9f            	ld	a,xl
2179  022f 4d            	tnz	a
2180  0230 271d          	jreq	L7011
2181                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2183  0232 9e            	ld	a,xh
2184  0233 a11c          	cp	a,#28
2185  0235 2606          	jrne	L1111
2186                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2188  0237 721450c9      	bset	20681,#2
2190  023b 202e          	jra	L1211
2191  023d               L1111:
2192                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2194  023d 7b01          	ld	a,(OFST+1,sp)
2195  023f a12c          	cp	a,#44
2196  0241 2606          	jrne	L5111
2197                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2199  0243 72145190      	bset	20880,#2
2201  0247 2022          	jra	L1211
2202  0249               L5111:
2203                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2205  0249 721450ca      	bset	20682,#2
2206  024d 201c          	jra	L1211
2207  024f               L7011:
2208                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2210  024f 7b01          	ld	a,(OFST+1,sp)
2211  0251 a11c          	cp	a,#28
2212  0253 2606          	jrne	L3211
2213                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2215  0255 721550c9      	bres	20681,#2
2217  0259 2010          	jra	L1211
2218  025b               L3211:
2219                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2221  025b 7b01          	ld	a,(OFST+1,sp)
2222  025d a12c          	cp	a,#44
2223  025f 2606          	jrne	L7211
2224                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2226  0261 72155190      	bres	20880,#2
2228  0265 2004          	jra	L1211
2229  0267               L7211:
2230                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2232  0267 721550ca      	bres	20682,#2
2233  026b               L1211:
2234                     ; 918 }
2237  026b 85            	popw	x
2238  026c 81            	ret
2461                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2461                     ; 946 {
2462                     	switch	.text
2463  026d               _CLK_GetFlagStatus:
2465  026d 88            	push	a
2466  026e 89            	pushw	x
2467       00000002      OFST:	set	2
2470                     ; 947   uint8_t reg = 0;
2472                     ; 948   uint8_t pos = 0;
2474                     ; 949   FlagStatus bitstatus = RESET;
2476                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2478                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2480  026f a4f0          	and	a,#240
2481  0271 6b02          	ld	(OFST+0,sp),a
2483                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2485  0273 7b03          	ld	a,(OFST+1,sp)
2486  0275 a40f          	and	a,#15
2487  0277 6b01          	ld	(OFST-1,sp),a
2489                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2491  0279 0d02          	tnz	(OFST+0,sp)
2492  027b 2607          	jrne	L7421
2493                     ; 962     reg = CLK->CRTCR;
2495  027d c650c1        	ld	a,20673
2496  0280 6b02          	ld	(OFST+0,sp),a
2499  0282 2060          	jra	L1521
2500  0284               L7421:
2501                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2503  0284 7b02          	ld	a,(OFST+0,sp)
2504  0286 a110          	cp	a,#16
2505  0288 2607          	jrne	L3521
2506                     ; 966     reg = CLK->ICKCR;
2508  028a c650c2        	ld	a,20674
2509  028d 6b02          	ld	(OFST+0,sp),a
2512  028f 2053          	jra	L1521
2513  0291               L3521:
2514                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2516  0291 7b02          	ld	a,(OFST+0,sp)
2517  0293 a120          	cp	a,#32
2518  0295 2607          	jrne	L7521
2519                     ; 970     reg = CLK->CCOR;
2521  0297 c650c5        	ld	a,20677
2522  029a 6b02          	ld	(OFST+0,sp),a
2525  029c 2046          	jra	L1521
2526  029e               L7521:
2527                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2529  029e 7b02          	ld	a,(OFST+0,sp)
2530  02a0 a130          	cp	a,#48
2531  02a2 2607          	jrne	L3621
2532                     ; 974     reg = CLK->ECKCR;
2534  02a4 c650c6        	ld	a,20678
2535  02a7 6b02          	ld	(OFST+0,sp),a
2538  02a9 2039          	jra	L1521
2539  02ab               L3621:
2540                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2542  02ab 7b02          	ld	a,(OFST+0,sp)
2543  02ad a140          	cp	a,#64
2544  02af 2607          	jrne	L7621
2545                     ; 978     reg = CLK->SWCR;
2547  02b1 c650c9        	ld	a,20681
2548  02b4 6b02          	ld	(OFST+0,sp),a
2551  02b6 202c          	jra	L1521
2552  02b8               L7621:
2553                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2555  02b8 7b02          	ld	a,(OFST+0,sp)
2556  02ba a150          	cp	a,#80
2557  02bc 2607          	jrne	L3721
2558                     ; 982     reg = CLK->CSSR;
2560  02be c650ca        	ld	a,20682
2561  02c1 6b02          	ld	(OFST+0,sp),a
2564  02c3 201f          	jra	L1521
2565  02c5               L3721:
2566                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2568  02c5 7b02          	ld	a,(OFST+0,sp)
2569  02c7 a170          	cp	a,#112
2570  02c9 2607          	jrne	L7721
2571                     ; 986     reg = CLK->REGCSR;
2573  02cb c650cf        	ld	a,20687
2574  02ce 6b02          	ld	(OFST+0,sp),a
2577  02d0 2012          	jra	L1521
2578  02d2               L7721:
2579                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2581  02d2 7b02          	ld	a,(OFST+0,sp)
2582  02d4 a180          	cp	a,#128
2583  02d6 2607          	jrne	L3031
2584                     ; 990     reg = CSSLSE->CSR;
2586  02d8 c65190        	ld	a,20880
2587  02db 6b02          	ld	(OFST+0,sp),a
2590  02dd 2005          	jra	L1521
2591  02df               L3031:
2592                     ; 994     reg = CLK->CBEEPR;
2594  02df c650cb        	ld	a,20683
2595  02e2 6b02          	ld	(OFST+0,sp),a
2597  02e4               L1521:
2598                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2600  02e4 7b01          	ld	a,(OFST-1,sp)
2601  02e6 5f            	clrw	x
2602  02e7 97            	ld	xl,a
2603  02e8 a601          	ld	a,#1
2604  02ea 5d            	tnzw	x
2605  02eb 2704          	jreq	L211
2606  02ed               L411:
2607  02ed 48            	sll	a
2608  02ee 5a            	decw	x
2609  02ef 26fc          	jrne	L411
2610  02f1               L211:
2611  02f1 1402          	and	a,(OFST+0,sp)
2612  02f3 2706          	jreq	L7031
2613                     ; 1000     bitstatus = SET;
2615  02f5 a601          	ld	a,#1
2616  02f7 6b02          	ld	(OFST+0,sp),a
2619  02f9 2002          	jra	L1131
2620  02fb               L7031:
2621                     ; 1004     bitstatus = RESET;
2623  02fb 0f02          	clr	(OFST+0,sp)
2625  02fd               L1131:
2626                     ; 1008   return((FlagStatus)bitstatus);
2628  02fd 7b02          	ld	a,(OFST+0,sp)
2631  02ff 5b03          	addw	sp,#3
2632  0301 81            	ret
2655                     ; 1016 void CLK_ClearFlag(void)
2655                     ; 1017 {
2656                     	switch	.text
2657  0302               _CLK_ClearFlag:
2661                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2663  0302 72175190      	bres	20880,#3
2664                     ; 1021 }
2667  0306 81            	ret
2713                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2713                     ; 1033 {
2714                     	switch	.text
2715  0307               _CLK_GetITStatus:
2717  0307 88            	push	a
2718  0308 88            	push	a
2719       00000001      OFST:	set	1
2722                     ; 1035   ITStatus bitstatus = RESET;
2724                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2726                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2728  0309 a11c          	cp	a,#28
2729  030b 2611          	jrne	L5431
2730                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2732  030d c450c9        	and	a,20681
2733  0310 a10c          	cp	a,#12
2734  0312 2606          	jrne	L7431
2735                     ; 1045       bitstatus = SET;
2737  0314 a601          	ld	a,#1
2738  0316 6b01          	ld	(OFST+0,sp),a
2741  0318 202e          	jra	L3531
2742  031a               L7431:
2743                     ; 1049       bitstatus = RESET;
2745  031a 0f01          	clr	(OFST+0,sp)
2747  031c 202a          	jra	L3531
2748  031e               L5431:
2749                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2751  031e 7b02          	ld	a,(OFST+1,sp)
2752  0320 a12c          	cp	a,#44
2753  0322 2613          	jrne	L5531
2754                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2756  0324 c65190        	ld	a,20880
2757  0327 1402          	and	a,(OFST+1,sp)
2758  0329 a10c          	cp	a,#12
2759  032b 2606          	jrne	L7531
2760                     ; 1057       bitstatus = SET;
2762  032d a601          	ld	a,#1
2763  032f 6b01          	ld	(OFST+0,sp),a
2766  0331 2015          	jra	L3531
2767  0333               L7531:
2768                     ; 1061       bitstatus = RESET;
2770  0333 0f01          	clr	(OFST+0,sp)
2772  0335 2011          	jra	L3531
2773  0337               L5531:
2774                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2776  0337 c650ca        	ld	a,20682
2777  033a 1402          	and	a,(OFST+1,sp)
2778  033c a10c          	cp	a,#12
2779  033e 2606          	jrne	L5631
2780                     ; 1069       bitstatus = SET;
2782  0340 a601          	ld	a,#1
2783  0342 6b01          	ld	(OFST+0,sp),a
2786  0344 2002          	jra	L3531
2787  0346               L5631:
2788                     ; 1073       bitstatus = RESET;
2790  0346 0f01          	clr	(OFST+0,sp)
2792  0348               L3531:
2793                     ; 1078   return bitstatus;
2795  0348 7b01          	ld	a,(OFST+0,sp)
2798  034a 85            	popw	x
2799  034b 81            	ret
2835                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2835                     ; 1090 {
2836                     	switch	.text
2837  034c               _CLK_ClearITPendingBit:
2841                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2843                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2845  034c a4f0          	and	a,#240
2846  034e a120          	cp	a,#32
2847  0350 2606          	jrne	L7041
2848                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2850  0352 72175190      	bres	20880,#3
2852  0356 2004          	jra	L1141
2853  0358               L7041:
2854                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2856  0358 721750c9      	bres	20681,#3
2857  035c               L1141:
2858                     ; 1105 }
2861  035c 81            	ret
2886                     	xdef	_SYSDivFactor
2887                     	xdef	_CLK_ClearITPendingBit
2888                     	xdef	_CLK_GetITStatus
2889                     	xdef	_CLK_ClearFlag
2890                     	xdef	_CLK_GetFlagStatus
2891                     	xdef	_CLK_ITConfig
2892                     	xdef	_CLK_MainRegulatorCmd
2893                     	xdef	_CLK_HaltConfig
2894                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2895                     	xdef	_CLK_LSEClockSecuritySystemEnable
2896                     	xdef	_CLK_PeripheralClockConfig
2897                     	xdef	_CLK_BEEPClockConfig
2898                     	xdef	_CLK_RTCClockConfig
2899                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2900                     	xdef	_CLK_SYSCLKDivConfig
2901                     	xdef	_CLK_GetClockFreq
2902                     	xdef	_CLK_GetSYSCLKSource
2903                     	xdef	_CLK_SYSCLKSourceConfig
2904                     	xdef	_CLK_CCOConfig
2905                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2906                     	xdef	_CLK_ClockSecuritySystemEnable
2907                     	xdef	_CLK_LSEConfig
2908                     	xdef	_CLK_HSEConfig
2909                     	xdef	_CLK_LSICmd
2910                     	xdef	_CLK_AdjustHSICalibrationValue
2911                     	xdef	_CLK_HSICmd
2912                     	xdef	_CLK_DeInit
2913                     	xref.b	c_lreg
2914                     	xref.b	c_x
2933                     	xref	c_ludv
2934                     	xref	c_rtol
2935                     	xref	c_ltor
2936                     	end
