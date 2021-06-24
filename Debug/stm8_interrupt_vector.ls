   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  43                     ; 27 @far @interrupt void NonHandledInterrupt(void)
  43                     ; 28 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 32 	return;
  52  0000 80            	iret
  76                     ; 35 @far @interrupt void EXTID4_IRQHandler(void)
  76                     ; 36 {
  77                     	switch	.text
  78  0001               f_EXTID4_IRQHandler:
  82                     ; 38 	if (EXTI->SR1 == 0x10 )//&& GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_4) == ON)
  84  0001 c650a3        	ld	a,20643
  85  0004 a110          	cp	a,#16
  86  0006 2604          	jrne	L13
  87                     ; 39 		EXTI->SR1 |= 0x10;
  89  0008 721850a3      	bset	20643,#4
  90  000c               L13:
  91                     ; 41 	buttonPressed = UP;
  93  000c 35050000      	mov	_buttonPressed,#5
  94                     ; 42 	LCDUpdated = TRUE;
  96  0010 35010000      	mov	_LCDUpdated,#1
  97                     ; 43 	return;
 100  0014 80            	iret
 124                     ; 46 @far @interrupt void EXTID1_IRQHandler(void)
 124                     ; 47 {
 125                     	switch	.text
 126  0015               f_EXTID1_IRQHandler:
 130                     ; 49 	if (EXTI->SR1 == 0x02) // && GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_1) == ON)
 132  0015 c650a3        	ld	a,20643
 133  0018 a102          	cp	a,#2
 134  001a 2604          	jrne	L34
 135                     ; 50 		EXTI->SR1 |= 0x02;
 137  001c 721250a3      	bset	20643,#1
 138  0020               L34:
 139                     ; 52 	buttonPressed = DOWN;
 141  0020 35040000      	mov	_buttonPressed,#4
 142                     ; 53 	LCDUpdated = TRUE;
 144  0024 35010000      	mov	_LCDUpdated,#1
 145                     ; 54 	return;
 148  0028 80            	iret
 172                     ; 57 @far @interrupt void EXTID2_IRQHandler(void)
 172                     ; 58 {
 173                     	switch	.text
 174  0029               f_EXTID2_IRQHandler:
 178                     ; 60 	if (EXTI->SR1 == 0x04) // && GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_2) == ON)
 180  0029 c650a3        	ld	a,20643
 181  002c a104          	cp	a,#4
 182  002e 2604          	jrne	L55
 183                     ; 61 		EXTI->SR1 |= 0x04;
 185  0030 721450a3      	bset	20643,#2
 186  0034               L55:
 187                     ; 63 	buttonPressed = OK;
 189  0034 35030000      	mov	_buttonPressed,#3
 190                     ; 64 	LCDUpdated = TRUE;
 192  0038 35010000      	mov	_LCDUpdated,#1
 193                     ; 65 	return;
 196  003c 80            	iret
 220                     ; 68 @far @interrupt void EXTID3_IRQHandler(void)
 220                     ; 69 {
 221                     	switch	.text
 222  003d               f_EXTID3_IRQHandler:
 226                     ; 71 	if (EXTI->SR1 == 0x08) // && GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_3) == ON)
 228  003d c650a3        	ld	a,20643
 229  0040 a108          	cp	a,#8
 230  0042 2604          	jrne	L76
 231                     ; 72 		EXTI->SR1 |= 0x08;
 233  0044 721650a3      	bset	20643,#3
 234  0048               L76:
 235                     ; 74 	buttonPressed = BACK;
 237  0048 35020000      	mov	_buttonPressed,#2
 238                     ; 75 	LCDUpdated = TRUE;
 240  004c 35010000      	mov	_LCDUpdated,#1
 241                     ; 76 	return;
 244  0050 80            	iret
 246                     .const:	section	.text
 247  0000               __vectab:
 248  0000 82            	dc.b	130
 250  0001 00            	dc.b	page(__stext)
 251  0002 0000          	dc.w	__stext
 252  0004 82            	dc.b	130
 254  0005 00            	dc.b	page(f_NonHandledInterrupt)
 255  0006 0000          	dc.w	f_NonHandledInterrupt
 256  0008 82            	dc.b	130
 258  0009 00            	dc.b	page(f_NonHandledInterrupt)
 259  000a 0000          	dc.w	f_NonHandledInterrupt
 260  000c 82            	dc.b	130
 262  000d 00            	dc.b	page(f_NonHandledInterrupt)
 263  000e 0000          	dc.w	f_NonHandledInterrupt
 264  0010 82            	dc.b	130
 266  0011 00            	dc.b	page(f_NonHandledInterrupt)
 267  0012 0000          	dc.w	f_NonHandledInterrupt
 268  0014 82            	dc.b	130
 270  0015 00            	dc.b	page(f_NonHandledInterrupt)
 271  0016 0000          	dc.w	f_NonHandledInterrupt
 272  0018 82            	dc.b	130
 274  0019 00            	dc.b	page(f_NonHandledInterrupt)
 275  001a 0000          	dc.w	f_NonHandledInterrupt
 276  001c 82            	dc.b	130
 278  001d 00            	dc.b	page(f_NonHandledInterrupt)
 279  001e 0000          	dc.w	f_NonHandledInterrupt
 280  0020 82            	dc.b	130
 282  0021 00            	dc.b	page(f_NonHandledInterrupt)
 283  0022 0000          	dc.w	f_NonHandledInterrupt
 284  0024 82            	dc.b	130
 286  0025 00            	dc.b	page(f_NonHandledInterrupt)
 287  0026 0000          	dc.w	f_NonHandledInterrupt
 288  0028 82            	dc.b	130
 290  0029 00            	dc.b	page(f_NonHandledInterrupt)
 291  002a 0000          	dc.w	f_NonHandledInterrupt
 292  002c 82            	dc.b	130
 294  002d 15            	dc.b	page(f_EXTID1_IRQHandler)
 295  002e 0015          	dc.w	f_EXTID1_IRQHandler
 296  0030 82            	dc.b	130
 298  0031 29            	dc.b	page(f_EXTID2_IRQHandler)
 299  0032 0029          	dc.w	f_EXTID2_IRQHandler
 300  0034 82            	dc.b	130
 302  0035 3d            	dc.b	page(f_EXTID3_IRQHandler)
 303  0036 003d          	dc.w	f_EXTID3_IRQHandler
 304  0038 82            	dc.b	130
 306  0039 01            	dc.b	page(f_EXTID4_IRQHandler)
 307  003a 0001          	dc.w	f_EXTID4_IRQHandler
 308  003c 82            	dc.b	130
 310  003d 00            	dc.b	page(f_NonHandledInterrupt)
 311  003e 0000          	dc.w	f_NonHandledInterrupt
 312  0040 82            	dc.b	130
 314  0041 00            	dc.b	page(f_NonHandledInterrupt)
 315  0042 0000          	dc.w	f_NonHandledInterrupt
 316  0044 82            	dc.b	130
 318  0045 00            	dc.b	page(f_NonHandledInterrupt)
 319  0046 0000          	dc.w	f_NonHandledInterrupt
 320  0048 82            	dc.b	130
 322  0049 00            	dc.b	page(f_NonHandledInterrupt)
 323  004a 0000          	dc.w	f_NonHandledInterrupt
 324  004c 82            	dc.b	130
 326  004d 00            	dc.b	page(f_NonHandledInterrupt)
 327  004e 0000          	dc.w	f_NonHandledInterrupt
 328  0050 82            	dc.b	130
 330  0051 00            	dc.b	page(f_NonHandledInterrupt)
 331  0052 0000          	dc.w	f_NonHandledInterrupt
 332  0054 82            	dc.b	130
 334  0055 00            	dc.b	page(f_NonHandledInterrupt)
 335  0056 0000          	dc.w	f_NonHandledInterrupt
 336  0058 82            	dc.b	130
 338  0059 00            	dc.b	page(f_NonHandledInterrupt)
 339  005a 0000          	dc.w	f_NonHandledInterrupt
 340  005c 82            	dc.b	130
 342  005d 00            	dc.b	page(f_NonHandledInterrupt)
 343  005e 0000          	dc.w	f_NonHandledInterrupt
 344  0060 82            	dc.b	130
 346  0061 00            	dc.b	page(f_NonHandledInterrupt)
 347  0062 0000          	dc.w	f_NonHandledInterrupt
 348  0064 82            	dc.b	130
 350  0065 00            	dc.b	page(f_NonHandledInterrupt)
 351  0066 0000          	dc.w	f_NonHandledInterrupt
 352  0068 82            	dc.b	130
 354  0069 00            	dc.b	page(f_NonHandledInterrupt)
 355  006a 0000          	dc.w	f_NonHandledInterrupt
 356  006c 82            	dc.b	130
 358  006d 00            	dc.b	page(f_NonHandledInterrupt)
 359  006e 0000          	dc.w	f_NonHandledInterrupt
 360  0070 82            	dc.b	130
 362  0071 00            	dc.b	page(f_NonHandledInterrupt)
 363  0072 0000          	dc.w	f_NonHandledInterrupt
 364  0074 82            	dc.b	130
 366  0075 00            	dc.b	page(f_NonHandledInterrupt)
 367  0076 0000          	dc.w	f_NonHandledInterrupt
 368  0078 82            	dc.b	130
 370  0079 00            	dc.b	page(f_NonHandledInterrupt)
 371  007a 0000          	dc.w	f_NonHandledInterrupt
 372  007c 82            	dc.b	130
 374  007d 00            	dc.b	page(f_NonHandledInterrupt)
 375  007e 0000          	dc.w	f_NonHandledInterrupt
 426                     	xdef	__vectab
 427                     	xref	__stext
 428                     	xdef	f_EXTID3_IRQHandler
 429                     	xdef	f_EXTID2_IRQHandler
 430                     	xdef	f_EXTID1_IRQHandler
 431                     	xdef	f_EXTID4_IRQHandler
 432                     	xdef	f_NonHandledInterrupt
 433                     	xref.b	_buttonPressed
 434                     	xref.b	_LCDUpdated
 453                     	end
