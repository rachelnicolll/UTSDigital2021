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
  22  0007 80            	dc.b	128
  23  0008 00            	dc.b	0
  24  0009 00            	dc.b	0
  25  000a 40            	dc.b	64
  26  000b 0001          	dc.w	1
  27  000d 0001          	dc.w	1
 156                     .const:	section	.text
 157  0000               _HDC2080:
 158  0000 0000          	dc.w	L3_HDC2080_state
 194                     ; 21 void main(void)
 194                     ; 22 {
 196                     	switch	.text
 197  0000               _main:
 201                     ; 23 	CLK->CKDIVR = 0x00;
 203  0000 725f50c0      	clr	20672
 204                     ; 25 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 206  0004 ae0301        	ldw	x,#769
 207  0007 cd0000        	call	_CLK_PeripheralClockConfig
 209                     ; 27 	HDC2080_config(HDC2080);
 211  000a ae0000        	ldw	x,#L3_HDC2080_state
 212  000d cd0000        	call	_HDC2080_config
 214  0010               L57:
 215                     ; 31 		RawResult = HDC2080_tempRead(HDC2080);
 217  0010 ae0000        	ldw	x,#L3_HDC2080_state
 218  0013 cd0000        	call	_HDC2080_tempRead
 220  0016 bf04          	ldw	_RawResult,x
 221                     ; 32 		ReadingResult = HDC2080_tempToFloatCelsius(RawResult);
 223  0018 be04          	ldw	x,_RawResult
 224  001a cd0000        	call	_HDC2080_tempToFloatCelsius
 226  001d ae0000        	ldw	x,#_ReadingResult
 227  0020 cd0000        	call	c_rtol
 230  0023 20eb          	jra	L57
 373                     	xdef	_main
 374                     	switch	.ubsct
 375  0000               _ReadingResult:
 376  0000 00000000      	ds.b	4
 377                     	xdef	_ReadingResult
 378  0004               _RawResult:
 379  0004 0000          	ds.b	2
 380                     	xdef	_RawResult
 381                     	xdef	_HDC2080
 382                     	xref	_HDC2080_tempToFloatCelsius
 383                     	xref	_HDC2080_tempRead
 384                     	xref	_HDC2080_config
 385                     	xref	_CLK_PeripheralClockConfig
 405                     	xref	c_rtol
 406                     	end
