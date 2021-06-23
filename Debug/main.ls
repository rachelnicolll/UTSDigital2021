   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
<<<<<<< HEAD
  13                     	bsct
  14  0000               _tempResults:
  15  0000 41a99999      	dc.w	16809,-26215
  16  0004 41ba6666      	dc.w	16826,26214
  17  0008 41c0cccc      	dc.w	16832,-13108
  18  000c 41b26666      	dc.w	16818,26214
  19  0010 41b40000      	dc.w	16820,0
  20  0014 41ae6666      	dc.w	16814,26214
  21  0018 41e59999      	dc.w	16869,-26215
  22  001c 41d59999      	dc.w	16853,-26215
  23  0020               _humResults:
  24  0020 42799999      	dc.w	17017,-26215
  25  0024 42793333      	dc.w	17017,13107
  26  0028 427ccccc      	dc.w	17020,-13108
  27  002c 42753333      	dc.w	17013,13107
  28  0030 427a0000      	dc.w	17018,0
  29  0034 42773333      	dc.w	17015,13107
  30  0038 42896666      	dc.w	17033,26214
  31  003c 42856666      	dc.w	17029,26214
  32  0040               _nbReadings:
  33  0040 41000000      	dc.w	16640,0
  62                     ; 15 unsigned int clock(void)
  62                     ; 16 {
  64                     	switch	.text
  65  0000               _clock:
  69                     ; 17 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  71  0000 c652bf        	ld	a,21183
  72  0003 5f            	clrw	x
  73  0004 97            	ld	xl,a
  74  0005 c652c0        	ld	a,21184
  75  0008 02            	rlwa	x,a
  78  0009 81            	ret
 109                     ; 20 void main(void)
 109                     ; 21 {
 110                     	switch	.text
 111  000a               _main:
 115                     ; 22 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 117  000a 725f50c0      	clr	20672
 118                     ; 23 	led_blink_init();
 120  000e cd0000        	call	_led_blink_init
 122                     ; 24 	UART_init();
 124  0011 cd0000        	call	_UART_init
 126  0014               L13:
 127                     ; 27 		led_blink();
 129  0014 cd0000        	call	_led_blink
 131                     ; 28 		UART_Poll();
 133  0017 cd0000        	call	_UART_Poll
 135                     ; 29 		UART_2PC(nbReadings, tempResults, humResults);
 137  001a ae0020        	ldw	x,#_humResults
 138  001d 89            	pushw	x
 139  001e ae0000        	ldw	x,#_tempResults
 140  0021 89            	pushw	x
 141  0022 ae0040        	ldw	x,#_nbReadings
 142  0025 cd0000        	call	c_ltor
 144  0028 cd0000        	call	c_ftoi
 146  002b cd0000        	call	_UART_2PC
 148  002e 5b04          	addw	sp,#4
 150  0030 20e2          	jra	L13
 194                     	xdef	_main
 195                     	xdef	_clock
 196                     	xdef	_nbReadings
 197                     	xdef	_humResults
 198                     	xdef	_tempResults
 199                     	xref	_led_blink
 200                     	xref	_led_blink_init
 201                     	xref	_UART_2PC
 202                     	xref	_UART_Poll
 203                     	xref	_UART_init
 222                     	xref	c_ftoi
 223                     	xref	c_ltor
 224                     	end
=======
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
 216                     ; 91 			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
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
 237                     ; 203 			break;
 238  006e 4d            	tnz	a
 239  006f 2717          	jreq	L12
 240  0071 4a            	dec	a
 241  0072 2725          	jreq	L32
 242  0074 4a            	dec	a
 243  0075 272d          	jreq	L52
 244  0077 4a            	dec	a
 245  0078 2771          	jreq	L72
 246  007a 4a            	dec	a
 247  007b 2603          	jrne	L02
 248  007d cc011c        	jp	L13
 249  0080               L02:
 250  0080 4a            	dec	a
 251  0081 2603          	jrne	L22
 252  0083 cc018b        	jp	L33
 253  0086               L22:
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
 317  00c9 260b          	jrne	L76
 318                     ; 117 				HMIStatePtr = HMIStatePtr->next;
 320  00cb be09          	ldw	x,_HMIStatePtr
 321  00cd ee03          	ldw	x,(3,x)
 322  00cf bf09          	ldw	_HMIStatePtr,x
 323                     ; 118 				LCD_clear();
 325  00d1 cd0000        	call	_LCD_clear
 328  00d4 200f          	jra	L17
 329  00d6               L76:
 330                     ; 120 			else if (buttonPressed == UP)
 332  00d6 b608          	ld	a,_buttonPressed
 333  00d8 a105          	cp	a,#5
 334  00da 2609          	jrne	L17
 335                     ; 122 				HMIStatePtr = HMIStatePtr->previous;
 337  00dc be09          	ldw	x,_HMIStatePtr
 338  00de ee01          	ldw	x,(1,x)
 339  00e0 bf09          	ldw	_HMIStatePtr,x
 340                     ; 123 				LCD_clear();
 342  00e2 cd0000        	call	_LCD_clear
 344  00e5               L17:
 345                     ; 125 			buttonPressed = NO;
 347  00e5 3f08          	clr	_buttonPressed
 348                     ; 126 			break;
 350  00e7 ac4c004c      	jpf	L35
 351  00eb               L72:
 352                     ; 128 		case DISPLAY_MIN_MAX:
 352                     ; 129 			LCD_min_max(12, 14, 8, 90);
 354  00eb 4b5a          	push	#90
 355  00ed 4b08          	push	#8
 356  00ef ae0c0e        	ldw	x,#3086
 357  00f2 cd0000        	call	_LCD_min_max
 359  00f5 85            	popw	x
 360                     ; 130 			if (buttonPressed == DOWN)
 362  00f6 b608          	ld	a,_buttonPressed
 363  00f8 a104          	cp	a,#4
 364  00fa 260b          	jrne	L57
 365                     ; 132 				HMIStatePtr = HMIStatePtr->next;
 367  00fc be09          	ldw	x,_HMIStatePtr
 368  00fe ee03          	ldw	x,(3,x)
 369  0100 bf09          	ldw	_HMIStatePtr,x
 370                     ; 133 				LCD_clear();
 372  0102 cd0000        	call	_LCD_clear
 375  0105 200f          	jra	L77
 376  0107               L57:
 377                     ; 135 			else if (buttonPressed == UP)
 379  0107 b608          	ld	a,_buttonPressed
 380  0109 a105          	cp	a,#5
 381  010b 2609          	jrne	L77
 382                     ; 137 				HMIStatePtr = HMIStatePtr->previous;
 384  010d be09          	ldw	x,_HMIStatePtr
 385  010f ee01          	ldw	x,(1,x)
 386  0111 bf09          	ldw	_HMIStatePtr,x
 387                     ; 138 				LCD_clear();
 389  0113 cd0000        	call	_LCD_clear
 391  0116               L77:
 392                     ; 141 			buttonPressed = NO;
 394  0116 3f08          	clr	_buttonPressed
 395                     ; 142 			break;
 397  0118 ac4c004c      	jpf	L35
 398  011c               L13:
 399                     ; 143 		case DISPLAY_SETTINGS:
 399                     ; 144 			// Show settings to change frequency. Need to press ok to engage with screen
 399                     ; 145 
 399                     ; 146 			if (editMode == FALSE)
 401  011c 3d00          	tnz	_editMode
 402  011e 2639          	jrne	L301
 403                     ; 148 				LCD_display_settings();
 405  0120 cd0000        	call	_LCD_display_settings
 407                     ; 149 				if (buttonPressed == DOWN)
 409  0123 b608          	ld	a,_buttonPressed
 410  0125 a104          	cp	a,#4
 411  0127 260b          	jrne	L501
 412                     ; 151 					HMIStatePtr = HMIStatePtr->next;
 414  0129 be09          	ldw	x,_HMIStatePtr
 415  012b ee03          	ldw	x,(3,x)
 416  012d bf09          	ldw	_HMIStatePtr,x
 417                     ; 152 					LCD_clear();
 419  012f cd0000        	call	_LCD_clear
 422  0132 200f          	jra	L701
 423  0134               L501:
 424                     ; 154 				else if (buttonPressed == UP)
 426  0134 b608          	ld	a,_buttonPressed
 427  0136 a105          	cp	a,#5
 428  0138 2609          	jrne	L701
 429                     ; 156 					HMIStatePtr = HMIStatePtr->previous;
 431  013a be09          	ldw	x,_HMIStatePtr
 432  013c ee01          	ldw	x,(1,x)
 433  013e bf09          	ldw	_HMIStatePtr,x
 434                     ; 157 					LCD_clear();
 436  0140 cd0000        	call	_LCD_clear
 438  0143               L701:
 439                     ; 159 				if (buttonPressed == OK)
 441  0143 b608          	ld	a,_buttonPressed
 442  0145 a103          	cp	a,#3
 443  0147 263c          	jrne	L511
 444                     ; 161 					editMode = !editMode;
 446  0149 3d00          	tnz	_editMode
 447  014b 2604          	jrne	L01
 448  014d a601          	ld	a,#1
 449  014f 2001          	jra	L21
 450  0151               L01:
 451  0151 4f            	clr	a
 452  0152               L21:
 453  0152 b700          	ld	_editMode,a
 454                     ; 162 					LCD_clear();
 456  0154 cd0000        	call	_LCD_clear
 458  0157 202c          	jra	L511
 459  0159               L301:
 460                     ; 168 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 462  0159 4b03          	push	#3
 463  015b 4b14          	push	#20
 464  015d 4b0a          	push	#10
 465  015f ae0012        	ldw	x,#_settingMsg
 466  0162 cd0000        	call	_LCD_writemsg
 468  0165 5b03          	addw	sp,#3
 469                     ; 170 				if (buttonPressed == DOWN)
 471  0167 b608          	ld	a,_buttonPressed
 472  0169 a104          	cp	a,#4
 473  016b 2704          	jreq	L121
 475                     ; 174 				else if (buttonPressed == UP)
 477  016d b608          	ld	a,_buttonPressed
 478  016f a105          	cp	a,#5
 479  0171               L121:
 480                     ; 178 				if (buttonPressed == OK)
 482  0171 b608          	ld	a,_buttonPressed
 483  0173 a103          	cp	a,#3
 484  0175 260e          	jrne	L511
 485                     ; 180 					editMode = !editMode;
 487  0177 3d00          	tnz	_editMode
 488  0179 2604          	jrne	L41
 489  017b a601          	ld	a,#1
 490  017d 2001          	jra	L61
 491  017f               L41:
 492  017f 4f            	clr	a
 493  0180               L61:
 494  0180 b700          	ld	_editMode,a
 495                     ; 181 					LCD_clear();
 497  0182 cd0000        	call	_LCD_clear
 499  0185               L511:
 500                     ; 185 			buttonPressed = NO;
 502  0185 3f08          	clr	_buttonPressed
 503                     ; 186 			break;
 505  0187 ac4c004c      	jpf	L35
 506  018b               L33:
 507                     ; 188 		case DISPLAY_SEND_DATA:
 507                     ; 189 			// Show instructions to send data
 507                     ; 190 			if (buttonPressed == DOWN)
 509  018b b608          	ld	a,_buttonPressed
 510  018d a104          	cp	a,#4
 511  018f 260b          	jrne	L721
 512                     ; 192 				HMIStatePtr = HMIStatePtr->next;
 514  0191 be09          	ldw	x,_HMIStatePtr
 515  0193 ee03          	ldw	x,(3,x)
 516  0195 bf09          	ldw	_HMIStatePtr,x
 517                     ; 193 				LCD_clear();
 519  0197 cd0000        	call	_LCD_clear
 522  019a 200f          	jra	L131
 523  019c               L721:
 524                     ; 195 			else if (buttonPressed == UP)
 526  019c b608          	ld	a,_buttonPressed
 527  019e a105          	cp	a,#5
 528  01a0 2609          	jrne	L131
 529                     ; 197 				HMIStatePtr = HMIStatePtr->previous;
 531  01a2 be09          	ldw	x,_HMIStatePtr
 532  01a4 ee01          	ldw	x,(1,x)
 533  01a6 bf09          	ldw	_HMIStatePtr,x
 534                     ; 198 				LCD_clear();
 536  01a8 cd0000        	call	_LCD_clear
 538  01ab               L131:
 539                     ; 201 			LCD_writemsg(sendDataMsg, sizeof(sendDataMsg), 20, 3);
 541  01ab 4b03          	push	#3
 542  01ad 4b14          	push	#20
 543  01af 4b0c          	push	#12
 544  01b1 ae001c        	ldw	x,#_sendDataMsg
 545  01b4 cd0000        	call	_LCD_writemsg
 547  01b7 5b03          	addw	sp,#3
 548                     ; 202 			buttonPressed = NO;
 550  01b9 3f08          	clr	_buttonPressed
 551                     ; 203 			break;
 553  01bb ac4c004c      	jpf	L35
 554  01bf               L36:
 556  01bf ac4c004c      	jpf	L35
1032                     	xdef	_main
1033                     	xdef	_clock
1034                     	switch	.ubsct
1035  0000               _SRTC_DateRead:
1036  0000 00000000      	ds.b	4
1037                     	xdef	_SRTC_DateRead
1038  0004               _SRTC_TimeRead:
1039  0004 00000000      	ds.b	4
1040                     	xdef	_SRTC_TimeRead
1041  0008               _buttonPressed:
1042  0008 00            	ds.b	1
1043                     	xdef	_buttonPressed
1044                     	xdef	_editMode
1045                     	xdef	_sendDataMsg
1046                     	xdef	_settingMsg
1047                     	xdef	_pressMSG
1048                     	xdef	_op
1049                     	xref	_BTN_init
1050                     	xdef	_HMIFSM
1051  0009               _HMIStatePtr:
1052  0009 0000          	ds.b	2
1053                     	xdef	_HMIStatePtr
1054                     	xref	_RTC_init
1055                     	xref	_LCD_display_settings
1056                     	xref	_LCD_min_max
1057                     	xref	_LCD_homescreen
1058                     	xref	_LCD_welcome
1059                     	xref	_LCD_writemsg
1060                     	xref	_LCD_clear
1061                     	xref	_LCD_init
1062                     	xref	_SPI_init
1063                     	xref	_RTC_GetDate
1064                     	xref	_RTC_GetTime
1084                     	end
>>>>>>> SPI
