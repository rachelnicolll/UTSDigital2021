   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  42                     ; 40 void EXTID_IRQHandler(void)
  42                     ; 41 {
  43                     	switch	.text
  44  0000               f_EXTID_IRQHandler:
  48                     ; 42 	state ^= 1;
  50  0000 90100000      	bcpl	_state,#0
  51                     ; 43 }
  54  0004 80            	iret
  76                     ; 68 uint8_t ITC_GetCPUCC(void)
  76                     ; 69 {
  78                     	switch	.text
  79  0005               _ITC_GetCPUCC:
  83                     ; 71   _asm("push cc");
  86  0005 8a            push cc
  88                     ; 72   _asm("pop a");
  91  0006 84            pop a
  93                     ; 73   return; /* Ignore compiler warning, the returned value is in A register */
  96  0007 81            	ret
 119                     ; 99 void ITC_DeInit(void)
 119                     ; 100 {
 120                     	switch	.text
 121  0008               _ITC_DeInit:
 125                     ; 101   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 127  0008 35ff7f70      	mov	32624,#255
 128                     ; 102   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 130  000c 35ff7f71      	mov	32625,#255
 131                     ; 103   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 133  0010 35ff7f72      	mov	32626,#255
 134                     ; 104   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 136  0014 35ff7f73      	mov	32627,#255
 137                     ; 105   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 139  0018 35ff7f74      	mov	32628,#255
 140                     ; 106   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 142  001c 35ff7f75      	mov	32629,#255
 143                     ; 107   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 145  0020 35ff7f76      	mov	32630,#255
 146                     ; 108   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 148  0024 35ff7f77      	mov	32631,#255
 149                     ; 109 }
 152  0028 81            	ret
 177                     ; 116 uint8_t ITC_GetSoftIntStatus(void)
 177                     ; 117 {
 178                     	switch	.text
 179  0029               _ITC_GetSoftIntStatus:
 183                     ; 118   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 185  0029 adda          	call	_ITC_GetCPUCC
 187  002b a428          	and	a,#40
 190  002d 81            	ret
 499                     .const:	section	.text
 500  0000               L42:
 501  0000 0052          	dc.w	L15
 502  0002 0052          	dc.w	L15
 503  0004 0052          	dc.w	L15
 504  0006 005b          	dc.w	L35
 505  0008 005b          	dc.w	L35
 506  000a 005b          	dc.w	L35
 507  000c 005b          	dc.w	L35
 508  000e 0064          	dc.w	L55
 509  0010 0064          	dc.w	L55
 510  0012 0064          	dc.w	L55
 511  0014 0064          	dc.w	L55
 512  0016 006d          	dc.w	L75
 513  0018 006d          	dc.w	L75
 514  001a 006d          	dc.w	L75
 515  001c 006d          	dc.w	L75
 516  001e 0076          	dc.w	L16
 517  0020 0076          	dc.w	L16
 518  0022 0076          	dc.w	L16
 519  0024 0076          	dc.w	L16
 520  0026 007f          	dc.w	L36
 521  0028 007f          	dc.w	L36
 522  002a 007f          	dc.w	L36
 523  002c 007f          	dc.w	L36
 524  002e 0088          	dc.w	L56
 525  0030 0088          	dc.w	L56
 526  0032 0088          	dc.w	L56
 527  0034 0088          	dc.w	L56
 528  0036 0091          	dc.w	L76
 529  0038 0091          	dc.w	L76
 530                     ; 126 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 530                     ; 127 {
 531                     	switch	.text
 532  002e               _ITC_GetSoftwarePriority:
 534  002e 88            	push	a
 535  002f 89            	pushw	x
 536       00000002      OFST:	set	2
 539                     ; 128   uint8_t Value = 0;
 541  0030 0f02          	clr	(OFST+0,sp)
 543                     ; 129   uint8_t Mask = 0;
 545                     ; 132   assert_param(IS_ITC_IRQ(IRQn));
 547                     ; 135   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 549  0032 a403          	and	a,#3
 550  0034 48            	sll	a
 551  0035 5f            	clrw	x
 552  0036 97            	ld	xl,a
 553  0037 a603          	ld	a,#3
 554  0039 5d            	tnzw	x
 555  003a 2704          	jreq	L61
 556  003c               L02:
 557  003c 48            	sll	a
 558  003d 5a            	decw	x
 559  003e 26fc          	jrne	L02
 560  0040               L61:
 561  0040 6b01          	ld	(OFST-1,sp),a
 563                     ; 137   switch (IRQn)
 565  0042 7b03          	ld	a,(OFST+1,sp)
 567                     ; 235     default:
 567                     ; 236       break;
 568  0044 4a            	dec	a
 569  0045 a11d          	cp	a,#29
 570  0047 2407          	jruge	L22
 571  0049 5f            	clrw	x
 572  004a 97            	ld	xl,a
 573  004b 58            	sllw	x
 574  004c de0000        	ldw	x,(L42,x)
 575  004f fc            	jp	(x)
 576  0050               L22:
 577  0050 2046          	jra	L532
 578  0052               L15:
 579                     ; 139     case FLASH_IRQn:
 579                     ; 140     case DMA1_CHANNEL0_1_IRQn:
 579                     ; 141     case DMA1_CHANNEL2_3_IRQn:
 579                     ; 142       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 581  0052 c67f70        	ld	a,32624
 582  0055 1401          	and	a,(OFST-1,sp)
 583  0057 6b02          	ld	(OFST+0,sp),a
 585                     ; 143       break;
 587  0059 203d          	jra	L532
 588  005b               L35:
 589                     ; 145     case EXTIE_F_PVD_IRQn:
 589                     ; 146 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 589                     ; 147     case RTC_IRQn:
 589                     ; 148     case EXTIB_IRQn:
 589                     ; 149     case EXTID_IRQn:
 589                     ; 150 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 589                     ; 151     case RTC_CSSLSE_IRQn:
 589                     ; 152     case EXTIB_IRQn:
 589                     ; 153     case EXTID_IRQn:
 589                     ; 154 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 589                     ; 155     case RTC_CSSLSE_IRQn:
 589                     ; 156     case EXTIB_G_IRQn:
 589                     ; 157     case EXTID_H_IRQn:
 589                     ; 158 #endif  /* STM8L15X_MD */
 589                     ; 159       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 591  005b c67f71        	ld	a,32625
 592  005e 1401          	and	a,(OFST-1,sp)
 593  0060 6b02          	ld	(OFST+0,sp),a
 595                     ; 160       break;
 597  0062 2034          	jra	L532
 598  0064               L55:
 599                     ; 162     case EXTI0_IRQn:
 599                     ; 163     case EXTI1_IRQn:
 599                     ; 164     case EXTI2_IRQn:
 599                     ; 165     case EXTI3_IRQn:
 599                     ; 166       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 601  0064 c67f72        	ld	a,32626
 602  0067 1401          	and	a,(OFST-1,sp)
 603  0069 6b02          	ld	(OFST+0,sp),a
 605                     ; 167       break;
 607  006b 202b          	jra	L532
 608  006d               L75:
 609                     ; 169     case EXTI4_IRQn:
 609                     ; 170     case EXTI5_IRQn:
 609                     ; 171     case EXTI6_IRQn:
 609                     ; 172     case EXTI7_IRQn:
 609                     ; 173       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 611  006d c67f73        	ld	a,32627
 612  0070 1401          	and	a,(OFST-1,sp)
 613  0072 6b02          	ld	(OFST+0,sp),a
 615                     ; 174       break;
 617  0074 2022          	jra	L532
 618  0076               L16:
 619                     ; 179     case SWITCH_CSS_BREAK_DAC_IRQn:
 619                     ; 180 #endif /* STM8L15X_LD */		
 619                     ; 181     case ADC1_COMP_IRQn:
 619                     ; 182 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 619                     ; 183     case LCD_IRQn:
 619                     ; 184     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 619                     ; 185 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 619                     ; 186     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 619                     ; 187 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 619                     ; 188     case LCD_AES_IRQn:
 619                     ; 189     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 619                     ; 190 #endif  /* STM8L15X_MD */
 619                     ; 191       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 621  0076 c67f74        	ld	a,32628
 622  0079 1401          	and	a,(OFST-1,sp)
 623  007b 6b02          	ld	(OFST+0,sp),a
 625                     ; 192       break;
 627  007d 2019          	jra	L532
 628  007f               L36:
 629                     ; 195     case TIM1_UPD_OVF_TRG_IRQn:
 629                     ; 196 #endif /* STM8L15X_LD */		
 629                     ; 197 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 629                     ; 198  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 629                     ; 199     case TIM2_CC_IRQn:
 629                     ; 200     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 629                     ; 201     case TIM3_CC_IRQn:
 629                     ; 202 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 629                     ; 203     case TIM2_CC_USART2_RX_IRQn:
 629                     ; 204     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 629                     ; 205     case TIM3_CC_USART3_RX_IRQn:
 629                     ; 206 #endif  /* STM8L15X_MD */
 629                     ; 207       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 631  007f c67f75        	ld	a,32629
 632  0082 1401          	and	a,(OFST-1,sp)
 633  0084 6b02          	ld	(OFST+0,sp),a
 635                     ; 208       break;
 637  0086 2010          	jra	L532
 638  0088               L56:
 639                     ; 211     case TIM1_CC_IRQn:
 639                     ; 212 #endif /* STM8L15X_LD */	
 639                     ; 213     case TIM4_UPD_OVF_TRG_IRQn:
 639                     ; 214     case SPI1_IRQn:
 639                     ; 215 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 639                     ; 216  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 639                     ; 217     case USART1_TX_IRQn:
 639                     ; 218 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 639                     ; 219     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 639                     ; 220 #endif  /* STM8L15X_MD || STM8L15X_LD */
 639                     ; 221       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 641  0088 c67f76        	ld	a,32630
 642  008b 1401          	and	a,(OFST-1,sp)
 643  008d 6b02          	ld	(OFST+0,sp),a
 645                     ; 222       break;
 647  008f 2007          	jra	L532
 648  0091               L76:
 649                     ; 226     case USART1_RX_IRQn:
 649                     ; 227     case I2C1_IRQn:
 649                     ; 228 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 649                     ; 229     case USART1_RX_TIM5_CC_IRQn:
 649                     ; 230     case I2C1_SPI2_IRQn:
 649                     ; 231 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 649                     ; 232       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 651  0091 c67f77        	ld	a,32631
 652  0094 1401          	and	a,(OFST-1,sp)
 653  0096 6b02          	ld	(OFST+0,sp),a
 655                     ; 233       break;
 657  0098               L17:
 658                     ; 235     default:
 658                     ; 236       break;
 660  0098               L532:
 661                     ; 239   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 663  0098 7b03          	ld	a,(OFST+1,sp)
 664  009a a403          	and	a,#3
 665  009c 48            	sll	a
 666  009d 5f            	clrw	x
 667  009e 97            	ld	xl,a
 668  009f 7b02          	ld	a,(OFST+0,sp)
 669  00a1 5d            	tnzw	x
 670  00a2 2704          	jreq	L62
 671  00a4               L03:
 672  00a4 44            	srl	a
 673  00a5 5a            	decw	x
 674  00a6 26fc          	jrne	L03
 675  00a8               L62:
 676  00a8 6b02          	ld	(OFST+0,sp),a
 678                     ; 241   return((ITC_PriorityLevel_TypeDef)Value);
 680  00aa 7b02          	ld	a,(OFST+0,sp)
 683  00ac 5b03          	addw	sp,#3
 684  00ae 81            	ret
 748                     	switch	.const
 749  003a               L64:
 750  003a 00e7          	dc.w	L732
 751  003c 00e7          	dc.w	L732
 752  003e 00e7          	dc.w	L732
 753  0040 00f9          	dc.w	L142
 754  0042 00f9          	dc.w	L142
 755  0044 00f9          	dc.w	L142
 756  0046 00f9          	dc.w	L142
 757  0048 010b          	dc.w	L342
 758  004a 010b          	dc.w	L342
 759  004c 010b          	dc.w	L342
 760  004e 010b          	dc.w	L342
 761  0050 011d          	dc.w	L542
 762  0052 011d          	dc.w	L542
 763  0054 011d          	dc.w	L542
 764  0056 011d          	dc.w	L542
 765  0058 012f          	dc.w	L742
 766  005a 012f          	dc.w	L742
 767  005c 012f          	dc.w	L742
 768  005e 012f          	dc.w	L742
 769  0060 0141          	dc.w	L152
 770  0062 0141          	dc.w	L152
 771  0064 0141          	dc.w	L152
 772  0066 0141          	dc.w	L152
 773  0068 0153          	dc.w	L352
 774  006a 0153          	dc.w	L352
 775  006c 0153          	dc.w	L352
 776  006e 0153          	dc.w	L352
 777  0070 0165          	dc.w	L552
 778  0072 0165          	dc.w	L552
 779                     ; 262 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 779                     ; 263 {
 780                     	switch	.text
 781  00af               _ITC_SetSoftwarePriority:
 783  00af 89            	pushw	x
 784  00b0 89            	pushw	x
 785       00000002      OFST:	set	2
 788                     ; 264   uint8_t Mask = 0;
 790                     ; 265   uint8_t NewPriority = 0;
 792                     ; 268   assert_param(IS_ITC_IRQ(IRQn));
 794                     ; 269   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 796                     ; 272   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 798                     ; 276   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 800  00b1 9e            	ld	a,xh
 801  00b2 a403          	and	a,#3
 802  00b4 48            	sll	a
 803  00b5 5f            	clrw	x
 804  00b6 97            	ld	xl,a
 805  00b7 a603          	ld	a,#3
 806  00b9 5d            	tnzw	x
 807  00ba 2704          	jreq	L43
 808  00bc               L63:
 809  00bc 48            	sll	a
 810  00bd 5a            	decw	x
 811  00be 26fc          	jrne	L63
 812  00c0               L43:
 813  00c0 43            	cpl	a
 814  00c1 6b01          	ld	(OFST-1,sp),a
 816                     ; 278   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 818  00c3 7b03          	ld	a,(OFST+1,sp)
 819  00c5 a403          	and	a,#3
 820  00c7 48            	sll	a
 821  00c8 5f            	clrw	x
 822  00c9 97            	ld	xl,a
 823  00ca 7b04          	ld	a,(OFST+2,sp)
 824  00cc 5d            	tnzw	x
 825  00cd 2704          	jreq	L04
 826  00cf               L24:
 827  00cf 48            	sll	a
 828  00d0 5a            	decw	x
 829  00d1 26fc          	jrne	L24
 830  00d3               L04:
 831  00d3 6b02          	ld	(OFST+0,sp),a
 833                     ; 280   switch (IRQn)
 835  00d5 7b03          	ld	a,(OFST+1,sp)
 837                     ; 384     default:
 837                     ; 385       break;
 838  00d7 4a            	dec	a
 839  00d8 a11d          	cp	a,#29
 840  00da 2407          	jruge	L44
 841  00dc 5f            	clrw	x
 842  00dd 97            	ld	xl,a
 843  00de 58            	sllw	x
 844  00df de003a        	ldw	x,(L64,x)
 845  00e2 fc            	jp	(x)
 846  00e3               L44:
 847  00e3 ac750175      	jpf	L513
 848  00e7               L732:
 849                     ; 282     case FLASH_IRQn:
 849                     ; 283     case DMA1_CHANNEL0_1_IRQn:
 849                     ; 284     case DMA1_CHANNEL2_3_IRQn:
 849                     ; 285       ITC->ISPR1 &= Mask;
 851  00e7 c67f70        	ld	a,32624
 852  00ea 1401          	and	a,(OFST-1,sp)
 853  00ec c77f70        	ld	32624,a
 854                     ; 286       ITC->ISPR1 |= NewPriority;
 856  00ef c67f70        	ld	a,32624
 857  00f2 1a02          	or	a,(OFST+0,sp)
 858  00f4 c77f70        	ld	32624,a
 859                     ; 287       break;
 861  00f7 207c          	jra	L513
 862  00f9               L142:
 863                     ; 289     case EXTIE_F_PVD_IRQn:
 863                     ; 290 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 863                     ; 291     case RTC_IRQn:
 863                     ; 292     case EXTIB_IRQn:
 863                     ; 293     case EXTID_IRQn:
 863                     ; 294 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 863                     ; 295     case RTC_CSSLSE_IRQn:
 863                     ; 296     case EXTIB_IRQn:
 863                     ; 297     case EXTID_IRQn:
 863                     ; 298 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 863                     ; 299     case RTC_CSSLSE_IRQn:
 863                     ; 300     case EXTIB_G_IRQn:
 863                     ; 301     case EXTID_H_IRQn:
 863                     ; 302 #endif  /* STM8L15X_MD */
 863                     ; 303       ITC->ISPR2 &= Mask;
 865  00f9 c67f71        	ld	a,32625
 866  00fc 1401          	and	a,(OFST-1,sp)
 867  00fe c77f71        	ld	32625,a
 868                     ; 304       ITC->ISPR2 |= NewPriority;
 870  0101 c67f71        	ld	a,32625
 871  0104 1a02          	or	a,(OFST+0,sp)
 872  0106 c77f71        	ld	32625,a
 873                     ; 305       break;
 875  0109 206a          	jra	L513
 876  010b               L342:
 877                     ; 307     case EXTI0_IRQn:
 877                     ; 308     case EXTI1_IRQn:
 877                     ; 309     case EXTI2_IRQn:
 877                     ; 310     case EXTI3_IRQn:
 877                     ; 311       ITC->ISPR3 &= Mask;
 879  010b c67f72        	ld	a,32626
 880  010e 1401          	and	a,(OFST-1,sp)
 881  0110 c77f72        	ld	32626,a
 882                     ; 312       ITC->ISPR3 |= NewPriority;
 884  0113 c67f72        	ld	a,32626
 885  0116 1a02          	or	a,(OFST+0,sp)
 886  0118 c77f72        	ld	32626,a
 887                     ; 313       break;
 889  011b 2058          	jra	L513
 890  011d               L542:
 891                     ; 315     case EXTI4_IRQn:
 891                     ; 316     case EXTI5_IRQn:
 891                     ; 317     case EXTI6_IRQn:
 891                     ; 318     case EXTI7_IRQn:
 891                     ; 319       ITC->ISPR4 &= Mask;
 893  011d c67f73        	ld	a,32627
 894  0120 1401          	and	a,(OFST-1,sp)
 895  0122 c77f73        	ld	32627,a
 896                     ; 320       ITC->ISPR4 |= NewPriority;
 898  0125 c67f73        	ld	a,32627
 899  0128 1a02          	or	a,(OFST+0,sp)
 900  012a c77f73        	ld	32627,a
 901                     ; 321       break;
 903  012d 2046          	jra	L513
 904  012f               L742:
 905                     ; 323     case SWITCH_CSS_BREAK_DAC_IRQn:
 905                     ; 324 #else
 905                     ; 325     case SWITCH_CSS_IRQn:
 905                     ; 326 #endif /*	STM8L15X_LD	*/
 905                     ; 327     case ADC1_COMP_IRQn:
 905                     ; 328 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 905                     ; 329     case LCD_IRQn:
 905                     ; 330     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 905                     ; 331 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 905                     ; 332     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 905                     ; 333 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 905                     ; 334     case LCD_AES_IRQn:
 905                     ; 335     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 905                     ; 336 #endif  /* STM8L15X_MD */
 905                     ; 337       ITC->ISPR5 &= Mask;
 907  012f c67f74        	ld	a,32628
 908  0132 1401          	and	a,(OFST-1,sp)
 909  0134 c77f74        	ld	32628,a
 910                     ; 338       ITC->ISPR5 |= NewPriority;
 912  0137 c67f74        	ld	a,32628
 913  013a 1a02          	or	a,(OFST+0,sp)
 914  013c c77f74        	ld	32628,a
 915                     ; 339       break;
 917  013f 2034          	jra	L513
 918  0141               L152:
 919                     ; 341     case TIM1_UPD_OVF_TRG_IRQn:
 919                     ; 342 #endif  /* STM8L15X_LD */
 919                     ; 343 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 919                     ; 344  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 919                     ; 345     case TIM2_CC_IRQn:
 919                     ; 346     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 919                     ; 347     case TIM3_CC_IRQn:
 919                     ; 348 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 919                     ; 349     case TIM2_CC_USART2_RX_IRQn:
 919                     ; 350     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 919                     ; 351     case TIM3_CC_USART3_RX_IRQn:
 919                     ; 352 #endif  /* STM8L15X_MD */
 919                     ; 353       ITC->ISPR6 &= Mask;
 921  0141 c67f75        	ld	a,32629
 922  0144 1401          	and	a,(OFST-1,sp)
 923  0146 c77f75        	ld	32629,a
 924                     ; 354       ITC->ISPR6 |= NewPriority;
 926  0149 c67f75        	ld	a,32629
 927  014c 1a02          	or	a,(OFST+0,sp)
 928  014e c77f75        	ld	32629,a
 929                     ; 355       break;
 931  0151 2022          	jra	L513
 932  0153               L352:
 933                     ; 358     case TIM1_CC_IRQn:
 933                     ; 359 #endif  /* STM8L15X_LD */
 933                     ; 360     case TIM4_UPD_OVF_TRG_IRQn:
 933                     ; 361     case SPI1_IRQn:
 933                     ; 362 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 933                     ; 363  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 933                     ; 364     case USART1_TX_IRQn:
 933                     ; 365 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 933                     ; 366     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 933                     ; 367 #endif  /* STM8L15X_MD */
 933                     ; 368       ITC->ISPR7 &= Mask;
 935  0153 c67f76        	ld	a,32630
 936  0156 1401          	and	a,(OFST-1,sp)
 937  0158 c77f76        	ld	32630,a
 938                     ; 369       ITC->ISPR7 |= NewPriority;
 940  015b c67f76        	ld	a,32630
 941  015e 1a02          	or	a,(OFST+0,sp)
 942  0160 c77f76        	ld	32630,a
 943                     ; 370       break;
 945  0163 2010          	jra	L513
 946  0165               L552:
 947                     ; 374     case USART1_RX_IRQn:
 947                     ; 375     case I2C1_IRQn:
 947                     ; 376 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 947                     ; 377     case USART1_RX_TIM5_CC_IRQn:
 947                     ; 378     case I2C1_SPI2_IRQn:
 947                     ; 379 #endif  /* STM8L15X_MD */
 947                     ; 380       ITC->ISPR8 &= Mask;
 949  0165 c67f77        	ld	a,32631
 950  0168 1401          	and	a,(OFST-1,sp)
 951  016a c77f77        	ld	32631,a
 952                     ; 381       ITC->ISPR8 |= NewPriority;
 954  016d c67f77        	ld	a,32631
 955  0170 1a02          	or	a,(OFST+0,sp)
 956  0172 c77f77        	ld	32631,a
 957                     ; 382       break;
 959  0175               L752:
 960                     ; 384     default:
 960                     ; 385       break;
 962  0175               L513:
 963                     ; 387 }
 966  0175 5b04          	addw	sp,#4
 967  0177 81            	ret
 980                     	xref.b	_state
 981                     	xdef	_ITC_GetSoftwarePriority
 982                     	xdef	_ITC_SetSoftwarePriority
 983                     	xdef	_ITC_GetSoftIntStatus
 984                     	xdef	_ITC_GetCPUCC
 985                     	xdef	_ITC_DeInit
 986                     	xdef	f_EXTID_IRQHandler
1005                     	end
