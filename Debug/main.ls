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
 224                     	switch	.const
 225  0002               L6:
 226  0002 000001bc      	dc.l	444
 227  0006               L01:
 228  0006 0001b198      	dc.l	111000
 229                     ; 21 void main(void)
 229                     ; 22 {
 230                     	scross	off
 231                     	switch	.text
 232  0000               _main:
 234  0000 5204          	subw	sp,#4
 235       00000004      OFST:	set	4
 238                     ; 23 	CLK->CKDIVR = 0x00;
 240  0002 725f50c0      	clr	20672
<<<<<<< HEAD
 241                     ; 24 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
=======
 241                     ; 25 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
>>>>>>> I2C_new
 243  0006 ae0301        	ldw	x,#769
 244  0009 cd0000        	call	_CLK_PeripheralClockConfig
 246                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 249  000c ae0000        	ldw	x,#0
 250  000f 1f03          	ldw	(OFST-1,sp),x
 251  0011 ae0000        	ldw	x,#0
 252  0014 1f01          	ldw	(OFST-3,sp),x
 254  0016               L121:
 257  0016 96            	ldw	x,sp
 258  0017 1c0001        	addw	x,#OFST-3
 259  001a a601          	ld	a,#1
 260  001c cd0000        	call	c_lgadc
 265  001f 96            	ldw	x,sp
 266  0020 1c0001        	addw	x,#OFST-3
 267  0023 cd0000        	call	c_ltor
 269  0026 ae0002        	ldw	x,#L6
 270  0029 cd0000        	call	c_lcmp
 272  002c 25e8          	jrult	L121
<<<<<<< HEAD
 273                     ; 31 	HDC2080_config(HDC2080);
=======
 273                     ; 28 	HDC2080_config(HDC2080);
>>>>>>> I2C_new
 275  002e ae0000        	ldw	x,#L3_HDC2080_state
 276  0031 cd0000        	call	_HDC2080_config
 278                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 281  0034 ae0000        	ldw	x,#0
 282  0037 1f03          	ldw	(OFST-1,sp),x
 283  0039 ae0000        	ldw	x,#0
 284  003c 1f01          	ldw	(OFST-3,sp),x
 286  003e               L721:
 289  003e 96            	ldw	x,sp
 290  003f 1c0001        	addw	x,#OFST-3
 291  0042 a601          	ld	a,#1
 292  0044 cd0000        	call	c_lgadc
 297  0047 96            	ldw	x,sp
 298  0048 1c0001        	addw	x,#OFST-3
 299  004b cd0000        	call	c_ltor
 301  004e ae0002        	ldw	x,#L6
 302  0051 cd0000        	call	c_lcmp
 304  0054 25e8          	jrult	L721
 305  0056               L531:
<<<<<<< HEAD
 306                     ; 35 		RawResult = HDC2080_tempRead(HDC2080);
 308  0056 ae0000        	ldw	x,#L3_HDC2080_state
 309  0059 cd0000        	call	_HDC2080_tempRead
 311  005c bf04          	ldw	_RawResult,x
 312                     ; 36 		ReadingResult = HDC2080_tempToFloatCelsius(RawResult);
=======
 306                     ; 32 		RawResult = HDC2080_tempRead(HDC2080);
 308  0056 ae0000        	ldw	x,#L3_HDC2080_state
 309  0059 cd0000        	call	_HDC2080_tempRead
 311  005c bf04          	ldw	_RawResult,x
 312                     ; 33 		ReadingResult = HDC2080_tempToFloatCelsius(RawResult);	
>>>>>>> I2C_new
 314  005e be04          	ldw	x,_RawResult
 315  0060 cd0000        	call	_HDC2080_tempToFloatCelsius
 317  0063 ae0000        	ldw	x,#_ReadingResult
 318  0066 cd0000        	call	c_rtol
 320                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 323  0069 ae0000        	ldw	x,#0
 324  006c 1f03          	ldw	(OFST-1,sp),x
 325  006e ae0000        	ldw	x,#0
 326  0071 1f01          	ldw	(OFST-3,sp),x
 328  0073               L141:
 331  0073 96            	ldw	x,sp
 332  0074 1c0001        	addw	x,#OFST-3
 333  0077 a601          	ld	a,#1
 334  0079 cd0000        	call	c_lgadc
 339  007c 96            	ldw	x,sp
 340  007d 1c0001        	addw	x,#OFST-3
 341  0080 cd0000        	call	c_ltor
 343  0083 ae0006        	ldw	x,#L01
 344  0086 cd0000        	call	c_lcmp
 346  0089 25e8          	jrult	L141
 347  008b 20c9          	jra	L531
 490                     	xdef	_main
 491                     	switch	.ubsct
 492  0000               _ReadingResult:
 493  0000 00000000      	ds.b	4
 494                     	xdef	_ReadingResult
 495  0004               _RawResult:
 496  0004 0000          	ds.b	2
 497                     	xdef	_RawResult
 498                     	xdef	_HDC2080
 499                     	xref	_HDC2080_tempToFloatCelsius
 500                     	xref	_HDC2080_tempRead
 501                     	xref	_HDC2080_config
 502                     	xref	_CLK_PeripheralClockConfig
 522                     	xref	c_rtol
 523                     	xref	c_lcmp
 524                     	xref	c_ltor
 525                     	xref	c_lgadc
 526                     	end
