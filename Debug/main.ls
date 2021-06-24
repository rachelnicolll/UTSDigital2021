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
 162  0010               _FINISH_READ_FLAG:
 163  0010 00            	dc.b	0
 164  0011               _tempResults:
 165  0011 41a99999      	dc.w	16809,-26215
 166  0015               _humResults:
 167  0015 42856666      	dc.w	17029,26214
 168  0019               _HMIFSM:
 169  0019 00            	dc.b	0
 170  001a 0019          	dc.w	_HMIFSM
 171  001c 001e          	dc.w	_HMIFSM+5
 172  001e 01            	dc.b	1
 173  001f 0019          	dc.w	_HMIFSM
 174  0021 0023          	dc.w	_HMIFSM+10
 175  0023 02            	dc.b	2
 176  0024 002d          	dc.w	_HMIFSM+20
 177  0026 0028          	dc.w	_HMIFSM+15
 178  0028 03            	dc.b	3
 179  0029 0023          	dc.w	_HMIFSM+10
 180  002b 002d          	dc.w	_HMIFSM+20
 181  002d 04            	dc.b	4
 182  002e 0028          	dc.w	_HMIFSM+15
 183  0030 0023          	dc.w	_HMIFSM+10
 184                     	switch	.const
 185  000a               _HDC2080:
 186  000a 0000          	dc.w	L3_HDC2080_state
 187                     	bsct
 188  0032               _LCD_Mode:
 189  0032 01            	dc.b	1
 218                     ; 56 unsigned int clock(void)
 218                     ; 57 {
 220                     	switch	.text
 221  0000               _clock:
 225                     ; 58 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
 227  0000 c652bf        	ld	a,21183
 228  0003 5f            	clrw	x
 229  0004 97            	ld	xl,a
 230  0005 c652c0        	ld	a,21184
 231  0008 02            	rlwa	x,a
 234  0009 81            	ret
 237                     	switch	.const
 238  000c               L57_rxBuf:
 239  000c 00            	dc.b	0
 240  000d 00            	ds.b	1
 241  000e               L77_txBuf:
 242  000e 00            	dc.b	0
 243  000f 00            	ds.b	1
 399                     	switch	.const
 400  0010               L01:
 401  0010 000001bc      	dc.l	444
 402                     ; 61 void main(void)
 402                     ; 62 {
 403                     	switch	.text
 404  000a               _main:
 406  000a 520b          	subw	sp,#11
 407       0000000b      OFST:	set	11
 410                     ; 64 	uint8_t cursorPos = 0;
 412                     ; 65 	bool toggleReading = TRUE;
 414  000c a601          	ld	a,#1
 415  000e 6b0b          	ld	(OFST+0,sp),a
 417                     ; 66 	uint8_t value = 5;
 419                     ; 67 	uint8_t rxBuf[2] = {0};
 421  0010 c6000c        	ld	a,L57_rxBuf
 422  0013 6b07          	ld	(OFST-4,sp),a
 423  0015 c6000d        	ld	a,L57_rxBuf+1
 424  0018 6b08          	ld	(OFST-3,sp),a
 425                     ; 68 	uint8_t txBuf[2] = {0};
 427  001a c6000e        	ld	a,L77_txBuf
 428  001d 6b09          	ld	(OFST-2,sp),a
 429  001f c6000f        	ld	a,L77_txBuf+1
 430  0022 6b0a          	ld	(OFST-1,sp),a
 431                     ; 70 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 433  0024 725f50c0      	clr	20672
 434                     ; 71 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 436  0028 c650c4        	ld	a,20676
 437  002b aaff          	or	a,#255
 438  002d c750c4        	ld	20676,a
 439                     ; 72 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 441  0030 c650c3        	ld	a,20675
 442  0033 aaff          	or	a,#255
 443  0035 c750c3        	ld	20675,a
 444                     ; 76 	TIM1->PSCRH = 0x3e; // 0011 1110
 446  0038 353e52c1      	mov	21185,#62
 447                     ; 77 	TIM1->PSCRL = 0x80; // 0111 0000
 449  003c 358052c2      	mov	21186,#128
 450                     ; 79 	TIM1->CR1 = TIM1_CR1_CEN;
 452  0040 350152b0      	mov	21168,#1
 453                     ; 80 	disableInterrupts();
 456  0044 9b            sim
 458                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 462  0045 ae0000        	ldw	x,#0
 463  0048 1f03          	ldw	(OFST-8,sp),x
 464  004a ae0000        	ldw	x,#0
 465  004d 1f01          	ldw	(OFST-10,sp),x
 467  004f               L571:
 468                     ; 14         _asm("nop");
 471  004f 9d            nop
 473                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 475  0050 96            	ldw	x,sp
 476  0051 1c0001        	addw	x,#OFST-10
 477  0054 a601          	ld	a,#1
 478  0056 cd0000        	call	c_lgadc
 483  0059 96            	ldw	x,sp
 484  005a 1c0001        	addw	x,#OFST-10
 485  005d cd0000        	call	c_ltor
 487  0060 ae0010        	ldw	x,#L01
 488  0063 cd0000        	call	c_lcmp
 490  0066 25e7          	jrult	L571
 491                     ; 84 	HDC2080_config(HDC2080);
 493  0068 ae0000        	ldw	x,#L3_HDC2080_state
 494  006b cd0000        	call	_HDC2080_config
 496                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 499  006e ae0000        	ldw	x,#0
 500  0071 1f03          	ldw	(OFST-8,sp),x
 501  0073 ae0000        	ldw	x,#0
 502  0076 1f01          	ldw	(OFST-10,sp),x
 504  0078               L302:
 505                     ; 14         _asm("nop");
 508  0078 9d            nop
 510                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 512  0079 96            	ldw	x,sp
 513  007a 1c0001        	addw	x,#OFST-10
 514  007d a601          	ld	a,#1
 515  007f cd0000        	call	c_lgadc
 520  0082 96            	ldw	x,sp
 521  0083 1c0001        	addw	x,#OFST-10
 522  0086 cd0000        	call	c_ltor
 524  0089 ae0010        	ldw	x,#L01
 525  008c cd0000        	call	c_lcmp
 527  008f 25e7          	jrult	L302
 528                     ; 87 	SPI_init();
 530  0091 cd0000        	call	_SPI_init
 532                     ; 89 	RTC_init();
 534  0094 cd0000        	call	_RTC_init
 536                     ; 91 	BTN_init();
 538  0097 cd0000        	call	_BTN_init
 540                     ; 93 	LCD_init();
 542  009a cd0000        	call	_LCD_init
 544                     ; 95 	UART_init();
 546  009d cd0000        	call	_UART_init
 548                     ; 97 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 550  00a0 ae0019        	ldw	x,#_HMIFSM
 551  00a3 bf1d          	ldw	_HMIStatePtr,x
 552                     ; 98 	enableInterrupts();
 555  00a5 9a            rim
 557                     ; 101 	RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 560  00a6 ae0018        	ldw	x,#_SRTC_TimeRead
 561  00a9 89            	pushw	x
 562  00aa 4f            	clr	a
 563  00ab cd0000        	call	_RTC_GetTime
 565  00ae 85            	popw	x
 566                     ; 103 	RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 568  00af ae0014        	ldw	x,#_SRTC_DateRead
 569  00b2 89            	pushw	x
 570  00b3 4f            	clr	a
 571  00b4 cd0000        	call	_RTC_GetDate
 573  00b7 85            	popw	x
 574                     ; 105 	disableInterrupts();
 577  00b8 9b            sim
 579                     ; 107 	TempRawResult = HDC2080_tempRead(HDC2080);
 582  00b9 ae0000        	ldw	x,#L3_HDC2080_state
 583  00bc cd0000        	call	_HDC2080_tempRead
 585  00bf bf12          	ldw	_TempRawResult,x
 586                     ; 108 	TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 588  00c1 be12          	ldw	x,_TempRawResult
 589  00c3 cd0000        	call	_HDC2080_tempToFloatCelsius
 591  00c6 ae000e        	ldw	x,#_TempReadingResult
 592  00c9 cd0000        	call	c_rtol
 594                     ; 109 	TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 596  00cc be12          	ldw	x,_TempRawResult
 597  00ce cd0000        	call	_HDC2080_tempToIntCelsius
 599  00d1 ae000a        	ldw	x,#_TempIntResult
 600  00d4 cd0000        	call	c_rtol
 602                     ; 111 	HumRawResult = HDC2080_humRead(HDC2080);
 604  00d7 ae0000        	ldw	x,#L3_HDC2080_state
 605  00da cd0000        	call	_HDC2080_humRead
 607  00dd bf08          	ldw	_HumRawResult,x
 608                     ; 112 	HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 610  00df be08          	ldw	x,_HumRawResult
 611  00e1 cd0000        	call	_HDC2080_humToFloatRelative
 613  00e4 ae0004        	ldw	x,#_HumReadingResult
 614  00e7 cd0000        	call	c_rtol
 616                     ; 113 	HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 618  00ea be08          	ldw	x,_HumRawResult
 619  00ec cd0000        	call	_HDC2080_humToIntRelative
 621  00ef ae0000        	ldw	x,#_HumIntResult
 622  00f2 cd0000        	call	c_rtol
 624                     ; 114 	enableInterrupts();
 627  00f5 9a            rim
 629  00f6               L112:
 630                     ; 120 		if (clock() % 1000 == 0)
 632  00f6 cd0000        	call	_clock
 634  00f9 90ae03e8      	ldw	y,#1000
 635  00fd 65            	divw	x,y
 636  00fe 51            	exgw	x,y
 637  00ff a30000        	cpw	x,#0
 638  0102 266c          	jrne	L512
 639                     ; 123 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 641  0104 ae0018        	ldw	x,#_SRTC_TimeRead
 642  0107 89            	pushw	x
 643  0108 4f            	clr	a
 644  0109 cd0000        	call	_RTC_GetTime
 646  010c 85            	popw	x
 647                     ; 125 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 649  010d ae0014        	ldw	x,#_SRTC_DateRead
 650  0110 89            	pushw	x
 651  0111 4f            	clr	a
 652  0112 cd0000        	call	_RTC_GetDate
 654  0115 85            	popw	x
 655                     ; 127 			disableInterrupts();
 658  0116 9b            sim
 660                     ; 129 			if (toggleReading)
 663  0117 0d0b          	tnz	(OFST+0,sp)
 664  0119 272b          	jreq	L712
 665                     ; 131 				TempRawResult = HDC2080_tempRead(HDC2080);
 667  011b ae0000        	ldw	x,#L3_HDC2080_state
 668  011e cd0000        	call	_HDC2080_tempRead
 670  0121 bf12          	ldw	_TempRawResult,x
 671                     ; 132 				TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 673  0123 be12          	ldw	x,_TempRawResult
 674  0125 cd0000        	call	_HDC2080_tempToFloatCelsius
 676  0128 ae000e        	ldw	x,#_TempReadingResult
 677  012b cd0000        	call	c_rtol
 679                     ; 133 				TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 681  012e be12          	ldw	x,_TempRawResult
 682  0130 cd0000        	call	_HDC2080_tempToIntCelsius
 684  0133 ae000a        	ldw	x,#_TempIntResult
 685  0136 cd0000        	call	c_rtol
 687                     ; 134 				toggleReading = !toggleReading;
 689  0139 0d0b          	tnz	(OFST+0,sp)
 690  013b 2604          	jrne	L21
 691  013d a601          	ld	a,#1
 692  013f 2001          	jra	L41
 693  0141               L21:
 694  0141 4f            	clr	a
 695  0142               L41:
 696  0142 6b0b          	ld	(OFST+0,sp),a
 699  0144 2029          	jra	L122
 700  0146               L712:
 701                     ; 138 				HumRawResult = HDC2080_humRead(HDC2080);
 703  0146 ae0000        	ldw	x,#L3_HDC2080_state
 704  0149 cd0000        	call	_HDC2080_humRead
 706  014c bf08          	ldw	_HumRawResult,x
 707                     ; 139 				HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 709  014e be08          	ldw	x,_HumRawResult
 710  0150 cd0000        	call	_HDC2080_humToFloatRelative
 712  0153 ae0004        	ldw	x,#_HumReadingResult
 713  0156 cd0000        	call	c_rtol
 715                     ; 140 				HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 717  0159 be08          	ldw	x,_HumRawResult
 718  015b cd0000        	call	_HDC2080_humToIntRelative
 720  015e ae0000        	ldw	x,#_HumIntResult
 721  0161 cd0000        	call	c_rtol
 723                     ; 141 				toggleReading = !toggleReading;
 725  0164 0d0b          	tnz	(OFST+0,sp)
 726  0166 2604          	jrne	L61
 727  0168 a601          	ld	a,#1
 728  016a 2001          	jra	L02
 729  016c               L61:
 730  016c 4f            	clr	a
 731  016d               L02:
 732  016d 6b0b          	ld	(OFST+0,sp),a
 734  016f               L122:
 735                     ; 144 			enableInterrupts();
 738  016f 9a            rim
 741  0170               L512:
 742                     ; 159 		if (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
 744  0170 4b20          	push	#32
 745  0172 ae500a        	ldw	x,#20490
 746  0175 cd0000        	call	_GPIO_ReadInputDataBit
 748  0178 5b01          	addw	sp,#1
 749  017a 4d            	tnz	a
 750  017b 2715          	jreq	L322
 751                     ; 161 			LCD_Mode = FALSE;
 753  017d 3f32          	clr	_LCD_Mode
 754                     ; 162 			UART_SendReading(TempReadingResult, HumReadingResult);
 756  017f be06          	ldw	x,_HumReadingResult+2
 757  0181 89            	pushw	x
 758  0182 be04          	ldw	x,_HumReadingResult
 759  0184 89            	pushw	x
 760  0185 be10          	ldw	x,_TempReadingResult+2
 761  0187 89            	pushw	x
 762  0188 be0e          	ldw	x,_TempReadingResult
 763  018a 89            	pushw	x
 764  018b cd0000        	call	_UART_SendReading
 766  018e 5b08          	addw	sp,#8
 768  0190 2004          	jra	L522
 769  0192               L322:
 770                     ; 165 			LCD_Mode = TRUE;
 772  0192 35010032      	mov	_LCD_Mode,#1
 773  0196               L522:
 774                     ; 167 		if (LCD_Mode)
 776  0196 3d32          	tnz	_LCD_Mode
 777  0198 2603          	jrne	L23
 778  019a cc00f6        	jp	L112
 779  019d               L23:
 780                     ; 170 			switch (HMIStatePtr->outState)
 782  019d 92c61d        	ld	a,[_HMIStatePtr.w]
 784                     ; 261 				break;
 785  01a0 4d            	tnz	a
 786  01a1 2713          	jreq	L501
 787  01a3 4a            	dec	a
 788  01a4 2723          	jreq	L701
 789  01a6 4a            	dec	a
 790  01a7 272d          	jreq	L111
 791  01a9 4a            	dec	a
 792  01aa 2779          	jreq	L311
 793  01ac 4a            	dec	a
 794  01ad 2603          	jrne	L43
 795  01af cc0256        	jp	L511
 796  01b2               L43:
 797  01b2 acf600f6      	jpf	L112
 798  01b6               L501:
 799                     ; 172 			case DISPLAY_DORMANT:
 799                     ; 173 				LCD_clear();
 801  01b6 cd0000        	call	_LCD_clear
 803                     ; 175 				if (buttonPressed != 0)
 805  01b9 3d1c          	tnz	_buttonPressed
 806  01bb 2706          	jreq	L532
 807                     ; 176 					HMIStatePtr = HMIStatePtr->next;
 809  01bd be1d          	ldw	x,_HMIStatePtr
 810  01bf ee03          	ldw	x,(3,x)
 811  01c1 bf1d          	ldw	_HMIStatePtr,x
 812  01c3               L532:
 813                     ; 177 				buttonPressed = NO;
 815  01c3 3f1c          	clr	_buttonPressed
 816                     ; 179 				break;
 818  01c5 acf600f6      	jpf	L112
 819  01c9               L701:
 820                     ; 180 			case DISPLAY_WELCOME:
 820                     ; 181 				LCD_welcome();
 822  01c9 cd0000        	call	_LCD_welcome
 824                     ; 182 				HMIStatePtr = HMIStatePtr->next;
 826  01cc be1d          	ldw	x,_HMIStatePtr
 827  01ce ee03          	ldw	x,(3,x)
 828  01d0 bf1d          	ldw	_HMIStatePtr,x
 829                     ; 184 				break;
 831  01d2 acf600f6      	jpf	L112
 832  01d6               L111:
 833                     ; 185 			case DISPLAY_HOME:
 833                     ; 186 
 833                     ; 187 				// Showing temp and humidity and menu option
 833                     ; 188 				LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, TempIntResult, HumIntResult);
 835  01d6 be02          	ldw	x,_HumIntResult+2
 836  01d8 89            	pushw	x
 837  01d9 be00          	ldw	x,_HumIntResult
 838  01db 89            	pushw	x
 839  01dc be0c          	ldw	x,_TempIntResult+2
 840  01de 89            	pushw	x
 841  01df be0a          	ldw	x,_TempIntResult
 842  01e1 89            	pushw	x
 843  01e2 b61b          	ld	a,_SRTC_TimeRead+3
 844  01e4 88            	push	a
 845  01e5 b61a          	ld	a,_SRTC_TimeRead+2
 846  01e7 88            	push	a
 847  01e8 b619          	ld	a,_SRTC_TimeRead+1
 848  01ea 88            	push	a
 849  01eb b618          	ld	a,_SRTC_TimeRead
 850  01ed 88            	push	a
 851  01ee b617          	ld	a,_SRTC_DateRead+3
 852  01f0 88            	push	a
 853  01f1 b616          	ld	a,_SRTC_DateRead+2
 854  01f3 88            	push	a
 855  01f4 b615          	ld	a,_SRTC_DateRead+1
 856  01f6 88            	push	a
 857  01f7 b614          	ld	a,_SRTC_DateRead
 858  01f9 88            	push	a
 859  01fa cd0000        	call	_LCD_homescreen
 861  01fd 5b10          	addw	sp,#16
 862                     ; 190 				if (buttonPressed == DOWN)
 864  01ff b61c          	ld	a,_buttonPressed
 865  0201 a104          	cp	a,#4
 866  0203 260b          	jrne	L732
 867                     ; 192 					HMIStatePtr = HMIStatePtr->next;
 869  0205 be1d          	ldw	x,_HMIStatePtr
 870  0207 ee03          	ldw	x,(3,x)
 871  0209 bf1d          	ldw	_HMIStatePtr,x
 872                     ; 193 					LCD_clear();
 874  020b cd0000        	call	_LCD_clear
 877  020e 200f          	jra	L142
 878  0210               L732:
 879                     ; 195 				else if (buttonPressed == UP)
 881  0210 b61c          	ld	a,_buttonPressed
 882  0212 a105          	cp	a,#5
 883  0214 2609          	jrne	L142
 884                     ; 197 					HMIStatePtr = HMIStatePtr->previous;
 886  0216 be1d          	ldw	x,_HMIStatePtr
 887  0218 ee01          	ldw	x,(1,x)
 888  021a bf1d          	ldw	_HMIStatePtr,x
 889                     ; 198 					LCD_clear();
 891  021c cd0000        	call	_LCD_clear
 893  021f               L142:
 894                     ; 200 				buttonPressed = NO;
 896  021f 3f1c          	clr	_buttonPressed
 897                     ; 201 				break;
 899  0221 acf600f6      	jpf	L112
 900  0225               L311:
 901                     ; 203 			case DISPLAY_MIN_MAX:
 901                     ; 204 				LCD_min_max(12, 14, 8, 90);
 903  0225 4b5a          	push	#90
 904  0227 4b08          	push	#8
 905  0229 ae0c0e        	ldw	x,#3086
 906  022c cd0000        	call	_LCD_min_max
 908  022f 85            	popw	x
 909                     ; 205 				if (buttonPressed == DOWN)
 911  0230 b61c          	ld	a,_buttonPressed
 912  0232 a104          	cp	a,#4
 913  0234 260b          	jrne	L542
 914                     ; 207 					HMIStatePtr = HMIStatePtr->next;
 916  0236 be1d          	ldw	x,_HMIStatePtr
 917  0238 ee03          	ldw	x,(3,x)
 918  023a bf1d          	ldw	_HMIStatePtr,x
 919                     ; 208 					LCD_clear();
 921  023c cd0000        	call	_LCD_clear
 924  023f 200f          	jra	L742
 925  0241               L542:
 926                     ; 210 				else if (buttonPressed == UP)
 928  0241 b61c          	ld	a,_buttonPressed
 929  0243 a105          	cp	a,#5
 930  0245 2609          	jrne	L742
 931                     ; 212 					HMIStatePtr = HMIStatePtr->previous;
 933  0247 be1d          	ldw	x,_HMIStatePtr
 934  0249 ee01          	ldw	x,(1,x)
 935  024b bf1d          	ldw	_HMIStatePtr,x
 936                     ; 213 					LCD_clear();
 938  024d cd0000        	call	_LCD_clear
 940  0250               L742:
 941                     ; 216 				buttonPressed = NO;
 943  0250 3f1c          	clr	_buttonPressed
 944                     ; 217 				break;
 946  0252 acf600f6      	jpf	L112
 947  0256               L511:
 948                     ; 218 			case DISPLAY_SETTINGS:
 948                     ; 219 				// Show settings to change frequency. Need to press ok to engage with screen
 948                     ; 220 
 948                     ; 221 				if (editMode == FALSE)
 950  0256 3d0f          	tnz	_editMode
 951  0258 2639          	jrne	L352
 952                     ; 223 					LCD_display_settings();
 954  025a cd0000        	call	_LCD_display_settings
 956                     ; 224 					if (buttonPressed == DOWN)
 958  025d b61c          	ld	a,_buttonPressed
 959  025f a104          	cp	a,#4
 960  0261 260b          	jrne	L552
 961                     ; 226 						HMIStatePtr = HMIStatePtr->next;
 963  0263 be1d          	ldw	x,_HMIStatePtr
 964  0265 ee03          	ldw	x,(3,x)
 965  0267 bf1d          	ldw	_HMIStatePtr,x
 966                     ; 227 						LCD_clear();
 968  0269 cd0000        	call	_LCD_clear
 971  026c 200f          	jra	L752
 972  026e               L552:
 973                     ; 229 					else if (buttonPressed == UP)
 975  026e b61c          	ld	a,_buttonPressed
 976  0270 a105          	cp	a,#5
 977  0272 2609          	jrne	L752
 978                     ; 231 						HMIStatePtr = HMIStatePtr->previous;
 980  0274 be1d          	ldw	x,_HMIStatePtr
 981  0276 ee01          	ldw	x,(1,x)
 982  0278 bf1d          	ldw	_HMIStatePtr,x
 983                     ; 232 						LCD_clear();
 985  027a cd0000        	call	_LCD_clear
 987  027d               L752:
 988                     ; 234 					if (buttonPressed == OK)
 990  027d b61c          	ld	a,_buttonPressed
 991  027f a103          	cp	a,#3
 992  0281 263c          	jrne	L562
 993                     ; 236 						editMode = !editMode;
 995  0283 3d0f          	tnz	_editMode
 996  0285 2604          	jrne	L22
 997  0287 a601          	ld	a,#1
 998  0289 2001          	jra	L42
 999  028b               L22:
1000  028b 4f            	clr	a
1001  028c               L42:
1002  028c b70f          	ld	_editMode,a
1003                     ; 237 						LCD_clear();
1005  028e cd0000        	call	_LCD_clear
1007  0291 202c          	jra	L562
1008  0293               L352:
1009                     ; 243 					LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
1011  0293 4b03          	push	#3
1012  0295 4b14          	push	#20
1013  0297 4b0a          	push	#10
1014  0299 ae0000        	ldw	x,#_settingMsg
1015  029c cd0000        	call	_LCD_writemsg
1017  029f 5b03          	addw	sp,#3
1018                     ; 245 					if (buttonPressed == DOWN)
1020  02a1 b61c          	ld	a,_buttonPressed
1021  02a3 a104          	cp	a,#4
1022  02a5 2704          	jreq	L172
1024                     ; 249 					else if (buttonPressed == UP)
1026  02a7 b61c          	ld	a,_buttonPressed
1027  02a9 a105          	cp	a,#5
1028  02ab               L172:
1029                     ; 253 					if (buttonPressed == OK)
1031  02ab b61c          	ld	a,_buttonPressed
1032  02ad a103          	cp	a,#3
1033  02af 260e          	jrne	L562
1034                     ; 255 						editMode = !editMode;
1036  02b1 3d0f          	tnz	_editMode
1037  02b3 2604          	jrne	L62
1038  02b5 a601          	ld	a,#1
1039  02b7 2001          	jra	L03
1040  02b9               L62:
1041  02b9 4f            	clr	a
1042  02ba               L03:
1043  02ba b70f          	ld	_editMode,a
1044                     ; 256 						LCD_clear();
1046  02bc cd0000        	call	_LCD_clear
1048  02bf               L562:
1049                     ; 260 				buttonPressed = NO;
1051  02bf 3f1c          	clr	_buttonPressed
1052                     ; 261 				break;
1054  02c1 acf600f6      	jpf	L112
1055  02c5               L332:
1056  02c5 acf600f6      	jpf	L112
1684                     	xdef	_main
1685                     	xdef	_clock
1686                     	xdef	_LCD_Mode
1687                     	switch	.ubsct
1688  0000               _HumIntResult:
1689  0000 00000000      	ds.b	4
1690                     	xdef	_HumIntResult
1691  0004               _HumReadingResult:
1692  0004 00000000      	ds.b	4
1693                     	xdef	_HumReadingResult
1694  0008               _HumRawResult:
1695  0008 0000          	ds.b	2
1696                     	xdef	_HumRawResult
1697  000a               _TempIntResult:
1698  000a 00000000      	ds.b	4
1699                     	xdef	_TempIntResult
1700  000e               _TempReadingResult:
1701  000e 00000000      	ds.b	4
1702                     	xdef	_TempReadingResult
1703  0012               _TempRawResult:
1704  0012 0000          	ds.b	2
1705                     	xdef	_TempRawResult
1706                     	xdef	_HDC2080
1707  0014               _SRTC_DateRead:
1708  0014 00000000      	ds.b	4
1709                     	xdef	_SRTC_DateRead
1710  0018               _SRTC_TimeRead:
1711  0018 00000000      	ds.b	4
1712                     	xdef	_SRTC_TimeRead
1713  001c               _buttonPressed:
1714  001c 00            	ds.b	1
1715                     	xdef	_buttonPressed
1716                     	xdef	_humResults
1717                     	xdef	_tempResults
1718                     	xdef	_FINISH_READ_FLAG
1719                     	xdef	_editMode
1720                     	xdef	_settingMsg
1721                     	xref	_BTN_init
1722                     	xdef	_HMIFSM
1723  001d               _HMIStatePtr:
1724  001d 0000          	ds.b	2
1725                     	xdef	_HMIStatePtr
1726                     	xref	_HDC2080_tempToIntCelsius
1727                     	xref	_HDC2080_tempToFloatCelsius
1728                     	xref	_HDC2080_tempRead
1729                     	xref	_HDC2080_humToIntRelative
1730                     	xref	_HDC2080_humToFloatRelative
1731                     	xref	_HDC2080_humRead
1732                     	xref	_HDC2080_config
1733                     	xref	_UART_SendReading
1734                     	xref	_UART_init
1735                     	xref	_RTC_init
1736                     	xref	_LCD_display_settings
1737                     	xref	_LCD_min_max
1738                     	xref	_LCD_homescreen
1739                     	xref	_LCD_welcome
1740                     	xref	_LCD_writemsg
1741                     	xref	_LCD_clear
1742                     	xref	_LCD_init
1743                     	xref	_SPI_init
1744                     	xref	_RTC_GetDate
1745                     	xref	_RTC_GetTime
1746                     	xref	_GPIO_ReadInputDataBit
1766                     	xref	c_rtol
1767                     	xref	c_lcmp
1768                     	xref	c_ltor
1769                     	xref	c_lgadc
1770                     	end
