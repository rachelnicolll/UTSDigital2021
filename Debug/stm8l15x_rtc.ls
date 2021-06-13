   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  94                     ; 232 ErrorStatus RTC_DeInit(void)
  94                     ; 233 {
  96                     	switch	.text
  97  0000               _RTC_DeInit:
  99  0000 5205          	subw	sp,#5
 100       00000005      OFST:	set	5
 103                     ; 234   ErrorStatus status = ERROR;
 105                     ; 235   uint16_t wutwfcount = 0;
 107  0002 5f            	clrw	x
 108  0003 1f02          	ldw	(OFST-3,sp),x
 110                     ; 236   uint16_t recalpfcount = 0;
 112  0005 5f            	clrw	x
 113  0006 1f04          	ldw	(OFST-1,sp),x
 115                     ; 239   RTC->WPR = 0xCA;
 117  0008 35ca5159      	mov	20825,#202
 118                     ; 240   RTC->WPR = 0x53;
 120  000c 35535159      	mov	20825,#83
 121                     ; 243   if (RTC_EnterInitMode() == ERROR)
 123  0010 cd0161        	call	_RTC_EnterInitMode
 125  0013 4d            	tnz	a
 126  0014 260b          	jrne	L35
 127                     ; 245     status = ERROR;
 129  0016 0f01          	clr	(OFST-4,sp)
 131                     ; 247     RTC->WPR = 0xFF; 
 133  0018 35ff5159      	mov	20825,#255
 135  001c               L55:
 136                     ; 343   return (ErrorStatus)status;
 138  001c 7b01          	ld	a,(OFST-4,sp)
 141  001e 5b05          	addw	sp,#5
 142  0020 81            	ret
 143  0021               L35:
 144                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 146  0021 725f5140      	clr	20800
 147                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 149  0025 725f5141      	clr	20801
 150                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 152  0029 725f5142      	clr	20802
 153                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 155  002d 35015144      	mov	20804,#1
 156                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 158  0031 35215145      	mov	20805,#33
 159                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 161  0035 725f5146      	clr	20806
 162                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 164  0039 725f5150      	clr	20816
 165                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 167  003d 35ff5151      	mov	20817,#255
 168                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 170  0041 357f5152      	mov	20818,#127
 171                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 173  0045 725f516c      	clr	20844
 174                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 176  0049 725f516d      	clr	20845
 177                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 179  004d 725f5148      	clr	20808
 180                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 182  0051 725f5149      	clr	20809
 183                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 185  0055 725f514a      	clr	20810
 187  0059 200b          	jra	L36
 188  005b               L75:
 189                     ; 278       wutwfcount++;
 191  005b 1e02          	ldw	x,(OFST-3,sp)
 192  005d 1c0001        	addw	x,#1
 193  0060 1f02          	ldw	(OFST-3,sp),x
 195                     ; 279       RTC->ISR1 = 0;
 197  0062 725f514c      	clr	20812
 198  0066               L36:
 199                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 201  0066 c6514c        	ld	a,20812
 202  0069 a504          	bcp	a,#4
 203  006b 2607          	jrne	L76
 205  006d 1e02          	ldw	x,(OFST-3,sp)
 206  006f a3ffff        	cpw	x,#65535
 207  0072 26e7          	jrne	L75
 208  0074               L76:
 209                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 211  0074 c6514c        	ld	a,20812
 212  0077 a504          	bcp	a,#4
 213  0079 2608          	jrne	L17
 214                     ; 284       status = ERROR;
 216  007b 0f01          	clr	(OFST-4,sp)
 218                     ; 286       RTC->WPR = 0xFF; 
 220  007d 35ff5159      	mov	20825,#255
 222  0081 2099          	jra	L55
 223  0083               L17:
 224                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 226  0083 725f5148      	clr	20808
 227                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 229  0087 35ff5154      	mov	20820,#255
 230                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 232  008b 35ff5155      	mov	20821,#255
 233                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 235  008f 725f515c      	clr	20828
 236                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 238  0093 725f515d      	clr	20829
 239                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 241  0097 725f515e      	clr	20830
 242                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 244  009b 725f515f      	clr	20831
 245                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 247  009f 725f5164      	clr	20836
 248                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 250  00a3 725f5165      	clr	20837
 251                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 253  00a7 725f5166      	clr	20838
 254                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 256  00ab 725f514c      	clr	20812
 257                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 259  00af 725f514d      	clr	20813
 260                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 262  00b3 c6514c        	ld	a,20812
 263  00b6 a502          	bcp	a,#2
 264  00b8 2717          	jreq	L57
 266  00ba 2007          	jra	L101
 267  00bc               L77:
 268                     ; 315           recalpfcount++;
 270  00bc 1e04          	ldw	x,(OFST-1,sp)
 271  00be 1c0001        	addw	x,#1
 272  00c1 1f04          	ldw	(OFST-1,sp),x
 274  00c3               L101:
 275                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 277  00c3 c6514c        	ld	a,20812
 278  00c6 a502          	bcp	a,#2
 279  00c8 2707          	jreq	L57
 281  00ca 1e04          	ldw	x,(OFST-1,sp)
 282  00cc a3ffff        	cpw	x,#65535
 283  00cf 26eb          	jrne	L77
 284  00d1               L57:
 285                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 287  00d1 c6514c        	ld	a,20812
 288  00d4 a502          	bcp	a,#2
 289  00d6 2618          	jrne	L701
 290                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 292  00d8 725f516a      	clr	20842
 293                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 295  00dc 725f516b      	clr	20843
 296                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 298  00e0 cd01a1        	call	_RTC_WaitForSynchro
 300  00e3 4d            	tnz	a
 301  00e4 2604          	jrne	L111
 302                     ; 325           status = ERROR;
 304  00e6 0f01          	clr	(OFST-4,sp)
 307  00e8 2008          	jra	L511
 308  00ea               L111:
 309                     ; 329           status = SUCCESS;
 311  00ea a601          	ld	a,#1
 312  00ec 6b01          	ld	(OFST-4,sp),a
 314  00ee 2002          	jra	L511
 315  00f0               L701:
 316                     ; 334         status = ERROR;
 318  00f0 0f01          	clr	(OFST-4,sp)
 320  00f2               L511:
 321                     ; 338       RTC->WPR = 0xFF; 
 323  00f2 35ff5159      	mov	20825,#255
 324  00f6 ac1c001c      	jpf	L55
 424                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 424                     ; 360 {
 425                     	switch	.text
 426  00fa               _RTC_Init:
 428  00fa 89            	pushw	x
 429  00fb 88            	push	a
 430       00000001      OFST:	set	1
 433                     ; 361   ErrorStatus status = ERROR;
 435                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 437                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 439                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 441                     ; 369   RTC->WPR = 0xCA;
 443  00fc 35ca5159      	mov	20825,#202
 444                     ; 370   RTC->WPR = 0x53;
 446  0100 35535159      	mov	20825,#83
 447                     ; 373   if (RTC_EnterInitMode() == ERROR)
 449  0104 ad5b          	call	_RTC_EnterInitMode
 451  0106 4d            	tnz	a
 452  0107 2604          	jrne	L761
 453                     ; 375     status = ERROR;
 455  0109 0f01          	clr	(OFST+0,sp)
 458  010b 202d          	jra	L171
 459  010d               L761:
 460                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 462  010d 721d5148      	bres	20808,#6
 463                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 465  0111 1e02          	ldw	x,(OFST+1,sp)
 466  0113 c65148        	ld	a,20808
 467  0116 fa            	or	a,(x)
 468  0117 c75148        	ld	20808,a
 469                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 471  011a 1e02          	ldw	x,(OFST+1,sp)
 472  011c ee02          	ldw	x,(2,x)
 473  011e 4f            	clr	a
 474  011f 01            	rrwa	x,a
 475  0120 9f            	ld	a,xl
 476  0121 c75150        	ld	20816,a
 477                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 479  0124 1e02          	ldw	x,(OFST+1,sp)
 480  0126 e603          	ld	a,(3,x)
 481  0128 c75151        	ld	20817,a
 482                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 484  012b 1e02          	ldw	x,(OFST+1,sp)
 485  012d e601          	ld	a,(1,x)
 486  012f c75152        	ld	20818,a
 487                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 489  0132 721f514c      	bres	20812,#7
 490                     ; 393     status = SUCCESS;
 492  0136 a601          	ld	a,#1
 493  0138 6b01          	ld	(OFST+0,sp),a
 495  013a               L171:
 496                     ; 397   RTC->WPR = 0xFF; 
 498  013a 35ff5159      	mov	20825,#255
 499                     ; 400   return (ErrorStatus)(status);
 501  013e 7b01          	ld	a,(OFST+0,sp)
 504  0140 5b03          	addw	sp,#3
 505  0142 81            	ret
 542                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 542                     ; 411 {
 543                     	switch	.text
 544  0143               _RTC_StructInit:
 548                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 550  0143 7f            	clr	(x)
 551                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 553  0144 a67f          	ld	a,#127
 554  0146 e701          	ld	(1,x),a
 555                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 557  0148 90ae00ff      	ldw	y,#255
 558  014c ef02          	ldw	(2,x),y
 559                     ; 420 }
 562  014e 81            	ret
 618                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 618                     ; 431 {
 619                     	switch	.text
 620  014f               _RTC_WriteProtectionCmd:
 624                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 626                     ; 435   if (NewState != DISABLE)
 628  014f 4d            	tnz	a
 629  0150 2706          	jreq	L142
 630                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 632  0152 35ff5159      	mov	20825,#255
 634  0156 2008          	jra	L342
 635  0158               L142:
 636                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 638  0158 35ca5159      	mov	20825,#202
 639                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 641  015c 35535159      	mov	20825,#83
 642  0160               L342:
 643                     ; 446 }
 646  0160 81            	ret
 691                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 691                     ; 459 {
 692                     	switch	.text
 693  0161               _RTC_EnterInitMode:
 695  0161 5203          	subw	sp,#3
 696       00000003      OFST:	set	3
 699                     ; 460   ErrorStatus status = ERROR;
 701                     ; 461   uint16_t initfcount = 0;
 703  0163 5f            	clrw	x
 704  0164 1f02          	ldw	(OFST-1,sp),x
 706                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 708  0166 c6514c        	ld	a,20812
 709  0169 a540          	bcp	a,#64
 710  016b 261b          	jrne	L762
 711                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 713  016d 3580514c      	mov	20812,#128
 715  0171 2007          	jra	L572
 716  0173               L172:
 717                     ; 472       initfcount++;
 719  0173 1e02          	ldw	x,(OFST-1,sp)
 720  0175 1c0001        	addw	x,#1
 721  0178 1f02          	ldw	(OFST-1,sp),x
 723  017a               L572:
 724                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 726  017a c6514c        	ld	a,20812
 727  017d a540          	bcp	a,#64
 728  017f 2607          	jrne	L762
 730  0181 1e02          	ldw	x,(OFST-1,sp)
 731  0183 a3ffff        	cpw	x,#65535
 732  0186 26eb          	jrne	L172
 733  0188               L762:
 734                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 736  0188 c6514c        	ld	a,20812
 737  018b a540          	bcp	a,#64
 738  018d 2604          	jrne	L303
 739                     ; 478     status = ERROR;
 741  018f 0f01          	clr	(OFST-2,sp)
 744  0191 2004          	jra	L503
 745  0193               L303:
 746                     ; 482     status = SUCCESS;
 748  0193 a601          	ld	a,#1
 749  0195 6b01          	ld	(OFST-2,sp),a
 751  0197               L503:
 752                     ; 485   return (ErrorStatus)status;
 754  0197 7b01          	ld	a,(OFST-2,sp)
 757  0199 5b03          	addw	sp,#3
 758  019b 81            	ret
 781                     ; 498 void RTC_ExitInitMode(void)
 781                     ; 499 {
 782                     	switch	.text
 783  019c               _RTC_ExitInitMode:
 787                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 789  019c 721f514c      	bres	20812,#7
 790                     ; 502 }
 793  01a0 81            	ret
 838                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 838                     ; 528 {
 839                     	switch	.text
 840  01a1               _RTC_WaitForSynchro:
 842  01a1 5203          	subw	sp,#3
 843       00000003      OFST:	set	3
 846                     ; 529   uint16_t rsfcount = 0;
 848  01a3 5f            	clrw	x
 849  01a4 1f02          	ldw	(OFST-1,sp),x
 851                     ; 530   ErrorStatus status = ERROR;
 853                     ; 533   RTC->WPR = 0xCA;
 855  01a6 35ca5159      	mov	20825,#202
 856                     ; 534   RTC->WPR = 0x53;
 858  01aa 35535159      	mov	20825,#83
 859                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 861  01ae c6514c        	ld	a,20812
 862  01b1 a45f          	and	a,#95
 863  01b3 c7514c        	ld	20812,a
 865  01b6 2007          	jra	L343
 866  01b8               L143:
 867                     ; 542     rsfcount++;
 869  01b8 1e02          	ldw	x,(OFST-1,sp)
 870  01ba 1c0001        	addw	x,#1
 871  01bd 1f02          	ldw	(OFST-1,sp),x
 873  01bf               L343:
 874                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 876  01bf c6514c        	ld	a,20812
 877  01c2 a520          	bcp	a,#32
 878  01c4 2607          	jrne	L743
 880  01c6 1e02          	ldw	x,(OFST-1,sp)
 881  01c8 a3ffff        	cpw	x,#65535
 882  01cb 26eb          	jrne	L143
 883  01cd               L743:
 884                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 886  01cd c6514c        	ld	a,20812
 887  01d0 a520          	bcp	a,#32
 888  01d2 2706          	jreq	L153
 889                     ; 548     status = SUCCESS;
 891  01d4 a601          	ld	a,#1
 892  01d6 6b01          	ld	(OFST-2,sp),a
 895  01d8 2002          	jra	L353
 896  01da               L153:
 897                     ; 552     status = ERROR;
 899  01da 0f01          	clr	(OFST-2,sp)
 901  01dc               L353:
 902                     ; 556   RTC->WPR = 0xFF; 
 904  01dc 35ff5159      	mov	20825,#255
 905                     ; 558   return (ErrorStatus)status;
 907  01e0 7b01          	ld	a,(OFST-2,sp)
 910  01e2 5b03          	addw	sp,#3
 911  01e4 81            	ret
 946                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 946                     ; 569 {
 947                     	switch	.text
 948  01e5               _RTC_RatioCmd:
 952                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 954                     ; 574   RTC->WPR = 0xCA;
 956  01e5 35ca5159      	mov	20825,#202
 957                     ; 575   RTC->WPR = 0x53;
 959  01e9 35535159      	mov	20825,#83
 960                     ; 577   if (NewState != DISABLE)
 962  01ed 4d            	tnz	a
 963  01ee 2706          	jreq	L373
 964                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 966  01f0 721a5148      	bset	20808,#5
 968  01f4 2004          	jra	L573
 969  01f6               L373:
 970                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 972  01f6 721b5148      	bres	20808,#5
 973  01fa               L573:
 974                     ; 589   RTC->WPR = 0xFF; 
 976  01fa 35ff5159      	mov	20825,#255
 977                     ; 590 }
 980  01fe 81            	ret
1016                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
1016                     ; 599 {
1017                     	switch	.text
1018  01ff               _RTC_BypassShadowCmd:
1022                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
1024                     ; 604   RTC->WPR = 0xCA;
1026  01ff 35ca5159      	mov	20825,#202
1027                     ; 605   RTC->WPR = 0x53;
1029  0203 35535159      	mov	20825,#83
1030                     ; 607   if (NewState != DISABLE)
1032  0207 4d            	tnz	a
1033  0208 2706          	jreq	L514
1034                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1036  020a 72185148      	bset	20808,#4
1038  020e 2004          	jra	L714
1039  0210               L514:
1040                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1042  0210 72195148      	bres	20808,#4
1043  0214               L714:
1044                     ; 619   RTC->WPR = 0xFF; 
1046  0214 35ff5159      	mov	20825,#255
1047                     ; 620 }
1050  0218 81            	ret
1198                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1198                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1198                     ; 661 {
1199                     	switch	.text
1200  0219               _RTC_SetTime:
1202  0219 88            	push	a
1203  021a 88            	push	a
1204       00000001      OFST:	set	1
1207                     ; 662   ErrorStatus status = ERROR;
1209                     ; 663   uint8_t temp = 0;
1211                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1213                     ; 668   if (RTC_Format == RTC_Format_BIN)
1215  021b 4d            	tnz	a
1216  021c 2609          	jrne	L315
1217                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1219  021e c65148        	ld	a,20808
1220  0221 a540          	bcp	a,#64
1221  0223 2700          	jreq	L515
1222                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1224                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1227  0225               L515:
1228                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1230                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1232                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1235  0225 2007          	jra	L125
1236  0227               L315:
1237                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1239  0227 c65148        	ld	a,20808
1240  022a a540          	bcp	a,#64
1241  022c 2700          	jreq	L325
1242                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1244                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1247  022e               L325:
1248                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1250                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1252                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1254  022e               L125:
1255                     ; 701   RTC->WPR = 0xCA;
1257  022e 35ca5159      	mov	20825,#202
1258                     ; 702   RTC->WPR = 0x53;
1260  0232 35535159      	mov	20825,#83
1261                     ; 705   if (RTC_EnterInitMode() == ERROR)
1263  0236 cd0161        	call	_RTC_EnterInitMode
1265  0239 4d            	tnz	a
1266  023a 2608          	jrne	L725
1267                     ; 707     status = ERROR;
1269  023c 0f01          	clr	(OFST+0,sp)
1271                     ; 709     RTC->WPR = 0xFF; 
1273  023e 35ff5159      	mov	20825,#255
1275  0242 2072          	jra	L135
1276  0244               L725:
1277                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1279  0244 c65148        	ld	a,20808
1280  0247 a540          	bcp	a,#64
1281  0249 2708          	jreq	L335
1282                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1284                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1286  024b 1e05          	ldw	x,(OFST+4,sp)
1287  024d e603          	ld	a,(3,x)
1288  024f 6b01          	ld	(OFST+0,sp),a
1291  0251 2002          	jra	L535
1292  0253               L335:
1293                     ; 721       temp = 0;
1295  0253 0f01          	clr	(OFST+0,sp)
1297  0255               L535:
1298                     ; 724     if (RTC_Format != RTC_Format_BIN)
1300  0255 0d02          	tnz	(OFST+1,sp)
1301  0257 2718          	jreq	L735
1302                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1304  0259 1e05          	ldw	x,(OFST+4,sp)
1305  025b e602          	ld	a,(2,x)
1306  025d c75140        	ld	20800,a
1307                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1309  0260 1e05          	ldw	x,(OFST+4,sp)
1310  0262 e601          	ld	a,(1,x)
1311  0264 c75141        	ld	20801,a
1312                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1314  0267 1e05          	ldw	x,(OFST+4,sp)
1315  0269 f6            	ld	a,(x)
1316  026a 1a01          	or	a,(OFST+0,sp)
1317  026c c75142        	ld	20802,a
1319  026f 201f          	jra	L145
1320  0271               L735:
1321                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1323  0271 1e05          	ldw	x,(OFST+4,sp)
1324  0273 e602          	ld	a,(2,x)
1325  0275 cd0994        	call	L3_ByteToBcd2
1327  0278 c75140        	ld	20800,a
1328                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1330  027b 1e05          	ldw	x,(OFST+4,sp)
1331  027d e601          	ld	a,(1,x)
1332  027f cd0994        	call	L3_ByteToBcd2
1334  0282 c75141        	ld	20801,a
1335                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1337  0285 1e05          	ldw	x,(OFST+4,sp)
1338  0287 f6            	ld	a,(x)
1339  0288 cd0994        	call	L3_ByteToBcd2
1341  028b 1a01          	or	a,(OFST+0,sp)
1342  028d c75142        	ld	20802,a
1343  0290               L145:
1344                     ; 737     (void)(RTC->DR3);
1346  0290 c65146        	ld	a,20806
1347                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1349  0293 721f514c      	bres	20812,#7
1350                     ; 743     RTC->WPR = 0xFF; 
1352  0297 35ff5159      	mov	20825,#255
1353                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1355  029b c65148        	ld	a,20808
1356  029e a510          	bcp	a,#16
1357  02a0 2610          	jrne	L345
1358                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1360  02a2 cd01a1        	call	_RTC_WaitForSynchro
1362  02a5 4d            	tnz	a
1363  02a6 2604          	jrne	L545
1364                     ; 750         status = ERROR;
1366  02a8 0f01          	clr	(OFST+0,sp)
1369  02aa 200a          	jra	L135
1370  02ac               L545:
1371                     ; 754         status = SUCCESS;
1373  02ac a601          	ld	a,#1
1374  02ae 6b01          	ld	(OFST+0,sp),a
1376  02b0 2004          	jra	L135
1377  02b2               L345:
1378                     ; 759       status = SUCCESS;
1380  02b2 a601          	ld	a,#1
1381  02b4 6b01          	ld	(OFST+0,sp),a
1383  02b6               L135:
1384                     ; 763   return (ErrorStatus)status;
1386  02b6 7b01          	ld	a,(OFST+0,sp)
1389  02b8 85            	popw	x
1390  02b9 81            	ret
1427                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1427                     ; 776 {
1428                     	switch	.text
1429  02ba               _RTC_TimeStructInit:
1433                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1435  02ba 6f03          	clr	(3,x)
1436                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1438  02bc 7f            	clr	(x)
1439                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1441  02bd 6f01          	clr	(1,x)
1442                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1444  02bf 6f02          	clr	(2,x)
1445                     ; 782 }
1448  02c1 81            	ret
1505                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1505                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1505                     ; 800 {
1506                     	switch	.text
1507  02c2               _RTC_GetTime:
1509  02c2 88            	push	a
1510  02c3 88            	push	a
1511       00000001      OFST:	set	1
1514                     ; 801   uint8_t  tmpreg = 0;
1516                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1518                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1520  02c4 1e05          	ldw	x,(OFST+4,sp)
1521  02c6 c65140        	ld	a,20800
1522  02c9 e702          	ld	(2,x),a
1523                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1525  02cb 1e05          	ldw	x,(OFST+4,sp)
1526  02cd c65141        	ld	a,20801
1527  02d0 e701          	ld	(1,x),a
1528                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1530  02d2 c65142        	ld	a,20802
1531  02d5 6b01          	ld	(OFST+0,sp),a
1533                     ; 817   (void) (RTC->DR3) ;
1535  02d7 c65146        	ld	a,20806
1536                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1538  02da 7b01          	ld	a,(OFST+0,sp)
1539  02dc a4bf          	and	a,#191
1540  02de 1e05          	ldw	x,(OFST+4,sp)
1541  02e0 f7            	ld	(x),a
1542                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1544  02e1 7b01          	ld	a,(OFST+0,sp)
1545  02e3 a440          	and	a,#64
1546  02e5 1e05          	ldw	x,(OFST+4,sp)
1547  02e7 e703          	ld	(3,x),a
1548                     ; 827   if (RTC_Format == RTC_Format_BIN)
1550  02e9 0d02          	tnz	(OFST+1,sp)
1551  02eb 261f          	jrne	L326
1552                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1554  02ed 1e05          	ldw	x,(OFST+4,sp)
1555  02ef f6            	ld	a,(x)
1556  02f0 cd09b3        	call	L5_Bcd2ToByte
1558  02f3 1e05          	ldw	x,(OFST+4,sp)
1559  02f5 f7            	ld	(x),a
1560                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1562  02f6 1e05          	ldw	x,(OFST+4,sp)
1563  02f8 e601          	ld	a,(1,x)
1564  02fa cd09b3        	call	L5_Bcd2ToByte
1566  02fd 1e05          	ldw	x,(OFST+4,sp)
1567  02ff e701          	ld	(1,x),a
1568                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1570  0301 1e05          	ldw	x,(OFST+4,sp)
1571  0303 e602          	ld	a,(2,x)
1572  0305 cd09b3        	call	L5_Bcd2ToByte
1574  0308 1e05          	ldw	x,(OFST+4,sp)
1575  030a e702          	ld	(2,x),a
1576  030c               L326:
1577                     ; 834 }
1580  030c 85            	popw	x
1581  030d 81            	ret
1633                     ; 845 uint16_t RTC_GetSubSecond(void)
1633                     ; 846 {
1634                     	switch	.text
1635  030e               _RTC_GetSubSecond:
1637  030e 5206          	subw	sp,#6
1638       00000006      OFST:	set	6
1641                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1645                     ; 848   uint16_t ssrreg = 0;
1647                     ; 851   ssrhreg = RTC->SSRH;
1649  0310 c65157        	ld	a,20823
1650  0313 6b03          	ld	(OFST-3,sp),a
1652                     ; 852   ssrlreg = RTC->SSRL;
1654  0315 c65158        	ld	a,20824
1655  0318 6b04          	ld	(OFST-2,sp),a
1657                     ; 855   (void) (RTC->DR3);
1659  031a c65146        	ld	a,20806
1660                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1662  031d 7b04          	ld	a,(OFST-2,sp)
1663  031f 5f            	clrw	x
1664  0320 97            	ld	xl,a
1665  0321 1f01          	ldw	(OFST-5,sp),x
1667  0323 7b03          	ld	a,(OFST-3,sp)
1668  0325 5f            	clrw	x
1669  0326 97            	ld	xl,a
1670  0327 4f            	clr	a
1671  0328 02            	rlwa	x,a
1672  0329 01            	rrwa	x,a
1673  032a 1a02          	or	a,(OFST-4,sp)
1674  032c 01            	rrwa	x,a
1675  032d 1a01          	or	a,(OFST-5,sp)
1676  032f 01            	rrwa	x,a
1677  0330 1f05          	ldw	(OFST-1,sp),x
1679                     ; 859   return (uint16_t)(ssrreg);
1681  0332 1e05          	ldw	x,(OFST-1,sp)
1684  0334 5b06          	addw	sp,#6
1685  0336 81            	ret
1937                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1937                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1937                     ; 878 {
1938                     	switch	.text
1939  0337               _RTC_SetDate:
1941  0337 88            	push	a
1942  0338 89            	pushw	x
1943       00000002      OFST:	set	2
1946                     ; 879   ErrorStatus status = ERROR;
1948                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1950  0339 4d            	tnz	a
1951  033a 2616          	jrne	L1001
1953  033c 1e06          	ldw	x,(OFST+4,sp)
1954  033e e601          	ld	a,(1,x)
1955  0340 a410          	and	a,#16
1956  0342 a110          	cp	a,#16
1957  0344 260c          	jrne	L1001
1958                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1960  0346 1e06          	ldw	x,(OFST+4,sp)
1961  0348 e601          	ld	a,(1,x)
1962  034a a4ef          	and	a,#239
1963  034c ab0a          	add	a,#10
1964  034e 1e06          	ldw	x,(OFST+4,sp)
1965  0350 e701          	ld	(1,x),a
1966  0352               L1001:
1967                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1969                     ; 888   if (RTC_Format == RTC_Format_BIN)
1971  0352 0d03          	tnz	(OFST+1,sp)
1972  0354 2600          	jrne	L3001
1973                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1975                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1977                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1979                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1981                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1984  0356               L3001:
1985                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1987                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1989                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1991                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1993                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1995                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1997                     ; 907   RTC->WPR = 0xCA;
1999  0356 35ca5159      	mov	20825,#202
2000                     ; 908   RTC->WPR = 0x53;
2002  035a 35535159      	mov	20825,#83
2003                     ; 911   if (RTC_EnterInitMode() == ERROR)
2005  035e cd0161        	call	_RTC_EnterInitMode
2007  0361 4d            	tnz	a
2008  0362 2608          	jrne	L7001
2009                     ; 913     status = ERROR;
2011  0364 0f02          	clr	(OFST+0,sp)
2013                     ; 915     RTC->WPR = 0xFF; 
2015  0366 35ff5159      	mov	20825,#255
2017  036a 2073          	jra	L1101
2018  036c               L7001:
2019                     ; 919     (void)(RTC->TR1);
2021  036c c65140        	ld	a,20800
2022                     ; 922     if (RTC_Format != RTC_Format_BIN)
2024  036f 0d03          	tnz	(OFST+1,sp)
2025  0371 271f          	jreq	L3101
2026                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2028  0373 1e06          	ldw	x,(OFST+4,sp)
2029  0375 e602          	ld	a,(2,x)
2030  0377 c75144        	ld	20804,a
2031                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2033  037a 1e06          	ldw	x,(OFST+4,sp)
2034  037c f6            	ld	a,(x)
2035  037d 97            	ld	xl,a
2036  037e a620          	ld	a,#32
2037  0380 42            	mul	x,a
2038  0381 9f            	ld	a,xl
2039  0382 1e06          	ldw	x,(OFST+4,sp)
2040  0384 ea01          	or	a,(1,x)
2041  0386 c75145        	ld	20805,a
2042                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2044  0389 1e06          	ldw	x,(OFST+4,sp)
2045  038b e603          	ld	a,(3,x)
2046  038d c75146        	ld	20806,a
2048  0390 202a          	jra	L5101
2049  0392               L3101:
2050                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2052  0392 1e06          	ldw	x,(OFST+4,sp)
2053  0394 e602          	ld	a,(2,x)
2054  0396 cd0994        	call	L3_ByteToBcd2
2056  0399 c75144        	ld	20804,a
2057                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2059  039c 1e06          	ldw	x,(OFST+4,sp)
2060  039e f6            	ld	a,(x)
2061  039f 97            	ld	xl,a
2062  03a0 a620          	ld	a,#32
2063  03a2 42            	mul	x,a
2064  03a3 9f            	ld	a,xl
2065  03a4 6b01          	ld	(OFST-1,sp),a
2067  03a6 1e06          	ldw	x,(OFST+4,sp)
2068  03a8 e601          	ld	a,(1,x)
2069  03aa cd0994        	call	L3_ByteToBcd2
2071  03ad 1a01          	or	a,(OFST-1,sp)
2072  03af c75145        	ld	20805,a
2073                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2075  03b2 1e06          	ldw	x,(OFST+4,sp)
2076  03b4 e603          	ld	a,(3,x)
2077  03b6 cd0994        	call	L3_ByteToBcd2
2079  03b9 c75146        	ld	20806,a
2080  03bc               L5101:
2081                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2083  03bc 721f514c      	bres	20812,#7
2084                     ; 939     RTC->WPR = 0xFF; 
2086  03c0 35ff5159      	mov	20825,#255
2087                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2089  03c4 c65148        	ld	a,20808
2090  03c7 a510          	bcp	a,#16
2091  03c9 2610          	jrne	L7101
2092                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2094  03cb cd01a1        	call	_RTC_WaitForSynchro
2096  03ce 4d            	tnz	a
2097  03cf 2604          	jrne	L1201
2098                     ; 946         status = ERROR;
2100  03d1 0f02          	clr	(OFST+0,sp)
2103  03d3 200a          	jra	L1101
2104  03d5               L1201:
2105                     ; 950         status = SUCCESS;
2107  03d5 a601          	ld	a,#1
2108  03d7 6b02          	ld	(OFST+0,sp),a
2110  03d9 2004          	jra	L1101
2111  03db               L7101:
2112                     ; 955       status = SUCCESS;
2114  03db a601          	ld	a,#1
2115  03dd 6b02          	ld	(OFST+0,sp),a
2117  03df               L1101:
2118                     ; 959   return (ErrorStatus)status;
2120  03df 7b02          	ld	a,(OFST+0,sp)
2123  03e1 5b03          	addw	sp,#3
2124  03e3 81            	ret
2161                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2161                     ; 969 {
2162                     	switch	.text
2163  03e4               _RTC_DateStructInit:
2167                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2169  03e4 a601          	ld	a,#1
2170  03e6 f7            	ld	(x),a
2171                     ; 972   RTC_DateStruct->RTC_Date = 1;
2173  03e7 a601          	ld	a,#1
2174  03e9 e702          	ld	(2,x),a
2175                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2177  03eb a601          	ld	a,#1
2178  03ed e701          	ld	(1,x),a
2179                     ; 974   RTC_DateStruct->RTC_Year = 0;
2181  03ef 6f03          	clr	(3,x)
2182                     ; 975 }
2185  03f1 81            	ret
2242                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2242                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2242                     ; 990 {
2243                     	switch	.text
2244  03f2               _RTC_GetDate:
2246  03f2 88            	push	a
2247  03f3 88            	push	a
2248       00000001      OFST:	set	1
2251                     ; 991   uint8_t tmpreg = 0;
2253                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2255                     ; 997   (void) (RTC->TR1) ;
2257  03f4 c65140        	ld	a,20800
2258                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2260  03f7 1e05          	ldw	x,(OFST+4,sp)
2261  03f9 c65144        	ld	a,20804
2262  03fc e702          	ld	(2,x),a
2263                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2265  03fe c65145        	ld	a,20805
2266  0401 6b01          	ld	(OFST+0,sp),a
2268                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2270  0403 1e05          	ldw	x,(OFST+4,sp)
2271  0405 c65146        	ld	a,20806
2272  0408 e703          	ld	(3,x),a
2273                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2275  040a 7b01          	ld	a,(OFST+0,sp)
2276  040c a41f          	and	a,#31
2277  040e 1e05          	ldw	x,(OFST+4,sp)
2278  0410 e701          	ld	(1,x),a
2279                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2281  0412 7b01          	ld	a,(OFST+0,sp)
2282  0414 a4e0          	and	a,#224
2283  0416 4e            	swap	a
2284  0417 44            	srl	a
2285  0418 a407          	and	a,#7
2286  041a 1e05          	ldw	x,(OFST+4,sp)
2287  041c f7            	ld	(x),a
2288                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2290  041d 0d02          	tnz	(OFST+1,sp)
2291  041f 2621          	jrne	L7701
2292                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2294  0421 1e05          	ldw	x,(OFST+4,sp)
2295  0423 e603          	ld	a,(3,x)
2296  0425 cd09b3        	call	L5_Bcd2ToByte
2298  0428 1e05          	ldw	x,(OFST+4,sp)
2299  042a e703          	ld	(3,x),a
2300                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2302  042c 1e05          	ldw	x,(OFST+4,sp)
2303  042e e601          	ld	a,(1,x)
2304  0430 cd09b3        	call	L5_Bcd2ToByte
2306  0433 1e05          	ldw	x,(OFST+4,sp)
2307  0435 e701          	ld	(1,x),a
2308                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2310  0437 1e05          	ldw	x,(OFST+4,sp)
2311  0439 e602          	ld	a,(2,x)
2312  043b cd09b3        	call	L5_Bcd2ToByte
2314  043e 1e05          	ldw	x,(OFST+4,sp)
2315  0440 e702          	ld	(2,x),a
2316  0442               L7701:
2317                     ; 1014 }
2320  0442 85            	popw	x
2321  0443 81            	ret
2470                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2470                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2470                     ; 1046 {
2471                     	switch	.text
2472  0444               _RTC_SetAlarm:
2474  0444 88            	push	a
2475  0445 5205          	subw	sp,#5
2476       00000005      OFST:	set	5
2479                     ; 1047   uint8_t tmpreg1 = 0;
2481                     ; 1048   uint8_t tmpreg2 = 0;
2483                     ; 1049   uint8_t tmpreg3 = 0;
2485                     ; 1050   uint8_t tmpreg4 = 0;
2487                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2489                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2491                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2493                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2495                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2497  0447 4d            	tnz	a
2498  0448 2609          	jrne	L5711
2499                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2501  044a c65148        	ld	a,20808
2502  044d a540          	bcp	a,#64
2503  044f 2700          	jreq	L7711
2504                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2506                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2509  0451               L7711:
2510                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2512                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2514                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2517  0451 2007          	jra	L3021
2518  0453               L5711:
2519                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2521  0453 c65148        	ld	a,20808
2522  0456 a540          	bcp	a,#64
2523  0458 2700          	jreq	L5021
2524                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2526                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2529  045a               L5021:
2530                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2532                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2534                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2536  045a               L3021:
2537                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2539  045a 1e09          	ldw	x,(OFST+4,sp)
2540  045c e604          	ld	a,(4,x)
2541  045e a510          	bcp	a,#16
2542  0460 2608          	jrne	L1121
2543                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2545  0462 1e09          	ldw	x,(OFST+4,sp)
2546  0464 e605          	ld	a,(5,x)
2547  0466 a140          	cp	a,#64
2548  0468 2600          	jrne	L3121
2549                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2552  046a               L3121:
2553                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2555                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2557  046a               L1121:
2558                     ; 1108   RTC->WPR = 0xCA;
2560  046a 35ca5159      	mov	20825,#202
2561                     ; 1109   RTC->WPR = 0x53;
2563  046e 35535159      	mov	20825,#83
2564                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2566  0472 0d06          	tnz	(OFST+1,sp)
2567  0474 2747          	jreq	L7121
2568                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2568                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2570  0476 1e09          	ldw	x,(OFST+4,sp)
2571  0478 e604          	ld	a,(4,x)
2572  047a a480          	and	a,#128
2573  047c 1e09          	ldw	x,(OFST+4,sp)
2574  047e ea02          	or	a,(2,x)
2575  0480 6b02          	ld	(OFST-3,sp),a
2577                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2577                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2579  0482 1e09          	ldw	x,(OFST+4,sp)
2580  0484 e604          	ld	a,(4,x)
2581  0486 48            	sll	a
2582  0487 a480          	and	a,#128
2583  0489 1e09          	ldw	x,(OFST+4,sp)
2584  048b ea01          	or	a,(1,x)
2585  048d 6b03          	ld	(OFST-2,sp),a
2587                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2587                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2587                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2589  048f 1e09          	ldw	x,(OFST+4,sp)
2590  0491 e604          	ld	a,(4,x)
2591  0493 48            	sll	a
2592  0494 48            	sll	a
2593  0495 a480          	and	a,#128
2594  0497 6b01          	ld	(OFST-4,sp),a
2596  0499 1e09          	ldw	x,(OFST+4,sp)
2597  049b e603          	ld	a,(3,x)
2598  049d 1e09          	ldw	x,(OFST+4,sp)
2599  049f fa            	or	a,(x)
2600  04a0 1a01          	or	a,(OFST-4,sp)
2601  04a2 6b04          	ld	(OFST-1,sp),a
2603                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2603                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2603                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2605  04a4 1e09          	ldw	x,(OFST+4,sp)
2606  04a6 e604          	ld	a,(4,x)
2607  04a8 48            	sll	a
2608  04a9 48            	sll	a
2609  04aa 48            	sll	a
2610  04ab a480          	and	a,#128
2611  04ad 6b01          	ld	(OFST-4,sp),a
2613  04af 1e09          	ldw	x,(OFST+4,sp)
2614  04b1 e605          	ld	a,(5,x)
2615  04b3 1e09          	ldw	x,(OFST+4,sp)
2616  04b5 ea06          	or	a,(6,x)
2617  04b7 1a01          	or	a,(OFST-4,sp)
2618  04b9 6b05          	ld	(OFST+0,sp),a
2621  04bb 2059          	jra	L1221
2622  04bd               L7121:
2623                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2623                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2625  04bd 1e09          	ldw	x,(OFST+4,sp)
2626  04bf e604          	ld	a,(4,x)
2627  04c1 a480          	and	a,#128
2628  04c3 6b01          	ld	(OFST-4,sp),a
2630  04c5 1e09          	ldw	x,(OFST+4,sp)
2631  04c7 e602          	ld	a,(2,x)
2632  04c9 cd0994        	call	L3_ByteToBcd2
2634  04cc 1a01          	or	a,(OFST-4,sp)
2635  04ce 6b02          	ld	(OFST-3,sp),a
2637                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2637                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2639  04d0 1e09          	ldw	x,(OFST+4,sp)
2640  04d2 e604          	ld	a,(4,x)
2641  04d4 48            	sll	a
2642  04d5 a480          	and	a,#128
2643  04d7 6b01          	ld	(OFST-4,sp),a
2645  04d9 1e09          	ldw	x,(OFST+4,sp)
2646  04db e601          	ld	a,(1,x)
2647  04dd cd0994        	call	L3_ByteToBcd2
2649  04e0 1a01          	or	a,(OFST-4,sp)
2650  04e2 6b03          	ld	(OFST-2,sp),a
2652                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2652                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2652                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2654  04e4 1e09          	ldw	x,(OFST+4,sp)
2655  04e6 e604          	ld	a,(4,x)
2656  04e8 48            	sll	a
2657  04e9 48            	sll	a
2658  04ea a480          	and	a,#128
2659  04ec 6b01          	ld	(OFST-4,sp),a
2661  04ee 1e09          	ldw	x,(OFST+4,sp)
2662  04f0 f6            	ld	a,(x)
2663  04f1 cd0994        	call	L3_ByteToBcd2
2665  04f4 1e09          	ldw	x,(OFST+4,sp)
2666  04f6 ea03          	or	a,(3,x)
2667  04f8 1a01          	or	a,(OFST-4,sp)
2668  04fa 6b04          	ld	(OFST-1,sp),a
2670                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2670                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2670                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2672  04fc 1e09          	ldw	x,(OFST+4,sp)
2673  04fe e604          	ld	a,(4,x)
2674  0500 48            	sll	a
2675  0501 48            	sll	a
2676  0502 48            	sll	a
2677  0503 a480          	and	a,#128
2678  0505 6b01          	ld	(OFST-4,sp),a
2680  0507 1e09          	ldw	x,(OFST+4,sp)
2681  0509 e606          	ld	a,(6,x)
2682  050b cd0994        	call	L3_ByteToBcd2
2684  050e 1e09          	ldw	x,(OFST+4,sp)
2685  0510 ea05          	or	a,(5,x)
2686  0512 1a01          	or	a,(OFST-4,sp)
2687  0514 6b05          	ld	(OFST+0,sp),a
2689  0516               L1221:
2690                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2692  0516 7b02          	ld	a,(OFST-3,sp)
2693  0518 c7515c        	ld	20828,a
2694                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2696  051b 7b03          	ld	a,(OFST-2,sp)
2697  051d c7515d        	ld	20829,a
2698                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2700  0520 7b04          	ld	a,(OFST-1,sp)
2701  0522 c7515e        	ld	20830,a
2702                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2704  0525 7b05          	ld	a,(OFST+0,sp)
2705  0527 c7515f        	ld	20831,a
2706                     ; 1154   RTC->WPR = 0xFF; 
2708  052a 35ff5159      	mov	20825,#255
2709                     ; 1155 }
2712  052e 5b06          	addw	sp,#6
2713  0530 81            	ret
2751                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2751                     ; 1166 {
2752                     	switch	.text
2753  0531               _RTC_AlarmStructInit:
2757                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2759  0531 6f03          	clr	(3,x)
2760                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2762  0533 7f            	clr	(x)
2763                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2765  0534 6f01          	clr	(1,x)
2766                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2768  0536 6f02          	clr	(2,x)
2769                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2771  0538 6f05          	clr	(5,x)
2772                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2774  053a a601          	ld	a,#1
2775  053c e706          	ld	(6,x),a
2776                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2778  053e a6f0          	ld	a,#240
2779  0540 e704          	ld	(4,x),a
2780                     ; 1179 }
2783  0542 81            	ret
2876                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2876                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2876                     ; 1190 {
2877                     	switch	.text
2878  0543               _RTC_GetAlarm:
2880  0543 88            	push	a
2881  0544 5204          	subw	sp,#4
2882       00000004      OFST:	set	4
2885                     ; 1191   uint8_t tmpreg1 = 0;
2887                     ; 1192   uint8_t tmpreg2 = 0;
2889                     ; 1193   uint8_t tmpreg3 = 0;
2891                     ; 1194   uint8_t tmpreg4 = 0;
2893                     ; 1195   uint8_t alarmmask = 0;
2895                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2897                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2899  0546 c6515c        	ld	a,20828
2900  0549 6b04          	ld	(OFST+0,sp),a
2902                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2904  054b c6515d        	ld	a,20829
2905  054e 6b01          	ld	(OFST-3,sp),a
2907                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2909  0550 c6515e        	ld	a,20830
2910  0553 6b02          	ld	(OFST-2,sp),a
2912                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2914  0555 c6515f        	ld	a,20831
2915  0558 6b03          	ld	(OFST-1,sp),a
2917                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2919  055a 7b04          	ld	a,(OFST+0,sp)
2920  055c a47f          	and	a,#127
2921  055e 1e08          	ldw	x,(OFST+4,sp)
2922  0560 e702          	ld	(2,x),a
2923                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2925  0562 7b04          	ld	a,(OFST+0,sp)
2926  0564 a480          	and	a,#128
2927  0566 6b04          	ld	(OFST+0,sp),a
2929                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2931  0568 7b01          	ld	a,(OFST-3,sp)
2932  056a a47f          	and	a,#127
2933  056c 1e08          	ldw	x,(OFST+4,sp)
2934  056e e701          	ld	(1,x),a
2935                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2937  0570 7b01          	ld	a,(OFST-3,sp)
2938  0572 a480          	and	a,#128
2939  0574 44            	srl	a
2940  0575 1a04          	or	a,(OFST+0,sp)
2941  0577 6b04          	ld	(OFST+0,sp),a
2943                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2945  0579 7b02          	ld	a,(OFST-2,sp)
2946  057b a43f          	and	a,#63
2947  057d 1e08          	ldw	x,(OFST+4,sp)
2948  057f f7            	ld	(x),a
2949                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2951  0580 7b02          	ld	a,(OFST-2,sp)
2952  0582 a440          	and	a,#64
2953  0584 1e08          	ldw	x,(OFST+4,sp)
2954  0586 e703          	ld	(3,x),a
2955                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2957  0588 7b02          	ld	a,(OFST-2,sp)
2958  058a a480          	and	a,#128
2959  058c 44            	srl	a
2960  058d 44            	srl	a
2961  058e 1a04          	or	a,(OFST+0,sp)
2962  0590 6b04          	ld	(OFST+0,sp),a
2964                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2966  0592 7b03          	ld	a,(OFST-1,sp)
2967  0594 a43f          	and	a,#63
2968  0596 1e08          	ldw	x,(OFST+4,sp)
2969  0598 e706          	ld	(6,x),a
2970                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2972  059a 7b03          	ld	a,(OFST-1,sp)
2973  059c a440          	and	a,#64
2974  059e 1e08          	ldw	x,(OFST+4,sp)
2975  05a0 e705          	ld	(5,x),a
2976                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2978  05a2 7b03          	ld	a,(OFST-1,sp)
2979  05a4 a480          	and	a,#128
2980  05a6 44            	srl	a
2981  05a7 44            	srl	a
2982  05a8 44            	srl	a
2983  05a9 1a04          	or	a,(OFST+0,sp)
2984  05ab 6b04          	ld	(OFST+0,sp),a
2986                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2988  05ad 7b04          	ld	a,(OFST+0,sp)
2989  05af 1e08          	ldw	x,(OFST+4,sp)
2990  05b1 e704          	ld	(4,x),a
2991                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2993  05b3 0d05          	tnz	(OFST+1,sp)
2994  05b5 262a          	jrne	L3131
2995                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2997  05b7 1e08          	ldw	x,(OFST+4,sp)
2998  05b9 f6            	ld	a,(x)
2999  05ba cd09b3        	call	L5_Bcd2ToByte
3001  05bd 1e08          	ldw	x,(OFST+4,sp)
3002  05bf f7            	ld	(x),a
3003                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
3005  05c0 1e08          	ldw	x,(OFST+4,sp)
3006  05c2 e601          	ld	a,(1,x)
3007  05c4 cd09b3        	call	L5_Bcd2ToByte
3009  05c7 1e08          	ldw	x,(OFST+4,sp)
3010  05c9 e701          	ld	(1,x),a
3011                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
3013  05cb 1e08          	ldw	x,(OFST+4,sp)
3014  05cd e602          	ld	a,(2,x)
3015  05cf cd09b3        	call	L5_Bcd2ToByte
3017  05d2 1e08          	ldw	x,(OFST+4,sp)
3018  05d4 e702          	ld	(2,x),a
3019                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
3021  05d6 1e08          	ldw	x,(OFST+4,sp)
3022  05d8 e606          	ld	a,(6,x)
3023  05da cd09b3        	call	L5_Bcd2ToByte
3025  05dd 1e08          	ldw	x,(OFST+4,sp)
3026  05df e706          	ld	(6,x),a
3027  05e1               L3131:
3028                     ; 1233 }
3031  05e1 5b05          	addw	sp,#5
3032  05e3 81            	ret
3096                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3096                     ; 1243 {
3097                     	switch	.text
3098  05e4               _RTC_AlarmCmd:
3100  05e4 5203          	subw	sp,#3
3101       00000003      OFST:	set	3
3104                     ; 1244   __IO uint16_t alrawfcount = 0;
3106  05e6 5f            	clrw	x
3107  05e7 1f01          	ldw	(OFST-2,sp),x
3109                     ; 1245   ErrorStatus status = ERROR;
3111                     ; 1246   uint8_t temp1 = 0;
3113                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3115                     ; 1252   RTC->WPR = 0xCA;
3117  05e9 35ca5159      	mov	20825,#202
3118                     ; 1253   RTC->WPR = 0x53;
3120  05ed 35535159      	mov	20825,#83
3121                     ; 1256   if (NewState != DISABLE)
3123  05f1 4d            	tnz	a
3124  05f2 2711          	jreq	L7431
3125                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3127  05f4 72105149      	bset	20809,#0
3128                     ; 1259     status = SUCCESS;
3130  05f8 a601          	ld	a,#1
3131  05fa 6b03          	ld	(OFST+0,sp),a
3134  05fc               L1531:
3135                     ; 1283   RTC->WPR = 0xFF; 
3137  05fc 35ff5159      	mov	20825,#255
3138                     ; 1286   return (ErrorStatus)status;
3140  0600 7b03          	ld	a,(OFST+0,sp)
3143  0602 5b03          	addw	sp,#3
3144  0604 81            	ret
3145  0605               L7431:
3146                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3148  0605 72115149      	bres	20809,#0
3149                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3151  0609 c6514c        	ld	a,20812
3152  060c a401          	and	a,#1
3153  060e 6b03          	ld	(OFST+0,sp),a
3156  0610 2007          	jra	L7531
3157  0612               L3531:
3158                     ; 1269       alrawfcount++;
3160  0612 1e01          	ldw	x,(OFST-2,sp)
3161  0614 1c0001        	addw	x,#1
3162  0617 1f01          	ldw	(OFST-2,sp),x
3164  0619               L7531:
3165                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3167  0619 1e01          	ldw	x,(OFST-2,sp)
3168  061b a3ffff        	cpw	x,#65535
3169  061e 2704          	jreq	L3631
3171  0620 0d03          	tnz	(OFST+0,sp)
3172  0622 27ee          	jreq	L3531
3173  0624               L3631:
3174                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3176  0624 c6514c        	ld	a,20812
3177  0627 a501          	bcp	a,#1
3178  0629 2604          	jrne	L5631
3179                     ; 1274       status = ERROR;
3181  062b 0f03          	clr	(OFST+0,sp)
3184  062d 20cd          	jra	L1531
3185  062f               L5631:
3186                     ; 1278       status = SUCCESS;
3188  062f a601          	ld	a,#1
3189  0631 6b03          	ld	(OFST+0,sp),a
3191  0633 20c7          	jra	L1531
3392                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3392                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3392                     ; 1300 {
3393                     	switch	.text
3394  0635               _RTC_AlarmSubSecondConfig:
3396  0635 89            	pushw	x
3397  0636 88            	push	a
3398       00000001      OFST:	set	1
3401                     ; 1301   uint8_t alarmstatus = 0;
3403                     ; 1302   ErrorStatus status = ERROR;
3405                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3407                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3409                     ; 1309   RTC->WPR = 0xCA;
3411  0637 35ca5159      	mov	20825,#202
3412                     ; 1310   RTC->WPR = 0x53;
3414  063b 35535159      	mov	20825,#83
3415                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3417  063f c6514c        	ld	a,20812
3418  0642 a540          	bcp	a,#64
3419  0644 2626          	jrne	L7641
3420                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3422  0646 c65149        	ld	a,20809
3423  0649 aa01          	or	a,#1
3424  064b 6b01          	ld	(OFST+0,sp),a
3426                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3428  064d 72115149      	bres	20809,#0
3429                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3431  0651 9e            	ld	a,xh
3432  0652 c75164        	ld	20836,a
3433                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3435  0655 9f            	ld	a,xl
3436  0656 c75165        	ld	20837,a
3437                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3439  0659 7b06          	ld	a,(OFST+5,sp)
3440  065b c75166        	ld	20838,a
3441                     ; 1327     RTC->CR2 |= alarmstatus;
3443  065e c65149        	ld	a,20809
3444  0661 1a01          	or	a,(OFST+0,sp)
3445  0663 c75149        	ld	20809,a
3446                     ; 1329     status = SUCCESS;
3448  0666 a601          	ld	a,#1
3449  0668 6b01          	ld	(OFST+0,sp),a
3452  066a 2002          	jra	L1741
3453  066c               L7641:
3454                     ; 1333     status = ERROR;
3456  066c 0f01          	clr	(OFST+0,sp)
3458  066e               L1741:
3459                     ; 1337   RTC->WPR = 0xFF; 
3461  066e 35ff5159      	mov	20825,#255
3462                     ; 1339   return (ErrorStatus)status;
3464  0672 7b01          	ld	a,(OFST+0,sp)
3467  0674 5b03          	addw	sp,#3
3468  0676 81            	ret
3558                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3558                     ; 1370 {
3559                     	switch	.text
3560  0677               _RTC_WakeUpClockConfig:
3562  0677 88            	push	a
3563       00000000      OFST:	set	0
3566                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3568                     ; 1376   RTC->WPR = 0xCA;
3570  0678 35ca5159      	mov	20825,#202
3571                     ; 1377   RTC->WPR = 0x53;
3573  067c 35535159      	mov	20825,#83
3574                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3576  0680 72155149      	bres	20809,#2
3577                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3579  0684 c65148        	ld	a,20808
3580  0687 a4f8          	and	a,#248
3581  0689 c75148        	ld	20808,a
3582                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3584  068c c65148        	ld	a,20808
3585  068f 1a01          	or	a,(OFST+1,sp)
3586  0691 c75148        	ld	20808,a
3587                     ; 1389   RTC->WPR = 0xFF; 
3589  0694 35ff5159      	mov	20825,#255
3590                     ; 1390 }
3593  0698 84            	pop	a
3594  0699 81            	ret
3629                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3629                     ; 1401 {
3630                     	switch	.text
3631  069a               _RTC_SetWakeUpCounter:
3635                     ; 1403   RTC->WPR = 0xCA;
3637  069a 35ca5159      	mov	20825,#202
3638                     ; 1404   RTC->WPR = 0x53;
3640  069e 35535159      	mov	20825,#83
3641                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3643  06a2 9e            	ld	a,xh
3644  06a3 c75154        	ld	20820,a
3645                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3647  06a6 9f            	ld	a,xl
3648  06a7 c75155        	ld	20821,a
3649                     ; 1412   RTC->WPR = 0xFF; 
3651  06aa 35ff5159      	mov	20825,#255
3652                     ; 1413 }
3655  06ae 81            	ret
3690                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3690                     ; 1421 {
3691                     	switch	.text
3692  06af               _RTC_GetWakeUpCounter:
3694  06af 89            	pushw	x
3695       00000002      OFST:	set	2
3698                     ; 1422   uint16_t tmpreg = 0;
3700                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3702  06b0 c65154        	ld	a,20820
3703  06b3 5f            	clrw	x
3704  06b4 97            	ld	xl,a
3705  06b5 4f            	clr	a
3706  06b6 02            	rlwa	x,a
3707  06b7 1f01          	ldw	(OFST-1,sp),x
3709                     ; 1426   tmpreg |= RTC->WUTRL;
3711  06b9 c65155        	ld	a,20821
3712  06bc 5f            	clrw	x
3713  06bd 97            	ld	xl,a
3714  06be 01            	rrwa	x,a
3715  06bf 1a02          	or	a,(OFST+0,sp)
3716  06c1 01            	rrwa	x,a
3717  06c2 1a01          	or	a,(OFST-1,sp)
3718  06c4 01            	rrwa	x,a
3719  06c5 1f01          	ldw	(OFST-1,sp),x
3721                     ; 1429   return (uint16_t)tmpreg;
3723  06c7 1e01          	ldw	x,(OFST-1,sp)
3726  06c9 5b02          	addw	sp,#2
3727  06cb 81            	ret
3782                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3782                     ; 1441 {
3783                     	switch	.text
3784  06cc               _RTC_WakeUpCmd:
3786  06cc 5203          	subw	sp,#3
3787       00000003      OFST:	set	3
3790                     ; 1442   ErrorStatus status = ERROR;
3792                     ; 1443   uint16_t wutwfcount = 0;
3794  06ce 5f            	clrw	x
3795  06cf 1f02          	ldw	(OFST-1,sp),x
3797                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3799                     ; 1449   RTC->WPR = 0xCA;
3801  06d1 35ca5159      	mov	20825,#202
3802                     ; 1450   RTC->WPR = 0x53;
3804  06d5 35535159      	mov	20825,#83
3805                     ; 1452   if (NewState != DISABLE)
3807  06d9 4d            	tnz	a
3808  06da 2711          	jreq	L3161
3809                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3811  06dc 72145149      	bset	20809,#2
3812                     ; 1457     status = SUCCESS;
3814  06e0 a601          	ld	a,#1
3815  06e2 6b01          	ld	(OFST-2,sp),a
3818  06e4               L5161:
3819                     ; 1482   RTC->WPR = 0xFF; 
3821  06e4 35ff5159      	mov	20825,#255
3822                     ; 1485   return (ErrorStatus)status;
3824  06e8 7b01          	ld	a,(OFST-2,sp)
3827  06ea 5b03          	addw	sp,#3
3828  06ec 81            	ret
3829  06ed               L3161:
3830                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3832  06ed 72155149      	bres	20809,#2
3834  06f1 2007          	jra	L1261
3835  06f3               L7161:
3836                     ; 1467       wutwfcount++;
3838  06f3 1e02          	ldw	x,(OFST-1,sp)
3839  06f5 1c0001        	addw	x,#1
3840  06f8 1f02          	ldw	(OFST-1,sp),x
3842  06fa               L1261:
3843                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3845  06fa c6514c        	ld	a,20812
3846  06fd a504          	bcp	a,#4
3847  06ff 2607          	jrne	L5261
3849  0701 1e02          	ldw	x,(OFST-1,sp)
3850  0703 a3ffff        	cpw	x,#65535
3851  0706 26eb          	jrne	L7161
3852  0708               L5261:
3853                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3855  0708 c6514c        	ld	a,20812
3856  070b a504          	bcp	a,#4
3857  070d 2604          	jrne	L7261
3858                     ; 1473       status = ERROR;
3860  070f 0f01          	clr	(OFST-2,sp)
3863  0711 20d1          	jra	L5161
3864  0713               L7261:
3865                     ; 1477       status = SUCCESS;
3867  0713 a601          	ld	a,#1
3868  0715 6b01          	ld	(OFST-2,sp),a
3870  0717 20cb          	jra	L5161
3960                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3960                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3960                     ; 1524 {
3961                     	switch	.text
3962  0719               _RTC_DayLightSavingConfig:
3964  0719 89            	pushw	x
3965       00000000      OFST:	set	0
3968                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3970                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3972                     ; 1530   RTC->WPR = 0xCA;
3974  071a 35ca5159      	mov	20825,#202
3975                     ; 1531   RTC->WPR = 0x53;
3977  071e 35535159      	mov	20825,#83
3978                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3980  0722 7215514a      	bres	20810,#2
3981                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3983  0726 9f            	ld	a,xl
3984  0727 1a01          	or	a,(OFST+1,sp)
3985  0729 ca514a        	or	a,20810
3986  072c c7514a        	ld	20810,a
3987                     ; 1540   RTC->WPR = 0xFF; 
3989  072f 35ff5159      	mov	20825,#255
3990                     ; 1541 }
3993  0733 85            	popw	x
3994  0734 81            	ret
4019                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
4019                     ; 1550 {
4020                     	switch	.text
4021  0735               _RTC_GetStoreOperation:
4025                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
4027  0735 c6514a        	ld	a,20810
4028  0738 a404          	and	a,#4
4031  073a 81            	ret
4125                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4125                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4125                     ; 1589 {
4126                     	switch	.text
4127  073b               _RTC_OutputConfig:
4129  073b 89            	pushw	x
4130       00000000      OFST:	set	0
4133                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4135                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4137                     ; 1595   RTC->WPR = 0xCA;
4139  073c 35ca5159      	mov	20825,#202
4140                     ; 1596   RTC->WPR = 0x53;
4142  0740 35535159      	mov	20825,#83
4143                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4145  0744 c6514a        	ld	a,20810
4146  0747 a48f          	and	a,#143
4147  0749 c7514a        	ld	20810,a
4148                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4150  074c 9f            	ld	a,xl
4151  074d 1a01          	or	a,(OFST+1,sp)
4152  074f ca514a        	or	a,20810
4153  0752 c7514a        	ld	20810,a
4154                     ; 1605   RTC->WPR = 0xFF; 
4156  0755 35ff5159      	mov	20825,#255
4157                     ; 1606 }
4160  0759 85            	popw	x
4161  075a 81            	ret
4256                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4256                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4256                     ; 1641 {
4257                     	switch	.text
4258  075b               _RTC_SynchroShiftConfig:
4260  075b 88            	push	a
4261  075c 5203          	subw	sp,#3
4262       00000003      OFST:	set	3
4265                     ; 1642   uint8_t shiftrhreg = 0;
4267                     ; 1643   ErrorStatus status = ERROR;
4269                     ; 1644   uint16_t shpfcount = 0;
4271  075e 5f            	clrw	x
4272  075f 1f02          	ldw	(OFST-1,sp),x
4274                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4276                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4278                     ; 1651   RTC->WPR = 0xCA;
4280  0761 35ca5159      	mov	20825,#202
4281                     ; 1652   RTC->WPR = 0x53;
4283  0765 35535159      	mov	20825,#83
4284                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4286  0769 c6514c        	ld	a,20812
4287  076c a508          	bcp	a,#8
4288  076e 2717          	jreq	L7102
4290  0770 2007          	jra	L3202
4291  0772               L1202:
4292                     ; 1660       shpfcount++;
4294  0772 1e02          	ldw	x,(OFST-1,sp)
4295  0774 1c0001        	addw	x,#1
4296  0777 1f02          	ldw	(OFST-1,sp),x
4298  0779               L3202:
4299                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4301  0779 c6514c        	ld	a,20812
4302  077c a508          	bcp	a,#8
4303  077e 2707          	jreq	L7102
4305  0780 1e02          	ldw	x,(OFST-1,sp)
4306  0782 a3ffff        	cpw	x,#65535
4307  0785 26eb          	jrne	L1202
4308  0787               L7102:
4309                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4311  0787 c6514c        	ld	a,20812
4312  078a a508          	bcp	a,#8
4313  078c 2616          	jrne	L1302
4314                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4316  078e 7b07          	ld	a,(OFST+4,sp)
4317  0790 1a04          	or	a,(OFST+1,sp)
4318  0792 6b01          	ld	(OFST-2,sp),a
4320                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4322  0794 7b01          	ld	a,(OFST-2,sp)
4323  0796 c7515a        	ld	20826,a
4324                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4326  0799 7b08          	ld	a,(OFST+5,sp)
4327  079b c7515b        	ld	20827,a
4328                     ; 1672     status = SUCCESS;
4330  079e a601          	ld	a,#1
4331  07a0 6b01          	ld	(OFST-2,sp),a
4334  07a2 2002          	jra	L3302
4335  07a4               L1302:
4336                     ; 1676     status = ERROR;
4338  07a4 0f01          	clr	(OFST-2,sp)
4340  07a6               L3302:
4341                     ; 1680   RTC->WPR = 0xFF; 
4343  07a6 35ff5159      	mov	20825,#255
4344                     ; 1682   return (ErrorStatus)(status);
4346  07aa 7b01          	ld	a,(OFST-2,sp)
4349  07ac 5b04          	addw	sp,#4
4350  07ae 81            	ret
4480                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4480                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4480                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4480                     ; 1721 {
4481                     	switch	.text
4482  07af               _RTC_SmoothCalibConfig:
4484  07af 89            	pushw	x
4485  07b0 5203          	subw	sp,#3
4486       00000003      OFST:	set	3
4489                     ; 1722   ErrorStatus status = ERROR;
4491                     ; 1723   uint16_t recalpfcount = 0;
4493  07b2 5f            	clrw	x
4494  07b3 1f02          	ldw	(OFST-1,sp),x
4496                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4498                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4500                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4502                     ; 1731   RTC->WPR = 0xCA;
4504  07b5 35ca5159      	mov	20825,#202
4505                     ; 1732   RTC->WPR = 0x53;
4507  07b9 35535159      	mov	20825,#83
4508                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4510  07bd c6514c        	ld	a,20812
4511  07c0 a502          	bcp	a,#2
4512  07c2 2717          	jreq	L5112
4514  07c4 2007          	jra	L1212
4515  07c6               L7112:
4516                     ; 1740       recalpfcount++;
4518  07c6 1e02          	ldw	x,(OFST-1,sp)
4519  07c8 1c0001        	addw	x,#1
4520  07cb 1f02          	ldw	(OFST-1,sp),x
4522  07cd               L1212:
4523                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4525  07cd c6514c        	ld	a,20812
4526  07d0 a502          	bcp	a,#2
4527  07d2 2707          	jreq	L5112
4529  07d4 1e02          	ldw	x,(OFST-1,sp)
4530  07d6 a3ffff        	cpw	x,#65535
4531  07d9 26eb          	jrne	L7112
4532  07db               L5112:
4533                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4535  07db c6514c        	ld	a,20812
4536  07de a502          	bcp	a,#2
4537  07e0 2614          	jrne	L7212
4538                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4538                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4538                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4540  07e2 7b04          	ld	a,(OFST+1,sp)
4541  07e4 1a05          	or	a,(OFST+2,sp)
4542  07e6 1a08          	or	a,(OFST+5,sp)
4543  07e8 c7516a        	ld	20842,a
4544                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4546  07eb 7b09          	ld	a,(OFST+6,sp)
4547  07ed c7516b        	ld	20843,a
4548                     ; 1754     status = SUCCESS;
4550  07f0 a601          	ld	a,#1
4551  07f2 6b01          	ld	(OFST-2,sp),a
4554  07f4 2002          	jra	L1312
4555  07f6               L7212:
4556                     ; 1758     status = ERROR;
4558  07f6 0f01          	clr	(OFST-2,sp)
4560  07f8               L1312:
4561                     ; 1762   RTC->WPR = 0xFF; 
4563  07f8 35ff5159      	mov	20825,#255
4564                     ; 1764   return (ErrorStatus)(status);
4566  07fc 7b01          	ld	a,(OFST-2,sp)
4569  07fe 5b05          	addw	sp,#5
4570  0800 81            	ret
4628                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4628                     ; 1791 {
4629                     	switch	.text
4630  0801               _RTC_CalibOutputConfig:
4634                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4636                     ; 1796   RTC->WPR = 0xCA;
4638  0801 35ca5159      	mov	20825,#202
4639                     ; 1797   RTC->WPR = 0x53;
4641  0805 35535159      	mov	20825,#83
4642                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4644  0809 4d            	tnz	a
4645  080a 2706          	jreq	L1612
4646                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4648  080c 7216514a      	bset	20810,#3
4650  0810 2004          	jra	L3612
4651  0812               L1612:
4652                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4654  0812 7217514a      	bres	20810,#3
4655  0816               L3612:
4656                     ; 1811   RTC->WPR = 0xFF; 
4658  0816 35ff5159      	mov	20825,#255
4659                     ; 1812 }
4662  081a 81            	ret
4697                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4697                     ; 1821 {
4698                     	switch	.text
4699  081b               _RTC_CalibOutputCmd:
4703                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4705                     ; 1826   RTC->WPR = 0xCA;
4707  081b 35ca5159      	mov	20825,#202
4708                     ; 1827   RTC->WPR = 0x53;
4710  081f 35535159      	mov	20825,#83
4711                     ; 1829   if (NewState != DISABLE)
4713  0823 4d            	tnz	a
4714  0824 2706          	jreq	L3022
4715                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4717  0826 721e514a      	bset	20810,#7
4719  082a 2004          	jra	L5022
4720  082c               L3022:
4721                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4723  082c 721f514a      	bres	20810,#7
4724  0830               L5022:
4725                     ; 1841   RTC->WPR = 0xFF; 
4727  0830 35ff5159      	mov	20825,#255
4728                     ; 1842 }
4731  0834 81            	ret
4826                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4826                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4826                     ; 1873 {
4827                     	switch	.text
4828  0835               _RTC_TamperLevelConfig:
4830  0835 89            	pushw	x
4831       00000000      OFST:	set	0
4834                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4836                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4838                     ; 1879   RTC->WPR = 0xCA;
4840  0836 35ca5159      	mov	20825,#202
4841                     ; 1880   RTC->WPR = 0x53;
4843  083a 35535159      	mov	20825,#83
4844                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4846  083e 9f            	ld	a,xl
4847  083f 4d            	tnz	a
4848  0840 270a          	jreq	L3522
4849                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4851  0842 9e            	ld	a,xh
4852  0843 48            	sll	a
4853  0844 ca516c        	or	a,20844
4854  0847 c7516c        	ld	20844,a
4856  084a 200a          	jra	L5522
4857  084c               L3522:
4858                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4860  084c 7b01          	ld	a,(OFST+1,sp)
4861  084e 48            	sll	a
4862  084f 43            	cpl	a
4863  0850 c4516c        	and	a,20844
4864  0853 c7516c        	ld	20844,a
4865  0856               L5522:
4866                     ; 1894   RTC->WPR = 0xFF; 
4868  0856 35ff5159      	mov	20825,#255
4869                     ; 1895 }
4872  085a 85            	popw	x
4873  085b 81            	ret
4947                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4947                     ; 1904 {
4948                     	switch	.text
4949  085c               _RTC_TamperFilterConfig:
4951  085c 88            	push	a
4952       00000000      OFST:	set	0
4955                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4957                     ; 1910   RTC->WPR = 0xCA;
4959  085d 35ca5159      	mov	20825,#202
4960                     ; 1911   RTC->WPR = 0x53;
4962  0861 35535159      	mov	20825,#83
4963                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4965  0865 c6516d        	ld	a,20845
4966  0868 a4e7          	and	a,#231
4967  086a c7516d        	ld	20845,a
4968                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4970  086d c6516d        	ld	a,20845
4971  0870 1a01          	or	a,(OFST+1,sp)
4972  0872 c7516d        	ld	20845,a
4973                     ; 1920   RTC->WPR = 0xFF; 
4975  0875 35ff5159      	mov	20825,#255
4976                     ; 1922 }
4979  0879 84            	pop	a
4980  087a 81            	ret
5093                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5093                     ; 1932 {
5094                     	switch	.text
5095  087b               _RTC_TamperSamplingFreqConfig:
5097  087b 88            	push	a
5098       00000000      OFST:	set	0
5101                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5103                     ; 1937   RTC->WPR = 0xCA;
5105  087c 35ca5159      	mov	20825,#202
5106                     ; 1938   RTC->WPR = 0x53;
5108  0880 35535159      	mov	20825,#83
5109                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5111  0884 c6516d        	ld	a,20845
5112  0887 a4f8          	and	a,#248
5113  0889 c7516d        	ld	20845,a
5114                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5116  088c c6516d        	ld	a,20845
5117  088f 1a01          	or	a,(OFST+1,sp)
5118  0891 c7516d        	ld	20845,a
5119                     ; 1947   RTC->WPR = 0xFF; 
5121  0894 35ff5159      	mov	20825,#255
5122                     ; 1948 }
5125  0898 84            	pop	a
5126  0899 81            	ret
5209                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5209                     ; 1959 {
5210                     	switch	.text
5211  089a               _RTC_TamperPinsPrechargeDuration:
5213  089a 88            	push	a
5214       00000000      OFST:	set	0
5217                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5219                     ; 1964   RTC->WPR = 0xCA;
5221  089b 35ca5159      	mov	20825,#202
5222                     ; 1965   RTC->WPR = 0x53;
5224  089f 35535159      	mov	20825,#83
5225                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5227  08a3 c6516d        	ld	a,20845
5228  08a6 a41f          	and	a,#31
5229  08a8 c7516d        	ld	20845,a
5230                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5232  08ab c6516d        	ld	a,20845
5233  08ae 1a01          	or	a,(OFST+1,sp)
5234  08b0 c7516d        	ld	20845,a
5235                     ; 1974   RTC->WPR = 0xFF; 
5237  08b3 35ff5159      	mov	20825,#255
5238                     ; 1975 }
5241  08b7 84            	pop	a
5242  08b8 81            	ret
5287                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5287                     ; 1988                    FunctionalState NewState)
5287                     ; 1989 {
5288                     	switch	.text
5289  08b9               _RTC_TamperCmd:
5291  08b9 89            	pushw	x
5292       00000000      OFST:	set	0
5295                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5297                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5299                     ; 1996   RTC->WPR = 0xCA;
5301  08ba 35ca5159      	mov	20825,#202
5302                     ; 1997   RTC->WPR = 0x53;
5304  08be 35535159      	mov	20825,#83
5305                     ; 2000   if (NewState != DISABLE)
5307  08c2 9f            	ld	a,xl
5308  08c3 4d            	tnz	a
5309  08c4 2709          	jreq	L1342
5310                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5312  08c6 9e            	ld	a,xh
5313  08c7 ca516c        	or	a,20844
5314  08ca c7516c        	ld	20844,a
5316  08cd 2009          	jra	L3342
5317  08cf               L1342:
5318                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5320  08cf 7b01          	ld	a,(OFST+1,sp)
5321  08d1 43            	cpl	a
5322  08d2 c4516c        	and	a,20844
5323  08d5 c7516c        	ld	20844,a
5324  08d8               L3342:
5325                     ; 2013   RTC->WPR = 0xFF; 
5327  08d8 35ff5159      	mov	20825,#255
5328                     ; 2014 }
5331  08dc 85            	popw	x
5332  08dd 81            	ret
5404                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5404                     ; 2059 {
5405                     	switch	.text
5406  08de               _RTC_ITConfig:
5408  08de 89            	pushw	x
5409       00000000      OFST:	set	0
5412                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5414                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5416                     ; 2065   RTC->WPR = 0xCA;
5418  08df 35ca5159      	mov	20825,#202
5419                     ; 2066   RTC->WPR = 0x53;
5421  08e3 35535159      	mov	20825,#83
5422                     ; 2068   if (NewState != DISABLE)
5424  08e7 0d05          	tnz	(OFST+5,sp)
5425  08e9 2715          	jreq	L1742
5426                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5428  08eb 9f            	ld	a,xl
5429  08ec a4f0          	and	a,#240
5430  08ee ca5149        	or	a,20809
5431  08f1 c75149        	ld	20809,a
5432                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5434  08f4 7b02          	ld	a,(OFST+2,sp)
5435  08f6 a401          	and	a,#1
5436  08f8 ca516c        	or	a,20844
5437  08fb c7516c        	ld	20844,a
5439  08fe 2016          	jra	L3742
5440  0900               L1742:
5441                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5443  0900 7b02          	ld	a,(OFST+2,sp)
5444  0902 a4f0          	and	a,#240
5445  0904 43            	cpl	a
5446  0905 c45149        	and	a,20809
5447  0908 c75149        	ld	20809,a
5448                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5450  090b 7b02          	ld	a,(OFST+2,sp)
5451  090d a401          	and	a,#1
5452  090f 43            	cpl	a
5453  0910 c4516c        	and	a,20844
5454  0913 c7516c        	ld	20844,a
5455  0916               L3742:
5456                     ; 2082   RTC->WPR = 0xFF; 
5458  0916 35ff5159      	mov	20825,#255
5459                     ; 2083 }
5462  091a 85            	popw	x
5463  091b 81            	ret
5637                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5637                     ; 2091 {
5638                     	switch	.text
5639  091c               _RTC_GetFlagStatus:
5641  091c 89            	pushw	x
5642  091d 5203          	subw	sp,#3
5643       00000003      OFST:	set	3
5646                     ; 2092   FlagStatus flagstatus = RESET;
5648                     ; 2093   uint16_t tmpreg1 = 0;
5650                     ; 2094   uint16_t tmpreg2 = 0;
5652                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5654                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5656  091f c6514c        	ld	a,20812
5657  0922 5f            	clrw	x
5658  0923 97            	ld	xl,a
5659  0924 4f            	clr	a
5660  0925 02            	rlwa	x,a
5661  0926 1f02          	ldw	(OFST-1,sp),x
5663                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5665  0928 c6514d        	ld	a,20813
5666  092b 5f            	clrw	x
5667  092c 97            	ld	xl,a
5668  092d 01            	rrwa	x,a
5669  092e 1a03          	or	a,(OFST+0,sp)
5670  0930 01            	rrwa	x,a
5671  0931 1a02          	or	a,(OFST-1,sp)
5672  0933 01            	rrwa	x,a
5673  0934 1f02          	ldw	(OFST-1,sp),x
5675                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5677  0936 1e02          	ldw	x,(OFST-1,sp)
5678  0938 01            	rrwa	x,a
5679  0939 1405          	and	a,(OFST+2,sp)
5680  093b 01            	rrwa	x,a
5681  093c 1404          	and	a,(OFST+1,sp)
5682  093e 01            	rrwa	x,a
5683  093f a30000        	cpw	x,#0
5684  0942 2706          	jreq	L3752
5685                     ; 2106     flagstatus = SET;
5687  0944 a601          	ld	a,#1
5688  0946 6b01          	ld	(OFST-2,sp),a
5691  0948 2002          	jra	L5752
5692  094a               L3752:
5693                     ; 2110     flagstatus = RESET;
5695  094a 0f01          	clr	(OFST-2,sp)
5697  094c               L5752:
5698                     ; 2112   return (FlagStatus)flagstatus;
5700  094c 7b01          	ld	a,(OFST-2,sp)
5703  094e 5b05          	addw	sp,#5
5704  0950 81            	ret
5739                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5739                     ; 2123 {
5740                     	switch	.text
5741  0951               _RTC_ClearFlag:
5743  0951 89            	pushw	x
5744       00000000      OFST:	set	0
5747                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5749                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5751  0952 9f            	ld	a,xl
5752  0953 43            	cpl	a
5753  0954 c7514d        	ld	20813,a
5754                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5756  0957 7b01          	ld	a,(OFST+1,sp)
5757  0959 43            	cpl	a
5758  095a a47f          	and	a,#127
5759  095c c7514c        	ld	20812,a
5760                     ; 2130 }
5763  095f 85            	popw	x
5764  0960 81            	ret
5828                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5828                     ; 2139 {
5829                     	switch	.text
5830  0961               _RTC_GetITStatus:
5832  0961 89            	pushw	x
5833  0962 89            	pushw	x
5834       00000002      OFST:	set	2
5837                     ; 2140   ITStatus itstatus = RESET;
5839                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5843                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5845                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5847  0963 9f            	ld	a,xl
5848  0964 c45149        	and	a,20809
5849  0967 6b01          	ld	(OFST-1,sp),a
5851                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5853  0969 1e03          	ldw	x,(OFST+1,sp)
5854  096b 54            	srlw	x
5855  096c 54            	srlw	x
5856  096d 54            	srlw	x
5857  096e 54            	srlw	x
5858  096f 9f            	ld	a,xl
5859  0970 c4514d        	and	a,20813
5860  0973 6b02          	ld	(OFST+0,sp),a
5862                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5864  0975 0d01          	tnz	(OFST-1,sp)
5865  0977 270a          	jreq	L7462
5867  0979 0d02          	tnz	(OFST+0,sp)
5868  097b 2706          	jreq	L7462
5869                     ; 2155     itstatus = SET;
5871  097d a601          	ld	a,#1
5872  097f 6b02          	ld	(OFST+0,sp),a
5875  0981 2002          	jra	L1562
5876  0983               L7462:
5877                     ; 2159     itstatus = RESET;
5879  0983 0f02          	clr	(OFST+0,sp)
5881  0985               L1562:
5882                     ; 2162   return (ITStatus)itstatus;
5884  0985 7b02          	ld	a,(OFST+0,sp)
5887  0987 5b04          	addw	sp,#4
5888  0989 81            	ret
5924                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5924                     ; 2173 {
5925                     	switch	.text
5926  098a               _RTC_ClearITPendingBit:
5930                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5932                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5934  098a 54            	srlw	x
5935  098b 54            	srlw	x
5936  098c 54            	srlw	x
5937  098d 54            	srlw	x
5938  098e 9f            	ld	a,xl
5939  098f 43            	cpl	a
5940  0990 c7514d        	ld	20813,a
5941                     ; 2179 }
5944  0993 81            	ret
5987                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5987                     ; 2203 {
5988                     	switch	.text
5989  0994               L3_ByteToBcd2:
5991  0994 88            	push	a
5992  0995 88            	push	a
5993       00000001      OFST:	set	1
5996                     ; 2204   uint8_t bcdhigh = 0;
5998  0996 0f01          	clr	(OFST+0,sp)
6001  0998 2008          	jra	L7172
6002  099a               L3172:
6003                     ; 2208     bcdhigh++;
6005  099a 0c01          	inc	(OFST+0,sp)
6007                     ; 2209     Value -= 10;
6009  099c 7b02          	ld	a,(OFST+1,sp)
6010  099e a00a          	sub	a,#10
6011  09a0 6b02          	ld	(OFST+1,sp),a
6012  09a2               L7172:
6013                     ; 2206   while (Value >= 10)
6015  09a2 7b02          	ld	a,(OFST+1,sp)
6016  09a4 a10a          	cp	a,#10
6017  09a6 24f2          	jruge	L3172
6018                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
6020  09a8 7b01          	ld	a,(OFST+0,sp)
6021  09aa 97            	ld	xl,a
6022  09ab a610          	ld	a,#16
6023  09ad 42            	mul	x,a
6024  09ae 9f            	ld	a,xl
6025  09af 1a02          	or	a,(OFST+1,sp)
6028  09b1 85            	popw	x
6029  09b2 81            	ret
6072                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
6072                     ; 2221 {
6073                     	switch	.text
6074  09b3               L5_Bcd2ToByte:
6076  09b3 88            	push	a
6077  09b4 88            	push	a
6078       00000001      OFST:	set	1
6081                     ; 2222   uint8_t tmp = 0;
6083                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
6085  09b5 a4f0          	and	a,#240
6086  09b7 4e            	swap	a
6087  09b8 a40f          	and	a,#15
6088  09ba 97            	ld	xl,a
6089  09bb a60a          	ld	a,#10
6090  09bd 42            	mul	x,a
6091  09be 9f            	ld	a,xl
6092  09bf 6b01          	ld	(OFST+0,sp),a
6094                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6096  09c1 7b02          	ld	a,(OFST+1,sp)
6097  09c3 a40f          	and	a,#15
6098  09c5 1b01          	add	a,(OFST+0,sp)
6101  09c7 85            	popw	x
6102  09c8 81            	ret
6115                     	xdef	_RTC_ClearITPendingBit
6116                     	xdef	_RTC_GetITStatus
6117                     	xdef	_RTC_ClearFlag
6118                     	xdef	_RTC_GetFlagStatus
6119                     	xdef	_RTC_ITConfig
6120                     	xdef	_RTC_TamperCmd
6121                     	xdef	_RTC_TamperPinsPrechargeDuration
6122                     	xdef	_RTC_TamperSamplingFreqConfig
6123                     	xdef	_RTC_TamperFilterConfig
6124                     	xdef	_RTC_TamperLevelConfig
6125                     	xdef	_RTC_CalibOutputCmd
6126                     	xdef	_RTC_CalibOutputConfig
6127                     	xdef	_RTC_SmoothCalibConfig
6128                     	xdef	_RTC_SynchroShiftConfig
6129                     	xdef	_RTC_OutputConfig
6130                     	xdef	_RTC_GetStoreOperation
6131                     	xdef	_RTC_DayLightSavingConfig
6132                     	xdef	_RTC_WakeUpCmd
6133                     	xdef	_RTC_GetWakeUpCounter
6134                     	xdef	_RTC_SetWakeUpCounter
6135                     	xdef	_RTC_WakeUpClockConfig
6136                     	xdef	_RTC_AlarmSubSecondConfig
6137                     	xdef	_RTC_AlarmCmd
6138                     	xdef	_RTC_GetAlarm
6139                     	xdef	_RTC_AlarmStructInit
6140                     	xdef	_RTC_SetAlarm
6141                     	xdef	_RTC_GetDate
6142                     	xdef	_RTC_DateStructInit
6143                     	xdef	_RTC_SetDate
6144                     	xdef	_RTC_GetSubSecond
6145                     	xdef	_RTC_GetTime
6146                     	xdef	_RTC_TimeStructInit
6147                     	xdef	_RTC_SetTime
6148                     	xdef	_RTC_BypassShadowCmd
6149                     	xdef	_RTC_RatioCmd
6150                     	xdef	_RTC_WaitForSynchro
6151                     	xdef	_RTC_ExitInitMode
6152                     	xdef	_RTC_EnterInitMode
6153                     	xdef	_RTC_WriteProtectionCmd
6154                     	xdef	_RTC_StructInit
6155                     	xdef	_RTC_Init
6156                     	xdef	_RTC_DeInit
6175                     	end
