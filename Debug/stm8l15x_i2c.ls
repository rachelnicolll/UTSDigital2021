   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
 197                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 197                     ; 142 {
 199                     	switch	.text
 200  0000               _I2C_DeInit:
 204                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 206  0000 7f            	clr	(x)
 207                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 209  0001 6f01          	clr	(1,x)
 210                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 212  0003 6f02          	clr	(2,x)
 213                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 215  0005 6f03          	clr	(3,x)
 216                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 218  0007 6f04          	clr	(4,x)
 219                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 221  0009 6f05          	clr	(5,x)
 222                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 224  000b 6f0a          	clr	(10,x)
 225                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 227  000d 6f0b          	clr	(11,x)
 228                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 230  000f 6f0c          	clr	(12,x)
 231                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 233  0011 a602          	ld	a,#2
 234  0013 e70d          	ld	(13,x),a
 235                     ; 153 }
 238  0015 81            	ret
 462                     .const:	section	.text
 463  0000               L01:
 464  0000 000f4240      	dc.l	1000000
 465  0004               L21:
 466  0004 000186a1      	dc.l	100001
 467  0008               L41:
 468  0008 00000004      	dc.l	4
 469                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 469                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 469                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 469                     ; 187 {
 470                     	switch	.text
 471  0016               _I2C_Init:
 473  0016 89            	pushw	x
 474  0017 520c          	subw	sp,#12
 475       0000000c      OFST:	set	12
 478                     ; 188   uint32_t result = 0x0004;
 480                     ; 189   uint16_t tmpval = 0;
 482                     ; 190   uint8_t tmpccrh = 0;
 484  0019 0f07          	clr	(OFST-5,sp)
 486                     ; 191   uint8_t input_clock = 0;
 488                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 490                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 492                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 494                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 496                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 498                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 500                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 502  001b cd0000        	call	_CLK_GetClockFreq
 504  001e ae0000        	ldw	x,#L01
 505  0021 cd0000        	call	c_ludv
 507  0024 b603          	ld	a,c_lreg+3
 508  0026 6b08          	ld	(OFST-4,sp),a
 510                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 512  0028 1e0d          	ldw	x,(OFST+1,sp)
 513  002a e602          	ld	a,(2,x)
 514  002c a4c0          	and	a,#192
 515  002e e702          	ld	(2,x),a
 516                     ; 209   I2Cx->FREQR |= input_clock;
 518  0030 1e0d          	ldw	x,(OFST+1,sp)
 519  0032 e602          	ld	a,(2,x)
 520  0034 1a08          	or	a,(OFST-4,sp)
 521  0036 e702          	ld	(2,x),a
 522                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 524  0038 1e0d          	ldw	x,(OFST+1,sp)
 525  003a f6            	ld	a,(x)
 526  003b a4fe          	and	a,#254
 527  003d f7            	ld	(x),a
 528                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 530  003e 1e0d          	ldw	x,(OFST+1,sp)
 531  0040 e60c          	ld	a,(12,x)
 532  0042 a430          	and	a,#48
 533  0044 e70c          	ld	(12,x),a
 534                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 536  0046 1e0d          	ldw	x,(OFST+1,sp)
 537  0048 6f0b          	clr	(11,x)
 538                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 540  004a 96            	ldw	x,sp
 541  004b 1c0011        	addw	x,#OFST+5
 542  004e cd0000        	call	c_ltor
 544  0051 ae0004        	ldw	x,#L21
 545  0054 cd0000        	call	c_lcmp
 547  0057 2403          	jruge	L61
 548  0059 cc00f7        	jp	L362
 549  005c               L61:
 550                     ; 223     tmpccrh = I2C_CCRH_FS;
 552  005c a680          	ld	a,#128
 553  005e 6b07          	ld	(OFST-5,sp),a
 555                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 557  0060 0d18          	tnz	(OFST+12,sp)
 558  0062 2633          	jrne	L562
 559                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 561  0064 96            	ldw	x,sp
 562  0065 1c0011        	addw	x,#OFST+5
 563  0068 cd0000        	call	c_ltor
 565  006b a603          	ld	a,#3
 566  006d cd0000        	call	c_smul
 568  0070 96            	ldw	x,sp
 569  0071 1c0001        	addw	x,#OFST-11
 570  0074 cd0000        	call	c_rtol
 573  0077 7b08          	ld	a,(OFST-4,sp)
 574  0079 b703          	ld	c_lreg+3,a
 575  007b 3f02          	clr	c_lreg+2
 576  007d 3f01          	clr	c_lreg+1
 577  007f 3f00          	clr	c_lreg
 578  0081 ae0000        	ldw	x,#L01
 579  0084 cd0000        	call	c_lmul
 581  0087 96            	ldw	x,sp
 582  0088 1c0001        	addw	x,#OFST-11
 583  008b cd0000        	call	c_ludv
 585  008e 96            	ldw	x,sp
 586  008f 1c0009        	addw	x,#OFST-3
 587  0092 cd0000        	call	c_rtol
 591  0095 2037          	jra	L762
 592  0097               L562:
 593                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 595  0097 96            	ldw	x,sp
 596  0098 1c0011        	addw	x,#OFST+5
 597  009b cd0000        	call	c_ltor
 599  009e a619          	ld	a,#25
 600  00a0 cd0000        	call	c_smul
 602  00a3 96            	ldw	x,sp
 603  00a4 1c0001        	addw	x,#OFST-11
 604  00a7 cd0000        	call	c_rtol
 607  00aa 7b08          	ld	a,(OFST-4,sp)
 608  00ac b703          	ld	c_lreg+3,a
 609  00ae 3f02          	clr	c_lreg+2
 610  00b0 3f01          	clr	c_lreg+1
 611  00b2 3f00          	clr	c_lreg
 612  00b4 ae0000        	ldw	x,#L01
 613  00b7 cd0000        	call	c_lmul
 615  00ba 96            	ldw	x,sp
 616  00bb 1c0001        	addw	x,#OFST-11
 617  00be cd0000        	call	c_ludv
 619  00c1 96            	ldw	x,sp
 620  00c2 1c0009        	addw	x,#OFST-3
 621  00c5 cd0000        	call	c_rtol
 624                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 626  00c8 7b07          	ld	a,(OFST-5,sp)
 627  00ca aa40          	or	a,#64
 628  00cc 6b07          	ld	(OFST-5,sp),a
 630  00ce               L762:
 631                     ; 239     if (result < (uint16_t)0x01)
 633  00ce 96            	ldw	x,sp
 634  00cf 1c0009        	addw	x,#OFST-3
 635  00d2 cd0000        	call	c_lzmp
 637  00d5 260a          	jrne	L172
 638                     ; 242       result = (uint16_t)0x0001;
 640  00d7 ae0001        	ldw	x,#1
 641  00da 1f0b          	ldw	(OFST-1,sp),x
 642  00dc ae0000        	ldw	x,#0
 643  00df 1f09          	ldw	(OFST-3,sp),x
 645  00e1               L172:
 646                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 648  00e1 7b08          	ld	a,(OFST-4,sp)
 649  00e3 97            	ld	xl,a
 650  00e4 a603          	ld	a,#3
 651  00e6 42            	mul	x,a
 652  00e7 a60a          	ld	a,#10
 653  00e9 cd0000        	call	c_sdivx
 655  00ec 5c            	incw	x
 656  00ed 1f05          	ldw	(OFST-7,sp),x
 658                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 660  00ef 7b06          	ld	a,(OFST-6,sp)
 661  00f1 1e0d          	ldw	x,(OFST+1,sp)
 662  00f3 e70d          	ld	(13,x),a
 664  00f5 205c          	jra	L372
 665  00f7               L362:
 666                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 668  00f7 96            	ldw	x,sp
 669  00f8 1c0011        	addw	x,#OFST+5
 670  00fb cd0000        	call	c_ltor
 672  00fe 3803          	sll	c_lreg+3
 673  0100 3902          	rlc	c_lreg+2
 674  0102 3901          	rlc	c_lreg+1
 675  0104 3900          	rlc	c_lreg
 676  0106 96            	ldw	x,sp
 677  0107 1c0001        	addw	x,#OFST-11
 678  010a cd0000        	call	c_rtol
 681  010d 7b08          	ld	a,(OFST-4,sp)
 682  010f b703          	ld	c_lreg+3,a
 683  0111 3f02          	clr	c_lreg+2
 684  0113 3f01          	clr	c_lreg+1
 685  0115 3f00          	clr	c_lreg
 686  0117 ae0000        	ldw	x,#L01
 687  011a cd0000        	call	c_lmul
 689  011d 96            	ldw	x,sp
 690  011e 1c0001        	addw	x,#OFST-11
 691  0121 cd0000        	call	c_ludv
 693  0124 b602          	ld	a,c_lreg+2
 694  0126 97            	ld	xl,a
 695  0127 b603          	ld	a,c_lreg+3
 696  0129 cd0000        	call	c_uitol
 698  012c 96            	ldw	x,sp
 699  012d 1c0009        	addw	x,#OFST-3
 700  0130 cd0000        	call	c_rtol
 703                     ; 259     if (result < (uint16_t)0x0004)
 705  0133 96            	ldw	x,sp
 706  0134 1c0009        	addw	x,#OFST-3
 707  0137 cd0000        	call	c_ltor
 709  013a ae0008        	ldw	x,#L41
 710  013d cd0000        	call	c_lcmp
 712  0140 240a          	jruge	L572
 713                     ; 262       result = (uint16_t)0x0004;
 715  0142 ae0004        	ldw	x,#4
 716  0145 1f0b          	ldw	(OFST-1,sp),x
 717  0147 ae0000        	ldw	x,#0
 718  014a 1f09          	ldw	(OFST-3,sp),x
 720  014c               L572:
 721                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 723  014c 7b08          	ld	a,(OFST-4,sp)
 724  014e 4c            	inc	a
 725  014f 1e0d          	ldw	x,(OFST+1,sp)
 726  0151 e70d          	ld	(13,x),a
 727  0153               L372:
 728                     ; 273   I2Cx->CCRL = (uint8_t)result;
 730  0153 7b0c          	ld	a,(OFST+0,sp)
 731  0155 1e0d          	ldw	x,(OFST+1,sp)
 732  0157 e70b          	ld	(11,x),a
 733                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 735  0159 7b07          	ld	a,(OFST-5,sp)
 736  015b 1e0d          	ldw	x,(OFST+1,sp)
 737  015d e70c          	ld	(12,x),a
 738                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 740  015f 1e0d          	ldw	x,(OFST+1,sp)
 741  0161 7b17          	ld	a,(OFST+11,sp)
 742  0163 aa01          	or	a,#1
 743  0165 fa            	or	a,(x)
 744  0166 f7            	ld	(x),a
 745                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 747  0167 1e0d          	ldw	x,(OFST+1,sp)
 748  0169 e601          	ld	a,(1,x)
 749  016b 1a19          	or	a,(OFST+13,sp)
 750  016d e701          	ld	(1,x),a
 751                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 753  016f 7b16          	ld	a,(OFST+10,sp)
 754  0171 1e0d          	ldw	x,(OFST+1,sp)
 755  0173 e703          	ld	(3,x),a
 756                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 756                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 758  0175 1e15          	ldw	x,(OFST+9,sp)
 759  0177 4f            	clr	a
 760  0178 01            	rrwa	x,a
 761  0179 48            	sll	a
 762  017a 59            	rlcw	x
 763  017b 01            	rrwa	x,a
 764  017c a406          	and	a,#6
 765  017e 5f            	clrw	x
 766  017f 6b04          	ld	(OFST-8,sp),a
 768  0181 7b1a          	ld	a,(OFST+14,sp)
 769  0183 aa40          	or	a,#64
 770  0185 1a04          	or	a,(OFST-8,sp)
 771  0187 1e0d          	ldw	x,(OFST+1,sp)
 772  0189 e704          	ld	(4,x),a
 773                     ; 286 }
 776  018b 5b0e          	addw	sp,#14
 777  018d 81            	ret
 844                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 844                     ; 296 {
 845                     	switch	.text
 846  018e               _I2C_Cmd:
 848  018e 89            	pushw	x
 849       00000000      OFST:	set	0
 852                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 854                     ; 301   if (NewState != DISABLE)
 856  018f 0d05          	tnz	(OFST+5,sp)
 857  0191 2706          	jreq	L333
 858                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 860  0193 f6            	ld	a,(x)
 861  0194 aa01          	or	a,#1
 862  0196 f7            	ld	(x),a
 864  0197 2006          	jra	L533
 865  0199               L333:
 866                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 868  0199 1e01          	ldw	x,(OFST+1,sp)
 869  019b f6            	ld	a,(x)
 870  019c a4fe          	and	a,#254
 871  019e f7            	ld	(x),a
 872  019f               L533:
 873                     ; 311 }
 876  019f 85            	popw	x
 877  01a0 81            	ret
 924                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 924                     ; 321 {
 925                     	switch	.text
 926  01a1               _I2C_GeneralCallCmd:
 928  01a1 89            	pushw	x
 929       00000000      OFST:	set	0
 932                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 934                     ; 326   if (NewState != DISABLE)
 936  01a2 0d05          	tnz	(OFST+5,sp)
 937  01a4 2706          	jreq	L363
 938                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 940  01a6 f6            	ld	a,(x)
 941  01a7 aa40          	or	a,#64
 942  01a9 f7            	ld	(x),a
 944  01aa 2006          	jra	L563
 945  01ac               L363:
 946                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 948  01ac 1e01          	ldw	x,(OFST+1,sp)
 949  01ae f6            	ld	a,(x)
 950  01af a4bf          	and	a,#191
 951  01b1 f7            	ld	(x),a
 952  01b2               L563:
 953                     ; 336 }
 956  01b2 85            	popw	x
 957  01b3 81            	ret
1004                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
1004                     ; 348 {
1005                     	switch	.text
1006  01b4               _I2C_GenerateSTART:
1008  01b4 89            	pushw	x
1009       00000000      OFST:	set	0
1012                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
1014                     ; 353   if (NewState != DISABLE)
1016  01b5 0d05          	tnz	(OFST+5,sp)
1017  01b7 2708          	jreq	L314
1018                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
1020  01b9 e601          	ld	a,(1,x)
1021  01bb aa01          	or	a,#1
1022  01bd e701          	ld	(1,x),a
1024  01bf 2008          	jra	L514
1025  01c1               L314:
1026                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1028  01c1 1e01          	ldw	x,(OFST+1,sp)
1029  01c3 e601          	ld	a,(1,x)
1030  01c5 a4fe          	and	a,#254
1031  01c7 e701          	ld	(1,x),a
1032  01c9               L514:
1033                     ; 363 }
1036  01c9 85            	popw	x
1037  01ca 81            	ret
1084                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1084                     ; 373 {
1085                     	switch	.text
1086  01cb               _I2C_GenerateSTOP:
1088  01cb 89            	pushw	x
1089       00000000      OFST:	set	0
1092                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1094                     ; 378   if (NewState != DISABLE)
1096  01cc 0d05          	tnz	(OFST+5,sp)
1097  01ce 2708          	jreq	L344
1098                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1100  01d0 e601          	ld	a,(1,x)
1101  01d2 aa02          	or	a,#2
1102  01d4 e701          	ld	(1,x),a
1104  01d6 2008          	jra	L544
1105  01d8               L344:
1106                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1108  01d8 1e01          	ldw	x,(OFST+1,sp)
1109  01da e601          	ld	a,(1,x)
1110  01dc a4fd          	and	a,#253
1111  01de e701          	ld	(1,x),a
1112  01e0               L544:
1113                     ; 388 }
1116  01e0 85            	popw	x
1117  01e1 81            	ret
1165                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1165                     ; 398 {
1166                     	switch	.text
1167  01e2               _I2C_SoftwareResetCmd:
1169  01e2 89            	pushw	x
1170       00000000      OFST:	set	0
1173                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1175                     ; 402   if (NewState != DISABLE)
1177  01e3 0d05          	tnz	(OFST+5,sp)
1178  01e5 2708          	jreq	L374
1179                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1181  01e7 e601          	ld	a,(1,x)
1182  01e9 aa80          	or	a,#128
1183  01eb e701          	ld	(1,x),a
1185  01ed 2008          	jra	L574
1186  01ef               L374:
1187                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1189  01ef 1e01          	ldw	x,(OFST+1,sp)
1190  01f1 e601          	ld	a,(1,x)
1191  01f3 a47f          	and	a,#127
1192  01f5 e701          	ld	(1,x),a
1193  01f7               L574:
1194                     ; 412 }
1197  01f7 85            	popw	x
1198  01f8 81            	ret
1246                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1246                     ; 422 {
1247                     	switch	.text
1248  01f9               _I2C_StretchClockCmd:
1250  01f9 89            	pushw	x
1251       00000000      OFST:	set	0
1254                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1256                     ; 426   if (NewState != DISABLE)
1258  01fa 0d05          	tnz	(OFST+5,sp)
1259  01fc 2706          	jreq	L325
1260                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1262  01fe f6            	ld	a,(x)
1263  01ff a47f          	and	a,#127
1264  0201 f7            	ld	(x),a
1266  0202 2006          	jra	L525
1267  0204               L325:
1268                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1270  0204 1e01          	ldw	x,(OFST+1,sp)
1271  0206 f6            	ld	a,(x)
1272  0207 aa80          	or	a,#128
1273  0209 f7            	ld	(x),a
1274  020a               L525:
1275                     ; 437 }
1278  020a 85            	popw	x
1279  020b 81            	ret
1326                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1326                     ; 447 {
1327                     	switch	.text
1328  020c               _I2C_ARPCmd:
1330  020c 89            	pushw	x
1331       00000000      OFST:	set	0
1334                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1336                     ; 451   if (NewState != DISABLE)
1338  020d 0d05          	tnz	(OFST+5,sp)
1339  020f 2706          	jreq	L355
1340                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1342  0211 f6            	ld	a,(x)
1343  0212 aa10          	or	a,#16
1344  0214 f7            	ld	(x),a
1346  0215 2006          	jra	L555
1347  0217               L355:
1348                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1350  0217 1e01          	ldw	x,(OFST+1,sp)
1351  0219 f6            	ld	a,(x)
1352  021a a4ef          	and	a,#239
1353  021c f7            	ld	(x),a
1354  021d               L555:
1355                     ; 462 }
1358  021d 85            	popw	x
1359  021e 81            	ret
1407                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1407                     ; 472 {
1408                     	switch	.text
1409  021f               _I2C_AcknowledgeConfig:
1411  021f 89            	pushw	x
1412       00000000      OFST:	set	0
1415                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1417                     ; 476   if (NewState != DISABLE)
1419  0220 0d05          	tnz	(OFST+5,sp)
1420  0222 2708          	jreq	L306
1421                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1423  0224 e601          	ld	a,(1,x)
1424  0226 aa04          	or	a,#4
1425  0228 e701          	ld	(1,x),a
1427  022a 2008          	jra	L506
1428  022c               L306:
1429                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1431  022c 1e01          	ldw	x,(OFST+1,sp)
1432  022e e601          	ld	a,(1,x)
1433  0230 a4fb          	and	a,#251
1434  0232 e701          	ld	(1,x),a
1435  0234               L506:
1436                     ; 486 }
1439  0234 85            	popw	x
1440  0235 81            	ret
1496                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1496                     ; 495 {
1497                     	switch	.text
1498  0236               _I2C_OwnAddress2Config:
1500  0236 89            	pushw	x
1501  0237 88            	push	a
1502       00000001      OFST:	set	1
1505                     ; 496   uint8_t tmpreg = 0;
1507                     ; 499   tmpreg = I2Cx->OAR2;
1509  0238 e605          	ld	a,(5,x)
1510  023a 6b01          	ld	(OFST+0,sp),a
1512                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1514  023c 7b01          	ld	a,(OFST+0,sp)
1515  023e a401          	and	a,#1
1516  0240 6b01          	ld	(OFST+0,sp),a
1518                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1520  0242 7b06          	ld	a,(OFST+5,sp)
1521  0244 a4fe          	and	a,#254
1522  0246 1a01          	or	a,(OFST+0,sp)
1523  0248 6b01          	ld	(OFST+0,sp),a
1525                     ; 508   I2Cx->OAR2 = tmpreg;
1527  024a 7b01          	ld	a,(OFST+0,sp)
1528  024c 1e02          	ldw	x,(OFST+1,sp)
1529  024e e705          	ld	(5,x),a
1530                     ; 509 }
1533  0250 5b03          	addw	sp,#3
1534  0252 81            	ret
1581                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1581                     ; 519 {
1582                     	switch	.text
1583  0253               _I2C_DualAddressCmd:
1585  0253 89            	pushw	x
1586       00000000      OFST:	set	0
1589                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1591                     ; 523   if (NewState != DISABLE)
1593  0254 0d05          	tnz	(OFST+5,sp)
1594  0256 2708          	jreq	L366
1595                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1597  0258 e605          	ld	a,(5,x)
1598  025a aa01          	or	a,#1
1599  025c e705          	ld	(5,x),a
1601  025e 2008          	jra	L566
1602  0260               L366:
1603                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1605  0260 1e01          	ldw	x,(OFST+1,sp)
1606  0262 e605          	ld	a,(5,x)
1607  0264 a4fe          	and	a,#254
1608  0266 e705          	ld	(5,x),a
1609  0268               L566:
1610                     ; 533 }
1613  0268 85            	popw	x
1614  0269 81            	ret
1684                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1684                     ; 546 {
1685                     	switch	.text
1686  026a               _I2C_AckPositionConfig:
1688  026a 89            	pushw	x
1689       00000000      OFST:	set	0
1692                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1694                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1696  026b e601          	ld	a,(1,x)
1697  026d a4f7          	and	a,#247
1698  026f e701          	ld	(1,x),a
1699                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1701  0271 e601          	ld	a,(1,x)
1702  0273 1a05          	or	a,(OFST+5,sp)
1703  0275 e701          	ld	(1,x),a
1704                     ; 554 }
1707  0277 85            	popw	x
1708  0278 81            	ret
1777                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1777                     ; 566 {
1778                     	switch	.text
1779  0279               _I2C_SMBusAlertConfig:
1781  0279 89            	pushw	x
1782       00000000      OFST:	set	0
1785                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1787                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1789  027a 0d05          	tnz	(OFST+5,sp)
1790  027c 2708          	jreq	L757
1791                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1793  027e e601          	ld	a,(1,x)
1794  0280 aa20          	or	a,#32
1795  0282 e701          	ld	(1,x),a
1797  0284 2008          	jra	L167
1798  0286               L757:
1799                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1801  0286 1e01          	ldw	x,(OFST+1,sp)
1802  0288 e601          	ld	a,(1,x)
1803  028a a4df          	and	a,#223
1804  028c e701          	ld	(1,x),a
1805  028e               L167:
1806                     ; 581 }
1809  028e 85            	popw	x
1810  028f 81            	ret
1858                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1858                     ; 593 {
1859                     	switch	.text
1860  0290               _I2C_FastModeDutyCycleConfig:
1862  0290 89            	pushw	x
1863       00000000      OFST:	set	0
1866                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1868                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1870  0291 7b05          	ld	a,(OFST+5,sp)
1871  0293 a140          	cp	a,#64
1872  0295 2608          	jrne	L7001
1873                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1875  0297 e60c          	ld	a,(12,x)
1876  0299 aa40          	or	a,#64
1877  029b e70c          	ld	(12,x),a
1879  029d 2008          	jra	L1101
1880  029f               L7001:
1881                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1883  029f 1e01          	ldw	x,(OFST+1,sp)
1884  02a1 e60c          	ld	a,(12,x)
1885  02a3 a4bf          	and	a,#191
1886  02a5 e70c          	ld	(12,x),a
1887  02a7               L1101:
1888                     ; 608 }
1891  02a7 85            	popw	x
1892  02a8 81            	ret
1971                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1971                     ; 622 {
1972                     	switch	.text
1973  02a9               _I2C_Send7bitAddress:
1975  02a9 89            	pushw	x
1976       00000000      OFST:	set	0
1979                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1981                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1983                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1985  02aa 0d06          	tnz	(OFST+6,sp)
1986  02ac 2708          	jreq	L3501
1987                     ; 631     Address |= OAR1_ADD0_Set;
1989  02ae 7b05          	ld	a,(OFST+5,sp)
1990  02b0 aa01          	or	a,#1
1991  02b2 6b05          	ld	(OFST+5,sp),a
1993  02b4 2006          	jra	L5501
1994  02b6               L3501:
1995                     ; 636     Address &= OAR1_ADD0_Reset;
1997  02b6 7b05          	ld	a,(OFST+5,sp)
1998  02b8 a4fe          	and	a,#254
1999  02ba 6b05          	ld	(OFST+5,sp),a
2000  02bc               L5501:
2001                     ; 639   I2Cx->DR = Address;
2003  02bc 7b05          	ld	a,(OFST+5,sp)
2004  02be 1e01          	ldw	x,(OFST+1,sp)
2005  02c0 e706          	ld	(6,x),a
2006                     ; 640 }
2009  02c2 85            	popw	x
2010  02c3 81            	ret
2056                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2056                     ; 665 {
2057                     	switch	.text
2058  02c4               _I2C_SendData:
2060  02c4 89            	pushw	x
2061       00000000      OFST:	set	0
2064                     ; 667   I2Cx->DR = Data;
2066  02c5 7b05          	ld	a,(OFST+5,sp)
2067  02c7 1e01          	ldw	x,(OFST+1,sp)
2068  02c9 e706          	ld	(6,x),a
2069                     ; 668 }
2072  02cb 85            	popw	x
2073  02cc 81            	ret
2110                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2110                     ; 677 {
2111                     	switch	.text
2112  02cd               _I2C_ReceiveData:
2116                     ; 679   return ((uint8_t)I2Cx->DR);
2118  02cd e606          	ld	a,(6,x)
2121  02cf 81            	ret
2168                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2168                     ; 706 {
2169                     	switch	.text
2170  02d0               _I2C_TransmitPEC:
2172  02d0 89            	pushw	x
2173       00000000      OFST:	set	0
2176                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2178                     ; 710   if (NewState != DISABLE)
2180  02d1 0d05          	tnz	(OFST+5,sp)
2181  02d3 2708          	jreq	L7411
2182                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2184  02d5 e601          	ld	a,(1,x)
2185  02d7 aa10          	or	a,#16
2186  02d9 e701          	ld	(1,x),a
2188  02db 2008          	jra	L1511
2189  02dd               L7411:
2190                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2192  02dd 1e01          	ldw	x,(OFST+1,sp)
2193  02df e601          	ld	a,(1,x)
2194  02e1 a4ef          	and	a,#239
2195  02e3 e701          	ld	(1,x),a
2196  02e5               L1511:
2197                     ; 720 }
2200  02e5 85            	popw	x
2201  02e6 81            	ret
2248                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2248                     ; 730 {
2249                     	switch	.text
2250  02e7               _I2C_CalculatePEC:
2252  02e7 89            	pushw	x
2253       00000000      OFST:	set	0
2256                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2258                     ; 734   if (NewState != DISABLE)
2260  02e8 0d05          	tnz	(OFST+5,sp)
2261  02ea 2706          	jreq	L7711
2262                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2264  02ec f6            	ld	a,(x)
2265  02ed aa20          	or	a,#32
2266  02ef f7            	ld	(x),a
2268  02f0 2006          	jra	L1021
2269  02f2               L7711:
2270                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2272  02f2 1e01          	ldw	x,(OFST+1,sp)
2273  02f4 f6            	ld	a,(x)
2274  02f5 a4df          	and	a,#223
2275  02f7 f7            	ld	(x),a
2276  02f8               L1021:
2277                     ; 744 }
2280  02f8 85            	popw	x
2281  02f9 81            	ret
2351                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2351                     ; 756 {
2352                     	switch	.text
2353  02fa               _I2C_PECPositionConfig:
2355  02fa 89            	pushw	x
2356       00000000      OFST:	set	0
2359                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2361                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2363  02fb e601          	ld	a,(1,x)
2364  02fd a4f7          	and	a,#247
2365  02ff e701          	ld	(1,x),a
2366                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2368  0301 e601          	ld	a,(1,x)
2369  0303 1a05          	or	a,(OFST+5,sp)
2370  0305 e701          	ld	(1,x),a
2371                     ; 764 }
2374  0307 85            	popw	x
2375  0308 81            	ret
2412                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2412                     ; 773 {
2413                     	switch	.text
2414  0309               _I2C_GetPEC:
2418                     ; 775   return (I2Cx->PECR);
2420  0309 e60e          	ld	a,(14,x)
2423  030b 81            	ret
2470                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2470                     ; 804 {
2471                     	switch	.text
2472  030c               _I2C_DMACmd:
2474  030c 89            	pushw	x
2475       00000000      OFST:	set	0
2478                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2480                     ; 808   if (NewState != DISABLE)
2482  030d 0d05          	tnz	(OFST+5,sp)
2483  030f 2708          	jreq	L3031
2484                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2486  0311 e60a          	ld	a,(10,x)
2487  0313 aa08          	or	a,#8
2488  0315 e70a          	ld	(10,x),a
2490  0317 2008          	jra	L5031
2491  0319               L3031:
2492                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2494  0319 1e01          	ldw	x,(OFST+1,sp)
2495  031b e60a          	ld	a,(10,x)
2496  031d a4f7          	and	a,#247
2497  031f e70a          	ld	(10,x),a
2498  0321               L5031:
2499                     ; 818 }
2502  0321 85            	popw	x
2503  0322 81            	ret
2551                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2551                     ; 828 {
2552                     	switch	.text
2553  0323               _I2C_DMALastTransferCmd:
2555  0323 89            	pushw	x
2556       00000000      OFST:	set	0
2559                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2561                     ; 832   if (NewState != DISABLE)
2563  0324 0d05          	tnz	(OFST+5,sp)
2564  0326 2708          	jreq	L3331
2565                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2567  0328 e60a          	ld	a,(10,x)
2568  032a aa10          	or	a,#16
2569  032c e70a          	ld	(10,x),a
2571  032e 2008          	jra	L5331
2572  0330               L3331:
2573                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2575  0330 1e01          	ldw	x,(OFST+1,sp)
2576  0332 e60a          	ld	a,(10,x)
2577  0334 a4ef          	and	a,#239
2578  0336 e70a          	ld	(10,x),a
2579  0338               L5331:
2580                     ; 842 }
2583  0338 85            	popw	x
2584  0339 81            	ret
2773                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2773                     ; 955 {
2774                     	switch	.text
2775  033a               _I2C_ITConfig:
2777  033a 89            	pushw	x
2778       00000000      OFST:	set	0
2781                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2783                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2785                     ; 960   if (NewState != DISABLE)
2787  033b 0d07          	tnz	(OFST+7,sp)
2788  033d 2708          	jreq	L7341
2789                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2791  033f e60a          	ld	a,(10,x)
2792  0341 1a06          	or	a,(OFST+6,sp)
2793  0343 e70a          	ld	(10,x),a
2795  0345 2009          	jra	L1441
2796  0347               L7341:
2797                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2799  0347 1e01          	ldw	x,(OFST+1,sp)
2800  0349 7b06          	ld	a,(OFST+6,sp)
2801  034b 43            	cpl	a
2802  034c e40a          	and	a,(10,x)
2803  034e e70a          	ld	(10,x),a
2804  0350               L1441:
2805                     ; 970 }
2808  0350 85            	popw	x
2809  0351 81            	ret
2970                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2970                     ; 995 {
2971                     	switch	.text
2972  0352               _I2C_ReadRegister:
2974  0352 89            	pushw	x
2975  0353 5204          	subw	sp,#4
2976       00000004      OFST:	set	4
2979                     ; 996   __IO uint16_t tmp = 0;
2981  0355 5f            	clrw	x
2982  0356 1f03          	ldw	(OFST-1,sp),x
2984                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2986                     ; 1000   tmp = (uint16_t) I2Cx;
2988  0358 1e05          	ldw	x,(OFST+1,sp)
2989  035a 1f03          	ldw	(OFST-1,sp),x
2991                     ; 1001   tmp += I2C_Register;
2993  035c 7b09          	ld	a,(OFST+5,sp)
2994  035e 5f            	clrw	x
2995  035f 97            	ld	xl,a
2996  0360 1f01          	ldw	(OFST-3,sp),x
2998  0362 1e03          	ldw	x,(OFST-1,sp)
2999  0364 72fb01        	addw	x,(OFST-3,sp)
3000  0367 1f03          	ldw	(OFST-1,sp),x
3002                     ; 1004   return (*(__IO uint8_t *) tmp);
3004  0369 1e03          	ldw	x,(OFST-1,sp)
3005  036b f6            	ld	a,(x)
3008  036c 5b06          	addw	sp,#6
3009  036e 81            	ret
3263                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3263                     ; 1045 {
3264                     	switch	.text
3265  036f               _I2C_CheckEvent:
3267  036f 89            	pushw	x
3268  0370 5206          	subw	sp,#6
3269       00000006      OFST:	set	6
3272                     ; 1046   __IO uint16_t lastevent = 0x00;
3274  0372 5f            	clrw	x
3275  0373 1f04          	ldw	(OFST-2,sp),x
3277                     ; 1047   uint8_t flag1 = 0x00 ;
3279                     ; 1048   uint8_t flag2 = 0x00;
3281                     ; 1049   ErrorStatus status = ERROR;
3283                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3285                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3287  0375 1e0b          	ldw	x,(OFST+5,sp)
3288  0377 a30004        	cpw	x,#4
3289  037a 260c          	jrne	L5561
3290                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3292  037c 1e07          	ldw	x,(OFST+1,sp)
3293  037e e608          	ld	a,(8,x)
3294  0380 a404          	and	a,#4
3295  0382 5f            	clrw	x
3296  0383 97            	ld	xl,a
3297  0384 1f04          	ldw	(OFST-2,sp),x
3300  0386 2021          	jra	L7561
3301  0388               L5561:
3302                     ; 1060     flag1 = I2Cx->SR1;
3304  0388 1e07          	ldw	x,(OFST+1,sp)
3305  038a e607          	ld	a,(7,x)
3306  038c 6b03          	ld	(OFST-3,sp),a
3308                     ; 1061     flag2 = I2Cx->SR3;
3310  038e 1e07          	ldw	x,(OFST+1,sp)
3311  0390 e609          	ld	a,(9,x)
3312  0392 6b06          	ld	(OFST+0,sp),a
3314                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3316  0394 7b03          	ld	a,(OFST-3,sp)
3317  0396 5f            	clrw	x
3318  0397 97            	ld	xl,a
3319  0398 1f01          	ldw	(OFST-5,sp),x
3321  039a 7b06          	ld	a,(OFST+0,sp)
3322  039c 5f            	clrw	x
3323  039d 97            	ld	xl,a
3324  039e 4f            	clr	a
3325  039f 02            	rlwa	x,a
3326  03a0 01            	rrwa	x,a
3327  03a1 1a02          	or	a,(OFST-4,sp)
3328  03a3 01            	rrwa	x,a
3329  03a4 1a01          	or	a,(OFST-5,sp)
3330  03a6 01            	rrwa	x,a
3331  03a7 1f04          	ldw	(OFST-2,sp),x
3333  03a9               L7561:
3334                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3336  03a9 1e04          	ldw	x,(OFST-2,sp)
3337  03ab 01            	rrwa	x,a
3338  03ac 140c          	and	a,(OFST+6,sp)
3339  03ae 01            	rrwa	x,a
3340  03af 140b          	and	a,(OFST+5,sp)
3341  03b1 01            	rrwa	x,a
3342  03b2 130b          	cpw	x,(OFST+5,sp)
3343  03b4 2606          	jrne	L1661
3344                     ; 1068     status = SUCCESS;
3346  03b6 a601          	ld	a,#1
3347  03b8 6b06          	ld	(OFST+0,sp),a
3350  03ba 2002          	jra	L3661
3351  03bc               L1661:
3352                     ; 1073     status = ERROR;
3354  03bc 0f06          	clr	(OFST+0,sp)
3356  03be               L3661:
3357                     ; 1077   return status;
3359  03be 7b06          	ld	a,(OFST+0,sp)
3362  03c0 5b08          	addw	sp,#8
3363  03c2 81            	ret
3428                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3428                     ; 1096 {
3429                     	switch	.text
3430  03c3               _I2C_GetLastEvent:
3432  03c3 89            	pushw	x
3433  03c4 5206          	subw	sp,#6
3434       00000006      OFST:	set	6
3437                     ; 1097   __IO uint16_t lastevent = 0;
3439  03c6 5f            	clrw	x
3440  03c7 1f05          	ldw	(OFST-1,sp),x
3442                     ; 1098   uint16_t flag1 = 0;
3444                     ; 1099   uint16_t flag2 = 0;
3446                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3448  03c9 1e07          	ldw	x,(OFST+1,sp)
3449  03cb e608          	ld	a,(8,x)
3450  03cd a504          	bcp	a,#4
3451  03cf 2707          	jreq	L1271
3452                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3454  03d1 ae0004        	ldw	x,#4
3455  03d4 1f05          	ldw	(OFST-1,sp),x
3458  03d6 201d          	jra	L3271
3459  03d8               L1271:
3460                     ; 1108     flag1 = I2Cx->SR1;
3462  03d8 1e07          	ldw	x,(OFST+1,sp)
3463  03da e607          	ld	a,(7,x)
3464  03dc 5f            	clrw	x
3465  03dd 97            	ld	xl,a
3466  03de 1f01          	ldw	(OFST-5,sp),x
3468                     ; 1109     flag2 = I2Cx->SR3;
3470  03e0 1e07          	ldw	x,(OFST+1,sp)
3471  03e2 e609          	ld	a,(9,x)
3472  03e4 5f            	clrw	x
3473  03e5 97            	ld	xl,a
3474  03e6 1f03          	ldw	(OFST-3,sp),x
3476                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3478  03e8 1e03          	ldw	x,(OFST-3,sp)
3479  03ea 4f            	clr	a
3480  03eb 02            	rlwa	x,a
3481  03ec 01            	rrwa	x,a
3482  03ed 1a02          	or	a,(OFST-4,sp)
3483  03ef 01            	rrwa	x,a
3484  03f0 1a01          	or	a,(OFST-5,sp)
3485  03f2 01            	rrwa	x,a
3486  03f3 1f05          	ldw	(OFST-1,sp),x
3488  03f5               L3271:
3489                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3491  03f5 1e05          	ldw	x,(OFST-1,sp)
3494  03f7 5b08          	addw	sp,#8
3495  03f9 81            	ret
3752                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3752                     ; 1153 {
3753                     	switch	.text
3754  03fa               _I2C_GetFlagStatus:
3756  03fa 89            	pushw	x
3757  03fb 89            	pushw	x
3758       00000002      OFST:	set	2
3761                     ; 1154   uint8_t tempreg = 0;
3763  03fc 0f02          	clr	(OFST+0,sp)
3765                     ; 1155   uint8_t regindex = 0;
3767                     ; 1156   FlagStatus bitstatus = RESET;
3769                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3771                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3773  03fe 7b07          	ld	a,(OFST+5,sp)
3774  0400 6b01          	ld	(OFST-1,sp),a
3776                     ; 1164   switch (regindex)
3778  0402 7b01          	ld	a,(OFST-1,sp)
3780                     ; 1181     default:
3780                     ; 1182       break;
3781  0404 4a            	dec	a
3782  0405 2708          	jreq	L5271
3783  0407 4a            	dec	a
3784  0408 270d          	jreq	L7271
3785  040a 4a            	dec	a
3786  040b 2712          	jreq	L1371
3787  040d 2016          	jra	L7602
3788  040f               L5271:
3789                     ; 1167     case 0x01:
3789                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3791  040f 1e03          	ldw	x,(OFST+1,sp)
3792  0411 e607          	ld	a,(7,x)
3793  0413 6b02          	ld	(OFST+0,sp),a
3795                     ; 1169       break;
3797  0415 200e          	jra	L7602
3798  0417               L7271:
3799                     ; 1172     case 0x02:
3799                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3801  0417 1e03          	ldw	x,(OFST+1,sp)
3802  0419 e608          	ld	a,(8,x)
3803  041b 6b02          	ld	(OFST+0,sp),a
3805                     ; 1174       break;
3807  041d 2006          	jra	L7602
3808  041f               L1371:
3809                     ; 1177     case 0x03:
3809                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3811  041f 1e03          	ldw	x,(OFST+1,sp)
3812  0421 e609          	ld	a,(9,x)
3813  0423 6b02          	ld	(OFST+0,sp),a
3815                     ; 1179       break;
3817  0425               L3371:
3818                     ; 1181     default:
3818                     ; 1182       break;
3820  0425               L7602:
3821                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3823  0425 7b08          	ld	a,(OFST+6,sp)
3824  0427 1502          	bcp	a,(OFST+0,sp)
3825  0429 2706          	jreq	L1702
3826                     ; 1189     bitstatus = SET;
3828  042b a601          	ld	a,#1
3829  042d 6b02          	ld	(OFST+0,sp),a
3832  042f 2002          	jra	L3702
3833  0431               L1702:
3834                     ; 1194     bitstatus = RESET;
3836  0431 0f02          	clr	(OFST+0,sp)
3838  0433               L3702:
3839                     ; 1197   return bitstatus;
3841  0433 7b02          	ld	a,(OFST+0,sp)
3844  0435 5b04          	addw	sp,#4
3845  0437 81            	ret
3901                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3901                     ; 1230 {
3902                     	switch	.text
3903  0438               _I2C_ClearFlag:
3905  0438 89            	pushw	x
3906  0439 89            	pushw	x
3907       00000002      OFST:	set	2
3910                     ; 1231   uint16_t flagpos = 0;
3912                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3914                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3916  043a 7b07          	ld	a,(OFST+5,sp)
3917  043c 97            	ld	xl,a
3918  043d 7b08          	ld	a,(OFST+6,sp)
3919  043f a4ff          	and	a,#255
3920  0441 5f            	clrw	x
3921  0442 02            	rlwa	x,a
3922  0443 1f01          	ldw	(OFST-1,sp),x
3923  0445 01            	rrwa	x,a
3925                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3927  0446 7b02          	ld	a,(OFST+0,sp)
3928  0448 43            	cpl	a
3929  0449 1e03          	ldw	x,(OFST+1,sp)
3930  044b e708          	ld	(8,x),a
3931                     ; 1239 }
3934  044d 5b04          	addw	sp,#4
3935  044f 81            	ret
4011                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4011                     ; 1265 {
4012                     	switch	.text
4013  0450               _I2C_GetITStatus:
4015  0450 89            	pushw	x
4016  0451 5204          	subw	sp,#4
4017       00000004      OFST:	set	4
4020                     ; 1266   ITStatus bitstatus = RESET;
4022                     ; 1267   __IO uint8_t enablestatus = 0;
4024  0453 0f03          	clr	(OFST-1,sp)
4026                     ; 1268   uint16_t tempregister = 0;
4028                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
4030                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
4032  0455 7b09          	ld	a,(OFST+5,sp)
4033  0457 a407          	and	a,#7
4034  0459 5f            	clrw	x
4035  045a 97            	ld	xl,a
4036  045b 1f01          	ldw	(OFST-3,sp),x
4038                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4040  045d 1e05          	ldw	x,(OFST+1,sp)
4041  045f e60a          	ld	a,(10,x)
4042  0461 1402          	and	a,(OFST-2,sp)
4043  0463 6b03          	ld	(OFST-1,sp),a
4045                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4047  0465 7b09          	ld	a,(OFST+5,sp)
4048  0467 97            	ld	xl,a
4049  0468 7b0a          	ld	a,(OFST+6,sp)
4050  046a 9f            	ld	a,xl
4051  046b a430          	and	a,#48
4052  046d 97            	ld	xl,a
4053  046e 4f            	clr	a
4054  046f 02            	rlwa	x,a
4055  0470 a30100        	cpw	x,#256
4056  0473 2616          	jrne	L5612
4057                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4059  0475 1e05          	ldw	x,(OFST+1,sp)
4060  0477 e607          	ld	a,(7,x)
4061  0479 150a          	bcp	a,(OFST+6,sp)
4062  047b 270a          	jreq	L7612
4064  047d 0d03          	tnz	(OFST-1,sp)
4065  047f 2706          	jreq	L7612
4066                     ; 1284       bitstatus = SET;
4068  0481 a601          	ld	a,#1
4069  0483 6b04          	ld	(OFST+0,sp),a
4072  0485 2018          	jra	L3712
4073  0487               L7612:
4074                     ; 1289       bitstatus = RESET;
4076  0487 0f04          	clr	(OFST+0,sp)
4078  0489 2014          	jra	L3712
4079  048b               L5612:
4080                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4082  048b 1e05          	ldw	x,(OFST+1,sp)
4083  048d e608          	ld	a,(8,x)
4084  048f 150a          	bcp	a,(OFST+6,sp)
4085  0491 270a          	jreq	L5712
4087  0493 0d03          	tnz	(OFST-1,sp)
4088  0495 2706          	jreq	L5712
4089                     ; 1298       bitstatus = SET;
4091  0497 a601          	ld	a,#1
4092  0499 6b04          	ld	(OFST+0,sp),a
4095  049b 2002          	jra	L3712
4096  049d               L5712:
4097                     ; 1303       bitstatus = RESET;
4099  049d 0f04          	clr	(OFST+0,sp)
4101  049f               L3712:
4102                     ; 1307   return  bitstatus;
4104  049f 7b04          	ld	a,(OFST+0,sp)
4107  04a1 5b06          	addw	sp,#6
4108  04a3 81            	ret
4165                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4165                     ; 1341 {
4166                     	switch	.text
4167  04a4               _I2C_ClearITPendingBit:
4169  04a4 89            	pushw	x
4170  04a5 89            	pushw	x
4171       00000002      OFST:	set	2
4174                     ; 1342   uint16_t flagpos = 0;
4176                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4178                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4180  04a6 7b07          	ld	a,(OFST+5,sp)
4181  04a8 97            	ld	xl,a
4182  04a9 7b08          	ld	a,(OFST+6,sp)
4183  04ab a4ff          	and	a,#255
4184  04ad 5f            	clrw	x
4185  04ae 02            	rlwa	x,a
4186  04af 1f01          	ldw	(OFST-1,sp),x
4187  04b1 01            	rrwa	x,a
4189                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4191  04b2 7b02          	ld	a,(OFST+0,sp)
4192  04b4 43            	cpl	a
4193  04b5 1e03          	ldw	x,(OFST+1,sp)
4194  04b7 e708          	ld	(8,x),a
4195                     ; 1352 }
4198  04b9 5b04          	addw	sp,#4
4199  04bb 81            	ret
4212                     	xdef	_I2C_ClearITPendingBit
4213                     	xdef	_I2C_GetITStatus
4214                     	xdef	_I2C_ClearFlag
4215                     	xdef	_I2C_GetFlagStatus
4216                     	xdef	_I2C_GetLastEvent
4217                     	xdef	_I2C_CheckEvent
4218                     	xdef	_I2C_ReadRegister
4219                     	xdef	_I2C_ITConfig
4220                     	xdef	_I2C_DMALastTransferCmd
4221                     	xdef	_I2C_DMACmd
4222                     	xdef	_I2C_CalculatePEC
4223                     	xdef	_I2C_TransmitPEC
4224                     	xdef	_I2C_GetPEC
4225                     	xdef	_I2C_PECPositionConfig
4226                     	xdef	_I2C_ReceiveData
4227                     	xdef	_I2C_SendData
4228                     	xdef	_I2C_Send7bitAddress
4229                     	xdef	_I2C_SMBusAlertConfig
4230                     	xdef	_I2C_FastModeDutyCycleConfig
4231                     	xdef	_I2C_AckPositionConfig
4232                     	xdef	_I2C_DualAddressCmd
4233                     	xdef	_I2C_OwnAddress2Config
4234                     	xdef	_I2C_AcknowledgeConfig
4235                     	xdef	_I2C_GenerateSTOP
4236                     	xdef	_I2C_GenerateSTART
4237                     	xdef	_I2C_ARPCmd
4238                     	xdef	_I2C_StretchClockCmd
4239                     	xdef	_I2C_SoftwareResetCmd
4240                     	xdef	_I2C_GeneralCallCmd
4241                     	xdef	_I2C_Cmd
4242                     	xdef	_I2C_Init
4243                     	xdef	_I2C_DeInit
4244                     	xref	_CLK_GetClockFreq
4245                     	xref.b	c_lreg
4246                     	xref.b	c_x
4265                     	xref	c_uitol
4266                     	xref	c_sdivx
4267                     	xref	c_lzmp
4268                     	xref	c_rtol
4269                     	xref	c_smul
4270                     	xref	c_lmul
4271                     	xref	c_lcmp
4272                     	xref	c_ltor
4273                     	xref	c_ludv
4274                     	end
