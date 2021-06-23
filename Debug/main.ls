   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               L3_HDC2080_state:
  15  0000 00            	dc.b	0
  16  0001 00            	dc.b	0
  17  0002 00            	dc.b	0
  18  0003 00            	dc.b	0
  19  0004 ff            	dc.b	255
  20  0005 00            	dc.b	0
  21  0006 ff            	dc.b	255
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
 367                     	switch	.const
 368  000c               L01:
 369  000c 000001bc      	dc.l	444
 370                     ; 57 void main(void)
 370                     ; 58 {
 371                     	switch	.text
 372  000a               _main:
 374  000a 5207          	subw	sp,#7
 375       00000007      OFST:	set	7
 378                     ; 60 	uint8_t cursorPos = 0;
 380                     ; 61 	bool toggleReading = TRUE;
 382  000c a601          	ld	a,#1
 383  000e 6b07          	ld	(OFST+0,sp),a
 385                     ; 62 	uint8_t value = 5;
 387                     ; 64 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 389  0010 725f50c0      	clr	20672
 390                     ; 65 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 392  0014 c650c4        	ld	a,20676
 393  0017 aaff          	or	a,#255
 394  0019 c750c4        	ld	20676,a
 395                     ; 66 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 397  001c c650c3        	ld	a,20675
 398  001f aaff          	or	a,#255
 399  0021 c750c3        	ld	20675,a
 400                     ; 70 	TIM1->PSCRH = 0x3e; // 0011 1110
 402  0024 353e52c1      	mov	21185,#62
 403                     ; 71 	TIM1->PSCRL = 0x80; // 0111 0000
 405  0028 358052c2      	mov	21186,#128
 406                     ; 73 	TIM1->CR1 = TIM1_CR1_CEN;
 408  002c 350152b0      	mov	21168,#1
 409                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 412  0030 ae0000        	ldw	x,#0
 413  0033 1f03          	ldw	(OFST-4,sp),x
 414  0035 ae0000        	ldw	x,#0
 415  0038 1f01          	ldw	(OFST-6,sp),x
 417  003a               L161:
 418                     ; 14         _asm("nop");
 421  003a 9d            nop
 423                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 425  003b 96            	ldw	x,sp
 426  003c 1c0001        	addw	x,#OFST-6
 427  003f a601          	ld	a,#1
 428  0041 cd0000        	call	c_lgadc
 433  0044 96            	ldw	x,sp
 434  0045 1c0001        	addw	x,#OFST-6
 435  0048 cd0000        	call	c_ltor
 437  004b ae000c        	ldw	x,#L01
 438  004e cd0000        	call	c_lcmp
 440  0051 25e7          	jrult	L161
 441                     ; 78 	HDC2080_config(HDC2080);
 443  0053 ae0000        	ldw	x,#L3_HDC2080_state
 444  0056 cd0000        	call	_HDC2080_config
 446                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 449  0059 ae0000        	ldw	x,#0
 450  005c 1f03          	ldw	(OFST-4,sp),x
 451  005e ae0000        	ldw	x,#0
 452  0061 1f01          	ldw	(OFST-6,sp),x
 454  0063               L761:
 455                     ; 14         _asm("nop");
 458  0063 9d            nop
 460                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 462  0064 96            	ldw	x,sp
 463  0065 1c0001        	addw	x,#OFST-6
 464  0068 a601          	ld	a,#1
 465  006a cd0000        	call	c_lgadc
 470  006d 96            	ldw	x,sp
 471  006e 1c0001        	addw	x,#OFST-6
 472  0071 cd0000        	call	c_ltor
 474  0074 ae000c        	ldw	x,#L01
 475  0077 cd0000        	call	c_lcmp
 477  007a 25e7          	jrult	L761
 478                     ; 81 	SPI_init();
 480  007c cd0000        	call	_SPI_init
 482                     ; 83 	RTC_init();
 484  007f cd0000        	call	_RTC_init
 486                     ; 85 	BTN_init();
 488  0082 cd0000        	call	_BTN_init
 490                     ; 87 	LCD_init();
 492  0085 cd0000        	call	_LCD_init
 494                     ; 89 	UART_init();
 496  0088 cd0000        	call	_UART_init
 498                     ; 91 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 500  008b ae0018        	ldw	x,#_HMIFSM
 501  008e bf1d          	ldw	_HMIStatePtr,x
 502                     ; 94 	RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 504  0090 ae0018        	ldw	x,#_SRTC_TimeRead
 505  0093 89            	pushw	x
 506  0094 4f            	clr	a
 507  0095 cd0000        	call	_RTC_GetTime
 509  0098 85            	popw	x
 510                     ; 96 	RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 512  0099 ae0014        	ldw	x,#_SRTC_DateRead
 513  009c 89            	pushw	x
 514  009d 4f            	clr	a
 515  009e cd0000        	call	_RTC_GetDate
 517  00a1 85            	popw	x
 518                     ; 98 	disableInterrupts();
 521  00a2 9b            sim
 523                     ; 100 	TempRawResult = HDC2080_tempRead(HDC2080);
 526  00a3 ae0000        	ldw	x,#L3_HDC2080_state
 527  00a6 cd0000        	call	_HDC2080_tempRead
 529  00a9 bf12          	ldw	_TempRawResult,x
 530                     ; 101 	TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 532  00ab be12          	ldw	x,_TempRawResult
 533  00ad cd0000        	call	_HDC2080_tempToFloatCelsius
 535  00b0 ae000e        	ldw	x,#_TempReadingResult
 536  00b3 cd0000        	call	c_rtol
 538                     ; 102 	TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 540  00b6 be12          	ldw	x,_TempRawResult
 541  00b8 cd0000        	call	_HDC2080_tempToIntCelsius
 543  00bb ae000a        	ldw	x,#_TempIntResult
 544  00be cd0000        	call	c_rtol
 546                     ; 104 	HumRawResult = HDC2080_humRead(HDC2080);
 548  00c1 ae0000        	ldw	x,#L3_HDC2080_state
 549  00c4 cd0000        	call	_HDC2080_humRead
 551  00c7 bf08          	ldw	_HumRawResult,x
 552                     ; 105 	HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 554  00c9 be08          	ldw	x,_HumRawResult
 555  00cb cd0000        	call	_HDC2080_humToFloatRelative
 557  00ce ae0004        	ldw	x,#_HumReadingResult
 558  00d1 cd0000        	call	c_rtol
 560                     ; 106 	HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 562  00d4 be08          	ldw	x,_HumRawResult
 563  00d6 cd0000        	call	_HDC2080_humToIntRelative
 565  00d9 ae0000        	ldw	x,#_HumIntResult
 566  00dc cd0000        	call	c_rtol
 568                     ; 109 	enableInterrupts();
 571  00df 9a            rim
 573  00e0               L571:
 574                     ; 115 		if (clock() % 1000 == 0)
 576  00e0 cd0000        	call	_clock
 578  00e3 90ae03e8      	ldw	y,#1000
 579  00e7 65            	divw	x,y
 580  00e8 51            	exgw	x,y
 581  00e9 a30000        	cpw	x,#0
 582  00ec 266c          	jrne	L102
 583                     ; 118 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 585  00ee ae0018        	ldw	x,#_SRTC_TimeRead
 586  00f1 89            	pushw	x
 587  00f2 4f            	clr	a
 588  00f3 cd0000        	call	_RTC_GetTime
 590  00f6 85            	popw	x
 591                     ; 120 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 593  00f7 ae0014        	ldw	x,#_SRTC_DateRead
 594  00fa 89            	pushw	x
 595  00fb 4f            	clr	a
 596  00fc cd0000        	call	_RTC_GetDate
 598  00ff 85            	popw	x
 599                     ; 122 			disableInterrupts();
 602  0100 9b            sim
 604                     ; 124 			if (toggleReading)
 607  0101 0d07          	tnz	(OFST+0,sp)
 608  0103 272b          	jreq	L302
 609                     ; 126 				TempRawResult = HDC2080_tempRead(HDC2080);
 611  0105 ae0000        	ldw	x,#L3_HDC2080_state
 612  0108 cd0000        	call	_HDC2080_tempRead
 614  010b bf12          	ldw	_TempRawResult,x
 615                     ; 127 				TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 617  010d be12          	ldw	x,_TempRawResult
 618  010f cd0000        	call	_HDC2080_tempToFloatCelsius
 620  0112 ae000e        	ldw	x,#_TempReadingResult
 621  0115 cd0000        	call	c_rtol
 623                     ; 128 				TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 625  0118 be12          	ldw	x,_TempRawResult
 626  011a cd0000        	call	_HDC2080_tempToIntCelsius
 628  011d ae000a        	ldw	x,#_TempIntResult
 629  0120 cd0000        	call	c_rtol
 631                     ; 129 				toggleReading = !toggleReading;
 633  0123 0d07          	tnz	(OFST+0,sp)
 634  0125 2604          	jrne	L21
 635  0127 a601          	ld	a,#1
 636  0129 2001          	jra	L41
 637  012b               L21:
 638  012b 4f            	clr	a
 639  012c               L41:
 640  012c 6b07          	ld	(OFST+0,sp),a
 643  012e 2029          	jra	L502
 644  0130               L302:
 645                     ; 135 				HumRawResult = HDC2080_humRead(HDC2080);
 647  0130 ae0000        	ldw	x,#L3_HDC2080_state
 648  0133 cd0000        	call	_HDC2080_humRead
 650  0136 bf08          	ldw	_HumRawResult,x
 651                     ; 136 				HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 653  0138 be08          	ldw	x,_HumRawResult
 654  013a cd0000        	call	_HDC2080_humToFloatRelative
 656  013d ae0004        	ldw	x,#_HumReadingResult
 657  0140 cd0000        	call	c_rtol
 659                     ; 137 				HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 661  0143 be08          	ldw	x,_HumRawResult
 662  0145 cd0000        	call	_HDC2080_humToIntRelative
 664  0148 ae0000        	ldw	x,#_HumIntResult
 665  014b cd0000        	call	c_rtol
 667                     ; 138 				toggleReading = !toggleReading;
 669  014e 0d07          	tnz	(OFST+0,sp)
 670  0150 2604          	jrne	L61
 671  0152 a601          	ld	a,#1
 672  0154 2001          	jra	L02
 673  0156               L61:
 674  0156 4f            	clr	a
 675  0157               L02:
 676  0157 6b07          	ld	(OFST+0,sp),a
 678  0159               L502:
 679                     ; 142 			enableInterrupts();
 682  0159 9a            rim
 685  015a               L102:
 686                     ; 145 		if (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
 688  015a 4b20          	push	#32
 689  015c ae500a        	ldw	x,#20490
 690  015f cd0000        	call	_GPIO_ReadInputDataBit
 692  0162 5b01          	addw	sp,#1
 693  0164 4d            	tnz	a
 694  0165 2714          	jreq	L702
 695                     ; 148 			UART_Poll();
 697  0167 cd0000        	call	_UART_Poll
 699                     ; 149 			UART_2PC(tempResults, humResults);
 701  016a be16          	ldw	x,_humResults+2
 702  016c 89            	pushw	x
 703  016d be14          	ldw	x,_humResults
 704  016f 89            	pushw	x
 705  0170 be12          	ldw	x,_tempResults+2
 706  0172 89            	pushw	x
 707  0173 be10          	ldw	x,_tempResults
 708  0175 89            	pushw	x
 709  0176 cd0000        	call	_UART_2PC
 711  0179 5b08          	addw	sp,#8
 712  017b               L702:
 713                     ; 152 		switch (HMIStatePtr->outState)
 715  017b 92c61d        	ld	a,[_HMIStatePtr.w]
 717                     ; 243 			break;
 718  017e 4d            	tnz	a
 719  017f 2713          	jreq	L101
 720  0181 4a            	dec	a
 721  0182 2723          	jreq	L301
 722  0184 4a            	dec	a
 723  0185 272d          	jreq	L501
 724  0187 4a            	dec	a
 725  0188 2779          	jreq	L701
 726  018a 4a            	dec	a
 727  018b 2603          	jrne	L23
 728  018d cc0234        	jp	L111
 729  0190               L23:
 730  0190 ace000e0      	jpf	L571
 731  0194               L101:
 732                     ; 154 		case DISPLAY_DORMANT:
 732                     ; 155 			LCD_clear();
 734  0194 cd0000        	call	_LCD_clear
 736                     ; 157 			if (buttonPressed != 0)
 738  0197 3d1c          	tnz	_buttonPressed
 739  0199 2706          	jreq	L512
 740                     ; 158 				HMIStatePtr = HMIStatePtr->next;
 742  019b be1d          	ldw	x,_HMIStatePtr
 743  019d ee03          	ldw	x,(3,x)
 744  019f bf1d          	ldw	_HMIStatePtr,x
 745  01a1               L512:
 746                     ; 159 			buttonPressed = NO;
 748  01a1 3f1c          	clr	_buttonPressed
 749                     ; 161 			break;
 751  01a3 ace000e0      	jpf	L571
 752  01a7               L301:
 753                     ; 162 		case DISPLAY_WELCOME:
 753                     ; 163 			LCD_welcome();
 755  01a7 cd0000        	call	_LCD_welcome
 757                     ; 164 			HMIStatePtr = HMIStatePtr->next;
 759  01aa be1d          	ldw	x,_HMIStatePtr
 760  01ac ee03          	ldw	x,(3,x)
 761  01ae bf1d          	ldw	_HMIStatePtr,x
 762                     ; 166 			break;
 764  01b0 ace000e0      	jpf	L571
 765  01b4               L501:
 766                     ; 167 		case DISPLAY_HOME:
 766                     ; 168 
 766                     ; 169 			// Showing temp and humidity and menu option
 766                     ; 170 			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, TempIntResult, HumIntResult);
 768  01b4 be02          	ldw	x,_HumIntResult+2
 769  01b6 89            	pushw	x
 770  01b7 be00          	ldw	x,_HumIntResult
 771  01b9 89            	pushw	x
 772  01ba be0c          	ldw	x,_TempIntResult+2
 773  01bc 89            	pushw	x
 774  01bd be0a          	ldw	x,_TempIntResult
 775  01bf 89            	pushw	x
 776  01c0 b61b          	ld	a,_SRTC_TimeRead+3
 777  01c2 88            	push	a
 778  01c3 b61a          	ld	a,_SRTC_TimeRead+2
 779  01c5 88            	push	a
 780  01c6 b619          	ld	a,_SRTC_TimeRead+1
 781  01c8 88            	push	a
 782  01c9 b618          	ld	a,_SRTC_TimeRead
 783  01cb 88            	push	a
 784  01cc b617          	ld	a,_SRTC_DateRead+3
 785  01ce 88            	push	a
 786  01cf b616          	ld	a,_SRTC_DateRead+2
 787  01d1 88            	push	a
 788  01d2 b615          	ld	a,_SRTC_DateRead+1
 789  01d4 88            	push	a
 790  01d5 b614          	ld	a,_SRTC_DateRead
 791  01d7 88            	push	a
 792  01d8 cd0000        	call	_LCD_homescreen
 794  01db 5b10          	addw	sp,#16
 795                     ; 172 			if (buttonPressed == DOWN)
 797  01dd b61c          	ld	a,_buttonPressed
 798  01df a104          	cp	a,#4
 799  01e1 260b          	jrne	L712
 800                     ; 174 				HMIStatePtr = HMIStatePtr->next;
 802  01e3 be1d          	ldw	x,_HMIStatePtr
 803  01e5 ee03          	ldw	x,(3,x)
 804  01e7 bf1d          	ldw	_HMIStatePtr,x
 805                     ; 175 				LCD_clear();
 807  01e9 cd0000        	call	_LCD_clear
 810  01ec 200f          	jra	L122
 811  01ee               L712:
 812                     ; 177 			else if (buttonPressed == UP)
 814  01ee b61c          	ld	a,_buttonPressed
 815  01f0 a105          	cp	a,#5
 816  01f2 2609          	jrne	L122
 817                     ; 179 				HMIStatePtr = HMIStatePtr->previous;
 819  01f4 be1d          	ldw	x,_HMIStatePtr
 820  01f6 ee01          	ldw	x,(1,x)
 821  01f8 bf1d          	ldw	_HMIStatePtr,x
 822                     ; 180 				LCD_clear();
 824  01fa cd0000        	call	_LCD_clear
 826  01fd               L122:
 827                     ; 182 			buttonPressed = NO;
 829  01fd 3f1c          	clr	_buttonPressed
 830                     ; 183 			break;
 832  01ff ace000e0      	jpf	L571
 833  0203               L701:
 834                     ; 185 		case DISPLAY_MIN_MAX:
 834                     ; 186 			LCD_min_max(12, 14, 8, 90);
 836  0203 4b5a          	push	#90
 837  0205 4b08          	push	#8
 838  0207 ae0c0e        	ldw	x,#3086
 839  020a cd0000        	call	_LCD_min_max
 841  020d 85            	popw	x
 842                     ; 187 			if (buttonPressed == DOWN)
 844  020e b61c          	ld	a,_buttonPressed
 845  0210 a104          	cp	a,#4
 846  0212 260b          	jrne	L522
 847                     ; 189 				HMIStatePtr = HMIStatePtr->next;
 849  0214 be1d          	ldw	x,_HMIStatePtr
 850  0216 ee03          	ldw	x,(3,x)
 851  0218 bf1d          	ldw	_HMIStatePtr,x
 852                     ; 190 				LCD_clear();
 854  021a cd0000        	call	_LCD_clear
 857  021d 200f          	jra	L722
 858  021f               L522:
 859                     ; 192 			else if (buttonPressed == UP)
 861  021f b61c          	ld	a,_buttonPressed
 862  0221 a105          	cp	a,#5
 863  0223 2609          	jrne	L722
 864                     ; 194 				HMIStatePtr = HMIStatePtr->previous;
 866  0225 be1d          	ldw	x,_HMIStatePtr
 867  0227 ee01          	ldw	x,(1,x)
 868  0229 bf1d          	ldw	_HMIStatePtr,x
 869                     ; 195 				LCD_clear();
 871  022b cd0000        	call	_LCD_clear
 873  022e               L722:
 874                     ; 198 			buttonPressed = NO;
 876  022e 3f1c          	clr	_buttonPressed
 877                     ; 199 			break;
 879  0230 ace000e0      	jpf	L571
 880  0234               L111:
 881                     ; 200 		case DISPLAY_SETTINGS:
 881                     ; 201 			// Show settings to change frequency. Need to press ok to engage with screen
 881                     ; 202 
 881                     ; 203 			if (editMode == FALSE)
 883  0234 3d0f          	tnz	_editMode
 884  0236 2639          	jrne	L332
 885                     ; 205 				LCD_display_settings();
 887  0238 cd0000        	call	_LCD_display_settings
 889                     ; 206 				if (buttonPressed == DOWN)
 891  023b b61c          	ld	a,_buttonPressed
 892  023d a104          	cp	a,#4
 893  023f 260b          	jrne	L532
 894                     ; 208 					HMIStatePtr = HMIStatePtr->next;
 896  0241 be1d          	ldw	x,_HMIStatePtr
 897  0243 ee03          	ldw	x,(3,x)
 898  0245 bf1d          	ldw	_HMIStatePtr,x
 899                     ; 209 					LCD_clear();
 901  0247 cd0000        	call	_LCD_clear
 904  024a 200f          	jra	L732
 905  024c               L532:
 906                     ; 211 				else if (buttonPressed == UP)
 908  024c b61c          	ld	a,_buttonPressed
 909  024e a105          	cp	a,#5
 910  0250 2609          	jrne	L732
 911                     ; 213 					HMIStatePtr = HMIStatePtr->previous;
 913  0252 be1d          	ldw	x,_HMIStatePtr
 914  0254 ee01          	ldw	x,(1,x)
 915  0256 bf1d          	ldw	_HMIStatePtr,x
 916                     ; 214 					LCD_clear();
 918  0258 cd0000        	call	_LCD_clear
 920  025b               L732:
 921                     ; 216 				if (buttonPressed == OK)
 923  025b b61c          	ld	a,_buttonPressed
 924  025d a103          	cp	a,#3
 925  025f 263c          	jrne	L542
 926                     ; 218 					editMode = !editMode;
 928  0261 3d0f          	tnz	_editMode
 929  0263 2604          	jrne	L22
 930  0265 a601          	ld	a,#1
 931  0267 2001          	jra	L42
 932  0269               L22:
 933  0269 4f            	clr	a
 934  026a               L42:
 935  026a b70f          	ld	_editMode,a
 936                     ; 219 					LCD_clear();
 938  026c cd0000        	call	_LCD_clear
 940  026f 202c          	jra	L542
 941  0271               L332:
 942                     ; 225 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 944  0271 4b03          	push	#3
 945  0273 4b14          	push	#20
 946  0275 4b0a          	push	#10
 947  0277 ae0000        	ldw	x,#_settingMsg
 948  027a cd0000        	call	_LCD_writemsg
 950  027d 5b03          	addw	sp,#3
 951                     ; 227 				if (buttonPressed == DOWN)
 953  027f b61c          	ld	a,_buttonPressed
 954  0281 a104          	cp	a,#4
 955  0283 2704          	jreq	L152
 957                     ; 231 				else if (buttonPressed == UP)
 959  0285 b61c          	ld	a,_buttonPressed
 960  0287 a105          	cp	a,#5
 961  0289               L152:
 962                     ; 235 				if (buttonPressed == OK)
 964  0289 b61c          	ld	a,_buttonPressed
 965  028b a103          	cp	a,#3
 966  028d 260e          	jrne	L542
 967                     ; 237 					editMode = !editMode;
 969  028f 3d0f          	tnz	_editMode
 970  0291 2604          	jrne	L62
 971  0293 a601          	ld	a,#1
 972  0295 2001          	jra	L03
 973  0297               L62:
 974  0297 4f            	clr	a
 975  0298               L03:
 976  0298 b70f          	ld	_editMode,a
 977                     ; 238 					LCD_clear();
 979  029a cd0000        	call	_LCD_clear
 981  029d               L542:
 982                     ; 242 			buttonPressed = NO;
 984  029d 3f1c          	clr	_buttonPressed
 985                     ; 243 			break;
 987  029f ace000e0      	jpf	L571
 988  02a3               L312:
 990  02a3 ace000e0      	jpf	L571
1598                     	xdef	_main
1599                     	xdef	_clock
1600                     	switch	.ubsct
1601  0000               _HumIntResult:
1602  0000 00000000      	ds.b	4
1603                     	xdef	_HumIntResult
1604  0004               _HumReadingResult:
1605  0004 00000000      	ds.b	4
1606                     	xdef	_HumReadingResult
1607  0008               _HumRawResult:
1608  0008 0000          	ds.b	2
1609                     	xdef	_HumRawResult
1610  000a               _TempIntResult:
1611  000a 00000000      	ds.b	4
1612                     	xdef	_TempIntResult
1613  000e               _TempReadingResult:
1614  000e 00000000      	ds.b	4
1615                     	xdef	_TempReadingResult
1616  0012               _TempRawResult:
1617  0012 0000          	ds.b	2
1618                     	xdef	_TempRawResult
1619                     	xdef	_HDC2080
1620  0014               _SRTC_DateRead:
1621  0014 00000000      	ds.b	4
1622                     	xdef	_SRTC_DateRead
1623  0018               _SRTC_TimeRead:
1624  0018 00000000      	ds.b	4
1625                     	xdef	_SRTC_TimeRead
1626  001c               _buttonPressed:
1627  001c 00            	ds.b	1
1628                     	xdef	_buttonPressed
1629                     	xdef	_humResults
1630                     	xdef	_tempResults
1631                     	xdef	_editMode
1632                     	xdef	_settingMsg
1633                     	xref	_BTN_init
1634                     	xdef	_HMIFSM
1635  001d               _HMIStatePtr:
1636  001d 0000          	ds.b	2
1637                     	xdef	_HMIStatePtr
1638                     	xref	_HDC2080_tempToIntCelsius
1639                     	xref	_HDC2080_tempToFloatCelsius
1640                     	xref	_HDC2080_tempRead
1641                     	xref	_HDC2080_humToIntRelative
1642                     	xref	_HDC2080_humToFloatRelative
1643                     	xref	_HDC2080_humRead
1644                     	xref	_HDC2080_config
1645                     	xref	_UART_2PC
1646                     	xref	_UART_Poll
1647                     	xref	_UART_init
1648                     	xref	_RTC_init
1649                     	xref	_LCD_display_settings
1650                     	xref	_LCD_min_max
1651                     	xref	_LCD_homescreen
1652                     	xref	_LCD_welcome
1653                     	xref	_LCD_writemsg
1654                     	xref	_LCD_clear
1655                     	xref	_LCD_init
1656                     	xref	_SPI_init
1657                     	xref	_RTC_GetDate
1658                     	xref	_RTC_GetTime
1659                     	xref	_GPIO_ReadInputDataBit
1679                     	xref	c_rtol
1680                     	xref	c_lcmp
1681                     	xref	c_ltor
1682                     	xref	c_lgadc
1683                     	end
