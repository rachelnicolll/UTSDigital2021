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
 156                     	bsct
 157  000f               L75_EEPROM_state:
 158  000f 00            	dc.b	0
 159  0010 50            	dc.b	80
 211                     .const:	section	.text
 212  0000               _settingMsg:
 213  0000 456469746162  	dc.b	"Editable!",0
 214                     	bsct
 215  0011               _editMode:
 216  0011 00            	dc.b	0
 217  0012               _tempResults:
 218  0012 41a99999      	dc.w	16809,-26215
 219  0016               _humResults:
 220  0016 42856666      	dc.w	17029,26214
 221  001a               _HMIFSM:
 222  001a 00            	dc.b	0
 223  001b 001a          	dc.w	_HMIFSM
 224  001d 001f          	dc.w	_HMIFSM+5
 225  001f 01            	dc.b	1
 226  0020 001a          	dc.w	_HMIFSM
 227  0022 0024          	dc.w	_HMIFSM+10
 228  0024 02            	dc.b	2
 229  0025 002e          	dc.w	_HMIFSM+20
 230  0027 0029          	dc.w	_HMIFSM+15
 231  0029 03            	dc.b	3
 232  002a 0024          	dc.w	_HMIFSM+10
 233  002c 002e          	dc.w	_HMIFSM+20
 234  002e 04            	dc.b	4
 235  002f 0029          	dc.w	_HMIFSM+15
 236  0031 0024          	dc.w	_HMIFSM+10
 237                     	switch	.const
 238  000a               _HDC2080:
 239  000a 0000          	dc.w	L3_HDC2080_state
 240  000c               _EEPROM_struct:
 241  000c 000f          	dc.w	L75_EEPROM_state
 270                     ; 54 unsigned int clock(void)
 270                     ; 55 {
 272                     	switch	.text
 273  0000               _clock:
 277                     ; 56 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
 279  0000 c652bf        	ld	a,21183
 280  0003 5f            	clrw	x
 281  0004 97            	ld	xl,a
 282  0005 c652c0        	ld	a,21184
 283  0008 02            	rlwa	x,a
 286  0009 81            	ret
 289                     	switch	.const
 290  000e               L321_subADDR:
 291  000e 00            	dc.b	0
 292  000f 00            	ds.b	1
 293  0010               L521_eepromReadBuf:
 294  0010 00            	dc.b	0
 450                     	switch	.const
 451  0011               L01:
 452  0011 000001bc      	dc.l	444
 453                     ; 59 void main(void)
 453                     ; 60 {
 454                     	switch	.text
 455  000a               _main:
 457  000a 520a          	subw	sp,#10
 458       0000000a      OFST:	set	10
 461                     ; 62 	uint8_t cursorPos = 0;
 463                     ; 63 	bool toggleReading = TRUE;
 465  000c a601          	ld	a,#1
 466  000e 6b0a          	ld	(OFST+0,sp),a
 468                     ; 64 	uint8_t value = 5;
 470                     ; 65 	uint8_t subADDR [2] = {0};
 472  0010 c6000e        	ld	a,L321_subADDR
 473  0013 6b07          	ld	(OFST-3,sp),a
 474  0015 c6000f        	ld	a,L321_subADDR+1
 475  0018 6b08          	ld	(OFST-2,sp),a
 476                     ; 66 	uint8_t eepromReadBuf [1] = {0};
 478  001a c60010        	ld	a,L521_eepromReadBuf
 479  001d 6b09          	ld	(OFST-1,sp),a
 480                     ; 67 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 482  001f 725f50c0      	clr	20672
 483                     ; 68 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 485  0023 c650c4        	ld	a,20676
 486  0026 aaff          	or	a,#255
 487  0028 c750c4        	ld	20676,a
 488                     ; 69 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 490  002b c650c3        	ld	a,20675
 491  002e aaff          	or	a,#255
 492  0030 c750c3        	ld	20675,a
 493                     ; 73 	TIM1->PSCRH = 0x3e; // 0011 1110
 495  0033 353e52c1      	mov	21185,#62
 496                     ; 74 	TIM1->PSCRL = 0x80; // 0111 0000
 498  0037 358052c2      	mov	21186,#128
 499                     ; 76 	TIM1->CR1 = TIM1_CR1_CEN;
 501  003b 350152b0      	mov	21168,#1
 502                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 505  003f ae0000        	ldw	x,#0
 506  0042 1f03          	ldw	(OFST-7,sp),x
 507  0044 ae0000        	ldw	x,#0
 508  0047 1f01          	ldw	(OFST-9,sp),x
 510  0049               L322:
 511                     ; 14         _asm("nop");
 514  0049 9d            nop
 516                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 518  004a 96            	ldw	x,sp
 519  004b 1c0001        	addw	x,#OFST-9
 520  004e a601          	ld	a,#1
 521  0050 cd0000        	call	c_lgadc
 526  0053 96            	ldw	x,sp
 527  0054 1c0001        	addw	x,#OFST-9
 528  0057 cd0000        	call	c_ltor
 530  005a ae0011        	ldw	x,#L01
 531  005d cd0000        	call	c_lcmp
 533  0060 25e7          	jrult	L322
 534                     ; 80 	HDC2080_config(HDC2080);
 536  0062 ae0000        	ldw	x,#L3_HDC2080_state
 537  0065 cd0000        	call	_HDC2080_config
 539                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 542  0068 ae0000        	ldw	x,#0
 543  006b 1f03          	ldw	(OFST-7,sp),x
 544  006d ae0000        	ldw	x,#0
 545  0070 1f01          	ldw	(OFST-9,sp),x
 547  0072               L132:
 548                     ; 14         _asm("nop");
 551  0072 9d            nop
 553                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 555  0073 96            	ldw	x,sp
 556  0074 1c0001        	addw	x,#OFST-9
 557  0077 a601          	ld	a,#1
 558  0079 cd0000        	call	c_lgadc
 563  007c 96            	ldw	x,sp
 564  007d 1c0001        	addw	x,#OFST-9
 565  0080 cd0000        	call	c_ltor
 567  0083 ae0011        	ldw	x,#L01
 568  0086 cd0000        	call	c_lcmp
 570  0089 25e7          	jrult	L132
 571                     ; 83 	SPI_init();
 573  008b cd0000        	call	_SPI_init
 575                     ; 85 	RTC_init();
 577  008e cd0000        	call	_RTC_init
 579                     ; 87 	BTN_init();
 581  0091 cd0000        	call	_BTN_init
 583                     ; 89 	LCD_init();
 585  0094 cd0000        	call	_LCD_init
 587                     ; 91 	UART_init();
 589  0097 cd0000        	call	_UART_init
 591                     ; 93 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 593  009a ae001a        	ldw	x,#_HMIFSM
 594  009d bf1d          	ldw	_HMIStatePtr,x
 595                     ; 96 	RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 597  009f ae0018        	ldw	x,#_SRTC_TimeRead
 598  00a2 89            	pushw	x
 599  00a3 4f            	clr	a
 600  00a4 cd0000        	call	_RTC_GetTime
 602  00a7 85            	popw	x
 603                     ; 98 	RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 605  00a8 ae0014        	ldw	x,#_SRTC_DateRead
 606  00ab 89            	pushw	x
 607  00ac 4f            	clr	a
 608  00ad cd0000        	call	_RTC_GetDate
 610  00b0 85            	popw	x
 611                     ; 100 	disableInterrupts();
 614  00b1 9b            sim
 616                     ; 102 	TempRawResult = HDC2080_tempRead(HDC2080);
 619  00b2 ae0000        	ldw	x,#L3_HDC2080_state
 620  00b5 cd0000        	call	_HDC2080_tempRead
 622  00b8 bf12          	ldw	_TempRawResult,x
 623                     ; 103 	TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 625  00ba be12          	ldw	x,_TempRawResult
 626  00bc cd0000        	call	_HDC2080_tempToFloatCelsius
 628  00bf ae000e        	ldw	x,#_TempReadingResult
 629  00c2 cd0000        	call	c_rtol
 631                     ; 104 	TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 633  00c5 be12          	ldw	x,_TempRawResult
 634  00c7 cd0000        	call	_HDC2080_tempToIntCelsius
 636  00ca ae000a        	ldw	x,#_TempIntResult
 637  00cd cd0000        	call	c_rtol
 639                     ; 106 	HumRawResult = HDC2080_humRead(HDC2080);
 641  00d0 ae0000        	ldw	x,#L3_HDC2080_state
 642  00d3 cd0000        	call	_HDC2080_humRead
 644  00d6 bf08          	ldw	_HumRawResult,x
 645                     ; 107 	HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 647  00d8 be08          	ldw	x,_HumRawResult
 648  00da cd0000        	call	_HDC2080_humToFloatRelative
 650  00dd ae0004        	ldw	x,#_HumReadingResult
 651  00e0 cd0000        	call	c_rtol
 653                     ; 108 	HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 655  00e3 be08          	ldw	x,_HumRawResult
 656  00e5 cd0000        	call	_HDC2080_humToIntRelative
 658  00e8 ae0000        	ldw	x,#_HumIntResult
 659  00eb cd0000        	call	c_rtol
 661                     ; 114 	enableInterrupts();
 664  00ee 9a            rim
 666  00ef               L732:
 667                     ; 120 		if (clock() % 1000 == 0)
 669  00ef cd0000        	call	_clock
 671  00f2 90ae03e8      	ldw	y,#1000
 672  00f6 65            	divw	x,y
 673  00f7 51            	exgw	x,y
 674  00f8 a30000        	cpw	x,#0
 675  00fb 266c          	jrne	L342
 676                     ; 123 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 678  00fd ae0018        	ldw	x,#_SRTC_TimeRead
 679  0100 89            	pushw	x
 680  0101 4f            	clr	a
 681  0102 cd0000        	call	_RTC_GetTime
 683  0105 85            	popw	x
 684                     ; 125 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 686  0106 ae0014        	ldw	x,#_SRTC_DateRead
 687  0109 89            	pushw	x
 688  010a 4f            	clr	a
 689  010b cd0000        	call	_RTC_GetDate
 691  010e 85            	popw	x
 692                     ; 127 			disableInterrupts();
 695  010f 9b            sim
 697                     ; 129 			if (toggleReading)
 700  0110 0d0a          	tnz	(OFST+0,sp)
 701  0112 272b          	jreq	L542
 702                     ; 131 				TempRawResult = HDC2080_tempRead(HDC2080);
 704  0114 ae0000        	ldw	x,#L3_HDC2080_state
 705  0117 cd0000        	call	_HDC2080_tempRead
 707  011a bf12          	ldw	_TempRawResult,x
 708                     ; 132 				TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
 710  011c be12          	ldw	x,_TempRawResult
 711  011e cd0000        	call	_HDC2080_tempToFloatCelsius
 713  0121 ae000e        	ldw	x,#_TempReadingResult
 714  0124 cd0000        	call	c_rtol
 716                     ; 133 				TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 718  0127 be12          	ldw	x,_TempRawResult
 719  0129 cd0000        	call	_HDC2080_tempToIntCelsius
 721  012c ae000a        	ldw	x,#_TempIntResult
 722  012f cd0000        	call	c_rtol
 724                     ; 134 				toggleReading = !toggleReading;
 726  0132 0d0a          	tnz	(OFST+0,sp)
 727  0134 2604          	jrne	L21
 728  0136 a601          	ld	a,#1
 729  0138 2001          	jra	L41
 730  013a               L21:
 731  013a 4f            	clr	a
 732  013b               L41:
 733  013b 6b0a          	ld	(OFST+0,sp),a
 736  013d 2029          	jra	L742
 737  013f               L542:
 738                     ; 140 				HumRawResult = HDC2080_humRead(HDC2080);
 740  013f ae0000        	ldw	x,#L3_HDC2080_state
 741  0142 cd0000        	call	_HDC2080_humRead
 743  0145 bf08          	ldw	_HumRawResult,x
 744                     ; 141 				HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 746  0147 be08          	ldw	x,_HumRawResult
 747  0149 cd0000        	call	_HDC2080_humToFloatRelative
 749  014c ae0004        	ldw	x,#_HumReadingResult
 750  014f cd0000        	call	c_rtol
 752                     ; 142 				HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 754  0152 be08          	ldw	x,_HumRawResult
 755  0154 cd0000        	call	_HDC2080_humToIntRelative
 757  0157 ae0000        	ldw	x,#_HumIntResult
 758  015a cd0000        	call	c_rtol
 760                     ; 143 				toggleReading = !toggleReading;
 762  015d 0d0a          	tnz	(OFST+0,sp)
 763  015f 2604          	jrne	L61
 764  0161 a601          	ld	a,#1
 765  0163 2001          	jra	L02
 766  0165               L61:
 767  0165 4f            	clr	a
 768  0166               L02:
 769  0166 6b0a          	ld	(OFST+0,sp),a
 771  0168               L742:
 772                     ; 147 			enableInterrupts();
 775  0168 9a            rim
 778  0169               L342:
 779                     ; 150 		if (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
 781  0169 4b20          	push	#32
 782  016b ae500a        	ldw	x,#20490
 783  016e cd0000        	call	_GPIO_ReadInputDataBit
 785  0171 5b01          	addw	sp,#1
 786  0173 4d            	tnz	a
 787  0174 2714          	jreq	L152
 788                     ; 153 			UART_Poll();
 790  0176 cd0000        	call	_UART_Poll
 792                     ; 154 			UART_2PC(tempResults, humResults);
 794  0179 be18          	ldw	x,_humResults+2
 795  017b 89            	pushw	x
 796  017c be16          	ldw	x,_humResults
 797  017e 89            	pushw	x
 798  017f be14          	ldw	x,_tempResults+2
 799  0181 89            	pushw	x
 800  0182 be12          	ldw	x,_tempResults
 801  0184 89            	pushw	x
 802  0185 cd0000        	call	_UART_2PC
 804  0188 5b08          	addw	sp,#8
 805  018a               L152:
 806                     ; 157 		switch (HMIStatePtr->outState)
 808  018a 92c61d        	ld	a,[_HMIStatePtr.w]
 810                     ; 248 			break;
 811  018d 4d            	tnz	a
 812  018e 2713          	jreq	L331
 813  0190 4a            	dec	a
 814  0191 2723          	jreq	L531
 815  0193 4a            	dec	a
 816  0194 272d          	jreq	L731
 817  0196 4a            	dec	a
 818  0197 2779          	jreq	L141
 819  0199 4a            	dec	a
 820  019a 2603          	jrne	L23
 821  019c cc0243        	jp	L341
 822  019f               L23:
 823  019f acef00ef      	jpf	L732
 824  01a3               L331:
 825                     ; 159 		case DISPLAY_DORMANT:
 825                     ; 160 			LCD_clear();
 827  01a3 cd0000        	call	_LCD_clear
 829                     ; 162 			if (buttonPressed != 0)
 831  01a6 3d1c          	tnz	_buttonPressed
 832  01a8 2706          	jreq	L752
 833                     ; 163 				HMIStatePtr = HMIStatePtr->next;
 835  01aa be1d          	ldw	x,_HMIStatePtr
 836  01ac ee03          	ldw	x,(3,x)
 837  01ae bf1d          	ldw	_HMIStatePtr,x
 838  01b0               L752:
 839                     ; 164 			buttonPressed = NO;
 841  01b0 3f1c          	clr	_buttonPressed
 842                     ; 166 			break;
 844  01b2 acef00ef      	jpf	L732
 845  01b6               L531:
 846                     ; 167 		case DISPLAY_WELCOME:
 846                     ; 168 			LCD_welcome();
 848  01b6 cd0000        	call	_LCD_welcome
 850                     ; 169 			HMIStatePtr = HMIStatePtr->next;
 852  01b9 be1d          	ldw	x,_HMIStatePtr
 853  01bb ee03          	ldw	x,(3,x)
 854  01bd bf1d          	ldw	_HMIStatePtr,x
 855                     ; 171 			break;
 857  01bf acef00ef      	jpf	L732
 858  01c3               L731:
 859                     ; 172 		case DISPLAY_HOME:
 859                     ; 173 
 859                     ; 174 			// Showing temp and humidity and menu option
 859                     ; 175 			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, TempIntResult, HumIntResult);
 861  01c3 be02          	ldw	x,_HumIntResult+2
 862  01c5 89            	pushw	x
 863  01c6 be00          	ldw	x,_HumIntResult
 864  01c8 89            	pushw	x
 865  01c9 be0c          	ldw	x,_TempIntResult+2
 866  01cb 89            	pushw	x
 867  01cc be0a          	ldw	x,_TempIntResult
 868  01ce 89            	pushw	x
 869  01cf b61b          	ld	a,_SRTC_TimeRead+3
 870  01d1 88            	push	a
 871  01d2 b61a          	ld	a,_SRTC_TimeRead+2
 872  01d4 88            	push	a
 873  01d5 b619          	ld	a,_SRTC_TimeRead+1
 874  01d7 88            	push	a
 875  01d8 b618          	ld	a,_SRTC_TimeRead
 876  01da 88            	push	a
 877  01db b617          	ld	a,_SRTC_DateRead+3
 878  01dd 88            	push	a
 879  01de b616          	ld	a,_SRTC_DateRead+2
 880  01e0 88            	push	a
 881  01e1 b615          	ld	a,_SRTC_DateRead+1
 882  01e3 88            	push	a
 883  01e4 b614          	ld	a,_SRTC_DateRead
 884  01e6 88            	push	a
 885  01e7 cd0000        	call	_LCD_homescreen
 887  01ea 5b10          	addw	sp,#16
 888                     ; 177 			if (buttonPressed == DOWN)
 890  01ec b61c          	ld	a,_buttonPressed
 891  01ee a104          	cp	a,#4
 892  01f0 260b          	jrne	L162
 893                     ; 179 				HMIStatePtr = HMIStatePtr->next;
 895  01f2 be1d          	ldw	x,_HMIStatePtr
 896  01f4 ee03          	ldw	x,(3,x)
 897  01f6 bf1d          	ldw	_HMIStatePtr,x
 898                     ; 180 				LCD_clear();
 900  01f8 cd0000        	call	_LCD_clear
 903  01fb 200f          	jra	L362
 904  01fd               L162:
 905                     ; 182 			else if (buttonPressed == UP)
 907  01fd b61c          	ld	a,_buttonPressed
 908  01ff a105          	cp	a,#5
 909  0201 2609          	jrne	L362
 910                     ; 184 				HMIStatePtr = HMIStatePtr->previous;
 912  0203 be1d          	ldw	x,_HMIStatePtr
 913  0205 ee01          	ldw	x,(1,x)
 914  0207 bf1d          	ldw	_HMIStatePtr,x
 915                     ; 185 				LCD_clear();
 917  0209 cd0000        	call	_LCD_clear
 919  020c               L362:
 920                     ; 187 			buttonPressed = NO;
 922  020c 3f1c          	clr	_buttonPressed
 923                     ; 188 			break;
 925  020e acef00ef      	jpf	L732
 926  0212               L141:
 927                     ; 190 		case DISPLAY_MIN_MAX:
 927                     ; 191 			LCD_min_max(12, 14, 8, 90);
 929  0212 4b5a          	push	#90
 930  0214 4b08          	push	#8
 931  0216 ae0c0e        	ldw	x,#3086
 932  0219 cd0000        	call	_LCD_min_max
 934  021c 85            	popw	x
 935                     ; 192 			if (buttonPressed == DOWN)
 937  021d b61c          	ld	a,_buttonPressed
 938  021f a104          	cp	a,#4
 939  0221 260b          	jrne	L762
 940                     ; 194 				HMIStatePtr = HMIStatePtr->next;
 942  0223 be1d          	ldw	x,_HMIStatePtr
 943  0225 ee03          	ldw	x,(3,x)
 944  0227 bf1d          	ldw	_HMIStatePtr,x
 945                     ; 195 				LCD_clear();
 947  0229 cd0000        	call	_LCD_clear
 950  022c 200f          	jra	L172
 951  022e               L762:
 952                     ; 197 			else if (buttonPressed == UP)
 954  022e b61c          	ld	a,_buttonPressed
 955  0230 a105          	cp	a,#5
 956  0232 2609          	jrne	L172
 957                     ; 199 				HMIStatePtr = HMIStatePtr->previous;
 959  0234 be1d          	ldw	x,_HMIStatePtr
 960  0236 ee01          	ldw	x,(1,x)
 961  0238 bf1d          	ldw	_HMIStatePtr,x
 962                     ; 200 				LCD_clear();
 964  023a cd0000        	call	_LCD_clear
 966  023d               L172:
 967                     ; 203 			buttonPressed = NO;
 969  023d 3f1c          	clr	_buttonPressed
 970                     ; 204 			break;
 972  023f acef00ef      	jpf	L732
 973  0243               L341:
 974                     ; 205 		case DISPLAY_SETTINGS:
 974                     ; 206 			// Show settings to change frequency. Need to press ok to engage with screen
 974                     ; 207 
 974                     ; 208 			if (editMode == FALSE)
 976  0243 3d11          	tnz	_editMode
 977  0245 2639          	jrne	L572
 978                     ; 210 				LCD_display_settings();
 980  0247 cd0000        	call	_LCD_display_settings
 982                     ; 211 				if (buttonPressed == DOWN)
 984  024a b61c          	ld	a,_buttonPressed
 985  024c a104          	cp	a,#4
 986  024e 260b          	jrne	L772
 987                     ; 213 					HMIStatePtr = HMIStatePtr->next;
 989  0250 be1d          	ldw	x,_HMIStatePtr
 990  0252 ee03          	ldw	x,(3,x)
 991  0254 bf1d          	ldw	_HMIStatePtr,x
 992                     ; 214 					LCD_clear();
 994  0256 cd0000        	call	_LCD_clear
 997  0259 200f          	jra	L103
 998  025b               L772:
 999                     ; 216 				else if (buttonPressed == UP)
1001  025b b61c          	ld	a,_buttonPressed
1002  025d a105          	cp	a,#5
1003  025f 2609          	jrne	L103
1004                     ; 218 					HMIStatePtr = HMIStatePtr->previous;
1006  0261 be1d          	ldw	x,_HMIStatePtr
1007  0263 ee01          	ldw	x,(1,x)
1008  0265 bf1d          	ldw	_HMIStatePtr,x
1009                     ; 219 					LCD_clear();
1011  0267 cd0000        	call	_LCD_clear
1013  026a               L103:
1014                     ; 221 				if (buttonPressed == OK)
1016  026a b61c          	ld	a,_buttonPressed
1017  026c a103          	cp	a,#3
1018  026e 263c          	jrne	L703
1019                     ; 223 					editMode = !editMode;
1021  0270 3d11          	tnz	_editMode
1022  0272 2604          	jrne	L22
1023  0274 a601          	ld	a,#1
1024  0276 2001          	jra	L42
1025  0278               L22:
1026  0278 4f            	clr	a
1027  0279               L42:
1028  0279 b711          	ld	_editMode,a
1029                     ; 224 					LCD_clear();
1031  027b cd0000        	call	_LCD_clear
1033  027e 202c          	jra	L703
1034  0280               L572:
1035                     ; 230 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
1037  0280 4b03          	push	#3
1038  0282 4b14          	push	#20
1039  0284 4b0a          	push	#10
1040  0286 ae0000        	ldw	x,#_settingMsg
1041  0289 cd0000        	call	_LCD_writemsg
1043  028c 5b03          	addw	sp,#3
1044                     ; 232 				if (buttonPressed == DOWN)
1046  028e b61c          	ld	a,_buttonPressed
1047  0290 a104          	cp	a,#4
1048  0292 2704          	jreq	L313
1050                     ; 236 				else if (buttonPressed == UP)
1052  0294 b61c          	ld	a,_buttonPressed
1053  0296 a105          	cp	a,#5
1054  0298               L313:
1055                     ; 240 				if (buttonPressed == OK)
1057  0298 b61c          	ld	a,_buttonPressed
1058  029a a103          	cp	a,#3
1059  029c 260e          	jrne	L703
1060                     ; 242 					editMode = !editMode;
1062  029e 3d11          	tnz	_editMode
1063  02a0 2604          	jrne	L62
1064  02a2 a601          	ld	a,#1
1065  02a4 2001          	jra	L03
1066  02a6               L62:
1067  02a6 4f            	clr	a
1068  02a7               L03:
1069  02a7 b711          	ld	_editMode,a
1070                     ; 243 					LCD_clear();
1072  02a9 cd0000        	call	_LCD_clear
1074  02ac               L703:
1075                     ; 247 			buttonPressed = NO;
1077  02ac 3f1c          	clr	_buttonPressed
1078                     ; 248 			break;
1080  02ae acef00ef      	jpf	L732
1081  02b2               L552:
1083  02b2 acef00ef      	jpf	L732
1724                     	xdef	_main
1725                     	xdef	_clock
1726                     	switch	.ubsct
1727  0000               _HumIntResult:
1728  0000 00000000      	ds.b	4
1729                     	xdef	_HumIntResult
1730  0004               _HumReadingResult:
1731  0004 00000000      	ds.b	4
1732                     	xdef	_HumReadingResult
1733  0008               _HumRawResult:
1734  0008 0000          	ds.b	2
1735                     	xdef	_HumRawResult
1736  000a               _TempIntResult:
1737  000a 00000000      	ds.b	4
1738                     	xdef	_TempIntResult
1739  000e               _TempReadingResult:
1740  000e 00000000      	ds.b	4
1741                     	xdef	_TempReadingResult
1742  0012               _TempRawResult:
1743  0012 0000          	ds.b	2
1744                     	xdef	_TempRawResult
1745                     	xdef	_EEPROM_struct
1746                     	xdef	_HDC2080
1747  0014               _SRTC_DateRead:
1748  0014 00000000      	ds.b	4
1749                     	xdef	_SRTC_DateRead
1750  0018               _SRTC_TimeRead:
1751  0018 00000000      	ds.b	4
1752                     	xdef	_SRTC_TimeRead
1753  001c               _buttonPressed:
1754  001c 00            	ds.b	1
1755                     	xdef	_buttonPressed
1756                     	xdef	_humResults
1757                     	xdef	_tempResults
1758                     	xdef	_editMode
1759                     	xdef	_settingMsg
1760                     	xref	_BTN_init
1761                     	xdef	_HMIFSM
1762  001d               _HMIStatePtr:
1763  001d 0000          	ds.b	2
1764                     	xdef	_HMIStatePtr
1765                     	xref	_HDC2080_tempToIntCelsius
1766                     	xref	_HDC2080_tempToFloatCelsius
1767                     	xref	_HDC2080_tempRead
1768                     	xref	_HDC2080_humToIntRelative
1769                     	xref	_HDC2080_humToFloatRelative
1770                     	xref	_HDC2080_humRead
1771                     	xref	_HDC2080_config
1772                     	xref	_UART_2PC
1773                     	xref	_UART_Poll
1774                     	xref	_UART_init
1775                     	xref	_RTC_init
1776                     	xref	_LCD_display_settings
1777                     	xref	_LCD_min_max
1778                     	xref	_LCD_homescreen
1779                     	xref	_LCD_welcome
1780                     	xref	_LCD_writemsg
1781                     	xref	_LCD_clear
1782                     	xref	_LCD_init
1783                     	xref	_SPI_init
1784                     	xref	_RTC_GetDate
1785                     	xref	_RTC_GetTime
1786                     	xref	_GPIO_ReadInputDataBit
1806                     	xref	c_rtol
1807                     	xref	c_lcmp
1808                     	xref	c_ltor
1809                     	xref	c_lgadc
1810                     	end
