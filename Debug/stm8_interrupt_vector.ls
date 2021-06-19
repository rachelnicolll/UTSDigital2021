   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  43                     ; 14 @far @interrupt void NonHandledInterrupt (void)
  43                     ; 15 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 19 	return;
  52  0000 80            	iret
  86                     ; 22 @far @interrupt void I2C_Interrupt (void)
  86                     ; 23 {
  87                     	switch	.text
  88  0001               f_I2C_Interrupt:
  90  0001 8a            	push	cc
  91  0002 84            	pop	a
  92  0003 a4bf          	and	a,#191
  93  0005 88            	push	a
  94  0006 86            	pop	cc
  95       00000002      OFST:	set	2
  96  0007 3b0002        	push	c_x+2
  97  000a be00          	ldw	x,c_x
  98  000c 89            	pushw	x
  99  000d 3b0002        	push	c_y+2
 100  0010 be00          	ldw	x,c_y
 101  0012 89            	pushw	x
 102  0013 89            	pushw	x
 105                     ; 35 	if (I2C_SR1_ADDR & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
 107  0014 4b07          	push	#7
 108  0016 ae5210        	ldw	x,#21008
 109  0019 cd0000        	call	_I2C_ReadRegister
 111  001c 5b01          	addw	sp,#1
 112  001e a502          	bcp	a,#2
 113  0020 2707          	jreq	L73
 114                     ; 37 		i++;
 116  0022 1e01          	ldw	x,(OFST-1,sp)
 117  0024 1c0001        	addw	x,#1
 118  0027 1f01          	ldw	(OFST-1,sp),x
 120  0029               L73:
 121                     ; 40 	if (I2C_SR1_SB & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
 123  0029 4b07          	push	#7
 124  002b ae5210        	ldw	x,#21008
 125  002e cd0000        	call	_I2C_ReadRegister
 127  0031 5b01          	addw	sp,#1
 128  0033 a501          	bcp	a,#1
 129  0035 2707          	jreq	L14
 130                     ; 42 		i++;
 132  0037 1e01          	ldw	x,(OFST-1,sp)
 133  0039 1c0001        	addw	x,#1
 134  003c 1f01          	ldw	(OFST-1,sp),x
 136  003e               L14:
 137                     ; 45 	if (I2C_SR1_ADD10 & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
 139  003e 4b07          	push	#7
 140  0040 ae5210        	ldw	x,#21008
 141  0043 cd0000        	call	_I2C_ReadRegister
 143  0046 5b01          	addw	sp,#1
 144  0048 a508          	bcp	a,#8
 145  004a 2707          	jreq	L34
 146                     ; 47 		i++;//end up here?
 148  004c 1e01          	ldw	x,(OFST-1,sp)
 149  004e 1c0001        	addw	x,#1
 150  0051 1f01          	ldw	(OFST-1,sp),x
 152  0053               L34:
 153                     ; 49 	if (I2C_SR1_BTF & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
 155  0053 4b07          	push	#7
 156  0055 ae5210        	ldw	x,#21008
 157  0058 cd0000        	call	_I2C_ReadRegister
 159  005b 5b01          	addw	sp,#1
 160  005d a504          	bcp	a,#4
 161  005f 2707          	jreq	L54
 162                     ; 51 		i++;//end up here?
 164  0061 1e01          	ldw	x,(OFST-1,sp)
 165  0063 1c0001        	addw	x,#1
 166  0066 1f01          	ldw	(OFST-1,sp),x
 168  0068               L54:
 169                     ; 53 	if (I2C_SR1_TXE & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
 171  0068 4b07          	push	#7
 172  006a ae5210        	ldw	x,#21008
 173  006d cd0000        	call	_I2C_ReadRegister
 175  0070 5b01          	addw	sp,#1
 176  0072 a580          	bcp	a,#128
 177  0074 2707          	jreq	L74
 178                     ; 55 		i++;//end up here?
 180  0076 1e01          	ldw	x,(OFST-1,sp)
 181  0078 1c0001        	addw	x,#1
 182  007b 1f01          	ldw	(OFST-1,sp),x
 184  007d               L74:
 185                     ; 57 	if (I2C_SR1_RXNE & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
 187  007d 4b07          	push	#7
 188  007f ae5210        	ldw	x,#21008
 189  0082 cd0000        	call	_I2C_ReadRegister
 191  0085 5b01          	addw	sp,#1
 192  0087 a540          	bcp	a,#64
 193  0089 2707          	jreq	L15
 194                     ; 59 		i++;//end up here?
 196  008b 1e01          	ldw	x,(OFST-1,sp)
 197  008d 1c0001        	addw	x,#1
 198  0090 1f01          	ldw	(OFST-1,sp),x
 200  0092               L15:
 201                     ; 61 	if (I2C_SR2_WUFH & I2C_ReadRegister(I2C1, I2C_Register_SR2 ))
 203  0092 4b08          	push	#8
 204  0094 ae5210        	ldw	x,#21008
 205  0097 cd0000        	call	_I2C_ReadRegister
 207  009a 5b01          	addw	sp,#1
 208  009c a520          	bcp	a,#32
 209  009e 2707          	jreq	L35
 210                     ; 63 		i++;//end up here?
 212  00a0 1e01          	ldw	x,(OFST-1,sp)
 213  00a2 1c0001        	addw	x,#1
 214  00a5 1f01          	ldw	(OFST-1,sp),x
 216  00a7               L35:
 217                     ; 72 	return;
 220  00a7 5b02          	addw	sp,#2
 221  00a9 85            	popw	x
 222  00aa bf00          	ldw	c_y,x
 223  00ac 320002        	pop	c_y+2
 224  00af 85            	popw	x
 225  00b0 bf00          	ldw	c_x,x
 226  00b2 320002        	pop	c_x+2
 227  00b5 80            	iret
 229                     .const:	section	.text
 230  0000               __vectab:
 231  0000 82            	dc.b	130
 233  0001 00            	dc.b	page(__stext)
 234  0002 0000          	dc.w	__stext
 235  0004 82            	dc.b	130
 237  0005 00            	dc.b	page(f_NonHandledInterrupt)
 238  0006 0000          	dc.w	f_NonHandledInterrupt
 239  0008 82            	dc.b	130
 241  0009 00            	dc.b	page(f_NonHandledInterrupt)
 242  000a 0000          	dc.w	f_NonHandledInterrupt
 243  000c 82            	dc.b	130
 245  000d 00            	dc.b	page(f_NonHandledInterrupt)
 246  000e 0000          	dc.w	f_NonHandledInterrupt
 247  0010 82            	dc.b	130
 249  0011 00            	dc.b	page(f_NonHandledInterrupt)
 250  0012 0000          	dc.w	f_NonHandledInterrupt
 251  0014 82            	dc.b	130
 253  0015 00            	dc.b	page(f_NonHandledInterrupt)
 254  0016 0000          	dc.w	f_NonHandledInterrupt
 255  0018 82            	dc.b	130
 257  0019 00            	dc.b	page(f_NonHandledInterrupt)
 258  001a 0000          	dc.w	f_NonHandledInterrupt
 259  001c 82            	dc.b	130
 261  001d 00            	dc.b	page(f_NonHandledInterrupt)
 262  001e 0000          	dc.w	f_NonHandledInterrupt
 263  0020 82            	dc.b	130
 265  0021 00            	dc.b	page(f_NonHandledInterrupt)
 266  0022 0000          	dc.w	f_NonHandledInterrupt
 267  0024 82            	dc.b	130
 269  0025 00            	dc.b	page(f_NonHandledInterrupt)
 270  0026 0000          	dc.w	f_NonHandledInterrupt
 271  0028 82            	dc.b	130
 273  0029 00            	dc.b	page(f_NonHandledInterrupt)
 274  002a 0000          	dc.w	f_NonHandledInterrupt
 275  002c 82            	dc.b	130
 277  002d 00            	dc.b	page(f_NonHandledInterrupt)
 278  002e 0000          	dc.w	f_NonHandledInterrupt
 279  0030 82            	dc.b	130
 281  0031 00            	dc.b	page(f_NonHandledInterrupt)
 282  0032 0000          	dc.w	f_NonHandledInterrupt
 283  0034 82            	dc.b	130
 285  0035 00            	dc.b	page(f_NonHandledInterrupt)
 286  0036 0000          	dc.w	f_NonHandledInterrupt
 287  0038 82            	dc.b	130
 289  0039 00            	dc.b	page(f_NonHandledInterrupt)
 290  003a 0000          	dc.w	f_NonHandledInterrupt
 291  003c 82            	dc.b	130
 293  003d 00            	dc.b	page(f_NonHandledInterrupt)
 294  003e 0000          	dc.w	f_NonHandledInterrupt
 295  0040 82            	dc.b	130
 297  0041 00            	dc.b	page(f_NonHandledInterrupt)
 298  0042 0000          	dc.w	f_NonHandledInterrupt
 299  0044 82            	dc.b	130
 301  0045 00            	dc.b	page(f_NonHandledInterrupt)
 302  0046 0000          	dc.w	f_NonHandledInterrupt
 303  0048 82            	dc.b	130
 305  0049 00            	dc.b	page(f_NonHandledInterrupt)
 306  004a 0000          	dc.w	f_NonHandledInterrupt
 307  004c 82            	dc.b	130
 309  004d 00            	dc.b	page(f_NonHandledInterrupt)
 310  004e 0000          	dc.w	f_NonHandledInterrupt
 311  0050 82            	dc.b	130
 313  0051 00            	dc.b	page(f_NonHandledInterrupt)
 314  0052 0000          	dc.w	f_NonHandledInterrupt
 315  0054 82            	dc.b	130
 317  0055 00            	dc.b	page(f_NonHandledInterrupt)
 318  0056 0000          	dc.w	f_NonHandledInterrupt
 319  0058 82            	dc.b	130
 321  0059 00            	dc.b	page(f_NonHandledInterrupt)
 322  005a 0000          	dc.w	f_NonHandledInterrupt
 323  005c 82            	dc.b	130
 325  005d 00            	dc.b	page(f_NonHandledInterrupt)
 326  005e 0000          	dc.w	f_NonHandledInterrupt
 327  0060 82            	dc.b	130
 329  0061 00            	dc.b	page(f_NonHandledInterrupt)
 330  0062 0000          	dc.w	f_NonHandledInterrupt
 331  0064 82            	dc.b	130
 333  0065 00            	dc.b	page(f_NonHandledInterrupt)
 334  0066 0000          	dc.w	f_NonHandledInterrupt
 335  0068 82            	dc.b	130
 337  0069 00            	dc.b	page(f_NonHandledInterrupt)
 338  006a 0000          	dc.w	f_NonHandledInterrupt
 339  006c 82            	dc.b	130
 341  006d 00            	dc.b	page(f_NonHandledInterrupt)
 342  006e 0000          	dc.w	f_NonHandledInterrupt
 343  0070 82            	dc.b	130
 345  0071 00            	dc.b	page(f_NonHandledInterrupt)
 346  0072 0000          	dc.w	f_NonHandledInterrupt
 347  0074 82            	dc.b	130
 349  0075 00            	dc.b	page(f_NonHandledInterrupt)
 350  0076 0000          	dc.w	f_NonHandledInterrupt
 351  0078 82            	dc.b	130
 353  0079 00            	dc.b	page(f_NonHandledInterrupt)
 354  007a 0000          	dc.w	f_NonHandledInterrupt
 355  007c 82            	dc.b	130
 357  007d 01            	dc.b	page(f_I2C_Interrupt)
 358  007e 0001          	dc.w	f_I2C_Interrupt
 409                     	xdef	__vectab
 410                     	xref	__stext
 411                     	xdef	f_I2C_Interrupt
 412                     	xdef	f_NonHandledInterrupt
 413                     	xref	_I2C_ReadRegister
 414                     	xref.b	c_x
 415                     	xref.b	c_y
 434                     	end
