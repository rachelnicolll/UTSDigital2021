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
 156                     .const:	section	.text
 157  0000               _HDC2080:
 158  0000 0000          	dc.w	L3_HDC2080_state
 241                     	switch	.const
 242  0002               L6:
 243  0002 000001bc      	dc.l	444
 244  0006               L01:
 245  0006 000877f8      	dc.l	555000
 246                     ; 25 void main(void)
 246                     ; 26 {
 247                     	scross	off
 248                     	switch	.text
 249  0000               _main:
 251  0000 5204          	subw	sp,#4
 252       00000004      OFST:	set	4
 255                     ; 27 	CLK->CKDIVR = 0x00;
 257  0002 725f50c0      	clr	20672
 258                     ; 28 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 260  0006 ae0301        	ldw	x,#769
 261  0009 cd0000        	call	_CLK_PeripheralClockConfig
 263                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 266  000c ae0000        	ldw	x,#0
 267  000f 1f03          	ldw	(OFST-1,sp),x
 268  0011 ae0000        	ldw	x,#0
 269  0014 1f01          	ldw	(OFST-3,sp),x
 271  0016               L721:
 274  0016 96            	ldw	x,sp
 275  0017 1c0001        	addw	x,#OFST-3
 276  001a a601          	ld	a,#1
 277  001c cd0000        	call	c_lgadc
 282  001f 96            	ldw	x,sp
 283  0020 1c0001        	addw	x,#OFST-3
 284  0023 cd0000        	call	c_ltor
 286  0026 ae0002        	ldw	x,#L6
 287  0029 cd0000        	call	c_lcmp
 289  002c 25e8          	jrult	L721
 290                     ; 35 	HDC2080_config(HDC2080);
 292  002e ae0000        	ldw	x,#L3_HDC2080_state
 293  0031 cd0000        	call	_HDC2080_config
 295                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 298  0034 ae0000        	ldw	x,#0
 299  0037 1f03          	ldw	(OFST-1,sp),x
 300  0039 ae0000        	ldw	x,#0
 301  003c 1f01          	ldw	(OFST-3,sp),x
 303  003e               L531:
 306  003e 96            	ldw	x,sp
 307  003f 1c0001        	addw	x,#OFST-3
 308  0042 a601          	ld	a,#1
 309  0044 cd0000        	call	c_lgadc
 314  0047 96            	ldw	x,sp
 315  0048 1c0001        	addw	x,#OFST-3
 316  004b cd0000        	call	c_ltor
 318  004e ae0002        	ldw	x,#L6
 319  0051 cd0000        	call	c_lcmp
 321  0054 25e8          	jrult	L531
 322  0056               L341:
 323                     ; 39 		TempRawResult = HDC2080_tempRead(HDC2080);
 325  0056 ae0000        	ldw	x,#L3_HDC2080_state
 326  0059 cd0000        	call	_HDC2080_tempRead
 328  005c bf12          	ldw	_TempRawResult,x
 329                     ; 40 		TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);	
 331  005e be12          	ldw	x,_TempRawResult
 332  0060 cd0000        	call	_HDC2080_tempToFloatCelsius
 334  0063 ae000e        	ldw	x,#_TempReadingResult
 335  0066 cd0000        	call	c_rtol
 337                     ; 41 		TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
 339  0069 be12          	ldw	x,_TempRawResult
 340  006b cd0000        	call	_HDC2080_tempToIntCelsius
 342  006e ae000a        	ldw	x,#_TempIntResult
 343  0071 cd0000        	call	c_rtol
 345                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 348  0074 ae0000        	ldw	x,#0
 349  0077 1f03          	ldw	(OFST-1,sp),x
 350  0079 ae0000        	ldw	x,#0
 351  007c 1f01          	ldw	(OFST-3,sp),x
 353  007e               L741:
 356  007e 96            	ldw	x,sp
 357  007f 1c0001        	addw	x,#OFST-3
 358  0082 a601          	ld	a,#1
 359  0084 cd0000        	call	c_lgadc
 364  0087 96            	ldw	x,sp
 365  0088 1c0001        	addw	x,#OFST-3
 366  008b cd0000        	call	c_ltor
 368  008e ae0006        	ldw	x,#L01
 369  0091 cd0000        	call	c_lcmp
 371  0094 25e8          	jrult	L741
 372                     ; 43 		HumRawResult = HDC2080_humRead(HDC2080);
 374  0096 ae0000        	ldw	x,#L3_HDC2080_state
 375  0099 cd0000        	call	_HDC2080_humRead
 377  009c bf08          	ldw	_HumRawResult,x
 378                     ; 44 		HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 380  009e be08          	ldw	x,_HumRawResult
 381  00a0 cd0000        	call	_HDC2080_humToFloatRelative
 383  00a3 ae0004        	ldw	x,#_HumReadingResult
 384  00a6 cd0000        	call	c_rtol
 386                     ; 45 		HumIntResult = HDC2080_humToIntRelative(HumRawResult);
 388  00a9 be08          	ldw	x,_HumRawResult
 389  00ab cd0000        	call	_HDC2080_humToIntRelative
 391  00ae ae0000        	ldw	x,#_HumIntResult
 392  00b1 cd0000        	call	c_rtol
 394                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 397  00b4 ae0000        	ldw	x,#0
 398  00b7 1f03          	ldw	(OFST-1,sp),x
 399  00b9 ae0000        	ldw	x,#0
 400  00bc 1f01          	ldw	(OFST-3,sp),x
 402  00be               L551:
 405  00be 96            	ldw	x,sp
 406  00bf 1c0001        	addw	x,#OFST-3
 407  00c2 a601          	ld	a,#1
 408  00c4 cd0000        	call	c_lgadc
 413  00c7 96            	ldw	x,sp
 414  00c8 1c0001        	addw	x,#OFST-3
 415  00cb cd0000        	call	c_ltor
 417  00ce ae0006        	ldw	x,#L01
 418  00d1 cd0000        	call	c_lcmp
 420  00d4 25e8          	jrult	L551
 421  00d6 cc0056        	jra	L341
 600                     	xdef	_main
 601                     	switch	.ubsct
 602  0000               _HumIntResult:
 603  0000 00000000      	ds.b	4
 604                     	xdef	_HumIntResult
 605  0004               _HumReadingResult:
 606  0004 00000000      	ds.b	4
 607                     	xdef	_HumReadingResult
 608  0008               _HumRawResult:
 609  0008 0000          	ds.b	2
 610                     	xdef	_HumRawResult
 611  000a               _TempIntResult:
 612  000a 00000000      	ds.b	4
 613                     	xdef	_TempIntResult
 614  000e               _TempReadingResult:
 615  000e 00000000      	ds.b	4
 616                     	xdef	_TempReadingResult
 617  0012               _TempRawResult:
 618  0012 0000          	ds.b	2
 619                     	xdef	_TempRawResult
 620                     	xdef	_HDC2080
 621                     	xref	_HDC2080_tempToIntCelsius
 622                     	xref	_HDC2080_tempToFloatCelsius
 623                     	xref	_HDC2080_tempRead
 624                     	xref	_HDC2080_humToIntRelative
 625                     	xref	_HDC2080_humToFloatRelative
 626                     	xref	_HDC2080_humRead
 627                     	xref	_HDC2080_config
 628                     	xref	_CLK_PeripheralClockConfig
 648                     	xref	c_rtol
 649                     	xref	c_lcmp
 650                     	xref	c_ltor
 651                     	xref	c_lgadc
 652                     	end
