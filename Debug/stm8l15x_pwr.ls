   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 82 void PWR_DeInit(void)
  41                     ; 83 {
  43                     	switch	.text
  44  0000               _PWR_DeInit:
  48                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  50  0000 352050b2      	mov	20658,#32
  51                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  53  0004 725f50b3      	clr	20659
  54                     ; 86 }
  57  0008 81            	ret
 154                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 154                     ; 103 {
 155                     	switch	.text
 156  0009               _PWR_PVDLevelConfig:
 158  0009 88            	push	a
 159       00000000      OFST:	set	0
 162                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 164                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 166  000a c650b2        	ld	a,20658
 167  000d a4f1          	and	a,#241
 168  000f c750b2        	ld	20658,a
 169                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 171  0012 c650b2        	ld	a,20658
 172  0015 1a01          	or	a,(OFST+1,sp)
 173  0017 c750b2        	ld	20658,a
 174                     ; 113 }
 177  001a 84            	pop	a
 178  001b 81            	ret
 233                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 233                     ; 122 {
 234                     	switch	.text
 235  001c               _PWR_PVDCmd:
 239                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 241                     ; 126   if (NewState != DISABLE)
 243  001c 4d            	tnz	a
 244  001d 2706          	jreq	L111
 245                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 247  001f 721050b2      	bset	20658,#0
 249  0023 2004          	jra	L311
 250  0025               L111:
 251                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 253  0025 721150b2      	bres	20658,#0
 254  0029               L311:
 255                     ; 136 }
 258  0029 81            	ret
 293                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 293                     ; 172 {
 294                     	switch	.text
 295  002a               _PWR_FastWakeUpCmd:
 299                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 301                     ; 176   if (NewState != DISABLE)
 303  002a 4d            	tnz	a
 304  002b 2706          	jreq	L331
 305                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 307  002d 721450b3      	bset	20659,#2
 309  0031 2004          	jra	L531
 310  0033               L331:
 311                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 313  0033 721550b3      	bres	20659,#2
 314  0037               L531:
 315                     ; 186 }
 318  0037 81            	ret
 354                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 354                     ; 195 {
 355                     	switch	.text
 356  0038               _PWR_UltraLowPowerCmd:
 360                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 362                     ; 199   if (NewState != DISABLE)
 364  0038 4d            	tnz	a
 365  0039 2706          	jreq	L551
 366                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 368  003b 721250b3      	bset	20659,#1
 370  003f 2004          	jra	L751
 371  0041               L551:
 372                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 374  0041 721350b3      	bres	20659,#1
 375  0045               L751:
 376                     ; 209 }
 379  0045 81            	ret
 414                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 414                     ; 233 {
 415                     	switch	.text
 416  0046               _PWR_PVDITConfig:
 420                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 422                     ; 237   if (NewState != DISABLE)
 424  0046 4d            	tnz	a
 425  0047 2706          	jreq	L771
 426                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 428  0049 721850b2      	bset	20658,#4
 430  004d 2004          	jra	L102
 431  004f               L771:
 432                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 434  004f 721950b2      	bres	20658,#4
 435  0053               L102:
 436                     ; 247 }
 439  0053 81            	ret
 532                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 532                     ; 262 {
 533                     	switch	.text
 534  0054               _PWR_GetFlagStatus:
 536  0054 88            	push	a
 537  0055 88            	push	a
 538       00000001      OFST:	set	1
 541                     ; 263   FlagStatus bitstatus = RESET;
 543                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 545                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 547  0056 a501          	bcp	a,#1
 548  0058 2711          	jreq	L742
 549                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 551  005a c650b3        	ld	a,20659
 552  005d a501          	bcp	a,#1
 553  005f 2706          	jreq	L152
 554                     ; 272       bitstatus = SET;
 556  0061 a601          	ld	a,#1
 557  0063 6b01          	ld	(OFST+0,sp),a
 560  0065 2013          	jra	L552
 561  0067               L152:
 562                     ; 276       bitstatus = RESET;
 564  0067 0f01          	clr	(OFST+0,sp)
 566  0069 200f          	jra	L552
 567  006b               L742:
 568                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 570  006b c650b2        	ld	a,20658
 571  006e 1502          	bcp	a,(OFST+1,sp)
 572  0070 2706          	jreq	L752
 573                     ; 283       bitstatus = SET;
 575  0072 a601          	ld	a,#1
 576  0074 6b01          	ld	(OFST+0,sp),a
 579  0076 2002          	jra	L552
 580  0078               L752:
 581                     ; 287       bitstatus = RESET;
 583  0078 0f01          	clr	(OFST+0,sp)
 585  007a               L552:
 586                     ; 292   return((FlagStatus)bitstatus);
 588  007a 7b01          	ld	a,(OFST+0,sp)
 591  007c 85            	popw	x
 592  007d 81            	ret
 615                     ; 300 void PWR_PVDClearFlag(void)
 615                     ; 301 {
 616                     	switch	.text
 617  007e               _PWR_PVDClearFlag:
 621                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 623  007e 721a50b2      	bset	20658,#5
 624                     ; 304 }
 627  0082 81            	ret
 681                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 681                     ; 312 {
 682                     	switch	.text
 683  0083               _PWR_PVDGetITStatus:
 685  0083 89            	pushw	x
 686       00000002      OFST:	set	2
 689                     ; 313   ITStatus bitstatus = RESET;
 691                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 695                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 697  0084 c650b2        	ld	a,20658
 698  0087 a420          	and	a,#32
 699  0089 6b01          	ld	(OFST-1,sp),a
 701                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 703  008b c650b2        	ld	a,20658
 704  008e a410          	and	a,#16
 705  0090 6b02          	ld	(OFST+0,sp),a
 707                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 709  0092 0d01          	tnz	(OFST-1,sp)
 710  0094 270a          	jreq	L123
 712  0096 0d02          	tnz	(OFST+0,sp)
 713  0098 2706          	jreq	L123
 714                     ; 322     bitstatus = (ITStatus)SET;
 716  009a a601          	ld	a,#1
 717  009c 6b02          	ld	(OFST+0,sp),a
 720  009e 2002          	jra	L323
 721  00a0               L123:
 722                     ; 326     bitstatus = (ITStatus)RESET;
 724  00a0 0f02          	clr	(OFST+0,sp)
 726  00a2               L323:
 727                     ; 328   return ((ITStatus)bitstatus);
 729  00a2 7b02          	ld	a,(OFST+0,sp)
 732  00a4 85            	popw	x
 733  00a5 81            	ret
 757                     ; 336 void PWR_PVDClearITPendingBit(void)
 757                     ; 337 {
 758                     	switch	.text
 759  00a6               _PWR_PVDClearITPendingBit:
 763                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 765  00a6 721a50b2      	bset	20658,#5
 766                     ; 340 }
 769  00aa 81            	ret
 782                     	xdef	_PWR_PVDClearITPendingBit
 783                     	xdef	_PWR_PVDClearFlag
 784                     	xdef	_PWR_GetFlagStatus
 785                     	xdef	_PWR_PVDGetITStatus
 786                     	xdef	_PWR_PVDITConfig
 787                     	xdef	_PWR_UltraLowPowerCmd
 788                     	xdef	_PWR_FastWakeUpCmd
 789                     	xdef	_PWR_PVDCmd
 790                     	xdef	_PWR_PVDLevelConfig
 791                     	xdef	_PWR_DeInit
 810                     	end
