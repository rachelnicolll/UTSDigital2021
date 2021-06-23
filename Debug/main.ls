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
 237                     	switch	.const
 238  0002               L6:
 239  0002 000001bc      	dc.l	444
 240  0006               L01:
 241  0006 0001b198      	dc.l	111000
 242                     ; 23 void main(void)
 242                     ; 24 {
 243                     	scross	off
 244                     	switch	.text
 245  0000               _main:
 247  0000 5204          	subw	sp,#4
 248       00000004      OFST:	set	4
 251                     ; 25 	CLK->CKDIVR = 0x00;
 253  0002 725f50c0      	clr	20672
 254                     ; 26 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 256  0006 ae0301        	ldw	x,#769
 257  0009 cd0000        	call	_CLK_PeripheralClockConfig
 259                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 262  000c ae0000        	ldw	x,#0
 263  000f 1f03          	ldw	(OFST-1,sp),x
 264  0011 ae0000        	ldw	x,#0
 265  0014 1f01          	ldw	(OFST-3,sp),x
 267  0016               L721:
 270  0016 96            	ldw	x,sp
 271  0017 1c0001        	addw	x,#OFST-3
 272  001a a601          	ld	a,#1
 273  001c cd0000        	call	c_lgadc
 278  001f 96            	ldw	x,sp
 279  0020 1c0001        	addw	x,#OFST-3
 280  0023 cd0000        	call	c_ltor
 282  0026 ae0002        	ldw	x,#L6
 283  0029 cd0000        	call	c_lcmp
 285  002c 25e8          	jrult	L721
 286                     ; 33 	HDC2080_config(HDC2080);
 288  002e ae0000        	ldw	x,#L3_HDC2080_state
 289  0031 cd0000        	call	_HDC2080_config
 291                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 294  0034 ae0000        	ldw	x,#0
 295  0037 1f03          	ldw	(OFST-1,sp),x
 296  0039 ae0000        	ldw	x,#0
 297  003c 1f01          	ldw	(OFST-3,sp),x
 299  003e               L531:
 302  003e 96            	ldw	x,sp
 303  003f 1c0001        	addw	x,#OFST-3
 304  0042 a601          	ld	a,#1
 305  0044 cd0000        	call	c_lgadc
 310  0047 96            	ldw	x,sp
 311  0048 1c0001        	addw	x,#OFST-3
 312  004b cd0000        	call	c_ltor
 314  004e ae0002        	ldw	x,#L6
 315  0051 cd0000        	call	c_lcmp
 317  0054 25e8          	jrult	L531
 318  0056               L341:
 319                     ; 37 		TempRawResult = HDC2080_tempRead(HDC2080);
 321  0056 ae0000        	ldw	x,#L3_HDC2080_state
 322  0059 cd0000        	call	_HDC2080_tempRead
 324  005c bf0a          	ldw	_TempRawResult,x
 325                     ; 38 		TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);	
 327  005e be0a          	ldw	x,_TempRawResult
 328  0060 cd0000        	call	_HDC2080_tempToFloatCelsius
 330  0063 ae0006        	ldw	x,#_TempReadingResult
 331  0066 cd0000        	call	c_rtol
 333                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 336  0069 ae0000        	ldw	x,#0
 337  006c 1f03          	ldw	(OFST-1,sp),x
 338  006e ae0000        	ldw	x,#0
 339  0071 1f01          	ldw	(OFST-3,sp),x
 341  0073               L741:
 344  0073 96            	ldw	x,sp
 345  0074 1c0001        	addw	x,#OFST-3
 346  0077 a601          	ld	a,#1
 347  0079 cd0000        	call	c_lgadc
 352  007c 96            	ldw	x,sp
 353  007d 1c0001        	addw	x,#OFST-3
 354  0080 cd0000        	call	c_ltor
 356  0083 ae0006        	ldw	x,#L01
 357  0086 cd0000        	call	c_lcmp
 359  0089 25e8          	jrult	L741
 360                     ; 40 		HumRawResult = HDC2080_humRead(HDC2080);
 362  008b ae0000        	ldw	x,#L3_HDC2080_state
 363  008e cd0000        	call	_HDC2080_humRead
 365  0091 bf04          	ldw	_HumRawResult,x
 366                     ; 41 		HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
 368  0093 be04          	ldw	x,_HumRawResult
 369  0095 cd0000        	call	_HDC2080_humToFloatRelative
 371  0098 ae0000        	ldw	x,#_HumReadingResult
 372  009b cd0000        	call	c_rtol
 374                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 377  009e ae0000        	ldw	x,#0
 378  00a1 1f03          	ldw	(OFST-1,sp),x
 379  00a3 ae0000        	ldw	x,#0
 380  00a6 1f01          	ldw	(OFST-3,sp),x
 382  00a8               L551:
 385  00a8 96            	ldw	x,sp
 386  00a9 1c0001        	addw	x,#OFST-3
 387  00ac a601          	ld	a,#1
 388  00ae cd0000        	call	c_lgadc
 393  00b1 96            	ldw	x,sp
 394  00b2 1c0001        	addw	x,#OFST-3
 395  00b5 cd0000        	call	c_ltor
 397  00b8 ae0006        	ldw	x,#L01
 398  00bb cd0000        	call	c_lcmp
 400  00be 25e8          	jrult	L551
 401  00c0 2094          	jra	L341
 562                     	xdef	_main
 563                     	switch	.ubsct
 564  0000               _HumReadingResult:
 565  0000 00000000      	ds.b	4
 566                     	xdef	_HumReadingResult
 567  0004               _HumRawResult:
 568  0004 0000          	ds.b	2
 569                     	xdef	_HumRawResult
 570  0006               _TempReadingResult:
 571  0006 00000000      	ds.b	4
 572                     	xdef	_TempReadingResult
 573  000a               _TempRawResult:
 574  000a 0000          	ds.b	2
 575                     	xdef	_TempRawResult
 576                     	xdef	_HDC2080
 577                     	xref	_HDC2080_tempToFloatCelsius
 578                     	xref	_HDC2080_tempRead
 579                     	xref	_HDC2080_humToFloatRelative
 580                     	xref	_HDC2080_humRead
 581                     	xref	_HDC2080_config
 582                     	xref	_CLK_PeripheralClockConfig
 602                     	xref	c_rtol
 603                     	xref	c_lcmp
 604                     	xref	c_ltor
 605                     	xref	c_lgadc
 606                     	end
