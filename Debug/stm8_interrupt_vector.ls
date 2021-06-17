   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  43                     ; 21 @far @interrupt void NonHandledInterrupt (void)
  43                     ; 22 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 26 	return;
  52  0000 80            	iret
  75                     ; 29 @far @interrupt void EXTID4_IRQHandler(void)
  75                     ; 30 {
  76                     	switch	.text
  77  0001               f_EXTID4_IRQHandler:
  81                     ; 32 	if(EXTI->SR1 == 0x10)
  83  0001 c650a3        	ld	a,20643
  84  0004 a110          	cp	a,#16
  85  0006 2604          	jrne	L13
  86                     ; 33 		EXTI->SR1 |= 0x10;
  88  0008 721850a3      	bset	20643,#4
  89  000c               L13:
  90                     ; 35 	buttonPressed = UP;
  92  000c 35050000      	mov	_buttonPressed,#5
  93                     ; 36 	return;
  96  0010 80            	iret
 119                     ; 38 @far @interrupt void EXTID1_IRQHandler(void)
 119                     ; 39 {
 120                     	switch	.text
 121  0011               f_EXTID1_IRQHandler:
 125                     ; 41 	if(EXTI->SR1 == 0x02)
 127  0011 c650a3        	ld	a,20643
 128  0014 a102          	cp	a,#2
 129  0016 2604          	jrne	L34
 130                     ; 42 		EXTI->SR1 |= 0x02;
 132  0018 721250a3      	bset	20643,#1
 133  001c               L34:
 134                     ; 44 	buttonPressed = DOWN;
 136  001c 35040000      	mov	_buttonPressed,#4
 137                     ; 45 	return;
 140  0020 80            	iret
 163                     ; 47 @far @interrupt void EXTID2_IRQHandler(void)
 163                     ; 48 {
 164                     	switch	.text
 165  0021               f_EXTID2_IRQHandler:
 169                     ; 50 	if(EXTI->SR1 == 0x04)
 171  0021 c650a3        	ld	a,20643
 172  0024 a104          	cp	a,#4
 173  0026 2604          	jrne	L55
 174                     ; 51 		EXTI->SR1 |= 0x04;
 176  0028 721450a3      	bset	20643,#2
 177  002c               L55:
 178                     ; 53 	buttonPressed = OK;
 180  002c 35030000      	mov	_buttonPressed,#3
 181                     ; 54 	return;
 184  0030 80            	iret
 207                     ; 56 @far @interrupt void EXTID3_IRQHandler(void)
 207                     ; 57 {
 208                     	switch	.text
 209  0031               f_EXTID3_IRQHandler:
 213                     ; 59 	if(EXTI->SR1 == 0x08)
 215  0031 c650a3        	ld	a,20643
 216  0034 a108          	cp	a,#8
 217  0036 2604          	jrne	L76
 218                     ; 60 		EXTI->SR1 |= 0x08;
 220  0038 721650a3      	bset	20643,#3
 221  003c               L76:
 222                     ; 62 	buttonPressed = BACK;
 224  003c 35020000      	mov	_buttonPressed,#2
 225                     ; 63 	return;
 228  0040 80            	iret
 230                     .const:	section	.text
 231  0000               __vectab:
 232  0000 82            	dc.b	130
 234  0001 00            	dc.b	page(__stext)
 235  0002 0000          	dc.w	__stext
 236  0004 82            	dc.b	130
 238  0005 00            	dc.b	page(f_NonHandledInterrupt)
 239  0006 0000          	dc.w	f_NonHandledInterrupt
 240  0008 82            	dc.b	130
 242  0009 00            	dc.b	page(f_NonHandledInterrupt)
 243  000a 0000          	dc.w	f_NonHandledInterrupt
 244  000c 82            	dc.b	130
 246  000d 00            	dc.b	page(f_NonHandledInterrupt)
 247  000e 0000          	dc.w	f_NonHandledInterrupt
 248  0010 82            	dc.b	130
 250  0011 00            	dc.b	page(f_NonHandledInterrupt)
 251  0012 0000          	dc.w	f_NonHandledInterrupt
 252  0014 82            	dc.b	130
 254  0015 00            	dc.b	page(f_NonHandledInterrupt)
 255  0016 0000          	dc.w	f_NonHandledInterrupt
 256  0018 82            	dc.b	130
 258  0019 00            	dc.b	page(f_NonHandledInterrupt)
 259  001a 0000          	dc.w	f_NonHandledInterrupt
 260  001c 82            	dc.b	130
 262  001d 00            	dc.b	page(f_NonHandledInterrupt)
 263  001e 0000          	dc.w	f_NonHandledInterrupt
 264  0020 82            	dc.b	130
 266  0021 00            	dc.b	page(f_NonHandledInterrupt)
 267  0022 0000          	dc.w	f_NonHandledInterrupt
 268  0024 82            	dc.b	130
 270  0025 00            	dc.b	page(f_NonHandledInterrupt)
 271  0026 0000          	dc.w	f_NonHandledInterrupt
 272  0028 82            	dc.b	130
 274  0029 00            	dc.b	page(f_NonHandledInterrupt)
 275  002a 0000          	dc.w	f_NonHandledInterrupt
 276  002c 82            	dc.b	130
 278  002d 11            	dc.b	page(f_EXTID1_IRQHandler)
 279  002e 0011          	dc.w	f_EXTID1_IRQHandler
 280  0030 82            	dc.b	130
 282  0031 21            	dc.b	page(f_EXTID2_IRQHandler)
 283  0032 0021          	dc.w	f_EXTID2_IRQHandler
 284  0034 82            	dc.b	130
 286  0035 31            	dc.b	page(f_EXTID3_IRQHandler)
 287  0036 0031          	dc.w	f_EXTID3_IRQHandler
 288  0038 82            	dc.b	130
 290  0039 01            	dc.b	page(f_EXTID4_IRQHandler)
 291  003a 0001          	dc.w	f_EXTID4_IRQHandler
 292  003c 82            	dc.b	130
 294  003d 00            	dc.b	page(f_NonHandledInterrupt)
 295  003e 0000          	dc.w	f_NonHandledInterrupt
 296  0040 82            	dc.b	130
 298  0041 00            	dc.b	page(f_NonHandledInterrupt)
 299  0042 0000          	dc.w	f_NonHandledInterrupt
 300  0044 82            	dc.b	130
 302  0045 00            	dc.b	page(f_NonHandledInterrupt)
 303  0046 0000          	dc.w	f_NonHandledInterrupt
 304  0048 82            	dc.b	130
 306  0049 00            	dc.b	page(f_NonHandledInterrupt)
 307  004a 0000          	dc.w	f_NonHandledInterrupt
 308  004c 82            	dc.b	130
 310  004d 00            	dc.b	page(f_NonHandledInterrupt)
 311  004e 0000          	dc.w	f_NonHandledInterrupt
 312  0050 82            	dc.b	130
 314  0051 00            	dc.b	page(f_NonHandledInterrupt)
 315  0052 0000          	dc.w	f_NonHandledInterrupt
 316  0054 82            	dc.b	130
 318  0055 00            	dc.b	page(f_NonHandledInterrupt)
 319  0056 0000          	dc.w	f_NonHandledInterrupt
 320  0058 82            	dc.b	130
 322  0059 00            	dc.b	page(f_NonHandledInterrupt)
 323  005a 0000          	dc.w	f_NonHandledInterrupt
 324  005c 82            	dc.b	130
 326  005d 00            	dc.b	page(f_NonHandledInterrupt)
 327  005e 0000          	dc.w	f_NonHandledInterrupt
 328  0060 82            	dc.b	130
 330  0061 00            	dc.b	page(f_NonHandledInterrupt)
 331  0062 0000          	dc.w	f_NonHandledInterrupt
 332  0064 82            	dc.b	130
 334  0065 00            	dc.b	page(f_NonHandledInterrupt)
 335  0066 0000          	dc.w	f_NonHandledInterrupt
 336  0068 82            	dc.b	130
 338  0069 00            	dc.b	page(f_NonHandledInterrupt)
 339  006a 0000          	dc.w	f_NonHandledInterrupt
 340  006c 82            	dc.b	130
 342  006d 00            	dc.b	page(f_NonHandledInterrupt)
 343  006e 0000          	dc.w	f_NonHandledInterrupt
 344  0070 82            	dc.b	130
 346  0071 00            	dc.b	page(f_NonHandledInterrupt)
 347  0072 0000          	dc.w	f_NonHandledInterrupt
 348  0074 82            	dc.b	130
 350  0075 00            	dc.b	page(f_NonHandledInterrupt)
 351  0076 0000          	dc.w	f_NonHandledInterrupt
 352  0078 82            	dc.b	130
 354  0079 00            	dc.b	page(f_NonHandledInterrupt)
 355  007a 0000          	dc.w	f_NonHandledInterrupt
 356  007c 82            	dc.b	130
 358  007d 00            	dc.b	page(f_NonHandledInterrupt)
 359  007e 0000          	dc.w	f_NonHandledInterrupt
 410                     	xdef	__vectab
 411                     	xref	__stext
 412                     	xdef	f_EXTID3_IRQHandler
 413                     	xdef	f_EXTID2_IRQHandler
 414                     	xdef	f_EXTID1_IRQHandler
 415                     	xdef	f_EXTID4_IRQHandler
 416                     	xdef	f_NonHandledInterrupt
 417                     	xref.b	_buttonPressed
 436                     	end
