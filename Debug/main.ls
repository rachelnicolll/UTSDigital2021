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
 237                     ; 192 			break;
 238  006e 4d            	tnz	a
 239  006f 2717          	jreq	L12
 240  0071 4a            	dec	a
 241  0072 2725          	jreq	L32
 242  0074 4a            	dec	a
 243  0075 272d          	jreq	L52
 244  0077 4a            	dec	a
 245  0078 2760          	jreq	L72
 246  007a 4a            	dec	a
 247  007b 2603          	jrne	L01
 248  007d cc010b        	jp	L13
 249  0080               L01:
 250  0080 4a            	dec	a
 251  0081 2603          	jrne	L21
 252  0083 cc015d        	jp	L33
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
 290                     ; 113 			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, 18, 70);
 292  00a4 4b46          	push	#70
 293  00a6 4b12          	push	#18
 294  00a8 b607          	ld	a,_SRTC_TimeRead+3
 295  00aa 88            	push	a
 296  00ab b606          	ld	a,_SRTC_TimeRead+2
 297  00ad 88            	push	a
 298  00ae b605          	ld	a,_SRTC_TimeRead+1
 299  00b0 88            	push	a
 300  00b1 b604          	ld	a,_SRTC_TimeRead
 301  00b3 88            	push	a
 302  00b4 b603          	ld	a,_SRTC_DateRead+3
 303  00b6 88            	push	a
 304  00b7 b602          	ld	a,_SRTC_DateRead+2
 305  00b9 88            	push	a
 306  00ba b601          	ld	a,_SRTC_DateRead+1
 307  00bc 88            	push	a
 308  00bd b600          	ld	a,_SRTC_DateRead
 309  00bf 88            	push	a
 310  00c0 cd0000        	call	_LCD_homescreen
 312  00c3 5b0a          	addw	sp,#10
 313                     ; 115 			if (buttonPressed == DOWN)
 315  00c5 b608          	ld	a,_buttonPressed
 316  00c7 a104          	cp	a,#4
 317  00c9 2609          	jrne	L76
 318                     ; 117 				HMIStatePtr = HMIStatePtr->next;
 320  00cb be09          	ldw	x,_HMIStatePtr
 321  00cd ee03          	ldw	x,(3,x)
 322  00cf bf09          	ldw	_HMIStatePtr,x
 323                     ; 118 				LCD_clear();
 325  00d1 cd0000        	call	_LCD_clear
 327  00d4               L76:
 328                     ; 120 			buttonPressed = NO;
 330  00d4 3f08          	clr	_buttonPressed
 331                     ; 121 			break;
 333  00d6 ac4c004c      	jpf	L35
 334  00da               L72:
 335                     ; 123 		case DISPLAY_MIN_MAX:
 335                     ; 124 			LCD_min_max(12, 14, 8, 90);
 337  00da 4b5a          	push	#90
 338  00dc 4b08          	push	#8
 339  00de ae0c0e        	ldw	x,#3086
 340  00e1 cd0000        	call	_LCD_min_max
 342  00e4 85            	popw	x
 343                     ; 125 			if (buttonPressed == DOWN)
 345  00e5 b608          	ld	a,_buttonPressed
 346  00e7 a104          	cp	a,#4
 347  00e9 260b          	jrne	L17
 348                     ; 127 				HMIStatePtr = HMIStatePtr->next;
 350  00eb be09          	ldw	x,_HMIStatePtr
 351  00ed ee03          	ldw	x,(3,x)
 352  00ef bf09          	ldw	_HMIStatePtr,x
 353                     ; 128 				LCD_clear();
 355  00f1 cd0000        	call	_LCD_clear
 358  00f4 200f          	jra	L37
 359  00f6               L17:
 360                     ; 130 			else if (buttonPressed == UP)
 362  00f6 b608          	ld	a,_buttonPressed
 363  00f8 a105          	cp	a,#5
 364  00fa 2609          	jrne	L37
 365                     ; 132 				HMIStatePtr = HMIStatePtr->previous;
 367  00fc be09          	ldw	x,_HMIStatePtr
 368  00fe ee01          	ldw	x,(1,x)
 369  0100 bf09          	ldw	_HMIStatePtr,x
 370                     ; 133 				LCD_clear();
 372  0102 cd0000        	call	_LCD_clear
 374  0105               L37:
 375                     ; 136 			buttonPressed = NO;
 377  0105 3f08          	clr	_buttonPressed
 378                     ; 137 			break;
 380  0107 ac4c004c      	jpf	L35
 381  010b               L13:
 382                     ; 138 		case DISPLAY_SETTINGS:
 382                     ; 139 			// Show settings to change frequency. Need to press ok to engage with screen
 382                     ; 140 			LCD_display_settings();
 384  010b cd0000        	call	_LCD_display_settings
 386                     ; 142 			if (buttonPressed == OK)
 388  010e b608          	ld	a,_buttonPressed
 389  0110 a103          	cp	a,#3
 390  0112 2602          	jrne	L77
 391                     ; 143 					editMode ^= editMode;
 393  0114 3f00          	clr	_editMode
 394  0116               L77:
 395                     ; 145 			if (editMode == FALSE)
 397  0116 3d00          	tnz	_editMode
 398  0118 2622          	jrne	L101
 399                     ; 147 				if (buttonPressed == DOWN)
 401  011a b608          	ld	a,_buttonPressed
 402  011c a104          	cp	a,#4
 403  011e 260b          	jrne	L301
 404                     ; 149 					HMIStatePtr = HMIStatePtr->next;
 406  0120 be09          	ldw	x,_HMIStatePtr
 407  0122 ee03          	ldw	x,(3,x)
 408  0124 bf09          	ldw	_HMIStatePtr,x
 409                     ; 150 					LCD_clear();
 411  0126 cd0000        	call	_LCD_clear
 414  0129 202c          	jra	L111
 415  012b               L301:
 416                     ; 152 				else if (buttonPressed == UP)
 418  012b b608          	ld	a,_buttonPressed
 419  012d a105          	cp	a,#5
 420  012f 2626          	jrne	L111
 421                     ; 154 					HMIStatePtr = HMIStatePtr->previous;
 423  0131 be09          	ldw	x,_HMIStatePtr
 424  0133 ee01          	ldw	x,(1,x)
 425  0135 bf09          	ldw	_HMIStatePtr,x
 426                     ; 155 					LCD_clear();
 428  0137 cd0000        	call	_LCD_clear
 430  013a 201b          	jra	L111
 431  013c               L101:
 432                     ; 161 				LCD_clear();
 434  013c cd0000        	call	_LCD_clear
 436                     ; 162 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 438  013f 4b03          	push	#3
 439  0141 4b14          	push	#20
 440  0143 4b0a          	push	#10
 441  0145 ae0012        	ldw	x,#_settingMsg
 442  0148 cd0000        	call	_LCD_writemsg
 444  014b 5b03          	addw	sp,#3
 445                     ; 164 				if (buttonPressed == DOWN)
 447  014d b608          	ld	a,_buttonPressed
 448  014f a104          	cp	a,#4
 449  0151 2704          	jreq	L111
 451                     ; 168 				else if (buttonPressed == UP)
 453  0153 b608          	ld	a,_buttonPressed
 454  0155 a105          	cp	a,#5
 455  0157               L111:
 456                     ; 174 			buttonPressed = NO;
 458  0157 3f08          	clr	_buttonPressed
 459                     ; 175 			break;
 461  0159 ac4c004c      	jpf	L35
 462  015d               L33:
 463                     ; 177 		case DISPLAY_SEND_DATA:
 463                     ; 178 			// Show instructions to send data
 463                     ; 179 			if (buttonPressed == DOWN)
 465  015d b608          	ld	a,_buttonPressed
 466  015f a104          	cp	a,#4
 467  0161 260b          	jrne	L121
 468                     ; 181 				HMIStatePtr = HMIStatePtr->next;
 470  0163 be09          	ldw	x,_HMIStatePtr
 471  0165 ee03          	ldw	x,(3,x)
 472  0167 bf09          	ldw	_HMIStatePtr,x
 473                     ; 182 				LCD_clear();
 475  0169 cd0000        	call	_LCD_clear
 478  016c 200f          	jra	L321
 479  016e               L121:
 480                     ; 184 			else if (buttonPressed == UP)
 482  016e b608          	ld	a,_buttonPressed
 483  0170 a105          	cp	a,#5
 484  0172 2609          	jrne	L321
 485                     ; 186 				HMIStatePtr = HMIStatePtr->previous;
 487  0174 be09          	ldw	x,_HMIStatePtr
 488  0176 ee01          	ldw	x,(1,x)
 489  0178 bf09          	ldw	_HMIStatePtr,x
 490                     ; 187 				LCD_clear();
 492  017a cd0000        	call	_LCD_clear
 494  017d               L321:
 495                     ; 190 			LCD_writemsg(sendDataMsg, sizeof(sendDataMsg), 20, 3);
 497  017d 4b03          	push	#3
 498  017f 4b14          	push	#20
 499  0181 4b0c          	push	#12
 500  0183 ae001c        	ldw	x,#_sendDataMsg
 501  0186 cd0000        	call	_LCD_writemsg
 503  0189 5b03          	addw	sp,#3
 504                     ; 191 			buttonPressed = NO;
 506  018b 3f08          	clr	_buttonPressed
 507                     ; 192 			break;
 509  018d ac4c004c      	jpf	L35
 510  0191               L36:
 512  0191 ac4c004c      	jpf	L35
 988                     	xdef	_main
 989                     	xdef	_clock
 990                     	switch	.ubsct
 991  0000               _SRTC_DateRead:
 992  0000 00000000      	ds.b	4
 993                     	xdef	_SRTC_DateRead
 994  0004               _SRTC_TimeRead:
 995  0004 00000000      	ds.b	4
 996                     	xdef	_SRTC_TimeRead
 997  0008               _buttonPressed:
 998  0008 00            	ds.b	1
 999                     	xdef	_buttonPressed
1000                     	xdef	_editMode
1001                     	xdef	_sendDataMsg
1002                     	xdef	_settingMsg
1003                     	xdef	_pressMSG
1004                     	xdef	_op
1005                     	xref	_BTN_init
1006                     	xdef	_HMIFSM
1007  0009               _HMIStatePtr:
1008  0009 0000          	ds.b	2
1009                     	xdef	_HMIStatePtr
1010                     	xref	_RTC_init
1011                     	xref	_LCD_display_settings
1012                     	xref	_LCD_min_max
1013                     	xref	_LCD_homescreen
1014                     	xref	_LCD_welcome
1015                     	xref	_LCD_writemsg
1016                     	xref	_LCD_clear
1017                     	xref	_LCD_init
1018                     	xref	_SPI_init
1019                     	xref	_RTC_GetDate
1020                     	xref	_RTC_GetTime
1040                     	end
