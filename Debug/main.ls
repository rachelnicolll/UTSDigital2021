   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               L3_HDC2080_state:
  15  0000 80            	dc.b	128
  16  0001 00            	dc.b	0
  17  0002 f8            	dc.b	248
  18  0003 ff            	dc.b	255
  19  0004 00            	dc.b	0
  20  0005 ff            	dc.b	255
  21  0006 00            	dc.b	0
  22  0007 00            	dc.b	0
  23  0008 00            	dc.b	0
  24  0009 00            	dc.b	0
  25  000a 40            	dc.b	64
  26  000b 0001          	dc.w	1
  27  000d 0001          	dc.w	1
 156                     .const:	section	.text
 157  0000               _HDC2080:
 158  0000 0000          	dc.w	L3_HDC2080_state
 192                     ; 20 void main(void)
 192                     ; 21 {
 194                     	switch	.text
 195  0000               _main:
 199                     ; 22 	CLK->CKDIVR = 0x00;
 201  0000 725f50c0      	clr	20672
 202                     ; 24 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 204  0004 ae0301        	ldw	x,#769
 205  0007 cd0000        	call	_CLK_PeripheralClockConfig
 207                     ; 26 	HDC2080_config(HDC2080);
 209  000a ae0000        	ldw	x,#L3_HDC2080_state
 210  000d cd0000        	call	_HDC2080_config
 212  0010               L57:
 213                     ; 30 		HDC2080_read(HDC2080, ReadingResult);
 215  0010 ae0000        	ldw	x,#_ReadingResult
 216  0013 89            	pushw	x
 217  0014 ae0000        	ldw	x,#L3_HDC2080_state
 218  0017 cd0000        	call	_HDC2080_read
 220  001a 85            	popw	x
 222  001b 20f3          	jra	L57
 357                     	xdef	_main
 358                     	switch	.ubsct
 359  0000               _ReadingResult:
 360  0000 000000000000  	ds.b	16
 361                     	xdef	_ReadingResult
 362                     	xdef	_HDC2080
 363                     	xref	_HDC2080_read
 364                     	xref	_HDC2080_config
 365                     	xref	_CLK_PeripheralClockConfig
 385                     	end
