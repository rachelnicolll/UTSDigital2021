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
 160  000f               _FINISH_READ_FLAG:
 161  000f 00            	dc.b	0
 162  0010               _tempResults:
 163  0010 41a99999      	dc.w	16809,-26215
 164  0014               _humResults:
 165  0014 42856666      	dc.w	17029,26214
 166  0018               _editMode:
 167  0018 00            	dc.b	0
 168  0019               _LCDUpdated:
 169  0019 01            	dc.b	1
 170  001a               _HMIFSM:
 171  001a 00            	dc.b	0
 172  001b 001a          	dc.w	_HMIFSM
 173  001d 001f          	dc.w	_HMIFSM+5
 174  001f 01            	dc.b	1
 175  0020 001a          	dc.w	_HMIFSM
 176  0022 0024          	dc.w	_HMIFSM+10
 177  0024 02            	dc.b	2
 178  0025 0029          	dc.w	_HMIFSM+15
 179  0027 0029          	dc.w	_HMIFSM+15
 180  0029 03            	dc.b	3
 181  002a 0024          	dc.w	_HMIFSM+10
 182  002c 0024          	dc.w	_HMIFSM+10
 183                     	switch	.const
 184  000a               _HDC2080:
 185  000a 0000          	dc.w	L3_HDC2080_state
 186                     	bsct
 187  002e               _LCD_Mode:
 188  002e 01            	dc.b	1
 217                     ; 57 unsigned int clock(void)
 217                     ; 58 {
 219                     	switch	.text
 220  0000               _clock:
 224                     ; 59 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
 226  0000 c652bf        	ld	a,21183
 227  0003 5f            	clrw	x
 228  0004 97            	ld	xl,a
 229  0005 c652c0        	ld	a,21184
 230  0008 02            	rlwa	x,a
 233  0009 81            	ret
 236                     	switch	.const
 237  000c               L57_rxBuf:
 238  000c 00            	dc.b	0
 239  000d 00            	ds.b	1
 240  000e               L77_txBuf:
 241  000e 00            	dc.b	0
 242  000f 00            	ds.b	1
 243  0010               L101_maxReadings:
 244  0010 00            	dc.b	0
 245  0011 00            	dc.b	0
 431                     	switch	.const
 432  0012               L01:
 433  0012 000001bc      	dc.l	444
 434                     ; 62 void main(void)
 434                     ; 63 {
 435                     	switch	.text
 436  000a               _main:
 438  000a 520f          	subw	sp,#15
 439       0000000f      OFST:	set	15
 442                     ; 65 	uint8_t cursorPos = 0;
 444                     ; 66 	bool toggleReading = TRUE;
 446  000c a601          	ld	a,#1
 447  000e 6b0f          	ld	(OFST+0,sp),a
 449                     ; 67 	uint8_t value = 5;
 451                     ; 68 	uint8_t rxBuf[2] = {0};
 453  0010 c6000c        	ld	a,L57_rxBuf
 454  0013 6b09          	ld	(OFST-6,sp),a
 455  0015 c6000d        	ld	a,L57_rxBuf+1
 456  0018 6b0a          	ld	(OFST-5,sp),a
 457                     ; 69 	uint8_t txBuf[2] = {0};
 459  001a c6000e        	ld	a,L77_txBuf
 460  001d 6b0b          	ld	(OFST-4,sp),a
 461  001f c6000f        	ld	a,L77_txBuf+1
 462  0022 6b0c          	ld	(OFST-3,sp),a
 463                     ; 71 	HDC2080_MaxReading maxReadings = {0, 0};
 465  0024 c60010        	ld	a,L101_maxReadings
 466  0027 6b0d          	ld	(OFST-2,sp),a
 467  0029 c60011        	ld	a,L101_maxReadings+1
 468  002c 6b0e          	ld	(OFST-1,sp),a
 469                     ; 73 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 471  002e 725f50c0      	clr	20672
 472                     ; 74 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 474  0032 c650c4        	ld	a,20676
 475  0035 aaff          	or	a,#255
 476  0037 c750c4        	ld	20676,a
 477                     ; 75 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 479  003a c650c3        	ld	a,20675
 480  003d aaff          	or	a,#255
 481  003f c750c3        	ld	20675,a
 482                     ; 79 	TIM1->PSCRH = 0x3e; // 0011 1110
 484  0042 353e52c1      	mov	21185,#62
 485                     ; 80 	TIM1->PSCRL = 0x80; // 0111 0000
 487  0046 358052c2      	mov	21186,#128
 488                     ; 82 	TIM1->CR1 = TIM1_CR1_CEN;
 490  004a 350152b0      	mov	21168,#1
 491                     ; 83 	disableInterrupts();
 494  004e 9b            sim
 496                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 500  004f ae0000        	ldw	x,#0
 501  0052 1f05          	ldw	(OFST-10,sp),x
 502  0054 ae0000        	ldw	x,#0
 503  0057 1f03          	ldw	(OFST-12,sp),x
 505  0059               L112:
 506                     ; 14         _asm("nop");
 509  0059 9d            nop
 511                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 513  005a 96            	ldw	x,sp
 514  005b 1c0003        	addw	x,#OFST-12
 515  005e a601          	ld	a,#1
 516  0060 cd0000        	call	c_lgadc
 521  0063 96            	ldw	x,sp
 522  0064 1c0003        	addw	x,#OFST-12
 523  0067 cd0000        	call	c_ltor
 525  006a ae0012        	ldw	x,#L01
 526  006d cd0000        	call	c_lcmp
 528  0070 25e7          	jrult	L112
 529                     ; 87 	HDC2080_config(HDC2080);
 531  0072 ae0000        	ldw	x,#L3_HDC2080_state
 532  0075 cd0000        	call	_HDC2080_config
 534                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 537  0078 ae0000        	ldw	x,#0
 538  007b 1f05          	ldw	(OFST-10,sp),x
 539  007d ae0000        	ldw	x,#0
 540  0080 1f03          	ldw	(OFST-12,sp),x
 542  0082               L712:
 543                     ; 14         _asm("nop");
 546  0082 9d            nop
 548                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 550  0083 96            	ldw	x,sp
 551  0084 1c0003        	addw	x,#OFST-12
 552  0087 a601          	ld	a,#1
 553  0089 cd0000        	call	c_lgadc
 558  008c 96            	ldw	x,sp
 559  008d 1c0003        	addw	x,#OFST-12
 560  0090 cd0000        	call	c_ltor
 562  0093 ae0012        	ldw	x,#L01
 563  0096 cd0000        	call	c_lcmp
 565  0099 25e7          	jrult	L712
 566                     ; 90 	SPI_init();
 568  009b cd0000        	call	_SPI_init
 570                     ; 92 	RTC_init();
 572  009e cd0000        	call	_RTC_init
 574                     ; 94 	BTN_init();
 576  00a1 cd0000        	call	_BTN_init
 578                     ; 96 	LCD_init();
 580  00a4 cd0000        	call	_LCD_init
 582                     ; 98 	UART_init();
 584  00a7 cd0000        	call	_UART_init
 586                     ; 100 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 588  00aa ae001a        	ldw	x,#_HMIFSM
 589  00ad bf1f          	ldw	_HMIStatePtr,x
 590                     ; 101 	enableInterrupts();
 593  00af 9a            rim
 595                     ; 104 	RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 598  00b0 ae0018        	ldw	x,#_SRTC_TimeRead
 599  00b3 89            	pushw	x
 600  00b4 4f            	clr	a
 601  00b5 cd0000        	call	_RTC_GetTime
 603  00b8 85            	popw	x
 604                     ; 106 	RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 606  00b9 ae0014        	ldw	x,#_SRTC_DateRead
 607  00bc 89            	pushw	x
 608  00bd 4f            	clr	a
 609  00be cd0000        	call	_RTC_GetDate
 611  00c1 85            	popw	x
 612                     ; 108 	disableInterrupts();
 615  00c2 9b            sim
 617                     ; 110 	TempRawResult = HDC2080_tempRead(HDC2080);
 620  00c3 ae0000        	ldw	x,#L3_HDC2080_state
 621  00c6 cd0000        	call	_HDC2080_tempRead
 623  00c9 bf12          	ldw	_TempRawResult,x
 624                     ; 111 	TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 626  00cb be12          	ldw	x,_TempRawResult
 627  00cd cd0000        	call	_HDC2080_tempToFloatCelsius
 629  00d0 ae000e        	ldw	x,#_TempReadingResult
 630  00d3 cd0000        	call	c_rtol
 632                     ; 112 	TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 634  00d6 be12          	ldw	x,_TempRawResult
 635  00d8 cd0000        	call	_HDC2080_tempToIntCelsius
 637  00db ae000a        	ldw	x,#_TempIntResult
 638  00de cd0000        	call	c_rtol
 640                     ; 114 	HumRawResult = HDC2080_humRead(HDC2080);
 642  00e1 ae0000        	ldw	x,#L3_HDC2080_state
 643  00e4 cd0000        	call	_HDC2080_humRead
 645  00e7 bf08          	ldw	_HumRawResult,x
 646                     ; 115 	HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 648  00e9 be08          	ldw	x,_HumRawResult
 649  00eb cd0000        	call	_HDC2080_humToFloatRelative
 651  00ee ae0004        	ldw	x,#_HumReadingResult
 652  00f1 cd0000        	call	c_rtol
 654                     ; 116 	HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 656  00f4 be08          	ldw	x,_HumRawResult
 657  00f6 cd0000        	call	_HDC2080_humToIntRelative
 659  00f9 ae0000        	ldw	x,#_HumIntResult
 660  00fc cd0000        	call	c_rtol
 662                     ; 117 	enableInterrupts();
 665  00ff 9a            rim
 667  0100               L522:
 668                     ; 123 		if (clock() % 1000 == 0)
 670  0100 cd0000        	call	_clock
 672  0103 90ae03e8      	ldw	y,#1000
 673  0107 65            	divw	x,y
 674  0108 51            	exgw	x,y
 675  0109 a30000        	cpw	x,#0
 676  010c 266c          	jrne	L132
 677                     ; 126 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 679  010e ae0018        	ldw	x,#_SRTC_TimeRead
 680  0111 89            	pushw	x
 681  0112 4f            	clr	a
 682  0113 cd0000        	call	_RTC_GetTime
 684  0116 85            	popw	x
 685                     ; 128 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 687  0117 ae0014        	ldw	x,#_SRTC_DateRead
 688  011a 89            	pushw	x
 689  011b 4f            	clr	a
 690  011c cd0000        	call	_RTC_GetDate
 692  011f 85            	popw	x
 693                     ; 130 			disableInterrupts();
 696  0120 9b            sim
 698                     ; 132 			if (toggleReading)
 701  0121 0d0f          	tnz	(OFST+0,sp)
 702  0123 272b          	jreq	L332
 703                     ; 134 				TempRawResult = HDC2080_tempRead(HDC2080);
 705  0125 ae0000        	ldw	x,#L3_HDC2080_state
 706  0128 cd0000        	call	_HDC2080_tempRead
 708  012b bf12          	ldw	_TempRawResult,x
 709                     ; 135 				TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 711  012d be12          	ldw	x,_TempRawResult
 712  012f cd0000        	call	_HDC2080_tempToFloatCelsius
 714  0132 ae000e        	ldw	x,#_TempReadingResult
 715  0135 cd0000        	call	c_rtol
 717                     ; 136 				TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 719  0138 be12          	ldw	x,_TempRawResult
 720  013a cd0000        	call	_HDC2080_tempToIntCelsius
 722  013d ae000a        	ldw	x,#_TempIntResult
 723  0140 cd0000        	call	c_rtol
 725                     ; 137 				toggleReading = !toggleReading;
 727  0143 0d0f          	tnz	(OFST+0,sp)
 728  0145 2604          	jrne	L21
 729  0147 a601          	ld	a,#1
 730  0149 2001          	jra	L41
 731  014b               L21:
 732  014b 4f            	clr	a
 733  014c               L41:
 734  014c 6b0f          	ld	(OFST+0,sp),a
 737  014e 2029          	jra	L532
 738  0150               L332:
 739                     ; 141 				HumRawResult = HDC2080_humRead(HDC2080);
 741  0150 ae0000        	ldw	x,#L3_HDC2080_state
 742  0153 cd0000        	call	_HDC2080_humRead
 744  0156 bf08          	ldw	_HumRawResult,x
 745                     ; 142 				HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 747  0158 be08          	ldw	x,_HumRawResult
 748  015a cd0000        	call	_HDC2080_humToFloatRelative
 750  015d ae0004        	ldw	x,#_HumReadingResult
 751  0160 cd0000        	call	c_rtol
 753                     ; 143 				HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 755  0163 be08          	ldw	x,_HumRawResult
 756  0165 cd0000        	call	_HDC2080_humToIntRelative
 758  0168 ae0000        	ldw	x,#_HumIntResult
 759  016b cd0000        	call	c_rtol
 761                     ; 144 				toggleReading = !toggleReading;
 763  016e 0d0f          	tnz	(OFST+0,sp)
 764  0170 2604          	jrne	L61
 765  0172 a601          	ld	a,#1
 766  0174 2001          	jra	L02
 767  0176               L61:
 768  0176 4f            	clr	a
 769  0177               L02:
 770  0177 6b0f          	ld	(OFST+0,sp),a
 772  0179               L532:
 773                     ; 147 			enableInterrupts();
 776  0179 9a            rim
 779  017a               L132:
 780                     ; 163 		if (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
 782  017a 4b20          	push	#32
 783  017c ae500a        	ldw	x,#20490
 784  017f cd0000        	call	_GPIO_ReadInputDataBit
 786  0182 5b01          	addw	sp,#1
 787  0184 4d            	tnz	a
 788  0185 2715          	jreq	L732
 789                     ; 165 			LCD_Mode = FALSE;
 791  0187 3f2e          	clr	_LCD_Mode
 792                     ; 166 			UART_SendReading(TempReadingResult, HumReadingResult);
 794  0189 be06          	ldw	x,_HumReadingResult+2
 795  018b 89            	pushw	x
 796  018c be04          	ldw	x,_HumReadingResult
 797  018e 89            	pushw	x
 798  018f be10          	ldw	x,_TempReadingResult+2
 799  0191 89            	pushw	x
 800  0192 be0e          	ldw	x,_TempReadingResult
 801  0194 89            	pushw	x
 802  0195 cd0000        	call	_UART_SendReading
 804  0198 5b08          	addw	sp,#8
 806  019a 2004          	jra	L142
 807  019c               L732:
 808                     ; 169 			LCD_Mode = TRUE;
 810  019c 3501002e      	mov	_LCD_Mode,#1
 811  01a0               L142:
 812                     ; 171 		if (LCD_Mode)
 814  01a0 3d2e          	tnz	_LCD_Mode
 815  01a2 2603          	jrne	L22
 816  01a4 cc0100        	jp	L522
 817  01a7               L22:
 818                     ; 175 			if (buttonPressed == BACK)
 820  01a7 b61c          	ld	a,_buttonPressed
 821  01a9 a102          	cp	a,#2
 822  01ab 2618          	jrne	L542
 823                     ; 177 				LCD_clear();
 825  01ad cd0000        	call	_LCD_clear
 827                     ; 178 				LCD_writemsg("Sleeping...", sizeof("Sleeping..."), 10, 3);
 829  01b0 4b03          	push	#3
 830  01b2 4b0a          	push	#10
 831  01b4 4b0c          	push	#12
 832  01b6 ae0016        	ldw	x,#L742
 833  01b9 cd0000        	call	_LCD_writemsg
 835  01bc 5b03          	addw	sp,#3
 836                     ; 179 				HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 838  01be ae001a        	ldw	x,#_HMIFSM
 839  01c1 bf1f          	ldw	_HMIStatePtr,x
 840                     ; 180 				buttonPressed = NO;
 842  01c3 3f1c          	clr	_buttonPressed
 843  01c5               L542:
 844                     ; 183 			switch (HMIStatePtr->outState)
 846  01c5 92c61f        	ld	a,[_HMIStatePtr.w]
 848                     ; 235 				break;
 849  01c8 4d            	tnz	a
 850  01c9 270d          	jreq	L701
 851  01cb 4a            	dec	a
 852  01cc 271d          	jreq	L111
 853  01ce 4a            	dec	a
 854  01cf 2727          	jreq	L311
 855  01d1 4a            	dec	a
 856  01d2 2773          	jreq	L511
 857  01d4 ac000100      	jpf	L522
 858  01d8               L701:
 859                     ; 185 			case DISPLAY_DORMANT:
 859                     ; 186 				LCD_clear();
 861  01d8 cd0000        	call	_LCD_clear
 863                     ; 188 				if (buttonPressed != 0)
 865  01db 3d1c          	tnz	_buttonPressed
 866  01dd 2706          	jreq	L552
 867                     ; 189 					HMIStatePtr = HMIStatePtr->next;
 869  01df be1f          	ldw	x,_HMIStatePtr
 870  01e1 ee03          	ldw	x,(3,x)
 871  01e3 bf1f          	ldw	_HMIStatePtr,x
 872  01e5               L552:
 873                     ; 190 				buttonPressed = NO;
 875  01e5 3f1c          	clr	_buttonPressed
 876                     ; 192 				break;
 878  01e7 ac000100      	jpf	L522
 879  01eb               L111:
 880                     ; 194 			case DISPLAY_WELCOME:
 880                     ; 195 				LCD_welcome();
 882  01eb cd0000        	call	_LCD_welcome
 884                     ; 196 				HMIStatePtr = HMIStatePtr->next;
 886  01ee be1f          	ldw	x,_HMIStatePtr
 887  01f0 ee03          	ldw	x,(3,x)
 888  01f2 bf1f          	ldw	_HMIStatePtr,x
 889                     ; 198 				break;
 891  01f4 ac000100      	jpf	L522
 892  01f8               L311:
 893                     ; 200 			case DISPLAY_HOME:
 893                     ; 201 				// Showing temp and humidity and menu option
 893                     ; 202 				LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, TempIntResult, HumIntResult);
 895  01f8 be02          	ldw	x,_HumIntResult+2
 896  01fa 89            	pushw	x
 897  01fb be00          	ldw	x,_HumIntResult
 898  01fd 89            	pushw	x
 899  01fe be0c          	ldw	x,_TempIntResult+2
 900  0200 89            	pushw	x
 901  0201 be0a          	ldw	x,_TempIntResult
 902  0203 89            	pushw	x
 903  0204 b61b          	ld	a,_SRTC_TimeRead+3
 904  0206 88            	push	a
 905  0207 b61a          	ld	a,_SRTC_TimeRead+2
 906  0209 88            	push	a
 907  020a b619          	ld	a,_SRTC_TimeRead+1
 908  020c 88            	push	a
 909  020d b618          	ld	a,_SRTC_TimeRead
 910  020f 88            	push	a
 911  0210 b617          	ld	a,_SRTC_DateRead+3
 912  0212 88            	push	a
 913  0213 b616          	ld	a,_SRTC_DateRead+2
 914  0215 88            	push	a
 915  0216 b615          	ld	a,_SRTC_DateRead+1
 916  0218 88            	push	a
 917  0219 b614          	ld	a,_SRTC_DateRead
 918  021b 88            	push	a
 919  021c cd0000        	call	_LCD_homescreen
 921  021f 5b10          	addw	sp,#16
 922                     ; 204 				if (buttonPressed == DOWN)
 924  0221 b61c          	ld	a,_buttonPressed
 925  0223 a104          	cp	a,#4
 926  0225 260b          	jrne	L752
 927                     ; 206 					HMIStatePtr = HMIStatePtr->next;
 929  0227 be1f          	ldw	x,_HMIStatePtr
 930  0229 ee03          	ldw	x,(3,x)
 931  022b bf1f          	ldw	_HMIStatePtr,x
 932                     ; 207 					LCD_clear();
 934  022d cd0000        	call	_LCD_clear
 937  0230 200f          	jra	L162
 938  0232               L752:
 939                     ; 209 				else if (buttonPressed == UP)
 941  0232 b61c          	ld	a,_buttonPressed
 942  0234 a105          	cp	a,#5
 943  0236 2609          	jrne	L162
 944                     ; 211 					HMIStatePtr = HMIStatePtr->previous;
 946  0238 be1f          	ldw	x,_HMIStatePtr
 947  023a ee01          	ldw	x,(1,x)
 948  023c bf1f          	ldw	_HMIStatePtr,x
 949                     ; 212 					LCD_clear();
 951  023e cd0000        	call	_LCD_clear
 953  0241               L162:
 954                     ; 214 				buttonPressed = NO;
 956  0241 3f1c          	clr	_buttonPressed
 957                     ; 215 				break;
 959  0243 ac000100      	jpf	L522
 960  0247               L511:
 961                     ; 217 			case DISPLAY_MIN_MAX:
 961                     ; 218 				//get max
 961                     ; 219 				MaxReadings = HDC2080_maxReads(HDC2080);
 963  0247 ae0000        	ldw	x,#L3_HDC2080_state
 964  024a cd0000        	call	_HDC2080_maxReads
 966  024d bf1d          	ldw	_MaxReadings,x
 967                     ; 220 				LCD_min_max(HDC2080_tempToFloatCelsius((uint16_t)maxReadings.tempMax), HDC2080_humToIntRelative((uint16_t)maxReadings.humMax));
 969  024f 7b0e          	ld	a,(OFST-1,sp)
 970  0251 5f            	clrw	x
 971  0252 97            	ld	xl,a
 972  0253 cd0000        	call	_HDC2080_humToIntRelative
 974  0256 cd0000        	call	c_ultof
 976  0259 be02          	ldw	x,c_lreg+2
 977  025b 89            	pushw	x
 978  025c be00          	ldw	x,c_lreg
 979  025e 89            	pushw	x
 980  025f 7b11          	ld	a,(OFST+2,sp)
 981  0261 5f            	clrw	x
 982  0262 97            	ld	xl,a
 983  0263 cd0000        	call	_HDC2080_tempToFloatCelsius
 985  0266 be02          	ldw	x,c_lreg+2
 986  0268 89            	pushw	x
 987  0269 be00          	ldw	x,c_lreg
 988  026b 89            	pushw	x
 989  026c cd0000        	call	_LCD_min_max
 991  026f 5b08          	addw	sp,#8
 992                     ; 222 				if (buttonPressed == DOWN)
 994  0271 b61c          	ld	a,_buttonPressed
 995  0273 a104          	cp	a,#4
 996  0275 260b          	jrne	L562
 997                     ; 224 					HMIStatePtr = HMIStatePtr->next;
 999  0277 be1f          	ldw	x,_HMIStatePtr
1000  0279 ee03          	ldw	x,(3,x)
1001  027b bf1f          	ldw	_HMIStatePtr,x
1002                     ; 225 					LCD_clear();
1004  027d cd0000        	call	_LCD_clear
1007  0280 200f          	jra	L762
1008  0282               L562:
1009                     ; 227 				else if (buttonPressed == UP)
1011  0282 b61c          	ld	a,_buttonPressed
1012  0284 a105          	cp	a,#5
1013  0286 2609          	jrne	L762
1014                     ; 229 					HMIStatePtr = HMIStatePtr->previous;
1016  0288 be1f          	ldw	x,_HMIStatePtr
1017  028a ee01          	ldw	x,(1,x)
1018  028c bf1f          	ldw	_HMIStatePtr,x
1019                     ; 230 					LCD_clear();
1021  028e cd0000        	call	_LCD_clear
1023  0291               L762:
1024                     ; 233 				buttonPressed = NO;
1026  0291 3f1c          	clr	_buttonPressed
1027                     ; 235 				break;
1029  0293 ac000100      	jpf	L522
1030  0297               L352:
1031  0297 ac000100      	jpf	L522
1665                     	xdef	_main
1666                     	xdef	_clock
1667                     	xdef	_LCD_Mode
1668                     	switch	.ubsct
1669  0000               _HumIntResult:
1670  0000 00000000      	ds.b	4
1671                     	xdef	_HumIntResult
1672  0004               _HumReadingResult:
1673  0004 00000000      	ds.b	4
1674                     	xdef	_HumReadingResult
1675  0008               _HumRawResult:
1676  0008 0000          	ds.b	2
1677                     	xdef	_HumRawResult
1678  000a               _TempIntResult:
1679  000a 00000000      	ds.b	4
1680                     	xdef	_TempIntResult
1681  000e               _TempReadingResult:
1682  000e 00000000      	ds.b	4
1683                     	xdef	_TempReadingResult
1684  0012               _TempRawResult:
1685  0012 0000          	ds.b	2
1686                     	xdef	_TempRawResult
1687                     	xdef	_HDC2080
1688  0014               _SRTC_DateRead:
1689  0014 00000000      	ds.b	4
1690                     	xdef	_SRTC_DateRead
1691  0018               _SRTC_TimeRead:
1692  0018 00000000      	ds.b	4
1693                     	xdef	_SRTC_TimeRead
1694                     	xdef	_LCDUpdated
1695                     	xdef	_editMode
1696  001c               _buttonPressed:
1697  001c 00            	ds.b	1
1698                     	xdef	_buttonPressed
1699  001d               _MaxReadings:
1700  001d 0000          	ds.b	2
1701                     	xdef	_MaxReadings
1702                     	xdef	_humResults
1703                     	xdef	_tempResults
1704                     	xdef	_FINISH_READ_FLAG
1705                     	xdef	_settingMsg
1706                     	xref	_BTN_init
1707                     	xdef	_HMIFSM
1708  001f               _HMIStatePtr:
1709  001f 0000          	ds.b	2
1710                     	xdef	_HMIStatePtr
1711                     	xref	_HDC2080_maxReads
1712                     	xref	_HDC2080_tempToIntCelsius
1713                     	xref	_HDC2080_tempToFloatCelsius
1714                     	xref	_HDC2080_tempRead
1715                     	xref	_HDC2080_humToIntRelative
1716                     	xref	_HDC2080_humToFloatRelative
1717                     	xref	_HDC2080_humRead
1718                     	xref	_HDC2080_config
1719                     	xref	_UART_SendReading
1720                     	xref	_UART_init
1721                     	xref	_RTC_init
1722                     	xref	_LCD_min_max
1723                     	xref	_LCD_homescreen
1724                     	xref	_LCD_welcome
1725                     	xref	_LCD_writemsg
1726                     	xref	_LCD_clear
1727                     	xref	_LCD_init
1728                     	xref	_SPI_init
1729                     	xref	_RTC_GetDate
1730                     	xref	_RTC_GetTime
1731                     	xref	_GPIO_ReadInputDataBit
1732                     	switch	.const
1733  0016               L742:
1734  0016 536c65657069  	dc.b	"Sleeping...",0
1735                     	xref.b	c_lreg
1755                     	xref	c_ultof
1756                     	xref	c_rtol
1757                     	xref	c_lcmp
1758                     	xref	c_ltor
1759                     	xref	c_lgadc
1760                     	end
