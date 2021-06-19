   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _SensorAddr:
  15  0000 80            	dc.b	128
  60                     ; 18 void mcu_i2cInit(uint8_t busId)
  60                     ; 19 {
  62                     	switch	.text
  63  0000               _mcu_i2cInit:
  67                     ; 22     I2C_DeInit(I2C1);
  69  0000 ae5210        	ldw	x,#21008
  70  0003 cd0000        	call	_I2C_DeInit
  72                     ; 24     I2C_Cmd(I2C1, ENABLE);
  74  0006 4b01          	push	#1
  75  0008 ae5210        	ldw	x,#21008
  76  000b cd0000        	call	_I2C_Cmd
  78  000e 84            	pop	a
  79                     ; 27     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  81  000f 4b00          	push	#0
  82  0011 4b04          	push	#4
  83  0013 4b00          	push	#0
  84  0015 4b00          	push	#0
  85  0017 ae00fe        	ldw	x,#254
  86  001a 89            	pushw	x
  87  001b ae86a0        	ldw	x,#34464
  88  001e 89            	pushw	x
  89  001f ae0001        	ldw	x,#1
  90  0022 89            	pushw	x
  91  0023 ae5210        	ldw	x,#21008
  92  0026 cd0000        	call	_I2C_Init
  94  0029 5b0a          	addw	sp,#10
  95                     ; 29     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
  97  002b 4bb0          	push	#176
  98  002d 4b01          	push	#1
  99  002f ae500a        	ldw	x,#20490
 100  0032 cd0000        	call	_GPIO_Init
 102  0035 85            	popw	x
 103                     ; 30     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 105  0036 4bb0          	push	#176
 106  0038 4b02          	push	#2
 107  003a ae500a        	ldw	x,#20490
 108  003d cd0000        	call	_GPIO_Init
 110  0040 85            	popw	x
 111                     ; 31     I2C_ITConfig(I2C1, I2C_IT_EVT | I2C_IT_BUF, ENABLE);
 113  0041 4b01          	push	#1
 114  0043 ae0006        	ldw	x,#6
 115  0046 89            	pushw	x
 116  0047 ae5210        	ldw	x,#21008
 117  004a cd0000        	call	_I2C_ITConfig
 119  004d 5b03          	addw	sp,#3
 120                     ; 32 }
 123  004f 81            	ret
 192                     ; 34 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 192                     ; 35                        uint8_t *dataToWrite, uint8_t writeLength,
 192                     ; 36                        uint8_t *dataToRead, uint8_t readLength)
 192                     ; 37 {
 193                     	switch	.text
 194  0050               _mcu_i2cTransfer:
 196  0050 89            	pushw	x
 197       00000000      OFST:	set	0
 200                     ; 43     I2C_GenerateSTART(I2C1, ENABLE);
 202  0051 4b01          	push	#1
 203  0053 ae5210        	ldw	x,#21008
 204  0056 cd0000        	call	_I2C_GenerateSTART
 206  0059 84            	pop	a
 208  005a               L36:
 209                     ; 44     while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 211  005a ae0301        	ldw	x,#769
 212  005d 89            	pushw	x
 213  005e ae5210        	ldw	x,#21008
 214  0061 cd0000        	call	_I2C_CheckEvent
 216  0064 85            	popw	x
 217  0065 4d            	tnz	a
 218  0066 27f2          	jreq	L36
 219                     ; 47     I2C_Send7bitAddress(I2C1, i2cAddr, I2C_Direction_Transmitter);
 221  0068 4b00          	push	#0
 222  006a 7b03          	ld	a,(OFST+3,sp)
 223  006c 88            	push	a
 224  006d ae5210        	ldw	x,#21008
 225  0070 cd0000        	call	_I2C_Send7bitAddress
 227  0073 85            	popw	x
 229  0074               L17:
 230                     ; 48     while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 232  0074 ae0782        	ldw	x,#1922
 233  0077 89            	pushw	x
 234  0078 ae5210        	ldw	x,#21008
 235  007b cd0000        	call	_I2C_CheckEvent
 237  007e 85            	popw	x
 238  007f 4d            	tnz	a
 239  0080 27f2          	jreq	L17
 240                     ; 51     if (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 242  0082 ae0782        	ldw	x,#1922
 243  0085 89            	pushw	x
 244  0086 ae5210        	ldw	x,#21008
 245  0089 cd0000        	call	_I2C_CheckEvent
 247  008c 85            	popw	x
 248  008d 4d            	tnz	a
 249  008e 271b          	jreq	L57
 250                     ; 53         I2C_SendData(I2C1, *dataToWrite);
 252  0090 1e05          	ldw	x,(OFST+5,sp)
 253  0092 f6            	ld	a,(x)
 254  0093 88            	push	a
 255  0094 ae5210        	ldw	x,#21008
 256  0097 cd0000        	call	_I2C_SendData
 258  009a 84            	pop	a
 260  009b               L101:
 261                     ; 54         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 263  009b ae0784        	ldw	x,#1924
 264  009e 89            	pushw	x
 265  009f ae5210        	ldw	x,#21008
 266  00a2 cd0000        	call	_I2C_CheckEvent
 268  00a5 85            	popw	x
 269  00a6 4d            	tnz	a
 270  00a7 27f2          	jreq	L101
 272  00a9 2025          	jra	L501
 273  00ab               L57:
 274                     ; 58     else if (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 276  00ab ae0302        	ldw	x,#770
 277  00ae 89            	pushw	x
 278  00af ae5210        	ldw	x,#21008
 279  00b2 cd0000        	call	_I2C_CheckEvent
 281  00b5 85            	popw	x
 282  00b6 4d            	tnz	a
 283  00b7 2717          	jreq	L501
 284                     ; 60         *dataToRead = I2C_ReceiveData(I2C1);
 286  00b9 ae5210        	ldw	x,#21008
 287  00bc cd0000        	call	_I2C_ReceiveData
 289  00bf 1e08          	ldw	x,(OFST+8,sp)
 290  00c1 f7            	ld	(x),a
 292  00c2               L511:
 293                     ; 61         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED))
 295  00c2 ae0340        	ldw	x,#832
 296  00c5 89            	pushw	x
 297  00c6 ae5210        	ldw	x,#21008
 298  00c9 cd0000        	call	_I2C_CheckEvent
 300  00cc 85            	popw	x
 301  00cd 4d            	tnz	a
 302  00ce 27f2          	jreq	L511
 303  00d0               L501:
 304                     ; 65     I2C_GenerateSTOP(I2C1, ENABLE);
 306  00d0 4b01          	push	#1
 307  00d2 ae5210        	ldw	x,#21008
 308  00d5 cd0000        	call	_I2C_GenerateSTOP
 310  00d8 84            	pop	a
 311                     ; 70     return (0);
 313  00d9 4f            	clr	a
 316  00da 85            	popw	x
 317  00db 81            	ret
 361                     .const:	section	.text
 362  0000               L21:
 363  0000 0000006f      	dc.l	111
 364                     ; 75 void mcu_msWait(unsigned long msWait)
 364                     ; 76 {
 365                     	switch	.text
 366  00dc               _mcu_msWait:
 368  00dc 5204          	subw	sp,#4
 369       00000004      OFST:	set	4
 372                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 375  00de ae0000        	ldw	x,#0
 376  00e1 1f03          	ldw	(OFST-1,sp),x
 377  00e3 ae0000        	ldw	x,#0
 378  00e6 1f01          	ldw	(OFST-3,sp),x
 380  00e8               L541:
 383  00e8 96            	ldw	x,sp
 384  00e9 1c0001        	addw	x,#OFST-3
 385  00ec a601          	ld	a,#1
 386  00ee cd0000        	call	c_lgadc
 391  00f1 96            	ldw	x,sp
 392  00f2 1c0001        	addw	x,#OFST-3
 393  00f5 cd0000        	call	c_ltor
 395  00f8 ae0000        	ldw	x,#L21
 396  00fb cd0000        	call	c_lcmp
 398  00fe 25e8          	jrult	L541
 399                     ; 81 }
 402  0100 5b04          	addw	sp,#4
 403  0102 81            	ret
 427                     	xdef	_SensorAddr
 428                     	xdef	_mcu_msWait
 429                     	xdef	_mcu_i2cTransfer
 430                     	xdef	_mcu_i2cInit
 431                     	xref	_I2C_CheckEvent
 432                     	xref	_I2C_ITConfig
 433                     	xref	_I2C_ReceiveData
 434                     	xref	_I2C_SendData
 435                     	xref	_I2C_Send7bitAddress
 436                     	xref	_I2C_GenerateSTOP
 437                     	xref	_I2C_GenerateSTART
 438                     	xref	_I2C_Cmd
 439                     	xref	_I2C_Init
 440                     	xref	_I2C_DeInit
 441                     	xref	_GPIO_Init
 460                     	xref	c_lcmp
 461                     	xref	c_ltor
 462                     	xref	c_lgadc
 463                     	end
