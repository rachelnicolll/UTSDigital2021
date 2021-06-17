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
  23  0000               _state:
  24  0000 00            	dc.b	0
  25  0001               _HMIFSM:
  26  0001 00            	dc.b	0
  27  0002 0001          	dc.w	_HMIFSM
  28  0004 0006          	dc.w	_HMIFSM+5
  29  0006 01            	dc.b	1
  30  0007 0001          	dc.w	_HMIFSM
  31  0009 000b          	dc.w	_HMIFSM+10
  32  000b 02            	dc.b	2
  33  000c 0001          	dc.w	_HMIFSM
  34  000e 0010          	dc.w	_HMIFSM+15
  35  0010 03            	dc.b	3
  36  0011 0001          	dc.w	_HMIFSM
  37  0013 0015          	dc.w	_HMIFSM+20
  38  0015 04            	dc.b	4
  39  0016 0001          	dc.w	_HMIFSM
  40  0018 000b          	dc.w	_HMIFSM+10
  41  001a 05            	dc.b	5
  42  001b 0001          	dc.w	_HMIFSM
  43  001d 001a          	dc.w	_HMIFSM+25
  72                     ; 34 unsigned int clock(void)
  72                     ; 35 {
  74                     	switch	.text
  75  0000               _clock:
  79                     ; 36 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  81  0000 c652bf        	ld	a,21183
  82  0003 5f            	clrw	x
  83  0004 97            	ld	xl,a
  84  0005 c652c0        	ld	a,21184
  85  0008 02            	rlwa	x,a
  88  0009 81            	ret
 136                     ; 39 void main(void)
 136                     ; 40 {
 137                     	switch	.text
 138  000a               _main:
 140  000a 88            	push	a
 141       00000001      OFST:	set	1
 144                     ; 42 	uint8_t cursorPos = 0;
 146                     ; 44 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 148  000b 725f50c0      	clr	20672
 149                     ; 45 	CLK->PCKENR2 |= 0xff; // Enable clock to timer
 151  000f c650c4        	ld	a,20676
 152  0012 aaff          	or	a,#255
 153  0014 c750c4        	ld	20676,a
 154                     ; 46 	CLK->PCKENR1 |= 0xff; // Enable all clocks
 156  0017 c650c3        	ld	a,20675
 157  001a aaff          	or	a,#255
 158  001c c750c3        	ld	20675,a
 159                     ; 60 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
 161  001f 3508500c      	mov	20492,#8
 162                     ; 61 	GPIOC->CR1 = 0x08; // 0b0000 1000
 164  0023 3508500d      	mov	20493,#8
 165                     ; 64 	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
 167  0027 35085235      	mov	21045,#8
 168                     ; 65 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
 170  002b c65236        	ld	a,21046
 171  002e a4cf          	and	a,#207
 172  0030 c75236        	ld	21046,a
 173                     ; 66 	USART1->BRR2 = 0x03;
 175  0033 35035233      	mov	21043,#3
 176                     ; 67 	USART1->BRR1 = 0x68; // 9600 baud
 178  0037 35685232      	mov	21042,#104
 179                     ; 70 	SPI_init();
 181  003b cd0000        	call	_SPI_init
 183                     ; 72 	BTN_init();
 185  003e cd0000        	call	_BTN_init
 187                     ; 74 	LCD_init();
 189  0041 cd0000        	call	_LCD_init
 191                     ; 76 	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
 193  0044 ae0001        	ldw	x,#_HMIFSM
 194  0047 bf01          	ldw	_HMIStatePtr,x
 195  0049               L35:
 196                     ; 81 		switch (HMIStatePtr->outState)
 198  0049 92c601        	ld	a,[_HMIStatePtr.w]
 200                     ; 161 			break;
 201  004c 4d            	tnz	a
 202  004d 2714          	jreq	L12
 203  004f 4a            	dec	a
 204  0050 271f          	jreq	L32
 205  0052 4a            	dec	a
 206  0053 2727          	jreq	L52
 207  0055 4a            	dec	a
 208  0056 2742          	jreq	L72
 209  0058 4a            	dec	a
 210  0059 276e          	jreq	L13
 211  005b 4a            	dec	a
 212  005c 2603          	jrne	L01
 213  005e cc010b        	jp	L33
 214  0061               L01:
 215  0061 20e6          	jra	L35
 216  0063               L12:
 217                     ; 83 		case DISPLAY_DORMANT:
 217                     ; 84 			// If button press, wake up
 217                     ; 85 			if (buttonPressed != 0)
 219  0063 3d00          	tnz	_buttonPressed
 220  0065 2706          	jreq	L36
 221                     ; 86 				HMIStatePtr = HMIStatePtr->next;
 223  0067 be01          	ldw	x,_HMIStatePtr
 224  0069 ee03          	ldw	x,(3,x)
 225  006b bf01          	ldw	_HMIStatePtr,x
 226  006d               L36:
 227                     ; 87 			buttonPressed = NO;
 229  006d 3f00          	clr	_buttonPressed
 230                     ; 89 			break;
 232  006f 20d8          	jra	L35
 233  0071               L32:
 234                     ; 90 		case DISPLAY_WELCOME:
 234                     ; 91 			LCD_welcome();
 236  0071 cd0000        	call	_LCD_welcome
 238                     ; 92 			HMIStatePtr = HMIStatePtr->next;
 240  0074 be01          	ldw	x,_HMIStatePtr
 241  0076 ee03          	ldw	x,(3,x)
 242  0078 bf01          	ldw	_HMIStatePtr,x
 243                     ; 94 			break;
 245  007a 20cd          	jra	L35
 246  007c               L52:
 247                     ; 95 		case DISPLAY_HOME:
 247                     ; 96 			// Showing temp and humidity and menu option
 247                     ; 97 			LCD_homescreen("18", "70");
 249  007c ae0028        	ldw	x,#L76
 250  007f 89            	pushw	x
 251  0080 ae002b        	ldw	x,#L56
 252  0083 cd0000        	call	_LCD_homescreen
 254  0086 85            	popw	x
 255                     ; 99 			if (buttonPressed == DOWN)
 257  0087 b600          	ld	a,_buttonPressed
 258  0089 a104          	cp	a,#4
 259  008b 2609          	jrne	L17
 260                     ; 101 				HMIStatePtr = HMIStatePtr->next;
 262  008d be01          	ldw	x,_HMIStatePtr
 263  008f ee03          	ldw	x,(3,x)
 264  0091 bf01          	ldw	_HMIStatePtr,x
 265                     ; 102 				LCD_clear();
 267  0093 cd0000        	call	_LCD_clear
 269  0096               L17:
 270                     ; 104 			buttonPressed = NO;
 272  0096 3f00          	clr	_buttonPressed
 273                     ; 105 			break;
 275  0098 20af          	jra	L35
 276  009a               L72:
 277                     ; 107 		case DISPLAY_MIN_MAX:
 277                     ; 108 			LCD_min_max(12, 14, 8, 90);
 279  009a 4b5a          	push	#90
 280  009c 4b08          	push	#8
 281  009e ae0c0e        	ldw	x,#3086
 282  00a1 cd0000        	call	_LCD_min_max
 284  00a4 85            	popw	x
 285                     ; 109 			if (buttonPressed == DOWN)
 287  00a5 b600          	ld	a,_buttonPressed
 288  00a7 a104          	cp	a,#4
 289  00a9 260b          	jrne	L37
 290                     ; 111 				HMIStatePtr = HMIStatePtr->next;
 292  00ab be01          	ldw	x,_HMIStatePtr
 293  00ad ee03          	ldw	x,(3,x)
 294  00af bf01          	ldw	_HMIStatePtr,x
 295                     ; 112 				LCD_clear();
 297  00b1 cd0000        	call	_LCD_clear
 300  00b4 200f          	jra	L57
 301  00b6               L37:
 302                     ; 114 			else if (buttonPressed == UP)
 304  00b6 b600          	ld	a,_buttonPressed
 305  00b8 a105          	cp	a,#5
 306  00ba 2609          	jrne	L57
 307                     ; 116 				HMIStatePtr = HMIStatePtr->previous;
 309  00bc be01          	ldw	x,_HMIStatePtr
 310  00be ee01          	ldw	x,(1,x)
 311  00c0 bf01          	ldw	_HMIStatePtr,x
 312                     ; 117 				LCD_clear();
 314  00c2 cd0000        	call	_LCD_clear
 316  00c5               L57:
 317                     ; 120 			buttonPressed = NO;
 319  00c5 3f00          	clr	_buttonPressed
 320                     ; 121 			break;
 322  00c7 2080          	jra	L35
 323  00c9               L13:
 324                     ; 122 		case DISPLAY_SETTINGS:
 324                     ; 123 		// Show settings to change frequency. Need to press ok to engage with screen
 324                     ; 124 			LCD_display_settings();
 326  00c9 cd0000        	call	_LCD_display_settings
 328                     ; 125 			if (buttonPressed == DOWN)
 330  00cc b600          	ld	a,_buttonPressed
 331  00ce a104          	cp	a,#4
 332  00d0 260b          	jrne	L101
 333                     ; 127 				HMIStatePtr = HMIStatePtr->next;
 335  00d2 be01          	ldw	x,_HMIStatePtr
 336  00d4 ee03          	ldw	x,(3,x)
 337  00d6 bf01          	ldw	_HMIStatePtr,x
 338                     ; 128 				LCD_clear();
 340  00d8 cd0000        	call	_LCD_clear
 343  00db 2028          	jra	L301
 344  00dd               L101:
 345                     ; 130 			else if (buttonPressed == UP)
 347  00dd b600          	ld	a,_buttonPressed
 348  00df a105          	cp	a,#5
 349  00e1 260b          	jrne	L501
 350                     ; 132 				HMIStatePtr = HMIStatePtr->previous;
 352  00e3 be01          	ldw	x,_HMIStatePtr
 353  00e5 ee01          	ldw	x,(1,x)
 354  00e7 bf01          	ldw	_HMIStatePtr,x
 355                     ; 133 				LCD_clear();
 357  00e9 cd0000        	call	_LCD_clear
 360  00ec 2017          	jra	L301
 361  00ee               L501:
 362                     ; 135 			else if (buttonPressed == OK)
 364  00ee b600          	ld	a,_buttonPressed
 365  00f0 a103          	cp	a,#3
 366  00f2 2611          	jrne	L301
 367                     ; 137 				LCD_clear();
 369  00f4 cd0000        	call	_LCD_clear
 371                     ; 139 				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);
 373  00f7 4b03          	push	#3
 374  00f9 4b14          	push	#20
 375  00fb 4b0a          	push	#10
 376  00fd ae0012        	ldw	x,#_settingMsg
 377  0100 cd0000        	call	_LCD_writemsg
 379  0103 5b03          	addw	sp,#3
 380  0105               L301:
 381                     ; 142 			buttonPressed = NO;
 383  0105 3f00          	clr	_buttonPressed
 384                     ; 143 			break;
 386  0107 ac490049      	jpf	L35
 387  010b               L33:
 388                     ; 145 		case DISPLAY_SEND_DATA:
 388                     ; 146 			// Show instructions to send data
 388                     ; 147 			if (buttonPressed == DOWN)
 390  010b b600          	ld	a,_buttonPressed
 391  010d a104          	cp	a,#4
 392  010f 260b          	jrne	L311
 393                     ; 149 				HMIStatePtr = HMIStatePtr->next;
 395  0111 be01          	ldw	x,_HMIStatePtr
 396  0113 ee03          	ldw	x,(3,x)
 397  0115 bf01          	ldw	_HMIStatePtr,x
 398                     ; 150 				LCD_clear();
 400  0117 cd0000        	call	_LCD_clear
 403  011a 200f          	jra	L511
 404  011c               L311:
 405                     ; 152 			else if (buttonPressed == UP)
 407  011c b600          	ld	a,_buttonPressed
 408  011e a105          	cp	a,#5
 409  0120 2609          	jrne	L511
 410                     ; 154 				HMIStatePtr = HMIStatePtr->previous;
 412  0122 be01          	ldw	x,_HMIStatePtr
 413  0124 ee01          	ldw	x,(1,x)
 414  0126 bf01          	ldw	_HMIStatePtr,x
 415                     ; 155 				LCD_clear();
 417  0128 cd0000        	call	_LCD_clear
 419  012b               L511:
 420                     ; 159 			LCD_writemsg(sendDataMsg, sizeof(sendDataMsg), 20, 3);
 422  012b 4b03          	push	#3
 423  012d 4b14          	push	#20
 424  012f 4b0c          	push	#12
 425  0131 ae001c        	ldw	x,#_sendDataMsg
 426  0134 cd0000        	call	_LCD_writemsg
 428  0137 5b03          	addw	sp,#3
 429                     ; 160 			buttonPressed = NO;
 431  0139 3f00          	clr	_buttonPressed
 432                     ; 161 			break;
 434  013b ac490049      	jpf	L35
 435  013f               L16:
 437  013f ac490049      	jpf	L35
 644                     	xdef	_main
 645                     	xdef	_clock
 646                     	switch	.ubsct
 647  0000               _buttonPressed:
 648  0000 00            	ds.b	1
 649                     	xdef	_buttonPressed
 650                     	xdef	_state
 651                     	xdef	_sendDataMsg
 652                     	xdef	_settingMsg
 653                     	xdef	_pressMSG
 654                     	xdef	_op
 655                     	xref	_BTN_init
 656                     	xdef	_HMIFSM
 657  0001               _HMIStatePtr:
 658  0001 0000          	ds.b	2
 659                     	xdef	_HMIStatePtr
 660                     	xref	_LCD_display_settings
 661                     	xref	_LCD_min_max
 662                     	xref	_LCD_homescreen
 663                     	xref	_LCD_welcome
 664                     	xref	_LCD_writemsg
 665                     	xref	_LCD_clear
 666                     	xref	_LCD_init
 667                     	xref	_SPI_init
 668                     	switch	.const
 669  0028               L76:
 670  0028 373000        	dc.b	"70",0
 671  002b               L56:
 672  002b 313800        	dc.b	"18",0
 692                     	end
