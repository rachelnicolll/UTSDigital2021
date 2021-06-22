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
 215                     	switch	.const
 216  0002               L6:
 217  0002 000001bc      	dc.l	444
 218                     ; 21 void main(void)
 218                     ; 22 {
 219                     	scross	off
 220                     	switch	.text
 221  0000               _main:
 223  0000 5204          	subw	sp,#4
 224       00000004      OFST:	set	4
 227                     ; 23 	CLK->CKDIVR = 0x00;
 229  0002 725f50c0      	clr	20672
 230                     ; 25 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 232  0006 ae0301        	ldw	x,#769
 233  0009 cd0000        	call	_CLK_PeripheralClockConfig
 235                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 238  000c ae0000        	ldw	x,#0
 239  000f 1f03          	ldw	(OFST-1,sp),x
 240  0011 ae0000        	ldw	x,#0
 241  0014 1f01          	ldw	(OFST-3,sp),x
 243  0016               L311:
 246  0016 96            	ldw	x,sp
 247  0017 1c0001        	addw	x,#OFST-3
 248  001a a601          	ld	a,#1
 249  001c cd0000        	call	c_lgadc
 254  001f 96            	ldw	x,sp
 255  0020 1c0001        	addw	x,#OFST-3
 256  0023 cd0000        	call	c_ltor
 258  0026 ae0002        	ldw	x,#L6
 259  0029 cd0000        	call	c_lcmp
 261  002c 25e8          	jrult	L311
 262                     ; 28 	HDC2080_config(HDC2080);
 264  002e ae0000        	ldw	x,#L3_HDC2080_state
 265  0031 cd0000        	call	_HDC2080_config
 267                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 270  0034 ae0000        	ldw	x,#0
 271  0037 1f03          	ldw	(OFST-1,sp),x
 272  0039 ae0000        	ldw	x,#0
 273  003c 1f01          	ldw	(OFST-3,sp),x
 275  003e               L121:
 278  003e 96            	ldw	x,sp
 279  003f 1c0001        	addw	x,#OFST-3
 280  0042 a601          	ld	a,#1
 281  0044 cd0000        	call	c_lgadc
 286  0047 96            	ldw	x,sp
 287  0048 1c0001        	addw	x,#OFST-3
 288  004b cd0000        	call	c_ltor
 290  004e ae0002        	ldw	x,#L6
 291  0051 cd0000        	call	c_lcmp
 293  0054 25e8          	jrult	L121
 294  0056               L721:
 295                     ; 32 		RawResult = HDC2080_tempRead(HDC2080);
 297  0056 ae0000        	ldw	x,#L3_HDC2080_state
 298  0059 cd0000        	call	_HDC2080_tempRead
 300  005c bf04          	ldw	_RawResult,x
 301                     ; 33 		ReadingResult = HDC2080_tempToFloatCelsius(RawResult);
 303  005e be04          	ldw	x,_RawResult
 304  0060 cd0000        	call	_HDC2080_tempToFloatCelsius
 306  0063 ae0000        	ldw	x,#_ReadingResult
 307  0066 cd0000        	call	c_rtol
 310  0069 20eb          	jra	L721
 453                     	xdef	_main
 454                     	switch	.ubsct
 455  0000               _ReadingResult:
 456  0000 00000000      	ds.b	4
 457                     	xdef	_ReadingResult
 458  0004               _RawResult:
 459  0004 0000          	ds.b	2
 460                     	xdef	_RawResult
 461                     	xdef	_HDC2080
 462                     	xref	_HDC2080_tempToFloatCelsius
 463                     	xref	_HDC2080_tempRead
 464                     	xref	_HDC2080_config
 465                     	xref	_CLK_PeripheralClockConfig
 485                     	xref	c_rtol
 486                     	xref	c_lcmp
 487                     	xref	c_ltor
 488                     	xref	c_lgadc
 489                     	end
