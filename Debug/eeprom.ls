   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               L3_EEPROM_state:
  15  0000 00            	dc.b	0
  16  0001 50            	dc.b	80
  68                     	xref	_mcu_i2cTransfer
 127                     ; 4 uint8_t writeEEPROM(uint8_t i2cAddr,
 127                     ; 5                     uint8_t *dataToWrite, uint8_t writeLength)
 127                     ; 6 {
 129                     	switch	.text
 130  0000               _writeEEPROM:
 132  0000 88            	push	a
 133       00000000      OFST:	set	0
 136                     ; 7     mcu_i2cTransfer(0, i2cAddr, dataToWrite, writeLength, NULL, 0);
 138  0001 5f            	clrw	x
 139  0002 89            	pushw	x
 140  0003 5f            	clrw	x
 141  0004 89            	pushw	x
 142  0005 7b0a          	ld	a,(OFST+10,sp)
 143  0007 88            	push	a
 144  0008 1e09          	ldw	x,(OFST+9,sp)
 145  000a 89            	pushw	x
 146  000b 7b08          	ld	a,(OFST+8,sp)
 147  000d 88            	push	a
 148  000e 5f            	clrw	x
 149  000f cd0000        	call	_mcu_i2cTransfer
 151  0012 5b08          	addw	sp,#8
 152                     ; 8     return 0;
 154  0014 4f            	clr	a
 157  0015 5b01          	addw	sp,#1
 158  0017 81            	ret
 161                     	xref	_mcu_i2cTransfer
 232                     ; 11 uint8_t readEEPROM(uint8_t i2cAddr,
 232                     ; 12                    uint8_t *dataToWrite, uint8_t writeLength,
 232                     ; 13                    uint8_t *dataToRead, uint8_t readLength)
 232                     ; 14 {
 233                     	switch	.text
 234  0018               _readEEPROM:
 236  0018 88            	push	a
 237       00000000      OFST:	set	0
 240                     ; 18     mcu_i2cTransfer(0, i2cAddr, dataToWrite, writeLength, dataToRead, readLength);
 242  0019 7b09          	ld	a,(OFST+9,sp)
 243  001b 88            	push	a
 244  001c 1e08          	ldw	x,(OFST+8,sp)
 245  001e 89            	pushw	x
 246  001f 7b09          	ld	a,(OFST+9,sp)
 247  0021 88            	push	a
 248  0022 1e08          	ldw	x,(OFST+8,sp)
 249  0024 89            	pushw	x
 250  0025 7b07          	ld	a,(OFST+7,sp)
 251  0027 88            	push	a
 252  0028 5f            	clrw	x
 253  0029 cd0000        	call	_mcu_i2cTransfer
 255  002c 5b07          	addw	sp,#7
 256                     ; 19     return 0;
 258  002e 4f            	clr	a
 261  002f 5b01          	addw	sp,#1
 262  0031 81            	ret
 275                     	xdef	_readEEPROM
 276                     	xdef	_writeEEPROM
 295                     	end
