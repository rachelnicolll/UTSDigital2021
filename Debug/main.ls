   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 30 static void LCD_gpio_init() {
  43                     	switch	.text
  44  0000               L3_LCD_gpio_init:
  48                     ; 31     GPIOB->DDR |= (1 << LCD_CE_PIN) | (1 << LCD_RST_PIN) | (1 << LCD_DC_PIN);
  50  0000 c65007        	ld	a,20487
  51  0003 aa0d          	or	a,#13
  52  0005 c75007        	ld	20487,a
  53                     ; 32     GPIOB->CR1 |= (1 << LCD_CE_PIN) | (1 << LCD_RST_PIN) | (1 << LCD_DC_PIN);
  55  0008 c65008        	ld	a,20488
  56  000b aa0d          	or	a,#13
  57  000d c75008        	ld	20488,a
  58                     ; 33 }
  61  0010 81            	ret
  84                     ; 35 static void LCD_DC_set() {
  85                     	switch	.text
  86  0011               L32_LCD_DC_set:
  90                     ; 36     GPIOB->ODR |= (1 << LCD_DC_PIN);
  92  0011 72145005      	bset	20485,#2
  93                     ; 37 }
  96  0015 81            	ret
 119                     ; 39 static void LCD_DC_clear() {
 120                     	switch	.text
 121  0016               L53_LCD_DC_clear:
 125                     ; 40     GPIOB->ODR &= ~(1 << LCD_DC_PIN);
 127  0016 72155005      	bres	20485,#2
 128                     ; 41 }
 131  001a 81            	ret
 154                     ; 43 static void LCD_CE_set() {
 155                     	switch	.text
 156  001b               L74_LCD_CE_set:
 160  001b               L36:
 161                     ; 44     while (SPI1->SR &  SPI_SR_BSY);
 163  001b c65203        	ld	a,20995
 164  001e a580          	bcp	a,#128
 165  0020 26f9          	jrne	L36
 166                     ; 45     GPIOB->ODR |= (1 << LCD_CE_PIN);
 168  0022 72165005      	bset	20485,#3
 169                     ; 46 }
 172  0026 81            	ret
 195                     ; 48 static void LCD_CE_clear() {
 196                     	switch	.text
 197  0027               L76_LCD_CE_clear:
 201                     ; 49     GPIOB->ODR &= ~(1 << LCD_CE_PIN);
 203  0027 72175005      	bres	20485,#3
 204                     ; 50 }
 207  002b 81            	ret
 230                     ; 52 static void LCD_RST_set() {
 231                     	switch	.text
 232  002c               L101_LCD_RST_set:
 236                     ; 53     GPIOB->ODR |= (1 << LCD_RST_PIN);
 238  002c 72105005      	bset	20485,#0
 239                     ; 54 }
 242  0030 81            	ret
 265                     ; 56 static void LCD_RST_clear() {
 266                     	switch	.text
 267  0031               L311_LCD_RST_clear:
 271                     ; 57     GPIOB->ODR &= ~(1 << LCD_RST_PIN);
 273  0031 72115005      	bres	20485,#0
 274                     ; 58 }
 277  0035 81            	ret
 312                     ; 60 static void LCD_SPI_write(uint8_t word) {
 313                     	switch	.text
 314  0036               L521_LCD_SPI_write:
 318                     ; 61     SPI_write(word);
 320  0036 cd0000        	call	_SPI_write
 322                     ; 62 }
 325  0039 81            	ret
 379                     ; 64 static void LCD_delay_ms(int ms) {
 380                     	switch	.text
 381  003a               L541_LCD_delay_ms:
 383  003a 5208          	subw	sp,#8
 384       00000008      OFST:	set	8
 387                     ; 65     delay_ms(ms);
 390  003c cd0000        	call	c_itolx
 392  003f 96            	ldw	x,sp
 393  0040 1c0001        	addw	x,#OFST-7
 394  0043 cd0000        	call	c_rtol
 397                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 399  0046 ae0000        	ldw	x,#0
 400  0049 1f07          	ldw	(OFST-1,sp),x
 401  004b ae0000        	ldw	x,#0
 402  004e 1f05          	ldw	(OFST-3,sp),x
 405  0050 200a          	jra	L302
 406  0052               L771:
 407                     ; 14         _asm("nop");
 410  0052 9d            nop
 412                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 414  0053 96            	ldw	x,sp
 415  0054 1c0005        	addw	x,#OFST-3
 416  0057 a601          	ld	a,#1
 417  0059 cd0000        	call	c_lgadc
 420  005c               L302:
 423  005c 96            	ldw	x,sp
 424  005d 1c0001        	addw	x,#OFST-7
 425  0060 cd0000        	call	c_ltor
 427  0063 a66f          	ld	a,#111
 428  0065 cd0000        	call	c_smul
 430  0068 96            	ldw	x,sp
 431  0069 1c0005        	addw	x,#OFST-3
 432  006c cd0000        	call	c_lcmp
 434  006f 22e1          	jrugt	L771
 435                     ; 66 }
 438  0071 5b08          	addw	sp,#8
 439  0073 81            	ret
 452                     .const:	section	.text
 453  0000               _settingMsg:
 454  0000 456469746162  	dc.b	"Editable!",0
 455  000a               _sendDataMsg:
 456  000a 506c7567206d  	dc.b	"Plug me in!",0
 457                     	bsct
 458  0000               _tempResults:
 459  0000 41a99999      	dc.w	16809,-26215
 460  0004 41ba6666      	dc.w	16826,26214
 461  0008 41c0cccc      	dc.w	16832,-13108
 462  000c 41b26666      	dc.w	16818,26214
 463  0010 41b40000      	dc.w	16820,0
 464  0014 41ae6666      	dc.w	16814,26214
 465  0018 41e59999      	dc.w	16869,-26215
 466  001c 41d59999      	dc.w	16853,-26215
 467  0020               _humResults:
 468  0020 42799999      	dc.w	17017,-26215
 469  0024 42793333      	dc.w	17017,13107
 470  0028 427ccccc      	dc.w	17020,-13108
 471  002c 42753333      	dc.w	17013,13107
 472  0030 427a0000      	dc.w	17018,0
 473  0034 42773333      	dc.w	17015,13107
 474  0038 42896666      	dc.w	17033,26214
 475  003c 42856666      	dc.w	17029,26214
 476  0040               _nbReadings:
 477  0040 41000000      	dc.w	16640,0
 478  0044               _editMode:
 479  0044 00            	dc.b	0
 480  0045               _HMIFSM:
 481  0045 00            	dc.b	0
 482  0046 0045          	dc.w	_HMIFSM
 483  0048 004a          	dc.w	_HMIFSM+5
 484  004a 01            	dc.b	1
 485  004b 0045          	dc.w	_HMIFSM
 486  004d 004f          	dc.w	_HMIFSM+10
 487  004f 02            	dc.b	2
 488  0050 0059          	dc.w	_HMIFSM+20
 489  0052 0054          	dc.w	_HMIFSM+15
 490  0054 03            	dc.b	3
 491  0055 004f          	dc.w	_HMIFSM+10
 492  0057 0059          	dc.w	_HMIFSM+20
 493  0059 04            	dc.b	4
 494  005a 0054          	dc.w	_HMIFSM+15
 495  005c 004f          	dc.w	_HMIFSM+10
 496  005e 05            	dc.b	5
 497  005f 0045          	dc.w	_HMIFSM
 498  0061 005e          	dc.w	_HMIFSM+25
 527                     ; 43 unsigned int clock(void)
 527                     ; 44 {
 528                     	switch	.text
 529  0074               _clock:
 533                     ; 45 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
 535  0074 c652bf        	ld	a,21183
 536  0077 5f            	clrw	x
 537  0078 97            	ld	xl,a
 538  0079 c652c0        	ld	a,21184
 539  007c 02            	rlwa	x,a
 542  007d 81            	ret
 597                     ; 48 void main(void)
 597                     ; 49 {
 598                     	switch	.text
 599  007e               _main:
 601  007e 88            	push	a
 602       00000001      OFST:	set	1
 605                     ; 51 	uint8_t cursorPos = 0;
 607                     ; 54 	SPI_init();
 609  007f cd0000        	call	_SPI_init
 611                     ; 56 	RTC_init();
 613  0082 cd0000        	call	_RTC_init
 615                     ; 58 	BTN_init();
 617  0085 cd0000        	call	_BTN_init
 619                     ; 60 	LCD_init();
 621  0088 cd0000        	call	_LCD_init
 623                     ; 62 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 625  008b ae0045        	ldw	x,#_HMIFSM
 626  008e bf09          	ldw	_HMIStatePtr,x
 627  0090               L752:
 628                     ; 70 		if (clock() % 1000 == 0)
 630  0090 ade2          	call	_clock
 632  0092 90ae03e8      	ldw	y,#1000
 633  0096 65            	divw	x,y
 634  0097 51            	exgw	x,y
 635  0098 a30000        	cpw	x,#0
 636  009b 2612          	jrne	L362
 637                     ; 73 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 639  009d ae0004        	ldw	x,#_SRTC_TimeRead
 640  00a0 89            	pushw	x
 641  00a1 4f            	clr	a
 642  00a2 cd0000        	call	_RTC_GetTime
 644  00a5 85            	popw	x
 645                     ; 75 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 647  00a6 ae0000        	ldw	x,#_SRTC_DateRead
 648  00a9 89            	pushw	x
 649  00aa 4f            	clr	a
 650  00ab cd0000        	call	_RTC_GetDate
 652  00ae 85            	popw	x
 653  00af               L362:
 654                     ; 77 		switch (HMIStatePtr->outState)
 656  00af 92c609        	ld	a,[_HMIStatePtr.w]
 658                     ; 185 			break;
 659  00b2 4d            	tnz	a
 660  00b3 2717          	jreq	L522
 661  00b5 4a            	dec	a
 662  00b6 2725          	jreq	L722
 663  00b8 4a            	dec	a
 664  00b9 272d          	jreq	L132
 665  00bb 4a            	dec	a
 666  00bc 2771          	jreq	L332
 667  00be 4a            	dec	a
 668  00bf 2603          	jrne	L24
 669  00c1 cc0160        	jp	L532
 670  00c4               L24:
 671  00c4 4a            	dec	a
 672  00c5 2603          	jrne	L44
 673  00c7 cc01cf        	jp	L732
 674  00ca               L44:
 675  00ca 20c4          	jra	L752
 676  00cc               L522:
 677                     ; 79 		case DISPLAY_DORMANT:
 677                     ; 80 			LCD_clear();
 679  00cc cd0000        	call	_LCD_clear
 681                     ; 82 			if (buttonPressed != 0)
 683  00cf 3d08          	tnz	_buttonPressed
 684  00d1 2706          	jreq	L172
 685                     ; 83 				HMIStatePtr = HMIStatePtr->next;
 687  00d3 be09          	ldw	x,_HMIStatePtr
 688  00d5 ee03          	ldw	x,(3,x)
 689  00d7 bf09          	ldw	_HMIStatePtr,x
 690  00d9               L172:
 691                     ; 84 			buttonPressed = NO;
 693  00d9 3f08          	clr	_buttonPressed
 694                     ; 86 			break;
 696  00db 20b3          	jra	L752
 697  00dd               L722:
 698                     ; 87 		case DISPLAY_WELCOME:
 698                     ; 88 			LCD_welcome();
 700  00dd cd0000        	call	_LCD_welcome
 702                     ; 89 			HMIStatePtr = HMIStatePtr->next;
 704  00e0 be09          	ldw	x,_HMIStatePtr
 705  00e2 ee03          	ldw	x,(3,x)
 706  00e4 bf09          	ldw	_HMIStatePtr,x
 707                     ; 91 			break;
 709  00e6 20a8          	jra	L752
 710  00e8               L132:
 711                     ; 92 		case DISPLAY_HOME:
 711                     ; 93 
 711                     ; 94 			// Showing temp and humidity and menu option
 711                     ; 95 			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, 18, 70);
 713  00e8 4b46          	push	#70
 714  00ea 4b12          	push	#18
 715  00ec b607          	ld	a,_SRTC_TimeRead+3
 716  00ee 88            	push	a
 717  00ef b606          	ld	a,_SRTC_TimeRead+2
 718  00f1 88            	push	a
 719  00f2 b605          	ld	a,_SRTC_TimeRead+1
 720  00f4 88            	push	a
 721  00f5 b604          	ld	a,_SRTC_TimeRead
 722  00f7 88            	push	a
 723  00f8 b603          	ld	a,_SRTC_DateRead+3
 724  00fa 88            	push	a
 725  00fb b602          	ld	a,_SRTC_DateRead+2
 726  00fd 88            	push	a
 727  00fe b601          	ld	a,_SRTC_DateRead+1
 728  0100 88            	push	a
 729  0101 b600          	ld	a,_SRTC_DateRead
 730  0103 88            	push	a
 731  0104 cd0000        	call	_LCD_homescreen
 733  0107 5b0a          	addw	sp,#10
 734                     ; 97 			if (buttonPressed == DOWN)
 736  0109 b608          	ld	a,_buttonPressed
 737  010b a104          	cp	a,#4
 738  010d 260b          	jrne	L372
 739                     ; 99 				HMIStatePtr = HMIStatePtr->next;
 741  010f be09          	ldw	x,_HMIStatePtr
 742  0111 ee03          	ldw	x,(3,x)
 743  0113 bf09          	ldw	_HMIStatePtr,x
 744                     ; 100 				LCD_clear();
 746  0115 cd0000        	call	_LCD_clear
 749  0118 200f          	jra	L572
 750  011a               L372:
 751                     ; 102 			else if (buttonPressed == UP)
 753  011a b608          	ld	a,_buttonPressed
 754  011c a105          	cp	a,#5
 755  011e 2609          	jrne	L572
 756                     ; 104 				HMIStatePtr = HMIStatePtr->previous;
 758  0120 be09          	ldw	x,_HMIStatePtr
 759  0122 ee01          	ldw	x,(1,x)
 760  0124 bf09          	ldw	_HMIStatePtr,x
 761                     ; 105 				LCD_clear();
 763  0126 cd0000        	call	_LCD_clear
 765  0129               L572:
 766                     ; 107 			buttonPressed = NO;
 768  0129 3f08          	clr	_buttonPressed
 769                     ; 108 			break;
 771  012b ac900090      	jpf	L752
 772  012f               L332:
 773                     ; 110 		case DISPLAY_MIN_MAX:
 773                     ; 111 			LCD_min_max(12, 14, 8, 90);
 775  012f 4b5a          	push	#90
 776  0131 4b08          	push	#8
 777  0133 ae0c0e        	ldw	x,#3086
 778  0136 cd0000        	call	_LCD_min_max
 780  0139 85            	popw	x
 781                     ; 112 			if (buttonPressed == DOWN)
 783  013a b608          	ld	a,_buttonPressed
 784  013c a104          	cp	a,#4
 785  013e 260b          	jrne	L103
 786                     ; 114 				HMIStatePtr = HMIStatePtr->next;
 788  0140 be09          	ldw	x,_HMIStatePtr
 789  0142 ee03          	ldw	x,(3,x)
 790  0144 bf09          	ldw	_HMIStatePtr,x
 791                     ; 115 				LCD_clear();
 793  0146 cd0000        	call	_LCD_clear
 796  0149 200f          	jra	L303
 797  014b               L103:
 798                     ; 117 			else if (buttonPressed == UP)
 800  014b b608          	ld	a,_buttonPressed
 801  014d a105          	cp	a,#5
 802  014f 2609          	jrne	L303
 803                     ; 119 				HMIStatePtr = HMIStatePtr->previous;
 805  0151 be09          	ldw	x,_HMIStatePtr
 806  0153 ee01          	ldw	x,(1,x)
 807  0155 bf09          	ldw	_HMIStatePtr,x
 808                     ; 120 				LCD_clear();
 810  0157 cd0000        	call	_LCD_clear
 812  015a               L303:
 813                     ; 123 			buttonPressed = NO;
 815  015a 3f08          	clr	_buttonPressed
 816                     ; 124 			break;
 818  015c ac900090      	jpf	L752
 819  0160               L532:
 820                     ; 125 		case DISPLAY_SETTINGS:
 820                     ; 126 			// Show settings to change frequency. Need to press ok to engage with screen
 820                     ; 127 
 820                     ; 128 			if (editMode == FALSE)
 822  0160 3d44          	tnz	_editMode
 823  0162 2639          	jrne	L703
 824                     ; 130 				LCD_display_settings();
 826  0164 cd0000        	call	_LCD_display_settings
 828                     ; 131 				if (buttonPressed == DOWN)
 830  0167 b608          	ld	a,_buttonPressed
 831  0169 a104          	cp	a,#4
 832  016b 260b          	jrne	L113
 833                     ; 133 					HMIStatePtr = HMIStatePtr->next;
 835  016d be09          	ldw	x,_HMIStatePtr
 836  016f ee03          	ldw	x,(3,x)
 837  0171 bf09          	ldw	_HMIStatePtr,x
 838                     ; 134 					LCD_clear();
 840  0173 cd0000        	call	_LCD_clear
 843  0176 200f          	jra	L313
 844  0178               L113:
 845                     ; 136 				else if (buttonPressed == UP)
 847  0178 b608          	ld	a,_buttonPressed
 848  017a a105          	cp	a,#5
 849  017c 2609          	jrne	L313
 850                     ; 138 					HMIStatePtr = HMIStatePtr->previous;
 852  017e be09          	ldw	x,_HMIStatePtr
 853  0180 ee01          	ldw	x,(1,x)
 854  0182 bf09          	ldw	_HMIStatePtr,x
 855                     ; 139 					LCD_clear();
 857  0184 cd0000        	call	_LCD_clear
 859  0187               L313:
 860                     ; 141 				if (buttonPressed == OK)
 862  0187 b608          	ld	a,_buttonPressed
 863  0189 a103          	cp	a,#3
 864  018b 263c          	jrne	L123
 865                     ; 143 					editMode = !editMode;
 867  018d 3d44          	tnz	_editMode
 868  018f 2604          	jrne	L23
 869  0191 a601          	ld	a,#1
 870  0193 2001          	jra	L43
 871  0195               L23:
 872  0195 4f            	clr	a
 873  0196               L43:
 874  0196 b744          	ld	_editMode,a
 875                     ; 144 					LCD_clear();
 877  0198 cd0000        	call	_LCD_clear
 879  019b 202c          	jra	L123
 880  019d               L703:
 881                     ; 150 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 883  019d 4b03          	push	#3
 884  019f 4b14          	push	#20
 885  01a1 4b0a          	push	#10
 886  01a3 ae0000        	ldw	x,#_settingMsg
 887  01a6 cd0000        	call	_LCD_writemsg
 889  01a9 5b03          	addw	sp,#3
 890                     ; 152 				if (buttonPressed == DOWN)
 892  01ab b608          	ld	a,_buttonPressed
 893  01ad a104          	cp	a,#4
 894  01af 2704          	jreq	L523
 896                     ; 156 				else if (buttonPressed == UP)
 898  01b1 b608          	ld	a,_buttonPressed
 899  01b3 a105          	cp	a,#5
 900  01b5               L523:
 901                     ; 160 				if (buttonPressed == OK)
 903  01b5 b608          	ld	a,_buttonPressed
 904  01b7 a103          	cp	a,#3
 905  01b9 260e          	jrne	L123
 906                     ; 162 					editMode = !editMode;
 908  01bb 3d44          	tnz	_editMode
 909  01bd 2604          	jrne	L63
 910  01bf a601          	ld	a,#1
 911  01c1 2001          	jra	L04
 912  01c3               L63:
 913  01c3 4f            	clr	a
 914  01c4               L04:
 915  01c4 b744          	ld	_editMode,a
 916                     ; 163 					LCD_clear();
 918  01c6 cd0000        	call	_LCD_clear
 920  01c9               L123:
 921                     ; 167 			buttonPressed = NO;
 923  01c9 3f08          	clr	_buttonPressed
 924                     ; 168 			break;
 926  01cb ac900090      	jpf	L752
 927  01cf               L732:
 928                     ; 170 		case DISPLAY_SEND_DATA:
 928                     ; 171 			// Show instructions to send data
 928                     ; 172 			if (buttonPressed == DOWN)
 930  01cf b608          	ld	a,_buttonPressed
 931  01d1 a104          	cp	a,#4
 932  01d3 260b          	jrne	L333
 933                     ; 174 				HMIStatePtr = HMIStatePtr->next;
 935  01d5 be09          	ldw	x,_HMIStatePtr
 936  01d7 ee03          	ldw	x,(3,x)
 937  01d9 bf09          	ldw	_HMIStatePtr,x
 938                     ; 175 				LCD_clear();
 940  01db cd0000        	call	_LCD_clear
 943  01de 200f          	jra	L533
 944  01e0               L333:
 945                     ; 177 			else if (buttonPressed == UP)
 947  01e0 b608          	ld	a,_buttonPressed
 948  01e2 a105          	cp	a,#5
 949  01e4 2609          	jrne	L533
 950                     ; 179 				HMIStatePtr = HMIStatePtr->previous;
 952  01e6 be09          	ldw	x,_HMIStatePtr
 953  01e8 ee01          	ldw	x,(1,x)
 954  01ea bf09          	ldw	_HMIStatePtr,x
 955                     ; 180 				LCD_clear();
 957  01ec cd0000        	call	_LCD_clear
 959  01ef               L533:
 960                     ; 183 			LCD_writemsg(sendDataMsg, sizeof(sendDataMsg), 20, 3);
 962  01ef 4b03          	push	#3
 963  01f1 4b14          	push	#20
 964  01f3 4b0c          	push	#12
 965  01f5 ae000a        	ldw	x,#_sendDataMsg
 966  01f8 cd0000        	call	_LCD_writemsg
 968  01fb 5b03          	addw	sp,#3
 969                     ; 184 			buttonPressed = NO;
 971  01fd 3f08          	clr	_buttonPressed
 972                     ; 185 			break;
 974  01ff ac900090      	jpf	L752
 975  0203               L762:
 977  0203 ac900090      	jpf	L752
1462                     	xdef	_main
1463                     	xdef	_clock
1464                     	switch	.ubsct
1465  0000               _SRTC_DateRead:
1466  0000 00000000      	ds.b	4
1467                     	xdef	_SRTC_DateRead
1468  0004               _SRTC_TimeRead:
1469  0004 00000000      	ds.b	4
1470                     	xdef	_SRTC_TimeRead
1471  0008               _buttonPressed:
1472  0008 00            	ds.b	1
1473                     	xdef	_buttonPressed
1474                     	xdef	_editMode
1475                     	xdef	_nbReadings
1476                     	xdef	_humResults
1477                     	xdef	_tempResults
1478                     	xdef	_sendDataMsg
1479                     	xdef	_settingMsg
1480                     	xref	_BTN_init
1481                     	xdef	_HMIFSM
1482  0009               _HMIStatePtr:
1483  0009 0000          	ds.b	2
1484                     	xdef	_HMIStatePtr
1485                     	xref	_RTC_init
1486                     	xref	_LCD_display_settings
1487                     	xref	_LCD_min_max
1488                     	xref	_LCD_homescreen
1489                     	xref	_LCD_welcome
1490                     	xref	_LCD_writemsg
1491                     	xref	_LCD_clear
1492                     	xref	_LCD_init
1493                     	xref	_SPI_write
1494                     	xref	_SPI_init
1495                     	xref	_RTC_GetDate
1496                     	xref	_RTC_GetTime
1516                     	xref	c_lcmp
1517                     	xref	c_smul
1518                     	xref	c_ltor
1519                     	xref	c_lgadc
1520                     	xref	c_rtol
1521                     	xref	c_itolx
1522                     	end
