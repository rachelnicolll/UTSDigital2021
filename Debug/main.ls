   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               L3_HDC2080_state:
  15  0000 00            	dc.b	0
  16  0001 00            	dc.b	0
  17  0002 00            	dc.b	0
  18  0003 ff            	dc.b	255
  19  0004 00            	dc.b	0
  20  0005 ff            	dc.b	255
  21  0006 00            	dc.b	0
  22  0007 00            	dc.b	0
  23  0008 00            	dc.b	0
  24  0009 00            	dc.b	0
  25  000a 40            	dc.b	64
  26  000b 0003          	dc.w	3
  27  000d 0003          	dc.w	3
 156                     .const:	section	.text
 157  0000               _settingMsg:
 158  0000 456469746162  	dc.b	"Editable!",0
 159                     	bsct
 160  000f               _editMode:
 161  000f 00            	dc.b	0
 162  0010               _tempResults:
 163  0010 41a99999      	dc.w	16809,-26215
 164  0014               _humResults:
 165  0014 42856666      	dc.w	17029,26214
 166  0018               _HMIFSM:
 167  0018 00            	dc.b	0
 168  0019 0018          	dc.w	_HMIFSM
 169  001b 001d          	dc.w	_HMIFSM+5
 170  001d 01            	dc.b	1
 171  001e 0018          	dc.w	_HMIFSM
 172  0020 0022          	dc.w	_HMIFSM+10
 173  0022 02            	dc.b	2
 174  0023 002c          	dc.w	_HMIFSM+20
 175  0025 0027          	dc.w	_HMIFSM+15
 176  0027 03            	dc.b	3
 177  0028 0022          	dc.w	_HMIFSM+10
 178  002a 002c          	dc.w	_HMIFSM+20
 179  002c 04            	dc.b	4
 180  002d 0027          	dc.w	_HMIFSM+15
 181  002f 0022          	dc.w	_HMIFSM+10
 182                     	switch	.const
 183  000a               _HDC2080:
 184  000a 0000          	dc.w	L3_HDC2080_state
 213                     ; 52 unsigned int clock(void)
 213                     ; 53 {
 215                     	switch	.text
 216  0000               _clock:
 220                     ; 54 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
 222  0000 c652bf        	ld	a,21183
 223  0003 5f            	clrw	x
 224  0004 97            	ld	xl,a
 225  0005 c652c0        	ld	a,21184
 226  0008 02            	rlwa	x,a
 229  0009 81            	ret
 358                     	switch	.const
 359  000c               L01:
 360  000c 000001bc      	dc.l	444
 361                     ; 57 void main(void)
 361                     ; 58 {
 362                     	switch	.text
 363  000a               _main:
 365  000a 5206          	subw	sp,#6
 366       00000006      OFST:	set	6
 369                     ; 60 	uint8_t cursorPos = 0;
 371                     ; 61 	bool toggleReading = TRUE;
 373  000c a601          	ld	a,#1
 374  000e 6b06          	ld	(OFST+0,sp),a
 376                     ; 63 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 378  0010 725f50c0      	clr	20672
 379                     ; 64 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 381  0014 c650c4        	ld	a,20676
 382  0017 aaff          	or	a,#255
 383  0019 c750c4        	ld	20676,a
 384                     ; 65 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 386  001c c650c3        	ld	a,20675
 387  001f aaff          	or	a,#255
 388  0021 c750c3        	ld	20675,a
 389                     ; 69 	TIM1->PSCRH = 0x3e; // 0011 1110
 391  0024 353e52c1      	mov	21185,#62
 392                     ; 70 	TIM1->PSCRL = 0x80; // 0111 0000
 394  0028 358052c2      	mov	21186,#128
 395                     ; 72 	TIM1->CR1 = TIM1_CR1_CEN;
 397  002c 350152b0      	mov	21168,#1
 398                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 401  0030 ae0000        	ldw	x,#0
 402  0033 1f03          	ldw	(OFST-3,sp),x
 403  0035 ae0000        	ldw	x,#0
 404  0038 1f01          	ldw	(OFST-5,sp),x
 406  003a               L551:
 407                     ; 14         _asm("nop");
 410  003a 9d            nop
 412                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 414  003b 96            	ldw	x,sp
 415  003c 1c0001        	addw	x,#OFST-5
 416  003f a601          	ld	a,#1
 417  0041 cd0000        	call	c_lgadc
 422  0044 96            	ldw	x,sp
 423  0045 1c0001        	addw	x,#OFST-5
 424  0048 cd0000        	call	c_ltor
 426  004b ae000c        	ldw	x,#L01
 427  004e cd0000        	call	c_lcmp
 429  0051 25e7          	jrult	L551
 430                     ; 76 	HDC2080_config(HDC2080);
 432  0053 ae0000        	ldw	x,#L3_HDC2080_state
 433  0056 cd0000        	call	_HDC2080_config
 435                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 438  0059 ae0000        	ldw	x,#0
 439  005c 1f03          	ldw	(OFST-3,sp),x
 440  005e ae0000        	ldw	x,#0
 441  0061 1f01          	ldw	(OFST-5,sp),x
 443  0063               L361:
 444                     ; 14         _asm("nop");
 447  0063 9d            nop
 449                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 451  0064 96            	ldw	x,sp
 452  0065 1c0001        	addw	x,#OFST-5
 453  0068 a601          	ld	a,#1
 454  006a cd0000        	call	c_lgadc
 459  006d 96            	ldw	x,sp
 460  006e 1c0001        	addw	x,#OFST-5
 461  0071 cd0000        	call	c_ltor
 463  0074 ae000c        	ldw	x,#L01
 464  0077 cd0000        	call	c_lcmp
 466  007a 25e7          	jrult	L361
 467                     ; 79 	SPI_init();
 469  007c cd0000        	call	_SPI_init
 471                     ; 81 	RTC_init();
 473  007f cd0000        	call	_RTC_init
 475                     ; 83 	BTN_init();
 477  0082 cd0000        	call	_BTN_init
 479                     ; 85 	LCD_init();
 481  0085 cd0000        	call	_LCD_init
 483                     ; 87 	UART_init();
 485  0088 cd0000        	call	_UART_init
 487                     ; 89 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 489  008b ae0018        	ldw	x,#_HMIFSM
 490  008e bf1d          	ldw	_HMIStatePtr,x
 491                     ; 92 	RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 493  0090 ae0018        	ldw	x,#_SRTC_TimeRead
 494  0093 89            	pushw	x
 495  0094 4f            	clr	a
 496  0095 cd0000        	call	_RTC_GetTime
 498  0098 85            	popw	x
 499                     ; 94 	RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 501  0099 ae0014        	ldw	x,#_SRTC_DateRead
 502  009c 89            	pushw	x
 503  009d 4f            	clr	a
 504  009e cd0000        	call	_RTC_GetDate
 506  00a1 85            	popw	x
 507                     ; 96 	disableInterrupts();
 510  00a2 9b            sim
 512                     ; 98 	TempRawResult = HDC2080_tempRead(HDC2080);
 515  00a3 ae0000        	ldw	x,#L3_HDC2080_state
 516  00a6 cd0000        	call	_HDC2080_tempRead
 518  00a9 bf12          	ldw	_TempRawResult,x
 519                     ; 99 	TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 521  00ab be12          	ldw	x,_TempRawResult
 522  00ad cd0000        	call	_HDC2080_tempToFloatCelsius
 524  00b0 ae000e        	ldw	x,#_TempReadingResult
 525  00b3 cd0000        	call	c_rtol
 527                     ; 100 	TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 529  00b6 be12          	ldw	x,_TempRawResult
 530  00b8 cd0000        	call	_HDC2080_tempToIntCelsius
 532  00bb ae000a        	ldw	x,#_TempIntResult
 533  00be cd0000        	call	c_rtol
 535                     ; 102 	HumRawResult = HDC2080_humRead(HDC2080);
 537  00c1 ae0000        	ldw	x,#L3_HDC2080_state
 538  00c4 cd0000        	call	_HDC2080_humRead
 540  00c7 bf08          	ldw	_HumRawResult,x
 541                     ; 103 	HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 543  00c9 be08          	ldw	x,_HumRawResult
 544  00cb cd0000        	call	_HDC2080_humToFloatRelative
 546  00ce ae0004        	ldw	x,#_HumReadingResult
 547  00d1 cd0000        	call	c_rtol
 549                     ; 104 	HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 551  00d4 be08          	ldw	x,_HumRawResult
 552  00d6 cd0000        	call	_HDC2080_humToIntRelative
 554  00d9 ae0000        	ldw	x,#_HumIntResult
 555  00dc cd0000        	call	c_rtol
 557                     ; 106 	enableInterrupts();
 560  00df 9a            rim
 562  00e0               L171:
 563                     ; 112 		if (clock() % 1000 == 0)
 565  00e0 cd0000        	call	_clock
 567  00e3 90ae03e8      	ldw	y,#1000
 568  00e7 65            	divw	x,y
 569  00e8 51            	exgw	x,y
 570  00e9 a30000        	cpw	x,#0
 571  00ec 266c          	jrne	L571
 572                     ; 115 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 574  00ee ae0018        	ldw	x,#_SRTC_TimeRead
 575  00f1 89            	pushw	x
 576  00f2 4f            	clr	a
 577  00f3 cd0000        	call	_RTC_GetTime
 579  00f6 85            	popw	x
 580                     ; 117 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 582  00f7 ae0014        	ldw	x,#_SRTC_DateRead
 583  00fa 89            	pushw	x
 584  00fb 4f            	clr	a
 585  00fc cd0000        	call	_RTC_GetDate
 587  00ff 85            	popw	x
 588                     ; 119 			disableInterrupts();
 591  0100 9b            sim
 593                     ; 121 			if (toggleReading)
 596  0101 0d06          	tnz	(OFST+0,sp)
 597  0103 272b          	jreq	L771
 598                     ; 123 				TempRawResult = HDC2080_tempRead(HDC2080);
 600  0105 ae0000        	ldw	x,#L3_HDC2080_state
 601  0108 cd0000        	call	_HDC2080_tempRead
 603  010b bf12          	ldw	_TempRawResult,x
 604                     ; 124 				TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 606  010d be12          	ldw	x,_TempRawResult
 607  010f cd0000        	call	_HDC2080_tempToFloatCelsius
 609  0112 ae000e        	ldw	x,#_TempReadingResult
 610  0115 cd0000        	call	c_rtol
 612                     ; 125 				TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 614  0118 be12          	ldw	x,_TempRawResult
 615  011a cd0000        	call	_HDC2080_tempToIntCelsius
 617  011d ae000a        	ldw	x,#_TempIntResult
 618  0120 cd0000        	call	c_rtol
 620                     ; 126 				toggleReading = !toggleReading;
 622  0123 0d06          	tnz	(OFST+0,sp)
 623  0125 2604          	jrne	L21
 624  0127 a601          	ld	a,#1
 625  0129 2001          	jra	L41
 626  012b               L21:
 627  012b 4f            	clr	a
 628  012c               L41:
 629  012c 6b06          	ld	(OFST+0,sp),a
 632  012e 2029          	jra	L102
 633  0130               L771:
 634                     ; 132 				HumRawResult = HDC2080_humRead(HDC2080);
 636  0130 ae0000        	ldw	x,#L3_HDC2080_state
 637  0133 cd0000        	call	_HDC2080_humRead
 639  0136 bf08          	ldw	_HumRawResult,x
 640                     ; 133 				HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 642  0138 be08          	ldw	x,_HumRawResult
 643  013a cd0000        	call	_HDC2080_humToFloatRelative
 645  013d ae0004        	ldw	x,#_HumReadingResult
 646  0140 cd0000        	call	c_rtol
 648                     ; 134 				HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 650  0143 be08          	ldw	x,_HumRawResult
 651  0145 cd0000        	call	_HDC2080_humToIntRelative
 653  0148 ae0000        	ldw	x,#_HumIntResult
 654  014b cd0000        	call	c_rtol
 656                     ; 135 				toggleReading = !toggleReading;
 658  014e 0d06          	tnz	(OFST+0,sp)
 659  0150 2604          	jrne	L61
 660  0152 a601          	ld	a,#1
 661  0154 2001          	jra	L02
 662  0156               L61:
 663  0156 4f            	clr	a
 664  0157               L02:
 665  0157 6b06          	ld	(OFST+0,sp),a
 667  0159               L102:
 668                     ; 139 			enableInterrupts();
 671  0159 9a            rim
 674  015a               L571:
 675                     ; 142 		if (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
 677  015a 4b20          	push	#32
 678  015c ae500a        	ldw	x,#20490
 679  015f cd0000        	call	_GPIO_ReadInputDataBit
 681  0162 5b01          	addw	sp,#1
 682  0164 4d            	tnz	a
 683  0165 2714          	jreq	L302
 684                     ; 145 			UART_Poll();
 686  0167 cd0000        	call	_UART_Poll
 688                     ; 146 			UART_2PC(tempResults, humResults);
 690  016a be16          	ldw	x,_humResults+2
 691  016c 89            	pushw	x
 692  016d be14          	ldw	x,_humResults
 693  016f 89            	pushw	x
 694  0170 be12          	ldw	x,_tempResults+2
 695  0172 89            	pushw	x
 696  0173 be10          	ldw	x,_tempResults
 697  0175 89            	pushw	x
 698  0176 cd0000        	call	_UART_2PC
 700  0179 5b08          	addw	sp,#8
 701  017b               L302:
 702                     ; 149 		switch (HMIStatePtr->outState)
 704  017b 92c61d        	ld	a,[_HMIStatePtr.w]
 706                     ; 240 			break;
 707  017e 4d            	tnz	a
 708  017f 2713          	jreq	L101
 709  0181 4a            	dec	a
 710  0182 2723          	jreq	L301
 711  0184 4a            	dec	a
 712  0185 272d          	jreq	L501
 713  0187 4a            	dec	a
 714  0188 2779          	jreq	L701
 715  018a 4a            	dec	a
 716  018b 2603          	jrne	L23
 717  018d cc0234        	jp	L111
 718  0190               L23:
 719  0190 ace000e0      	jpf	L171
 720  0194               L101:
 721                     ; 151 		case DISPLAY_DORMANT:
 721                     ; 152 			LCD_clear();
 723  0194 cd0000        	call	_LCD_clear
 725                     ; 154 			if (buttonPressed != 0)
 727  0197 3d1c          	tnz	_buttonPressed
 728  0199 2706          	jreq	L112
 729                     ; 155 				HMIStatePtr = HMIStatePtr->next;
 731  019b be1d          	ldw	x,_HMIStatePtr
 732  019d ee03          	ldw	x,(3,x)
 733  019f bf1d          	ldw	_HMIStatePtr,x
 734  01a1               L112:
 735                     ; 156 			buttonPressed = NO;
 737  01a1 3f1c          	clr	_buttonPressed
 738                     ; 158 			break;
 740  01a3 ace000e0      	jpf	L171
 741  01a7               L301:
 742                     ; 159 		case DISPLAY_WELCOME:
 742                     ; 160 			LCD_welcome();
 744  01a7 cd0000        	call	_LCD_welcome
 746                     ; 161 			HMIStatePtr = HMIStatePtr->next;
 748  01aa be1d          	ldw	x,_HMIStatePtr
 749  01ac ee03          	ldw	x,(3,x)
 750  01ae bf1d          	ldw	_HMIStatePtr,x
 751                     ; 163 			break;
 753  01b0 ace000e0      	jpf	L171
 754  01b4               L501:
 755                     ; 164 		case DISPLAY_HOME:
 755                     ; 165 
 755                     ; 166 			// Showing temp and humidity and menu option
 755                     ; 167 			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, TempIntResult, HumIntResult);
 757  01b4 be02          	ldw	x,_HumIntResult+2
 758  01b6 89            	pushw	x
 759  01b7 be00          	ldw	x,_HumIntResult
 760  01b9 89            	pushw	x
 761  01ba be0c          	ldw	x,_TempIntResult+2
 762  01bc 89            	pushw	x
 763  01bd be0a          	ldw	x,_TempIntResult
 764  01bf 89            	pushw	x
 765  01c0 b61b          	ld	a,_SRTC_TimeRead+3
 766  01c2 88            	push	a
 767  01c3 b61a          	ld	a,_SRTC_TimeRead+2
 768  01c5 88            	push	a
 769  01c6 b619          	ld	a,_SRTC_TimeRead+1
 770  01c8 88            	push	a
 771  01c9 b618          	ld	a,_SRTC_TimeRead
 772  01cb 88            	push	a
 773  01cc b617          	ld	a,_SRTC_DateRead+3
 774  01ce 88            	push	a
 775  01cf b616          	ld	a,_SRTC_DateRead+2
 776  01d1 88            	push	a
 777  01d2 b615          	ld	a,_SRTC_DateRead+1
 778  01d4 88            	push	a
 779  01d5 b614          	ld	a,_SRTC_DateRead
 780  01d7 88            	push	a
 781  01d8 cd0000        	call	_LCD_homescreen
 783  01db 5b10          	addw	sp,#16
 784                     ; 169 			if (buttonPressed == DOWN)
 786  01dd b61c          	ld	a,_buttonPressed
 787  01df a104          	cp	a,#4
 788  01e1 260b          	jrne	L312
 789                     ; 171 				HMIStatePtr = HMIStatePtr->next;
 791  01e3 be1d          	ldw	x,_HMIStatePtr
 792  01e5 ee03          	ldw	x,(3,x)
 793  01e7 bf1d          	ldw	_HMIStatePtr,x
 794                     ; 172 				LCD_clear();
 796  01e9 cd0000        	call	_LCD_clear
 799  01ec 200f          	jra	L512
 800  01ee               L312:
 801                     ; 174 			else if (buttonPressed == UP)
 803  01ee b61c          	ld	a,_buttonPressed
 804  01f0 a105          	cp	a,#5
 805  01f2 2609          	jrne	L512
 806                     ; 176 				HMIStatePtr = HMIStatePtr->previous;
 808  01f4 be1d          	ldw	x,_HMIStatePtr
 809  01f6 ee01          	ldw	x,(1,x)
 810  01f8 bf1d          	ldw	_HMIStatePtr,x
 811                     ; 177 				LCD_clear();
 813  01fa cd0000        	call	_LCD_clear
 815  01fd               L512:
 816                     ; 179 			buttonPressed = NO;
 818  01fd 3f1c          	clr	_buttonPressed
 819                     ; 180 			break;
 821  01ff ace000e0      	jpf	L171
 822  0203               L701:
 823                     ; 182 		case DISPLAY_MIN_MAX:
 823                     ; 183 			LCD_min_max(12, 14, 8, 90);
 825  0203 4b5a          	push	#90
 826  0205 4b08          	push	#8
 827  0207 ae0c0e        	ldw	x,#3086
 828  020a cd0000        	call	_LCD_min_max
 830  020d 85            	popw	x
 831                     ; 184 			if (buttonPressed == DOWN)
 833  020e b61c          	ld	a,_buttonPressed
 834  0210 a104          	cp	a,#4
 835  0212 260b          	jrne	L122
 836                     ; 186 				HMIStatePtr = HMIStatePtr->next;
 838  0214 be1d          	ldw	x,_HMIStatePtr
 839  0216 ee03          	ldw	x,(3,x)
 840  0218 bf1d          	ldw	_HMIStatePtr,x
 841                     ; 187 				LCD_clear();
 843  021a cd0000        	call	_LCD_clear
 846  021d 200f          	jra	L322
 847  021f               L122:
 848                     ; 189 			else if (buttonPressed == UP)
 850  021f b61c          	ld	a,_buttonPressed
 851  0221 a105          	cp	a,#5
 852  0223 2609          	jrne	L322
 853                     ; 191 				HMIStatePtr = HMIStatePtr->previous;
 855  0225 be1d          	ldw	x,_HMIStatePtr
 856  0227 ee01          	ldw	x,(1,x)
 857  0229 bf1d          	ldw	_HMIStatePtr,x
 858                     ; 192 				LCD_clear();
 860  022b cd0000        	call	_LCD_clear
 862  022e               L322:
 863                     ; 195 			buttonPressed = NO;
 865  022e 3f1c          	clr	_buttonPressed
 866                     ; 196 			break;
 868  0230 ace000e0      	jpf	L171
 869  0234               L111:
 870                     ; 197 		case DISPLAY_SETTINGS:
 870                     ; 198 			// Show settings to change frequency. Need to press ok to engage with screen
 870                     ; 199 
 870                     ; 200 			if (editMode == FALSE)
 872  0234 3d0f          	tnz	_editMode
 873  0236 2639          	jrne	L722
 874                     ; 202 				LCD_display_settings();
 876  0238 cd0000        	call	_LCD_display_settings
 878                     ; 203 				if (buttonPressed == DOWN)
 880  023b b61c          	ld	a,_buttonPressed
 881  023d a104          	cp	a,#4
 882  023f 260b          	jrne	L132
 883                     ; 205 					HMIStatePtr = HMIStatePtr->next;
 885  0241 be1d          	ldw	x,_HMIStatePtr
 886  0243 ee03          	ldw	x,(3,x)
 887  0245 bf1d          	ldw	_HMIStatePtr,x
 888                     ; 206 					LCD_clear();
 890  0247 cd0000        	call	_LCD_clear
 893  024a 200f          	jra	L332
 894  024c               L132:
 895                     ; 208 				else if (buttonPressed == UP)
 897  024c b61c          	ld	a,_buttonPressed
 898  024e a105          	cp	a,#5
 899  0250 2609          	jrne	L332
 900                     ; 210 					HMIStatePtr = HMIStatePtr->previous;
 902  0252 be1d          	ldw	x,_HMIStatePtr
 903  0254 ee01          	ldw	x,(1,x)
 904  0256 bf1d          	ldw	_HMIStatePtr,x
 905                     ; 211 					LCD_clear();
 907  0258 cd0000        	call	_LCD_clear
 909  025b               L332:
 910                     ; 213 				if (buttonPressed == OK)
 912  025b b61c          	ld	a,_buttonPressed
 913  025d a103          	cp	a,#3
 914  025f 263c          	jrne	L142
 915                     ; 215 					editMode = !editMode;
 917  0261 3d0f          	tnz	_editMode
 918  0263 2604          	jrne	L22
 919  0265 a601          	ld	a,#1
 920  0267 2001          	jra	L42
 921  0269               L22:
 922  0269 4f            	clr	a
 923  026a               L42:
 924  026a b70f          	ld	_editMode,a
 925                     ; 216 					LCD_clear();
 927  026c cd0000        	call	_LCD_clear
 929  026f 202c          	jra	L142
 930  0271               L722:
 931                     ; 222 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 933  0271 4b03          	push	#3
 934  0273 4b14          	push	#20
 935  0275 4b0a          	push	#10
 936  0277 ae0000        	ldw	x,#_settingMsg
 937  027a cd0000        	call	_LCD_writemsg
 939  027d 5b03          	addw	sp,#3
 940                     ; 224 				if (buttonPressed == DOWN)
 942  027f b61c          	ld	a,_buttonPressed
 943  0281 a104          	cp	a,#4
 944  0283 2704          	jreq	L542
 946                     ; 228 				else if (buttonPressed == UP)
 948  0285 b61c          	ld	a,_buttonPressed
 949  0287 a105          	cp	a,#5
 950  0289               L542:
 951                     ; 232 				if (buttonPressed == OK)
 953  0289 b61c          	ld	a,_buttonPressed
 954  028b a103          	cp	a,#3
 955  028d 260e          	jrne	L142
 956                     ; 234 					editMode = !editMode;
 958  028f 3d0f          	tnz	_editMode
 959  0291 2604          	jrne	L62
 960  0293 a601          	ld	a,#1
 961  0295 2001          	jra	L03
 962  0297               L62:
 963  0297 4f            	clr	a
 964  0298               L03:
 965  0298 b70f          	ld	_editMode,a
 966                     ; 235 					LCD_clear();
 968  029a cd0000        	call	_LCD_clear
 970  029d               L142:
 971                     ; 239 			buttonPressed = NO;
 973  029d 3f1c          	clr	_buttonPressed
 974                     ; 240 			break;
 976  029f ace000e0      	jpf	L171
 977  02a3               L702:
 979  02a3 ace000e0      	jpf	L171
1587                     	xdef	_main
1588                     	xdef	_clock
1589                     	switch	.ubsct
1590  0000               _HumIntResult:
1591  0000 00000000      	ds.b	4
1592                     	xdef	_HumIntResult
1593  0004               _HumReadingResult:
1594  0004 00000000      	ds.b	4
1595                     	xdef	_HumReadingResult
1596  0008               _HumRawResult:
1597  0008 0000          	ds.b	2
1598                     	xdef	_HumRawResult
1599  000a               _TempIntResult:
1600  000a 00000000      	ds.b	4
1601                     	xdef	_TempIntResult
1602  000e               _TempReadingResult:
1603  000e 00000000      	ds.b	4
1604                     	xdef	_TempReadingResult
1605  0012               _TempRawResult:
1606  0012 0000          	ds.b	2
1607                     	xdef	_TempRawResult
1608                     	xdef	_HDC2080
1609  0014               _SRTC_DateRead:
1610  0014 00000000      	ds.b	4
1611                     	xdef	_SRTC_DateRead
1612  0018               _SRTC_TimeRead:
1613  0018 00000000      	ds.b	4
1614                     	xdef	_SRTC_TimeRead
1615  001c               _buttonPressed:
1616  001c 00            	ds.b	1
1617                     	xdef	_buttonPressed
1618                     	xdef	_humResults
1619                     	xdef	_tempResults
1620                     	xdef	_editMode
1621                     	xdef	_settingMsg
1622                     	xref	_BTN_init
1623                     	xdef	_HMIFSM
1624  001d               _HMIStatePtr:
1625  001d 0000          	ds.b	2
1626                     	xdef	_HMIStatePtr
1627                     	xref	_HDC2080_tempToIntCelsius
1628                     	xref	_HDC2080_tempToFloatCelsius
1629                     	xref	_HDC2080_tempRead
1630                     	xref	_HDC2080_humToIntRelative
1631                     	xref	_HDC2080_humToFloatRelative
1632                     	xref	_HDC2080_humRead
1633                     	xref	_HDC2080_config
1634                     	xref	_UART_2PC
1635                     	xref	_UART_Poll
1636                     	xref	_UART_init
1637                     	xref	_RTC_init
1638                     	xref	_LCD_display_settings
1639                     	xref	_LCD_min_max
1640                     	xref	_LCD_homescreen
1641                     	xref	_LCD_welcome
1642                     	xref	_LCD_writemsg
1643                     	xref	_LCD_clear
1644                     	xref	_LCD_init
1645                     	xref	_SPI_init
1646                     	xref	_RTC_GetDate
1647                     	xref	_RTC_GetTime
1648                     	xref	_GPIO_ReadInputDataBit
1668                     	xref	c_rtol
1669                     	xref	c_lcmp
1670                     	xref	c_ltor
1671                     	xref	c_lgadc
1672                     	end
