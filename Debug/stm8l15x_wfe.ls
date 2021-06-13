   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 95 void WFE_DeInit(void)
  41                     ; 96 {
  43                     	switch	.text
  44  0000               _WFE_DeInit:
  48                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  50  0000 725f50a6      	clr	20646
  51                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  53  0004 725f50a7      	clr	20647
  54                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  56  0008 725f50a8      	clr	20648
  57                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  59  000c 725f50a9      	clr	20649
  60                     ; 101 }
  63  0010 81            	ret
 387                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 387                     ; 142 {
 388                     	switch	.text
 389  0011               _WFE_WakeUpSourceEventCmd:
 391  0011 89            	pushw	x
 392  0012 88            	push	a
 393       00000001      OFST:	set	1
 396                     ; 143   uint8_t register_index = 0;
 398                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 400                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 402                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 404  0013 9e            	ld	a,xh
 405  0014 6b01          	ld	(OFST+0,sp),a
 407                     ; 151   if (NewState != DISABLE)
 409  0016 0d06          	tnz	(OFST+5,sp)
 410  0018 273c          	jreq	L502
 411                     ; 153     switch (register_index)
 413  001a 7b01          	ld	a,(OFST+0,sp)
 415                     ; 171       default:
 415                     ; 172         break;
 416  001c 4a            	dec	a
 417  001d 270b          	jreq	L12
 418  001f 4a            	dec	a
 419  0020 2712          	jreq	L32
 420  0022 4a            	dec	a
 421  0023 2719          	jreq	L52
 422  0025 4a            	dec	a
 423  0026 2720          	jreq	L72
 424  0028 2045          	jra	L312
 425  002a               L12:
 426                     ; 155       case 1:
 426                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 428  002a c650a6        	ld	a,20646
 429  002d 1a03          	or	a,(OFST+2,sp)
 430  002f c750a6        	ld	20646,a
 431                     ; 157         break;
 433  0032 203b          	jra	L312
 434  0034               L32:
 435                     ; 159       case 2:
 435                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 437  0034 c650a7        	ld	a,20647
 438  0037 1a03          	or	a,(OFST+2,sp)
 439  0039 c750a7        	ld	20647,a
 440                     ; 161         break;
 442  003c 2031          	jra	L312
 443  003e               L52:
 444                     ; 163       case 3:
 444                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 446  003e c650a8        	ld	a,20648
 447  0041 1a03          	or	a,(OFST+2,sp)
 448  0043 c750a8        	ld	20648,a
 449                     ; 165         break;
 451  0046 2027          	jra	L312
 452  0048               L72:
 453                     ; 167       case 4:
 453                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 455  0048 c650a9        	ld	a,20649
 456  004b 1a03          	or	a,(OFST+2,sp)
 457  004d c750a9        	ld	20649,a
 458                     ; 169         break;
 460  0050 201d          	jra	L312
 461  0052               L13:
 462                     ; 171       default:
 462                     ; 172         break;
 464  0052 201b          	jra	L312
 465  0054               L112:
 467  0054 2019          	jra	L312
 468  0056               L502:
 469                     ; 177     switch (register_index)
 471  0056 7b01          	ld	a,(OFST+0,sp)
 473                     ; 195       default:
 473                     ; 196         break;
 474  0058 4a            	dec	a
 475  0059 270b          	jreq	L33
 476  005b 4a            	dec	a
 477  005c 2714          	jreq	L53
 478  005e 4a            	dec	a
 479  005f 271c          	jreq	L73
 480  0061 4a            	dec	a
 481  0062 2724          	jreq	L14
 482  0064 2009          	jra	L312
 483  0066               L33:
 484                     ; 179       case 1:
 484                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 486  0066 7b03          	ld	a,(OFST+2,sp)
 487  0068 43            	cpl	a
 488  0069 c450a6        	and	a,20646
 489  006c c750a6        	ld	20646,a
 490                     ; 181         break;
 491  006f               L312:
 492                     ; 199 }
 495  006f 5b03          	addw	sp,#3
 496  0071 81            	ret
 497  0072               L53:
 498                     ; 183       case 2:
 498                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 500  0072 7b03          	ld	a,(OFST+2,sp)
 501  0074 43            	cpl	a
 502  0075 c450a7        	and	a,20647
 503  0078 c750a7        	ld	20647,a
 504                     ; 185         break;
 506  007b 20f2          	jra	L312
 507  007d               L73:
 508                     ; 187       case 3:
 508                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 510  007d 7b03          	ld	a,(OFST+2,sp)
 511  007f 43            	cpl	a
 512  0080 c450a8        	and	a,20648
 513  0083 c750a8        	ld	20648,a
 514                     ; 189         break;
 516  0086 20e7          	jra	L312
 517  0088               L14:
 518                     ; 191       case 4:
 518                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 520  0088 7b03          	ld	a,(OFST+2,sp)
 521  008a 43            	cpl	a
 522  008b c450a9        	and	a,20649
 523  008e c750a9        	ld	20649,a
 524                     ; 193         break;
 526  0091 20dc          	jra	L312
 527  0093               L34:
 528                     ; 195       default:
 528                     ; 196         break;
 530  0093 20da          	jra	L312
 531  0095               L712:
 532  0095 20d8          	jra	L312
 579                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 579                     ; 238 {
 580                     	switch	.text
 581  0097               _WFE_GetWakeUpSourceEventStatus:
 583  0097 89            	pushw	x
 584  0098 88            	push	a
 585       00000001      OFST:	set	1
 588                     ; 239   FunctionalState status = DISABLE;
 590  0099 0f01          	clr	(OFST+0,sp)
 592                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 594                     ; 243   switch (WFE_Source)
 597                     ; 326     default:
 597                     ; 327       break;
 598  009b 1d0101        	subw	x,#257
 599  009e 2603          	jrne	L21
 600  00a0 cc013e        	jp	L122
 601  00a3               L21:
 602  00a3 5a            	decw	x
 603  00a4 2603          	jrne	L41
 604  00a6 cc013e        	jp	L122
 605  00a9               L41:
 606  00a9 1d0002        	subw	x,#2
 607  00ac 2603          	jrne	L61
 608  00ae cc013e        	jp	L122
 609  00b1               L61:
 610  00b1 1d0004        	subw	x,#4
 611  00b4 2603          	jrne	L02
 612  00b6 cc013e        	jp	L122
 613  00b9               L02:
 614  00b9 1d0008        	subw	x,#8
 615  00bc 2602          	jrne	L22
 616  00be 207e          	jp	L122
 617  00c0               L22:
 618  00c0 1d0010        	subw	x,#16
 619  00c3 2779          	jreq	L122
 620  00c5 1d0020        	subw	x,#32
 621  00c8 2774          	jreq	L122
 622  00ca 1d0040        	subw	x,#64
 623  00cd 276f          	jreq	L122
 624  00cf 1d0081        	subw	x,#129
 625  00d2 277b          	jreq	L322
 626  00d4 5a            	decw	x
 627  00d5 2778          	jreq	L322
 628  00d7 1d0002        	subw	x,#2
 629  00da 2773          	jreq	L322
 630  00dc 1d0004        	subw	x,#4
 631  00df 276e          	jreq	L322
 632  00e1 1d0008        	subw	x,#8
 633  00e4 2769          	jreq	L322
 634  00e6 1d0010        	subw	x,#16
 635  00e9 2764          	jreq	L322
 636  00eb 1d0020        	subw	x,#32
 637  00ee 275f          	jreq	L322
 638  00f0 1d0040        	subw	x,#64
 639  00f3 275a          	jreq	L322
 640  00f5 1d0081        	subw	x,#129
 641  00f8 2766          	jreq	L522
 642  00fa 5a            	decw	x
 643  00fb 2763          	jreq	L522
 644  00fd 1d0002        	subw	x,#2
 645  0100 275e          	jreq	L522
 646  0102 1d0004        	subw	x,#4
 647  0105 2759          	jreq	L522
 648  0107 1d0008        	subw	x,#8
 649  010a 2754          	jreq	L522
 650  010c 1d0010        	subw	x,#16
 651  010f 274f          	jreq	L522
 652  0111 1d0020        	subw	x,#32
 653  0114 274a          	jreq	L522
 654  0116 1d0040        	subw	x,#64
 655  0119 2745          	jreq	L522
 656  011b 1d0081        	subw	x,#129
 657  011e 2751          	jreq	L722
 658  0120 5a            	decw	x
 659  0121 274e          	jreq	L722
 660  0123 1d0002        	subw	x,#2
 661  0126 2749          	jreq	L722
 662  0128 1d0004        	subw	x,#4
 663  012b 2744          	jreq	L722
 664  012d 1d0008        	subw	x,#8
 665  0130 273f          	jreq	L722
 666  0132 1d0010        	subw	x,#16
 667  0135 273a          	jreq	L722
 668  0137 1d0020        	subw	x,#32
 669  013a 2735          	jreq	L722
 670  013c 2042          	jra	L752
 671  013e               L122:
 672                     ; 245     case WFE_Source_TIM2_EV0:
 672                     ; 246     case WFE_Source_TIM2_EV1:
 672                     ; 247     case WFE_Source_TIM1_EV0:
 672                     ; 248     case WFE_Source_TIM1_EV1:
 672                     ; 249     case WFE_Source_EXTI_EV0:
 672                     ; 250     case WFE_Source_EXTI_EV1:
 672                     ; 251     case WFE_Source_EXTI_EV2:
 672                     ; 252     case WFE_Source_EXTI_EV3:
 672                     ; 253 
 672                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 674  013e c650a6        	ld	a,20646
 675  0141 1503          	bcp	a,(OFST+2,sp)
 676  0143 2706          	jreq	L162
 677                     ; 257         status = ENABLE;
 679  0145 a601          	ld	a,#1
 680  0147 6b01          	ld	(OFST+0,sp),a
 683  0149 2035          	jra	L752
 684  014b               L162:
 685                     ; 262         status = DISABLE;
 687  014b 0f01          	clr	(OFST+0,sp)
 689  014d 2031          	jra	L752
 690  014f               L322:
 691                     ; 266     case WFE_Source_EXTI_EV4:
 691                     ; 267     case WFE_Source_EXTI_EV5:
 691                     ; 268     case WFE_Source_EXTI_EV6:
 691                     ; 269     case WFE_Source_EXTI_EV7:
 691                     ; 270     case WFE_Source_EXTI_EVB_G:
 691                     ; 271     case WFE_Source_EXTI_EVD_H:
 691                     ; 272     case WFE_Source_EXTI_EVE_F:
 691                     ; 273     case WFE_Source_ADC1_COMP_EV:
 691                     ; 274 
 691                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 693  014f c650a7        	ld	a,20647
 694  0152 1503          	bcp	a,(OFST+2,sp)
 695  0154 2706          	jreq	L562
 696                     ; 278         status = ENABLE;
 698  0156 a601          	ld	a,#1
 699  0158 6b01          	ld	(OFST+0,sp),a
 702  015a 2024          	jra	L752
 703  015c               L562:
 704                     ; 283         status = DISABLE;
 706  015c 0f01          	clr	(OFST+0,sp)
 708  015e 2020          	jra	L752
 709  0160               L522:
 710                     ; 286     case WFE_Source_TIM3_EV0:
 710                     ; 287     case WFE_Source_TIM3_EV1:
 710                     ; 288     case WFE_Source_TIM4_EV:
 710                     ; 289     case WFE_Source_SPI1_EV:
 710                     ; 290     case WFE_Source_I2C1_EV:
 710                     ; 291     case WFE_Source_USART1_EV:
 710                     ; 292     case WFE_Source_DMA1CH01_EV:
 710                     ; 293     case WFE_Source_DMA1CH23_EV:
 710                     ; 294 
 710                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 712  0160 c650a8        	ld	a,20648
 713  0163 1503          	bcp	a,(OFST+2,sp)
 714  0165 2706          	jreq	L172
 715                     ; 298         status = ENABLE;
 717  0167 a601          	ld	a,#1
 718  0169 6b01          	ld	(OFST+0,sp),a
 721  016b 2013          	jra	L752
 722  016d               L172:
 723                     ; 303         status = DISABLE;
 725  016d 0f01          	clr	(OFST+0,sp)
 727  016f 200f          	jra	L752
 728  0171               L722:
 729                     ; 307     case WFE_Source_TIM5_EV0:
 729                     ; 308     case WFE_Source_TIM5_EV1:
 729                     ; 309     case WFE_Source_AES_EV:
 729                     ; 310     case WFE_Source_SPI2_EV:
 729                     ; 311     case WFE_Source_USART2_EV:
 729                     ; 312     case WFE_Source_USART3_EV:
 729                     ; 313     case WFE_Source_RTC_CSS_EV:
 729                     ; 314 
 729                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 731  0171 c650a9        	ld	a,20649
 732  0174 1503          	bcp	a,(OFST+2,sp)
 733  0176 2706          	jreq	L572
 734                     ; 318         status = ENABLE;
 736  0178 a601          	ld	a,#1
 737  017a 6b01          	ld	(OFST+0,sp),a
 740  017c 2002          	jra	L752
 741  017e               L572:
 742                     ; 323         status = DISABLE;
 744  017e 0f01          	clr	(OFST+0,sp)
 746  0180               L132:
 747                     ; 326     default:
 747                     ; 327       break;
 749  0180               L752:
 750                     ; 329   return status;
 752  0180 7b01          	ld	a,(OFST+0,sp)
 755  0182 5b03          	addw	sp,#3
 756  0184 81            	ret
 769                     	xdef	_WFE_GetWakeUpSourceEventStatus
 770                     	xdef	_WFE_WakeUpSourceEventCmd
 771                     	xdef	_WFE_DeInit
 790                     	end
