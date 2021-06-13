   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 93 void AES_DeInit(void)
  41                     ; 94 {
  43                     	switch	.text
  44  0000               _AES_DeInit:
  48                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  50  0000 351853d0      	mov	21456,#24
  51                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  53  0004 725f53d2      	clr	21458
  54                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  56  0008 725f53d3      	clr	21459
  57                     ; 99 }
  60  000c 81            	ret
 134                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 134                     ; 113 {
 135                     	switch	.text
 136  000d               _AES_OperationModeConfig:
 138  000d 88            	push	a
 139       00000000      OFST:	set	0
 142                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 144                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 146  000e c653d0        	ld	a,21456
 147  0011 a4f9          	and	a,#249
 148  0013 c753d0        	ld	21456,a
 149                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 151  0016 c653d0        	ld	a,21456
 152  0019 1a01          	or	a,(OFST+1,sp)
 153  001b c753d0        	ld	21456,a
 154                     ; 122 }
 157  001e 84            	pop	a
 158  001f 81            	ret
 213                     ; 132 void AES_Cmd(FunctionalState NewState)
 213                     ; 133 {
 214                     	switch	.text
 215  0020               _AES_Cmd:
 219                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 221                     ; 137   if (NewState != DISABLE)
 223  0020 4d            	tnz	a
 224  0021 2706          	jreq	L101
 225                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 227  0023 721053d0      	bset	21456,#0
 229  0027 2004          	jra	L301
 230  0029               L101:
 231                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 233  0029 721153d0      	bres	21456,#0
 234  002d               L301:
 235                     ; 145 }
 238  002d 81            	ret
 272                     ; 170 void AES_WriteSubData(uint8_t Data)
 272                     ; 171 {
 273                     	switch	.text
 274  002e               _AES_WriteSubData:
 278                     ; 173   AES->DINR = Data;
 280  002e c753d2        	ld	21458,a
 281                     ; 174 }
 284  0031 81            	ret
 318                     ; 183 void AES_WriteSubKey(uint8_t Key)
 318                     ; 184 {
 319                     	switch	.text
 320  0032               _AES_WriteSubKey:
 324                     ; 186   AES->DINR = Key;
 326  0032 c753d2        	ld	21458,a
 327                     ; 187 }
 330  0035 81            	ret
 353                     ; 195 uint8_t AES_ReadSubData(void)
 353                     ; 196 {
 354                     	switch	.text
 355  0036               _AES_ReadSubData:
 359                     ; 197   return AES->DOUTR;
 361  0036 c653d3        	ld	a,21459
 364  0039 81            	ret
 387                     ; 206 uint8_t AES_ReadSubKey(void)
 387                     ; 207 {
 388                     	switch	.text
 389  003a               _AES_ReadSubKey:
 393                     ; 208   return AES->DOUTR;
 395  003a c653d3        	ld	a,21459
 398  003d 81            	ret
 457                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 457                     ; 238 {
 458                     	switch	.text
 459  003e               _AES_DMAConfig:
 461  003e 89            	pushw	x
 462       00000000      OFST:	set	0
 465                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 467                     ; 242   if (NewState != DISABLE)
 469  003f 9f            	ld	a,xl
 470  0040 4d            	tnz	a
 471  0041 2709          	jreq	L112
 472                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 474  0043 9e            	ld	a,xh
 475  0044 ca53d0        	or	a,21456
 476  0047 c753d0        	ld	21456,a
 478  004a 2009          	jra	L312
 479  004c               L112:
 480                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 482  004c 7b01          	ld	a,(OFST+1,sp)
 483  004e 43            	cpl	a
 484  004f c453d0        	and	a,21456
 485  0052 c753d0        	ld	21456,a
 486  0055               L312:
 487                     ; 252 }
 490  0055 85            	popw	x
 491  0056 81            	ret
 556                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 556                     ; 282 {
 557                     	switch	.text
 558  0057               _AES_ITConfig:
 560  0057 89            	pushw	x
 561       00000000      OFST:	set	0
 564                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 566                     ; 285   assert_param(IS_AES_IT(AES_IT));
 568                     ; 287   if (NewState != DISABLE)
 570  0058 9f            	ld	a,xl
 571  0059 4d            	tnz	a
 572  005a 2709          	jreq	L742
 573                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 575  005c 9e            	ld	a,xh
 576  005d ca53d0        	or	a,21456
 577  0060 c753d0        	ld	21456,a
 579  0063 2009          	jra	L152
 580  0065               L742:
 581                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 583  0065 7b01          	ld	a,(OFST+1,sp)
 584  0067 43            	cpl	a
 585  0068 c453d0        	and	a,21456
 586  006b c753d0        	ld	21456,a
 587  006e               L152:
 588                     ; 295 }
 591  006e 85            	popw	x
 592  006f 81            	ret
 685                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 685                     ; 308 {
 686                     	switch	.text
 687  0070               _AES_GetFlagStatus:
 689  0070 88            	push	a
 690  0071 88            	push	a
 691       00000001      OFST:	set	1
 694                     ; 309   FlagStatus status = RESET;
 696                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 698                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 700  0072 a101          	cp	a,#1
 701  0074 2611          	jrne	L713
 702                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 704  0076 c653d1        	ld	a,21457
 705  0079 a501          	bcp	a,#1
 706  007b 2706          	jreq	L123
 707                     ; 319       status = (FlagStatus) SET;
 709  007d a601          	ld	a,#1
 710  007f 6b01          	ld	(OFST+0,sp),a
 713  0081 202a          	jra	L523
 714  0083               L123:
 715                     ; 324       status = (FlagStatus) RESET;
 717  0083 0f01          	clr	(OFST+0,sp)
 719  0085 2026          	jra	L523
 720  0087               L713:
 721                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 723  0087 7b02          	ld	a,(OFST+1,sp)
 724  0089 a102          	cp	a,#2
 725  008b 2611          	jrne	L723
 726                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 728  008d c653d1        	ld	a,21457
 729  0090 a502          	bcp	a,#2
 730  0092 2706          	jreq	L133
 731                     ; 332       status = (FlagStatus) SET;
 733  0094 a601          	ld	a,#1
 734  0096 6b01          	ld	(OFST+0,sp),a
 737  0098 2013          	jra	L523
 738  009a               L133:
 739                     ; 337       status = (FlagStatus) RESET;
 741  009a 0f01          	clr	(OFST+0,sp)
 743  009c 200f          	jra	L523
 744  009e               L723:
 745                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 747  009e c653d1        	ld	a,21457
 748  00a1 a504          	bcp	a,#4
 749  00a3 2706          	jreq	L733
 750                     ; 345       status = (FlagStatus) SET;
 752  00a5 a601          	ld	a,#1
 753  00a7 6b01          	ld	(OFST+0,sp),a
 756  00a9 2002          	jra	L523
 757  00ab               L733:
 758                     ; 350       status = (FlagStatus) RESET;
 760  00ab 0f01          	clr	(OFST+0,sp)
 762  00ad               L523:
 763                     ; 354   return ((FlagStatus) status);
 765  00ad 7b01          	ld	a,(OFST+0,sp)
 768  00af 85            	popw	x
 769  00b0 81            	ret
 804                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 804                     ; 367 {
 805                     	switch	.text
 806  00b1               _AES_ClearFlag:
 810                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 812                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 814  00b1 a101          	cp	a,#1
 815  00b3 2606          	jrne	L163
 816                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 818  00b5 721653d0      	bset	21456,#3
 820  00b9 2004          	jra	L363
 821  00bb               L163:
 822                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 824  00bb 721853d0      	bset	21456,#4
 825  00bf               L363:
 826                     ; 382 }
 829  00bf 81            	ret
 895                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 895                     ; 393 {
 896                     	switch	.text
 897  00c0               _AES_GetITStatus:
 899  00c0 88            	push	a
 900  00c1 89            	pushw	x
 901       00000002      OFST:	set	2
 904                     ; 394   ITStatus itstatus = RESET;
 906                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 908                     ; 398   assert_param(IS_AES_IT(AES_IT));
 910                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 912  00c2 c653d0        	ld	a,21456
 913  00c5 a420          	and	a,#32
 914  00c7 6b01          	ld	(OFST-1,sp),a
 916                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 918  00c9 c653d1        	ld	a,21457
 919  00cc a401          	and	a,#1
 920  00ce 6b02          	ld	(OFST+0,sp),a
 922                     ; 404   if (AES_IT == AES_IT_CCIE)
 924  00d0 7b03          	ld	a,(OFST+1,sp)
 925  00d2 a120          	cp	a,#32
 926  00d4 2612          	jrne	L714
 927                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 929  00d6 0d01          	tnz	(OFST-1,sp)
 930  00d8 270a          	jreq	L124
 932  00da 0d02          	tnz	(OFST+0,sp)
 933  00dc 2706          	jreq	L124
 934                     ; 410       itstatus = (ITStatus) SET;
 936  00de a601          	ld	a,#1
 937  00e0 6b02          	ld	(OFST+0,sp),a
 940  00e2 201e          	jra	L524
 941  00e4               L124:
 942                     ; 415       itstatus = (ITStatus) RESET;
 944  00e4 0f02          	clr	(OFST+0,sp)
 946  00e6 201a          	jra	L524
 947  00e8               L714:
 948                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 950  00e8 c653d0        	ld	a,21456
 951  00eb a540          	bcp	a,#64
 952  00ed 2711          	jreq	L724
 953                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 955  00ef c653d1        	ld	a,21457
 956  00f2 a506          	bcp	a,#6
 957  00f4 2706          	jreq	L134
 958                     ; 427         itstatus = (ITStatus) SET;
 960  00f6 a601          	ld	a,#1
 961  00f8 6b02          	ld	(OFST+0,sp),a
 964  00fa 2006          	jra	L524
 965  00fc               L134:
 966                     ; 432         itstatus = (ITStatus) RESET;
 968  00fc 0f02          	clr	(OFST+0,sp)
 970  00fe 2002          	jra	L524
 971  0100               L724:
 972                     ; 438       itstatus = (ITStatus) RESET;
 974  0100 0f02          	clr	(OFST+0,sp)
 976  0102               L524:
 977                     ; 443   return ((ITStatus)itstatus);
 979  0102 7b02          	ld	a,(OFST+0,sp)
 982  0104 5b03          	addw	sp,#3
 983  0106 81            	ret
1019                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1019                     ; 455 {
1020                     	switch	.text
1021  0107               _AES_ClearITPendingBit:
1025                     ; 457   assert_param(IS_AES_IT(AES_IT));
1027                     ; 460   if (AES_IT == AES_IT_CCIE)
1029  0107 a120          	cp	a,#32
1030  0109 2606          	jrne	L554
1031                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
1033  010b 721653d0      	bset	21456,#3
1035  010f 2004          	jra	L754
1036  0111               L554:
1037                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
1039  0111 721853d0      	bset	21456,#4
1040  0115               L754:
1041                     ; 470 }
1044  0115 81            	ret
1057                     	xdef	_AES_ClearITPendingBit
1058                     	xdef	_AES_GetITStatus
1059                     	xdef	_AES_ClearFlag
1060                     	xdef	_AES_GetFlagStatus
1061                     	xdef	_AES_ITConfig
1062                     	xdef	_AES_DMAConfig
1063                     	xdef	_AES_ReadSubKey
1064                     	xdef	_AES_ReadSubData
1065                     	xdef	_AES_WriteSubKey
1066                     	xdef	_AES_WriteSubData
1067                     	xdef	_AES_Cmd
1068                     	xdef	_AES_OperationModeConfig
1069                     	xdef	_AES_DeInit
1088                     	end
