   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _EEPROM_writeSubAddress:
  15  0000 0000          	dc.w	0
  16  0002               _EEPROM_readSubAddress:
  17  0002 0000          	dc.w	0
  78                     ; 11 void EEPROM_writePage(uint32_t temperature, uint32_t humidity)
  78                     ; 12 {
  80                     	switch	.text
  81  0000               _EEPROM_writePage:
  83  0000 5204          	subw	sp,#4
  84       00000004      OFST:	set	4
  87                     ; 14     txBuf[0] = (uint8_t)(EEPROM_writeSubAddress >> 8);
  89  0002 b600          	ld	a,_EEPROM_writeSubAddress
  90  0004 6b01          	ld	(OFST-3,sp),a
  92                     ; 15     txBuf[1] = (uint8_t)(EEPROM_writeSubAddress & 0xFF);
  94  0006 b601          	ld	a,_EEPROM_writeSubAddress+1
  95  0008 a4ff          	and	a,#255
  96  000a 6b02          	ld	(OFST-2,sp),a
  98                     ; 16     txBuf[2] = (uint8_t)(temperature & 0xFF);
 100  000c 7b0a          	ld	a,(OFST+6,sp)
 101  000e a4ff          	and	a,#255
 102  0010 6b03          	ld	(OFST-1,sp),a
 104                     ; 17     txBuf[3] = (uint8_t)(humidity & 0xFF);
 106  0012 7b0e          	ld	a,(OFST+10,sp)
 107  0014 a4ff          	and	a,#255
 108  0016 6b04          	ld	(OFST+0,sp),a
 110                     ; 19     mcu_i2cTransfer(0x00, 0x50, txBuf, 4, NULL, 0);
 112  0018 4b00          	push	#0
 113  001a 5f            	clrw	x
 114  001b 89            	pushw	x
 115  001c 4b04          	push	#4
 116  001e 96            	ldw	x,sp
 117  001f 1c0005        	addw	x,#OFST+1
 118  0022 89            	pushw	x
 119  0023 ae0050        	ldw	x,#80
 120  0026 cd0000        	call	_mcu_i2cTransfer
 122  0029 5b06          	addw	sp,#6
 123                     ; 22     EEPROM_writeSubAddress+= 2;
 125  002b be00          	ldw	x,_EEPROM_writeSubAddress
 126  002d 1c0002        	addw	x,#2
 127  0030 bf00          	ldw	_EEPROM_writeSubAddress,x
 128                     ; 23 }
 131  0032 5b04          	addw	sp,#4
 132  0034 81            	ret
 135                     .const:	section	.text
 136  0000               L73_txBuf:
 137  0000 00            	dc.b	0
 138  0001 00            	ds.b	1
 139  0002               L14_rxBuf:
 140  0002 00            	dc.b	0
 141  0003 00            	ds.b	1
 197                     ; 25 void EEPROM_readPage()
 197                     ; 26 {
 198                     	switch	.text
 199  0035               _EEPROM_readPage:
 201  0035 5206          	subw	sp,#6
 202       00000006      OFST:	set	6
 205                     ; 27 		uint8_t txBuf[2] = {0};
 207  0037 c60000        	ld	a,L73_txBuf
 208  003a 6b01          	ld	(OFST-5,sp),a
 209  003c c60001        	ld	a,L73_txBuf+1
 210  003f 6b02          	ld	(OFST-4,sp),a
 211                     ; 28     uint8_t rxBuf[2] = {0};
 213  0041 c60002        	ld	a,L14_rxBuf
 214  0044 6b05          	ld	(OFST-1,sp),a
 215  0046 c60003        	ld	a,L14_rxBuf+1
 216  0049 6b06          	ld	(OFST+0,sp),a
 217                     ; 29     int i = 0;
 219                     ; 30 		txBuf[0] = (uint8_t)(EEPROM_readSubAddress >> 8);
 221  004b b602          	ld	a,_EEPROM_readSubAddress
 222  004d 6b01          	ld	(OFST-5,sp),a
 224                     ; 31     txBuf[1] = (uint8_t)(EEPROM_readSubAddress & 0xFF);
 226  004f b603          	ld	a,_EEPROM_readSubAddress+1
 227  0051 a4ff          	and	a,#255
 228  0053 6b02          	ld	(OFST-4,sp),a
 230                     ; 32     for (i = 0; i < EEPROM_writeSubAddress; i+2)
 232  0055 5f            	clrw	x
 233  0056 1f03          	ldw	(OFST-3,sp),x
 236  0058 2039          	jra	L57
 237  005a               L17:
 238                     ; 34         mcu_i2cTransfer(0x00, 0x50, txBuf, 2, rxBuf, 2);
 240  005a 4b02          	push	#2
 241  005c 96            	ldw	x,sp
 242  005d 1c0006        	addw	x,#OFST+0
 243  0060 89            	pushw	x
 244  0061 4b02          	push	#2
 245  0063 96            	ldw	x,sp
 246  0064 1c0005        	addw	x,#OFST-1
 247  0067 89            	pushw	x
 248  0068 ae0050        	ldw	x,#80
 249  006b cd0000        	call	_mcu_i2cTransfer
 251  006e 5b06          	addw	sp,#6
 252                     ; 35         UART_SendReading(rxBuf[0], rxBuf[1]);
 254  0070 7b06          	ld	a,(OFST+0,sp)
 255  0072 5f            	clrw	x
 256  0073 97            	ld	xl,a
 257  0074 cd0000        	call	c_itof
 259  0077 be02          	ldw	x,c_lreg+2
 260  0079 89            	pushw	x
 261  007a be00          	ldw	x,c_lreg
 262  007c 89            	pushw	x
 263  007d 7b09          	ld	a,(OFST+3,sp)
 264  007f 5f            	clrw	x
 265  0080 97            	ld	xl,a
 266  0081 cd0000        	call	c_itof
 268  0084 be02          	ldw	x,c_lreg+2
 269  0086 89            	pushw	x
 270  0087 be00          	ldw	x,c_lreg
 271  0089 89            	pushw	x
 272  008a cd0000        	call	_UART_SendReading
 274  008d 5b08          	addw	sp,#8
 275                     ; 32     for (i = 0; i < EEPROM_writeSubAddress; i+2)
 277  008f 1e03          	ldw	x,(OFST-3,sp)
 278  0091 5c            	incw	x
 279  0092 5c            	incw	x
 280  0093               L57:
 283  0093 1e03          	ldw	x,(OFST-3,sp)
 284  0095 b300          	cpw	x,_EEPROM_writeSubAddress
 285  0097 25c1          	jrult	L17
 286                     ; 37 }
 289  0099 5b06          	addw	sp,#6
 290  009b 81            	ret
 325                     	xdef	_EEPROM_readSubAddress
 326                     	xdef	_EEPROM_writeSubAddress
 327                     	xref	_UART_SendReading
 328                     	xref	_mcu_i2cTransfer
 329                     	xdef	_EEPROM_readPage
 330                     	xdef	_EEPROM_writePage
 331                     	xref.b	c_lreg
 350                     	xref	c_itof
 351                     	end
