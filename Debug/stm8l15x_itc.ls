   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 56 uint8_t ITC_GetCPUCC(void)
  41                     ; 57 {
  43                     	switch	.text
  44  0000               _ITC_GetCPUCC:
  48                     ; 59   _asm("push cc");
  51  0000 8a            push cc
  53                     ; 60   _asm("pop a");
  56  0001 84            pop a
  58                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  61  0002 81            	ret
  84                     ; 87 void ITC_DeInit(void)
  84                     ; 88 {
  85                     	switch	.text
  86  0003               _ITC_DeInit:
  90                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  92  0003 35ff7f70      	mov	32624,#255
  93                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  95  0007 35ff7f71      	mov	32625,#255
  96                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  98  000b 35ff7f72      	mov	32626,#255
  99                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 101  000f 35ff7f73      	mov	32627,#255
 102                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 104  0013 35ff7f74      	mov	32628,#255
 105                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 107  0017 35ff7f75      	mov	32629,#255
 108                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 110  001b 35ff7f76      	mov	32630,#255
 111                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 113  001f 35ff7f77      	mov	32631,#255
 114                     ; 97 }
 117  0023 81            	ret
 142                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 142                     ; 105 {
 143                     	switch	.text
 144  0024               _ITC_GetSoftIntStatus:
 148                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 150  0024 adda          	call	_ITC_GetCPUCC
 152  0026 a428          	and	a,#40
 155  0028 81            	ret
 464                     .const:	section	.text
 465  0000               L22:
 466  0000 004d          	dc.w	L14
 467  0002 004d          	dc.w	L14
 468  0004 004d          	dc.w	L14
 469  0006 0056          	dc.w	L34
 470  0008 0056          	dc.w	L34
 471  000a 0056          	dc.w	L34
 472  000c 0056          	dc.w	L34
 473  000e 005f          	dc.w	L54
 474  0010 005f          	dc.w	L54
 475  0012 005f          	dc.w	L54
 476  0014 005f          	dc.w	L54
 477  0016 0068          	dc.w	L74
 478  0018 0068          	dc.w	L74
 479  001a 0068          	dc.w	L74
 480  001c 0068          	dc.w	L74
 481  001e 0071          	dc.w	L15
 482  0020 0071          	dc.w	L15
 483  0022 0071          	dc.w	L15
 484  0024 0071          	dc.w	L15
 485  0026 007a          	dc.w	L35
 486  0028 007a          	dc.w	L35
 487  002a 007a          	dc.w	L35
 488  002c 007a          	dc.w	L35
 489  002e 0083          	dc.w	L55
 490  0030 0083          	dc.w	L55
 491  0032 0083          	dc.w	L55
 492  0034 0083          	dc.w	L55
 493  0036 008c          	dc.w	L75
 494  0038 008c          	dc.w	L75
 495                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 495                     ; 115 {
 496                     	switch	.text
 497  0029               _ITC_GetSoftwarePriority:
 499  0029 88            	push	a
 500  002a 89            	pushw	x
 501       00000002      OFST:	set	2
 504                     ; 116   uint8_t Value = 0;
 506  002b 0f02          	clr	(OFST+0,sp)
 508                     ; 117   uint8_t Mask = 0;
 510                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 512                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 514  002d a403          	and	a,#3
 515  002f 48            	sll	a
 516  0030 5f            	clrw	x
 517  0031 97            	ld	xl,a
 518  0032 a603          	ld	a,#3
 519  0034 5d            	tnzw	x
 520  0035 2704          	jreq	L41
 521  0037               L61:
 522  0037 48            	sll	a
 523  0038 5a            	decw	x
 524  0039 26fc          	jrne	L61
 525  003b               L41:
 526  003b 6b01          	ld	(OFST-1,sp),a
 528                     ; 125   switch (IRQn)
 530  003d 7b03          	ld	a,(OFST+1,sp)
 532                     ; 223     default:
 532                     ; 224       break;
 533  003f 4a            	dec	a
 534  0040 a11d          	cp	a,#29
 535  0042 2407          	jruge	L02
 536  0044 5f            	clrw	x
 537  0045 97            	ld	xl,a
 538  0046 58            	sllw	x
 539  0047 de0000        	ldw	x,(L22,x)
 540  004a fc            	jp	(x)
 541  004b               L02:
 542  004b 2046          	jra	L522
 543  004d               L14:
 544                     ; 127     case FLASH_IRQn:
 544                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 544                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 544                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 546  004d c67f70        	ld	a,32624
 547  0050 1401          	and	a,(OFST-1,sp)
 548  0052 6b02          	ld	(OFST+0,sp),a
 550                     ; 131       break;
 552  0054 203d          	jra	L522
 553  0056               L34:
 554                     ; 133     case EXTIE_F_PVD_IRQn:
 554                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 554                     ; 135     case RTC_IRQn:
 554                     ; 136     case EXTIB_IRQn:
 554                     ; 137     case EXTID_IRQn:
 554                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 554                     ; 139     case RTC_CSSLSE_IRQn:
 554                     ; 140     case EXTIB_IRQn:
 554                     ; 141     case EXTID_IRQn:
 554                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 554                     ; 143     case RTC_CSSLSE_IRQn:
 554                     ; 144     case EXTIB_G_IRQn:
 554                     ; 145     case EXTID_H_IRQn:
 554                     ; 146 #endif  /* STM8L15X_MD */
 554                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 556  0056 c67f71        	ld	a,32625
 557  0059 1401          	and	a,(OFST-1,sp)
 558  005b 6b02          	ld	(OFST+0,sp),a
 560                     ; 148       break;
 562  005d 2034          	jra	L522
 563  005f               L54:
 564                     ; 150     case EXTI0_IRQn:
 564                     ; 151     case EXTI1_IRQn:
 564                     ; 152     case EXTI2_IRQn:
 564                     ; 153     case EXTI3_IRQn:
 564                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 566  005f c67f72        	ld	a,32626
 567  0062 1401          	and	a,(OFST-1,sp)
 568  0064 6b02          	ld	(OFST+0,sp),a
 570                     ; 155       break;
 572  0066 202b          	jra	L522
 573  0068               L74:
 574                     ; 157     case EXTI4_IRQn:
 574                     ; 158     case EXTI5_IRQn:
 574                     ; 159     case EXTI6_IRQn:
 574                     ; 160     case EXTI7_IRQn:
 574                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 576  0068 c67f73        	ld	a,32627
 577  006b 1401          	and	a,(OFST-1,sp)
 578  006d 6b02          	ld	(OFST+0,sp),a
 580                     ; 162       break;
 582  006f 2022          	jra	L522
 583  0071               L15:
 584                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 584                     ; 168 #endif /* STM8L15X_LD */		
 584                     ; 169     case ADC1_COMP_IRQn:
 584                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 584                     ; 171     case LCD_IRQn:
 584                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 584                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 584                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 584                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 584                     ; 176     case LCD_AES_IRQn:
 584                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 584                     ; 178 #endif  /* STM8L15X_MD */
 584                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 586  0071 c67f74        	ld	a,32628
 587  0074 1401          	and	a,(OFST-1,sp)
 588  0076 6b02          	ld	(OFST+0,sp),a
 590                     ; 180       break;
 592  0078 2019          	jra	L522
 593  007a               L35:
 594                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 594                     ; 184 #endif /* STM8L15X_LD */		
 594                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 594                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 594                     ; 187     case TIM2_CC_IRQn:
 594                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 594                     ; 189     case TIM3_CC_IRQn:
 594                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 594                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 594                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 594                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 594                     ; 194 #endif  /* STM8L15X_MD */
 594                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 596  007a c67f75        	ld	a,32629
 597  007d 1401          	and	a,(OFST-1,sp)
 598  007f 6b02          	ld	(OFST+0,sp),a
 600                     ; 196       break;
 602  0081 2010          	jra	L522
 603  0083               L55:
 604                     ; 199     case TIM1_CC_IRQn:
 604                     ; 200 #endif /* STM8L15X_LD */	
 604                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 604                     ; 202     case SPI1_IRQn:
 604                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 604                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 604                     ; 205     case USART1_TX_IRQn:
 604                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 604                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 604                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 604                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 606  0083 c67f76        	ld	a,32630
 607  0086 1401          	and	a,(OFST-1,sp)
 608  0088 6b02          	ld	(OFST+0,sp),a
 610                     ; 210       break;
 612  008a 2007          	jra	L522
 613  008c               L75:
 614                     ; 214     case USART1_RX_IRQn:
 614                     ; 215     case I2C1_IRQn:
 614                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 614                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 614                     ; 218     case I2C1_SPI2_IRQn:
 614                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 614                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 616  008c c67f77        	ld	a,32631
 617  008f 1401          	and	a,(OFST-1,sp)
 618  0091 6b02          	ld	(OFST+0,sp),a
 620                     ; 221       break;
 622  0093               L16:
 623                     ; 223     default:
 623                     ; 224       break;
 625  0093               L522:
 626                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 628  0093 7b03          	ld	a,(OFST+1,sp)
 629  0095 a403          	and	a,#3
 630  0097 48            	sll	a
 631  0098 5f            	clrw	x
 632  0099 97            	ld	xl,a
 633  009a 7b02          	ld	a,(OFST+0,sp)
 634  009c 5d            	tnzw	x
 635  009d 2704          	jreq	L42
 636  009f               L62:
 637  009f 44            	srl	a
 638  00a0 5a            	decw	x
 639  00a1 26fc          	jrne	L62
 640  00a3               L42:
 641  00a3 6b02          	ld	(OFST+0,sp),a
 643                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 645  00a5 7b02          	ld	a,(OFST+0,sp)
 648  00a7 5b03          	addw	sp,#3
 649  00a9 81            	ret
 713                     	switch	.const
 714  003a               L44:
 715  003a 00e2          	dc.w	L722
 716  003c 00e2          	dc.w	L722
 717  003e 00e2          	dc.w	L722
 718  0040 00f4          	dc.w	L132
 719  0042 00f4          	dc.w	L132
 720  0044 00f4          	dc.w	L132
 721  0046 00f4          	dc.w	L132
 722  0048 0106          	dc.w	L332
 723  004a 0106          	dc.w	L332
 724  004c 0106          	dc.w	L332
 725  004e 0106          	dc.w	L332
 726  0050 0118          	dc.w	L532
 727  0052 0118          	dc.w	L532
 728  0054 0118          	dc.w	L532
 729  0056 0118          	dc.w	L532
 730  0058 012a          	dc.w	L732
 731  005a 012a          	dc.w	L732
 732  005c 012a          	dc.w	L732
 733  005e 012a          	dc.w	L732
 734  0060 013c          	dc.w	L142
 735  0062 013c          	dc.w	L142
 736  0064 013c          	dc.w	L142
 737  0066 013c          	dc.w	L142
 738  0068 014e          	dc.w	L342
 739  006a 014e          	dc.w	L342
 740  006c 014e          	dc.w	L342
 741  006e 014e          	dc.w	L342
 742  0070 0160          	dc.w	L542
 743  0072 0160          	dc.w	L542
 744                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 744                     ; 251 {
 745                     	switch	.text
 746  00aa               _ITC_SetSoftwarePriority:
 748  00aa 89            	pushw	x
 749  00ab 89            	pushw	x
 750       00000002      OFST:	set	2
 753                     ; 252   uint8_t Mask = 0;
 755                     ; 253   uint8_t NewPriority = 0;
 757                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 759                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 761                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 763                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 765  00ac 9e            	ld	a,xh
 766  00ad a403          	and	a,#3
 767  00af 48            	sll	a
 768  00b0 5f            	clrw	x
 769  00b1 97            	ld	xl,a
 770  00b2 a603          	ld	a,#3
 771  00b4 5d            	tnzw	x
 772  00b5 2704          	jreq	L23
 773  00b7               L43:
 774  00b7 48            	sll	a
 775  00b8 5a            	decw	x
 776  00b9 26fc          	jrne	L43
 777  00bb               L23:
 778  00bb 43            	cpl	a
 779  00bc 6b01          	ld	(OFST-1,sp),a
 781                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 783  00be 7b03          	ld	a,(OFST+1,sp)
 784  00c0 a403          	and	a,#3
 785  00c2 48            	sll	a
 786  00c3 5f            	clrw	x
 787  00c4 97            	ld	xl,a
 788  00c5 7b04          	ld	a,(OFST+2,sp)
 789  00c7 5d            	tnzw	x
 790  00c8 2704          	jreq	L63
 791  00ca               L04:
 792  00ca 48            	sll	a
 793  00cb 5a            	decw	x
 794  00cc 26fc          	jrne	L04
 795  00ce               L63:
 796  00ce 6b02          	ld	(OFST+0,sp),a
 798                     ; 268   switch (IRQn)
 800  00d0 7b03          	ld	a,(OFST+1,sp)
 802                     ; 372     default:
 802                     ; 373       break;
 803  00d2 4a            	dec	a
 804  00d3 a11d          	cp	a,#29
 805  00d5 2407          	jruge	L24
 806  00d7 5f            	clrw	x
 807  00d8 97            	ld	xl,a
 808  00d9 58            	sllw	x
 809  00da de003a        	ldw	x,(L44,x)
 810  00dd fc            	jp	(x)
 811  00de               L24:
 812  00de ac700170      	jpf	L503
 813  00e2               L722:
 814                     ; 270     case FLASH_IRQn:
 814                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 814                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 814                     ; 273       ITC->ISPR1 &= Mask;
 816  00e2 c67f70        	ld	a,32624
 817  00e5 1401          	and	a,(OFST-1,sp)
 818  00e7 c77f70        	ld	32624,a
 819                     ; 274       ITC->ISPR1 |= NewPriority;
 821  00ea c67f70        	ld	a,32624
 822  00ed 1a02          	or	a,(OFST+0,sp)
 823  00ef c77f70        	ld	32624,a
 824                     ; 275       break;
 826  00f2 207c          	jra	L503
 827  00f4               L132:
 828                     ; 277     case EXTIE_F_PVD_IRQn:
 828                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 828                     ; 279     case RTC_IRQn:
 828                     ; 280     case EXTIB_IRQn:
 828                     ; 281     case EXTID_IRQn:
 828                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 828                     ; 283     case RTC_CSSLSE_IRQn:
 828                     ; 284     case EXTIB_IRQn:
 828                     ; 285     case EXTID_IRQn:
 828                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 828                     ; 287     case RTC_CSSLSE_IRQn:
 828                     ; 288     case EXTIB_G_IRQn:
 828                     ; 289     case EXTID_H_IRQn:
 828                     ; 290 #endif  /* STM8L15X_MD */
 828                     ; 291       ITC->ISPR2 &= Mask;
 830  00f4 c67f71        	ld	a,32625
 831  00f7 1401          	and	a,(OFST-1,sp)
 832  00f9 c77f71        	ld	32625,a
 833                     ; 292       ITC->ISPR2 |= NewPriority;
 835  00fc c67f71        	ld	a,32625
 836  00ff 1a02          	or	a,(OFST+0,sp)
 837  0101 c77f71        	ld	32625,a
 838                     ; 293       break;
 840  0104 206a          	jra	L503
 841  0106               L332:
 842                     ; 295     case EXTI0_IRQn:
 842                     ; 296     case EXTI1_IRQn:
 842                     ; 297     case EXTI2_IRQn:
 842                     ; 298     case EXTI3_IRQn:
 842                     ; 299       ITC->ISPR3 &= Mask;
 844  0106 c67f72        	ld	a,32626
 845  0109 1401          	and	a,(OFST-1,sp)
 846  010b c77f72        	ld	32626,a
 847                     ; 300       ITC->ISPR3 |= NewPriority;
 849  010e c67f72        	ld	a,32626
 850  0111 1a02          	or	a,(OFST+0,sp)
 851  0113 c77f72        	ld	32626,a
 852                     ; 301       break;
 854  0116 2058          	jra	L503
 855  0118               L532:
 856                     ; 303     case EXTI4_IRQn:
 856                     ; 304     case EXTI5_IRQn:
 856                     ; 305     case EXTI6_IRQn:
 856                     ; 306     case EXTI7_IRQn:
 856                     ; 307       ITC->ISPR4 &= Mask;
 858  0118 c67f73        	ld	a,32627
 859  011b 1401          	and	a,(OFST-1,sp)
 860  011d c77f73        	ld	32627,a
 861                     ; 308       ITC->ISPR4 |= NewPriority;
 863  0120 c67f73        	ld	a,32627
 864  0123 1a02          	or	a,(OFST+0,sp)
 865  0125 c77f73        	ld	32627,a
 866                     ; 309       break;
 868  0128 2046          	jra	L503
 869  012a               L732:
 870                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 870                     ; 312 #else
 870                     ; 313     case SWITCH_CSS_IRQn:
 870                     ; 314 #endif /*	STM8L15X_LD	*/
 870                     ; 315     case ADC1_COMP_IRQn:
 870                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 870                     ; 317     case LCD_IRQn:
 870                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 870                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 870                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 870                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 870                     ; 322     case LCD_AES_IRQn:
 870                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 870                     ; 324 #endif  /* STM8L15X_MD */
 870                     ; 325       ITC->ISPR5 &= Mask;
 872  012a c67f74        	ld	a,32628
 873  012d 1401          	and	a,(OFST-1,sp)
 874  012f c77f74        	ld	32628,a
 875                     ; 326       ITC->ISPR5 |= NewPriority;
 877  0132 c67f74        	ld	a,32628
 878  0135 1a02          	or	a,(OFST+0,sp)
 879  0137 c77f74        	ld	32628,a
 880                     ; 327       break;
 882  013a 2034          	jra	L503
 883  013c               L142:
 884                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 884                     ; 330 #endif  /* STM8L15X_LD */
 884                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 884                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 884                     ; 333     case TIM2_CC_IRQn:
 884                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 884                     ; 335     case TIM3_CC_IRQn:
 884                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 884                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 884                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 884                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 884                     ; 340 #endif  /* STM8L15X_MD */
 884                     ; 341       ITC->ISPR6 &= Mask;
 886  013c c67f75        	ld	a,32629
 887  013f 1401          	and	a,(OFST-1,sp)
 888  0141 c77f75        	ld	32629,a
 889                     ; 342       ITC->ISPR6 |= NewPriority;
 891  0144 c67f75        	ld	a,32629
 892  0147 1a02          	or	a,(OFST+0,sp)
 893  0149 c77f75        	ld	32629,a
 894                     ; 343       break;
 896  014c 2022          	jra	L503
 897  014e               L342:
 898                     ; 346     case TIM1_CC_IRQn:
 898                     ; 347 #endif  /* STM8L15X_LD */
 898                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 898                     ; 349     case SPI1_IRQn:
 898                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 898                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 898                     ; 352     case USART1_TX_IRQn:
 898                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 898                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 898                     ; 355 #endif  /* STM8L15X_MD */
 898                     ; 356       ITC->ISPR7 &= Mask;
 900  014e c67f76        	ld	a,32630
 901  0151 1401          	and	a,(OFST-1,sp)
 902  0153 c77f76        	ld	32630,a
 903                     ; 357       ITC->ISPR7 |= NewPriority;
 905  0156 c67f76        	ld	a,32630
 906  0159 1a02          	or	a,(OFST+0,sp)
 907  015b c77f76        	ld	32630,a
 908                     ; 358       break;
 910  015e 2010          	jra	L503
 911  0160               L542:
 912                     ; 362     case USART1_RX_IRQn:
 912                     ; 363     case I2C1_IRQn:
 912                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 912                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 912                     ; 366     case I2C1_SPI2_IRQn:
 912                     ; 367 #endif  /* STM8L15X_MD */
 912                     ; 368       ITC->ISPR8 &= Mask;
 914  0160 c67f77        	ld	a,32631
 915  0163 1401          	and	a,(OFST-1,sp)
 916  0165 c77f77        	ld	32631,a
 917                     ; 369       ITC->ISPR8 |= NewPriority;
 919  0168 c67f77        	ld	a,32631
 920  016b 1a02          	or	a,(OFST+0,sp)
 921  016d c77f77        	ld	32631,a
 922                     ; 370       break;
 924  0170               L742:
 925                     ; 372     default:
 925                     ; 373       break;
 927  0170               L503:
 928                     ; 375 }
 931  0170 5b04          	addw	sp,#4
 932  0172 81            	ret
 945                     	xdef	_ITC_GetSoftwarePriority
 946                     	xdef	_ITC_SetSoftwarePriority
 947                     	xdef	_ITC_GetSoftIntStatus
 948                     	xdef	_ITC_GetCPUCC
 949                     	xdef	_ITC_DeInit
 968                     	end
