   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     .const:	section	.text
  14  0000               _op:
  15  0000 686568652100  	dc.b	"hehe!",0
  16  0006               _pressMSG:
  17  0006 505245535345  	dc.b	"PRESSED ME!",0
  18  0012               _settingMsg:
  19  0012 456469746162  	dc.b	"Editable!",0
  20  001c               _sendDataMsg:
  21  001c 506c7567206d  	dc.b	"Plug me in!",0
  22                     	bsct
  23  0000               _editMode:
  24  0000 00            	dc.b	0
  25  0001               _tempResults:
  26  0001 41a99999      	dc.w	16809,-26215
  27  0005 41ba6666      	dc.w	16826,26214
  28  0009 41c0cccc      	dc.w	16832,-13108
  29  000d 41b26666      	dc.w	16818,26214
  30  0011 41b40000      	dc.w	16820,0
  31  0015 41ae6666      	dc.w	16814,26214
  32  0019 41e59999      	dc.w	16869,-26215
  33  001d 41d59999      	dc.w	16853,-26215
  34  0021               _humResults:
  35  0021 42799999      	dc.w	17017,-26215
  36  0025 42793333      	dc.w	17017,13107
  37  0029 427ccccc      	dc.w	17020,-13108
  38  002d 42753333      	dc.w	17013,13107
  39  0031 427a0000      	dc.w	17018,0
  40  0035 42773333      	dc.w	17015,13107
  41  0039 42896666      	dc.w	17033,26214
  42  003d 42856666      	dc.w	17029,26214
  43  0041               _nbReadings:
  44  0041 41000000      	dc.w	16640,0
  45  0045               _HMIFSM:
  46  0045 00            	dc.b	0
  47  0046 0045          	dc.w	_HMIFSM
  48  0048 004a          	dc.w	_HMIFSM+5
  49  004a 01            	dc.b	1
  50  004b 0045          	dc.w	_HMIFSM
  51  004d 004f          	dc.w	_HMIFSM+10
  52  004f 02            	dc.b	2
  53  0050 0059          	dc.w	_HMIFSM+20
  54  0052 0054          	dc.w	_HMIFSM+15
  55  0054 03            	dc.b	3
  56  0055 004f          	dc.w	_HMIFSM+10
  57  0057 0059          	dc.w	_HMIFSM+20
  58  0059 04            	dc.b	4
  59  005a 0054          	dc.w	_HMIFSM+15
  60  005c 004f          	dc.w	_HMIFSM+10
  61  005e 05            	dc.b	5
  62  005f 0045          	dc.w	_HMIFSM
  63  0061 005e          	dc.w	_HMIFSM+25
  92                     ; 44 unsigned int clock(void)
  92                     ; 45 {
  94                     	switch	.text
  95  0000               _clock:
  99                     ; 46 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
 101  0000 c652bf        	ld	a,21183
 102  0003 5f            	clrw	x
 103  0004 97            	ld	xl,a
 104  0005 c652c0        	ld	a,21184
 105  0008 02            	rlwa	x,a
 108  0009 81            	ret
 170                     ; 49 void main(void)
 170                     ; 50 {
 171                     	switch	.text
 172  000a               _main:
 174  000a 88            	push	a
 175       00000001      OFST:	set	1
 178                     ; 52 	uint8_t cursorPos = 0;
 180                     ; 54 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 182  000b 725f50c0      	clr	20672
 183                     ; 55 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 185  000f c650c4        	ld	a,20676
 186  0012 aaff          	or	a,#255
 187  0014 c750c4        	ld	20676,a
 188                     ; 56 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 190  0017 c650c3        	ld	a,20675
 191  001a aaff          	or	a,#255
 192  001c c750c3        	ld	20675,a
 193                     ; 60 	SPI_init();
 195  001f cd0000        	call	_SPI_init
 197                     ; 62 	RTC_init();
 199  0022 cd0000        	call	_RTC_init
 201                     ; 64 	BTN_init();
 203  0025 cd0000        	call	_BTN_init
 205                     ; 66 	LCD_init();
 207  0028 cd0000        	call	_LCD_init
 209                     ; 68 	UART_init();
 211  002b cd0000        	call	_UART_init
 213                     ; 70 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 215  002e ae0045        	ldw	x,#_HMIFSM
 216  0031 bf09          	ldw	_HMIStatePtr,x
 217  0033               L35:
 218                     ; 75 		if (clock() % 1000 == 0)
 220  0033 adcb          	call	_clock
 222  0035 90ae03e8      	ldw	y,#1000
 223  0039 65            	divw	x,y
 224  003a 51            	exgw	x,y
 225  003b a30000        	cpw	x,#0
 226  003e 2612          	jrne	L75
 227                     ; 78 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
 229  0040 ae0004        	ldw	x,#_SRTC_TimeRead
 230  0043 89            	pushw	x
 231  0044 4f            	clr	a
 232  0045 cd0000        	call	_RTC_GetTime
 234  0048 85            	popw	x
 235                     ; 80 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
 237  0049 ae0000        	ldw	x,#_SRTC_DateRead
 238  004c 89            	pushw	x
 239  004d 4f            	clr	a
 240  004e cd0000        	call	_RTC_GetDate
 242  0051 85            	popw	x
 243  0052               L75:
 244                     ; 83 		if(GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
 246  0052 4b20          	push	#32
 247  0054 ae500a        	ldw	x,#20490
 248  0057 cd0000        	call	_GPIO_ReadInputDataBit
 250  005a 5b01          	addw	sp,#1
 251  005c 4d            	tnz	a
 252  005d 2719          	jreq	L16
 253                     ; 86 			UART_Poll();
 255  005f cd0000        	call	_UART_Poll
 257                     ; 87 			UART_2PC(nbReadings, tempResults, humResults);
 259  0062 ae0021        	ldw	x,#_humResults
 260  0065 89            	pushw	x
 261  0066 ae0001        	ldw	x,#_tempResults
 262  0069 89            	pushw	x
 263  006a ae0041        	ldw	x,#_nbReadings
 264  006d cd0000        	call	c_ltor
 266  0070 cd0000        	call	c_ftoi
 268  0073 cd0000        	call	_UART_2PC
 270  0076 5b04          	addw	sp,#4
 271  0078               L16:
 272                     ; 89 		switch (HMIStatePtr->outState)
 274  0078 92c609        	ld	a,[_HMIStatePtr.w]
 276                     ; 197 			break;
 277  007b 4d            	tnz	a
 278  007c 2717          	jreq	L12
 279  007e 4a            	dec	a
 280  007f 2725          	jreq	L32
 281  0081 4a            	dec	a
 282  0082 272d          	jreq	L52
 283  0084 4a            	dec	a
 284  0085 2771          	jreq	L72
 285  0087 4a            	dec	a
 286  0088 2603          	jrne	L02
 287  008a cc0129        	jp	L13
 288  008d               L02:
 289  008d 4a            	dec	a
 290  008e 2603          	jrne	L22
 291  0090 cc0198        	jp	L33
 292  0093               L22:
 293  0093 209e          	jra	L35
 294  0095               L12:
 295                     ; 91 		case DISPLAY_DORMANT:
 295                     ; 92 			LCD_clear();
 297  0095 cd0000        	call	_LCD_clear
 299                     ; 94 			if (buttonPressed != 0)
 301  0098 3d08          	tnz	_buttonPressed
 302  009a 2706          	jreq	L76
 303                     ; 95 				HMIStatePtr = HMIStatePtr->next;
 305  009c be09          	ldw	x,_HMIStatePtr
 306  009e ee03          	ldw	x,(3,x)
 307  00a0 bf09          	ldw	_HMIStatePtr,x
 308  00a2               L76:
 309                     ; 96 			buttonPressed = NO;
 311  00a2 3f08          	clr	_buttonPressed
 312                     ; 98 			break;
 314  00a4 208d          	jra	L35
 315  00a6               L32:
 316                     ; 99 		case DISPLAY_WELCOME:
 316                     ; 100 			LCD_welcome();
 318  00a6 cd0000        	call	_LCD_welcome
 320                     ; 101 			HMIStatePtr = HMIStatePtr->next;
 322  00a9 be09          	ldw	x,_HMIStatePtr
 323  00ab ee03          	ldw	x,(3,x)
 324  00ad bf09          	ldw	_HMIStatePtr,x
 325                     ; 103 			break;
 327  00af 2082          	jra	L35
 328  00b1               L52:
 329                     ; 104 		case DISPLAY_HOME:
 329                     ; 105 
 329                     ; 106 			// Showing temp and humidity and menu option
 329                     ; 107 			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, 18, 70);
 331  00b1 4b46          	push	#70
 332  00b3 4b12          	push	#18
 333  00b5 b607          	ld	a,_SRTC_TimeRead+3
 334  00b7 88            	push	a
 335  00b8 b606          	ld	a,_SRTC_TimeRead+2
 336  00ba 88            	push	a
 337  00bb b605          	ld	a,_SRTC_TimeRead+1
 338  00bd 88            	push	a
 339  00be b604          	ld	a,_SRTC_TimeRead
 340  00c0 88            	push	a
 341  00c1 b603          	ld	a,_SRTC_DateRead+3
 342  00c3 88            	push	a
 343  00c4 b602          	ld	a,_SRTC_DateRead+2
 344  00c6 88            	push	a
 345  00c7 b601          	ld	a,_SRTC_DateRead+1
 346  00c9 88            	push	a
 347  00ca b600          	ld	a,_SRTC_DateRead
 348  00cc 88            	push	a
 349  00cd cd0000        	call	_LCD_homescreen
 351  00d0 5b0a          	addw	sp,#10
 352                     ; 109 			if (buttonPressed == DOWN)
 354  00d2 b608          	ld	a,_buttonPressed
 355  00d4 a104          	cp	a,#4
 356  00d6 260b          	jrne	L17
 357                     ; 111 				HMIStatePtr = HMIStatePtr->next;
 359  00d8 be09          	ldw	x,_HMIStatePtr
 360  00da ee03          	ldw	x,(3,x)
 361  00dc bf09          	ldw	_HMIStatePtr,x
 362                     ; 112 				LCD_clear();
 364  00de cd0000        	call	_LCD_clear
 367  00e1 200f          	jra	L37
 368  00e3               L17:
 369                     ; 114 			else if (buttonPressed == UP)
 371  00e3 b608          	ld	a,_buttonPressed
 372  00e5 a105          	cp	a,#5
 373  00e7 2609          	jrne	L37
 374                     ; 116 				HMIStatePtr = HMIStatePtr->previous;
 376  00e9 be09          	ldw	x,_HMIStatePtr
 377  00eb ee01          	ldw	x,(1,x)
 378  00ed bf09          	ldw	_HMIStatePtr,x
 379                     ; 117 				LCD_clear();
 381  00ef cd0000        	call	_LCD_clear
 383  00f2               L37:
 384                     ; 119 			buttonPressed = NO;
 386  00f2 3f08          	clr	_buttonPressed
 387                     ; 120 			break;
 389  00f4 ac330033      	jpf	L35
 390  00f8               L72:
 391                     ; 122 		case DISPLAY_MIN_MAX:
 391                     ; 123 			LCD_min_max(12, 14, 8, 90);
 393  00f8 4b5a          	push	#90
 394  00fa 4b08          	push	#8
 395  00fc ae0c0e        	ldw	x,#3086
 396  00ff cd0000        	call	_LCD_min_max
 398  0102 85            	popw	x
 399                     ; 124 			if (buttonPressed == DOWN)
 401  0103 b608          	ld	a,_buttonPressed
 402  0105 a104          	cp	a,#4
 403  0107 260b          	jrne	L77
 404                     ; 126 				HMIStatePtr = HMIStatePtr->next;
 406  0109 be09          	ldw	x,_HMIStatePtr
 407  010b ee03          	ldw	x,(3,x)
 408  010d bf09          	ldw	_HMIStatePtr,x
 409                     ; 127 				LCD_clear();
 411  010f cd0000        	call	_LCD_clear
 414  0112 200f          	jra	L101
 415  0114               L77:
 416                     ; 129 			else if (buttonPressed == UP)
 418  0114 b608          	ld	a,_buttonPressed
 419  0116 a105          	cp	a,#5
 420  0118 2609          	jrne	L101
 421                     ; 131 				HMIStatePtr = HMIStatePtr->previous;
 423  011a be09          	ldw	x,_HMIStatePtr
 424  011c ee01          	ldw	x,(1,x)
 425  011e bf09          	ldw	_HMIStatePtr,x
 426                     ; 132 				LCD_clear();
 428  0120 cd0000        	call	_LCD_clear
 430  0123               L101:
 431                     ; 135 			buttonPressed = NO;
 433  0123 3f08          	clr	_buttonPressed
 434                     ; 136 			break;
 436  0125 ac330033      	jpf	L35
 437  0129               L13:
 438                     ; 137 		case DISPLAY_SETTINGS:
 438                     ; 138 			// Show settings to change frequency. Need to press ok to engage with screen
 438                     ; 139 
 438                     ; 140 			if (editMode == FALSE)
 440  0129 3d00          	tnz	_editMode
 441  012b 2639          	jrne	L501
 442                     ; 142 				LCD_display_settings();
 444  012d cd0000        	call	_LCD_display_settings
 446                     ; 143 				if (buttonPressed == DOWN)
 448  0130 b608          	ld	a,_buttonPressed
 449  0132 a104          	cp	a,#4
 450  0134 260b          	jrne	L701
 451                     ; 145 					HMIStatePtr = HMIStatePtr->next;
 453  0136 be09          	ldw	x,_HMIStatePtr
 454  0138 ee03          	ldw	x,(3,x)
 455  013a bf09          	ldw	_HMIStatePtr,x
 456                     ; 146 					LCD_clear();
 458  013c cd0000        	call	_LCD_clear
 461  013f 200f          	jra	L111
 462  0141               L701:
 463                     ; 148 				else if (buttonPressed == UP)
 465  0141 b608          	ld	a,_buttonPressed
 466  0143 a105          	cp	a,#5
 467  0145 2609          	jrne	L111
 468                     ; 150 					HMIStatePtr = HMIStatePtr->previous;
 470  0147 be09          	ldw	x,_HMIStatePtr
 471  0149 ee01          	ldw	x,(1,x)
 472  014b bf09          	ldw	_HMIStatePtr,x
 473                     ; 151 					LCD_clear();
 475  014d cd0000        	call	_LCD_clear
 477  0150               L111:
 478                     ; 153 				if (buttonPressed == OK)
 480  0150 b608          	ld	a,_buttonPressed
 481  0152 a103          	cp	a,#3
 482  0154 263c          	jrne	L711
 483                     ; 155 					editMode = !editMode;
 485  0156 3d00          	tnz	_editMode
 486  0158 2604          	jrne	L01
 487  015a a601          	ld	a,#1
 488  015c 2001          	jra	L21
 489  015e               L01:
 490  015e 4f            	clr	a
 491  015f               L21:
 492  015f b700          	ld	_editMode,a
 493                     ; 156 					LCD_clear();
 495  0161 cd0000        	call	_LCD_clear
 497  0164 202c          	jra	L711
 498  0166               L501:
 499                     ; 162 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 501  0166 4b03          	push	#3
 502  0168 4b14          	push	#20
 503  016a 4b0a          	push	#10
 504  016c ae0012        	ldw	x,#_settingMsg
 505  016f cd0000        	call	_LCD_writemsg
 507  0172 5b03          	addw	sp,#3
 508                     ; 164 				if (buttonPressed == DOWN)
 510  0174 b608          	ld	a,_buttonPressed
 511  0176 a104          	cp	a,#4
 512  0178 2704          	jreq	L321
 514                     ; 168 				else if (buttonPressed == UP)
 516  017a b608          	ld	a,_buttonPressed
 517  017c a105          	cp	a,#5
 518  017e               L321:
 519                     ; 172 				if (buttonPressed == OK)
 521  017e b608          	ld	a,_buttonPressed
 522  0180 a103          	cp	a,#3
 523  0182 260e          	jrne	L711
 524                     ; 174 					editMode = !editMode;
 526  0184 3d00          	tnz	_editMode
 527  0186 2604          	jrne	L41
 528  0188 a601          	ld	a,#1
 529  018a 2001          	jra	L61
 530  018c               L41:
 531  018c 4f            	clr	a
 532  018d               L61:
 533  018d b700          	ld	_editMode,a
 534                     ; 175 					LCD_clear();
 536  018f cd0000        	call	_LCD_clear
 538  0192               L711:
 539                     ; 179 			buttonPressed = NO;
 541  0192 3f08          	clr	_buttonPressed
 542                     ; 180 			break;
 544  0194 ac330033      	jpf	L35
 545  0198               L33:
 546                     ; 182 		case DISPLAY_SEND_DATA:
 546                     ; 183 			// Show instructions to send data
 546                     ; 184 			if (buttonPressed == DOWN)
 548  0198 b608          	ld	a,_buttonPressed
 549  019a a104          	cp	a,#4
 550  019c 260b          	jrne	L131
 551                     ; 186 				HMIStatePtr = HMIStatePtr->next;
 553  019e be09          	ldw	x,_HMIStatePtr
 554  01a0 ee03          	ldw	x,(3,x)
 555  01a2 bf09          	ldw	_HMIStatePtr,x
 556                     ; 187 				LCD_clear();
 558  01a4 cd0000        	call	_LCD_clear
 561  01a7 200f          	jra	L331
 562  01a9               L131:
 563                     ; 189 			else if (buttonPressed == UP)
 565  01a9 b608          	ld	a,_buttonPressed
 566  01ab a105          	cp	a,#5
 567  01ad 2609          	jrne	L331
 568                     ; 191 				HMIStatePtr = HMIStatePtr->previous;
 570  01af be09          	ldw	x,_HMIStatePtr
 571  01b1 ee01          	ldw	x,(1,x)
 572  01b3 bf09          	ldw	_HMIStatePtr,x
 573                     ; 192 				LCD_clear();
 575  01b5 cd0000        	call	_LCD_clear
 577  01b8               L331:
 578                     ; 195 			LCD_writemsg(sendDataMsg, sizeof(sendDataMsg), 20, 3);
 580  01b8 4b03          	push	#3
 581  01ba 4b14          	push	#20
 582  01bc 4b0c          	push	#12
 583  01be ae001c        	ldw	x,#_sendDataMsg
 584  01c1 cd0000        	call	_LCD_writemsg
 586  01c4 5b03          	addw	sp,#3
 587                     ; 196 			buttonPressed = NO;
 589  01c6 3f08          	clr	_buttonPressed
 590                     ; 197 			break;
 592  01c8 ac330033      	jpf	L35
 593  01cc               L56:
 595  01cc ac330033      	jpf	L35
1100                     	xdef	_main
1101                     	xdef	_clock
1102                     	switch	.ubsct
1103  0000               _SRTC_DateRead:
1104  0000 00000000      	ds.b	4
1105                     	xdef	_SRTC_DateRead
1106  0004               _SRTC_TimeRead:
1107  0004 00000000      	ds.b	4
1108                     	xdef	_SRTC_TimeRead
1109  0008               _buttonPressed:
1110  0008 00            	ds.b	1
1111                     	xdef	_buttonPressed
1112                     	xdef	_nbReadings
1113                     	xdef	_humResults
1114                     	xdef	_tempResults
1115                     	xdef	_editMode
1116                     	xdef	_sendDataMsg
1117                     	xdef	_settingMsg
1118                     	xdef	_pressMSG
1119                     	xdef	_op
1120                     	xref	_BTN_init
1121                     	xdef	_HMIFSM
1122  0009               _HMIStatePtr:
1123  0009 0000          	ds.b	2
1124                     	xdef	_HMIStatePtr
1125                     	xref	_UART_2PC
1126                     	xref	_UART_Poll
1127                     	xref	_UART_init
1128                     	xref	_RTC_init
1129                     	xref	_LCD_display_settings
1130                     	xref	_LCD_min_max
1131                     	xref	_LCD_homescreen
1132                     	xref	_LCD_welcome
1133                     	xref	_LCD_writemsg
1134                     	xref	_LCD_clear
1135                     	xref	_LCD_init
1136                     	xref	_SPI_init
1137                     	xref	_RTC_GetDate
1138                     	xref	_RTC_GetTime
1139                     	xref	_GPIO_ReadInputDataBit
1159                     	xref	c_ftoi
1160                     	xref	c_ltor
1161                     	end
