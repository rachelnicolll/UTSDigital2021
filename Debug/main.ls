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
  25  0001               _HMIFSM:
  26  0001 00            	dc.b	0
  27  0002 0001          	dc.w	_HMIFSM
  28  0004 0006          	dc.w	_HMIFSM+5
  29  0006 01            	dc.b	1
  30  0007 0001          	dc.w	_HMIFSM
  31  0009 000b          	dc.w	_HMIFSM+10
  32  000b 02            	dc.b	2
  33  000c 0015          	dc.w	_HMIFSM+20
  34  000e 0010          	dc.w	_HMIFSM+15
  35  0010 03            	dc.b	3
  36  0011 000b          	dc.w	_HMIFSM+10
  37  0013 0015          	dc.w	_HMIFSM+20
  38  0015 04            	dc.b	4
  39  0016 0010          	dc.w	_HMIFSM+15
  40  0018 000b          	dc.w	_HMIFSM+10
  41  001a 05            	dc.b	5
  42  001b 0001          	dc.w	_HMIFSM
  43  001d 001a          	dc.w	_HMIFSM+25
  72                     ; 39 unsigned int clock(void)
  72                     ; 40 {
  74                     	switch	.text
  75  0000               _clock:
  79                     ; 41 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  81  0000 c652bf        	ld	a,21183
  82  0003 5f            	clrw	x
  83  0004 97            	ld	xl,a
  84  0005 c652c0        	ld	a,21184
  85  0008 02            	rlwa	x,a
  88  0009 81            	ret
 143                     ; 44 void main(void)
 143                     ; 45 {
 144                     	switch	.text
 145  000a               _main:
 147  000a 88            	push	a
 148       00000001      OFST:	set	1
 151                     ; 47 	uint8_t cursorPos = 0;
 153                     ; 49 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 155  000b 725f50c0      	clr	20672
 156                     ; 50 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 158  000f c650c4        	ld	a,20676
 159  0012 aaff          	or	a,#255
 160  0014 c750c4        	ld	20676,a
 161                     ; 51 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 163  0017 c650c3        	ld	a,20675
 164  001a aaff          	or	a,#255
 165  001c c750c3        	ld	20675,a
 166                     ; 65 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
 168  001f 3508500c      	mov	20492,#8
 169                     ; 66 	GPIOC->CR1 = 0x08; // 0b0000 1000
 171  0023 3508500d      	mov	20493,#8
 172                     ; 69 	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
 174  0027 35085235      	mov	21045,#8
 175                     ; 70 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
 177  002b c65236        	ld	a,21046
 178  002e a4cf          	and	a,#207
 179  0030 c75236        	ld	21046,a
 180                     ; 71 	USART1->BRR2 = 0x03;
 182  0033 35035233      	mov	21043,#3
 183                     ; 72 	USART1->BRR1 = 0x68; // 9600 baud
 185  0037 35685232      	mov	21042,#104
 186                     ; 75 	SPI_init();
 188  003b cd0000        	call	_SPI_init
 190                     ; 77 	RTC_init();
 192  003e cd0000        	call	_RTC_init
 194                     ; 79 	BTN_init();
 196  0041 cd0000        	call	_BTN_init
 198                     ; 81 	LCD_init();
 200  0044 cd0000        	call	_LCD_init
 202                     ; 83 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 204  0047 ae0001        	ldw	x,#_HMIFSM
 205  004a bf09          	ldw	_HMIStatePtr,x
 206  004c               L35:
 207                     ; 88 		if (clock() % 1000 == 0)
 209  004c adb2          	call	_clock
 211  004e 90ae03e8      	ldw	y,#1000
 212  0052 65            	divw	x,y
 213  0053 51            	exgw	x,y
 214  0054 a30000        	cpw	x,#0
 215  0057 2612          	jrne	L75
 216                     ; 91 			RTC_GetTime(RTC_Format_BIN,&SRTC_TimeRead);
 218  0059 ae0004        	ldw	x,#_SRTC_TimeRead
 219  005c 89            	pushw	x
 220  005d 4f            	clr	a
 221  005e cd0000        	call	_RTC_GetTime
 223  0061 85            	popw	x
 224                     ; 93 			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);  
 226  0062 ae0000        	ldw	x,#_SRTC_DateRead
 227  0065 89            	pushw	x
 228  0066 4f            	clr	a
 229  0067 cd0000        	call	_RTC_GetDate
 231  006a 85            	popw	x
 232  006b               L75:
 233                     ; 95 		switch (HMIStatePtr->outState)
 235  006b 92c609        	ld	a,[_HMIStatePtr.w]
 237                     ; 196 			break;
 238  006e 4d            	tnz	a
 239  006f 2717          	jreq	L12
 240  0071 4a            	dec	a
 241  0072 2725          	jreq	L32
 242  0074 4a            	dec	a
 243  0075 272d          	jreq	L52
 244  0077 4a            	dec	a
 245  0078 2764          	jreq	L72
 246  007a 4a            	dec	a
 247  007b 2603          	jrne	L01
 248  007d cc010f        	jp	L13
 249  0080               L01:
 250  0080 4a            	dec	a
 251  0081 2603          	jrne	L21
 252  0083 cc016d        	jp	L33
 253  0086               L21:
 254  0086 20c4          	jra	L35
 255  0088               L12:
 256                     ; 97 		case DISPLAY_DORMANT:
 256                     ; 98 			LCD_clear();
 258  0088 cd0000        	call	_LCD_clear
 260                     ; 100 			if (buttonPressed != 0)
 262  008b 3d08          	tnz	_buttonPressed
 263  008d 2706          	jreq	L56
 264                     ; 101 				HMIStatePtr = HMIStatePtr->next;
 266  008f be09          	ldw	x,_HMIStatePtr
 267  0091 ee03          	ldw	x,(3,x)
 268  0093 bf09          	ldw	_HMIStatePtr,x
 269  0095               L56:
 270                     ; 102 			buttonPressed = NO;
 272  0095 3f08          	clr	_buttonPressed
 273                     ; 104 			break;
 275  0097 20b3          	jra	L35
 276  0099               L32:
 277                     ; 105 		case DISPLAY_WELCOME:
 277                     ; 106 			LCD_welcome();
 279  0099 cd0000        	call	_LCD_welcome
 281                     ; 107 			HMIStatePtr = HMIStatePtr->next;
 283  009c be09          	ldw	x,_HMIStatePtr
 284  009e ee03          	ldw	x,(3,x)
 285  00a0 bf09          	ldw	_HMIStatePtr,x
 286                     ; 109 			break;
 288  00a2 20a8          	jra	L35
 289  00a4               L52:
 290                     ; 110 		case DISPLAY_HOME:
 290                     ; 111 
 290                     ; 112 			// Showing temp and humidity and menu option
 290                     ; 113 			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, "18", "70");
 292  00a4 ae0028        	ldw	x,#L17
 293  00a7 89            	pushw	x
 294  00a8 ae002b        	ldw	x,#L76
 295  00ab 89            	pushw	x
 296  00ac b607          	ld	a,_SRTC_TimeRead+3
 297  00ae 88            	push	a
 298  00af b606          	ld	a,_SRTC_TimeRead+2
 299  00b1 88            	push	a
 300  00b2 b605          	ld	a,_SRTC_TimeRead+1
 301  00b4 88            	push	a
 302  00b5 b604          	ld	a,_SRTC_TimeRead
 303  00b7 88            	push	a
 304  00b8 b603          	ld	a,_SRTC_DateRead+3
 305  00ba 88            	push	a
 306  00bb b602          	ld	a,_SRTC_DateRead+2
 307  00bd 88            	push	a
 308  00be b601          	ld	a,_SRTC_DateRead+1
 309  00c0 88            	push	a
 310  00c1 b600          	ld	a,_SRTC_DateRead
 311  00c3 88            	push	a
 312  00c4 cd0000        	call	_LCD_homescreen
 314  00c7 5b0c          	addw	sp,#12
 315                     ; 115 			if (buttonPressed == DOWN)
 317  00c9 b608          	ld	a,_buttonPressed
 318  00cb a104          	cp	a,#4
 319  00cd 2609          	jrne	L37
 320                     ; 117 				HMIStatePtr = HMIStatePtr->next;
 322  00cf be09          	ldw	x,_HMIStatePtr
 323  00d1 ee03          	ldw	x,(3,x)
 324  00d3 bf09          	ldw	_HMIStatePtr,x
 325                     ; 118 				LCD_clear();
 327  00d5 cd0000        	call	_LCD_clear
 329  00d8               L37:
 330                     ; 120 			buttonPressed = NO;
 332  00d8 3f08          	clr	_buttonPressed
 333                     ; 121 			break;
 335  00da ac4c004c      	jpf	L35
 336  00de               L72:
 337                     ; 123 		case DISPLAY_MIN_MAX:
 337                     ; 124 			LCD_min_max(12, 14, 8, 90);
 339  00de 4b5a          	push	#90
 340  00e0 4b08          	push	#8
 341  00e2 ae0c0e        	ldw	x,#3086
 342  00e5 cd0000        	call	_LCD_min_max
 344  00e8 85            	popw	x
 345                     ; 125 			if (buttonPressed == DOWN)
 347  00e9 b608          	ld	a,_buttonPressed
 348  00eb a104          	cp	a,#4
 349  00ed 260b          	jrne	L57
 350                     ; 127 				HMIStatePtr = HMIStatePtr->next;
 352  00ef be09          	ldw	x,_HMIStatePtr
 353  00f1 ee03          	ldw	x,(3,x)
 354  00f3 bf09          	ldw	_HMIStatePtr,x
 355                     ; 128 				LCD_clear();
 357  00f5 cd0000        	call	_LCD_clear
 360  00f8 200f          	jra	L77
 361  00fa               L57:
 362                     ; 130 			else if (buttonPressed == UP)
 364  00fa b608          	ld	a,_buttonPressed
 365  00fc a105          	cp	a,#5
 366  00fe 2609          	jrne	L77
 367                     ; 132 				HMIStatePtr = HMIStatePtr->previous;
 369  0100 be09          	ldw	x,_HMIStatePtr
 370  0102 ee01          	ldw	x,(1,x)
 371  0104 bf09          	ldw	_HMIStatePtr,x
 372                     ; 133 				LCD_clear();
 374  0106 cd0000        	call	_LCD_clear
 376  0109               L77:
 377                     ; 136 			buttonPressed = NO;
 379  0109 3f08          	clr	_buttonPressed
 380                     ; 137 			break;
 382  010b ac4c004c      	jpf	L35
 383  010f               L13:
 384                     ; 138 		case DISPLAY_SETTINGS:
 384                     ; 139 			// Show settings to change frequency. Need to press ok to engage with screen
 384                     ; 140 			LCD_display_settings();
 386  010f cd0000        	call	_LCD_display_settings
 388                     ; 142 			if (editMode == FALSE)
 390  0112 3d00          	tnz	_editMode
 391  0114 262c          	jrne	L301
 392                     ; 144 				if (buttonPressed == DOWN)
 394  0116 b608          	ld	a,_buttonPressed
 395  0118 a104          	cp	a,#4
 396  011a 260b          	jrne	L501
 397                     ; 146 					HMIStatePtr = HMIStatePtr->next;
 399  011c be09          	ldw	x,_HMIStatePtr
 400  011e ee03          	ldw	x,(3,x)
 401  0120 bf09          	ldw	_HMIStatePtr,x
 402                     ; 147 					LCD_clear();
 404  0122 cd0000        	call	_LCD_clear
 407  0125 2040          	jra	L711
 408  0127               L501:
 409                     ; 149 				else if (buttonPressed == UP)
 411  0127 b608          	ld	a,_buttonPressed
 412  0129 a105          	cp	a,#5
 413  012b 260b          	jrne	L111
 414                     ; 151 					HMIStatePtr = HMIStatePtr->previous;
 416  012d be09          	ldw	x,_HMIStatePtr
 417  012f ee01          	ldw	x,(1,x)
 418  0131 bf09          	ldw	_HMIStatePtr,x
 419                     ; 152 					LCD_clear();
 421  0133 cd0000        	call	_LCD_clear
 424  0136 202f          	jra	L711
 425  0138               L111:
 426                     ; 154 				else if (buttonPressed == OK)
 428  0138 b608          	ld	a,_buttonPressed
 429  013a a103          	cp	a,#3
 430  013c 2629          	jrne	L711
 431                     ; 155 					editMode ^= editMode;
 433  013e 3f00          	clr	_editMode
 434  0140 2025          	jra	L711
 435  0142               L301:
 436                     ; 160 				LCD_clear();
 438  0142 cd0000        	call	_LCD_clear
 440                     ; 161 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 442  0145 4b03          	push	#3
 443  0147 4b14          	push	#20
 444  0149 4b0a          	push	#10
 445  014b ae0012        	ldw	x,#_settingMsg
 446  014e cd0000        	call	_LCD_writemsg
 448  0151 5b03          	addw	sp,#3
 449                     ; 163 				if (buttonPressed == DOWN)
 451  0153 b608          	ld	a,_buttonPressed
 452  0155 a104          	cp	a,#4
 453  0157 270e          	jreq	L711
 455                     ; 167 				else if (buttonPressed == UP)
 457  0159 b608          	ld	a,_buttonPressed
 458  015b a105          	cp	a,#5
 459  015d 2708          	jreq	L711
 461                     ; 171 				else if (buttonPressed == OK)
 463  015f b608          	ld	a,_buttonPressed
 464  0161 a103          	cp	a,#3
 465  0163 2602          	jrne	L711
 466                     ; 174 					editMode ^= editMode;
 468  0165 3f00          	clr	_editMode
 469  0167               L711:
 470                     ; 178 			buttonPressed = NO;
 472  0167 3f08          	clr	_buttonPressed
 473                     ; 179 			break;
 475  0169 ac4c004c      	jpf	L35
 476  016d               L33:
 477                     ; 181 		case DISPLAY_SEND_DATA:
 477                     ; 182 			// Show instructions to send data
 477                     ; 183 			if (buttonPressed == DOWN)
 479  016d b608          	ld	a,_buttonPressed
 480  016f a104          	cp	a,#4
 481  0171 260b          	jrne	L331
 482                     ; 185 				HMIStatePtr = HMIStatePtr->next;
 484  0173 be09          	ldw	x,_HMIStatePtr
 485  0175 ee03          	ldw	x,(3,x)
 486  0177 bf09          	ldw	_HMIStatePtr,x
 487                     ; 186 				LCD_clear();
 489  0179 cd0000        	call	_LCD_clear
 492  017c 200f          	jra	L531
 493  017e               L331:
 494                     ; 188 			else if (buttonPressed == UP)
 496  017e b608          	ld	a,_buttonPressed
 497  0180 a105          	cp	a,#5
 498  0182 2609          	jrne	L531
 499                     ; 190 				HMIStatePtr = HMIStatePtr->previous;
 501  0184 be09          	ldw	x,_HMIStatePtr
 502  0186 ee01          	ldw	x,(1,x)
 503  0188 bf09          	ldw	_HMIStatePtr,x
 504                     ; 191 				LCD_clear();
 506  018a cd0000        	call	_LCD_clear
 508  018d               L531:
 509                     ; 194 			LCD_writemsg(sendDataMsg, sizeof(sendDataMsg), 20, 3);
 511  018d 4b03          	push	#3
 512  018f 4b14          	push	#20
 513  0191 4b0c          	push	#12
 514  0193 ae001c        	ldw	x,#_sendDataMsg
 515  0196 cd0000        	call	_LCD_writemsg
 517  0199 5b03          	addw	sp,#3
 518                     ; 195 			buttonPressed = NO;
 520  019b 3f08          	clr	_buttonPressed
 521                     ; 196 			break;
 523  019d ac4c004c      	jpf	L35
 524  01a1               L36:
 526  01a1 ac4c004c      	jpf	L35
1002                     	xdef	_main
1003                     	xdef	_clock
1004                     	switch	.ubsct
1005  0000               _SRTC_DateRead:
1006  0000 00000000      	ds.b	4
1007                     	xdef	_SRTC_DateRead
1008  0004               _SRTC_TimeRead:
1009  0004 00000000      	ds.b	4
1010                     	xdef	_SRTC_TimeRead
1011  0008               _buttonPressed:
1012  0008 00            	ds.b	1
1013                     	xdef	_buttonPressed
1014                     	xdef	_editMode
1015                     	xdef	_sendDataMsg
1016                     	xdef	_settingMsg
1017                     	xdef	_pressMSG
1018                     	xdef	_op
1019                     	xref	_BTN_init
1020                     	xdef	_HMIFSM
1021  0009               _HMIStatePtr:
1022  0009 0000          	ds.b	2
1023                     	xdef	_HMIStatePtr
1024                     	xref	_RTC_init
1025                     	xref	_LCD_display_settings
1026                     	xref	_LCD_min_max
1027                     	xref	_LCD_homescreen
1028                     	xref	_LCD_welcome
1029                     	xref	_LCD_writemsg
1030                     	xref	_LCD_clear
1031                     	xref	_LCD_init
1032                     	xref	_SPI_init
1033                     	xref	_RTC_GetDate
1034                     	xref	_RTC_GetTime
1035                     	switch	.const
1036  0028               L17:
1037  0028 373000        	dc.b	"70",0
1038  002b               L76:
1039  002b 313800        	dc.b	"18",0
1059                     	end
