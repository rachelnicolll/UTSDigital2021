   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _SensorAddr:
  15  0000 80            	dc.b	128
  59                     ; 18 void mcu_i2cInit(uint8_t busId)
  59                     ; 19 {
  61                     	switch	.text
  62  0000               _mcu_i2cInit:
  66                     ; 22     I2C_DeInit(I2C1);
  68  0000 ae5210        	ldw	x,#21008
  69  0003 cd0000        	call	_I2C_DeInit
  71                     ; 24     I2C_Cmd(I2C1, ENABLE);
  73  0006 4b01          	push	#1
  74  0008 ae5210        	ldw	x,#21008
  75  000b cd0000        	call	_I2C_Cmd
  77  000e 84            	pop	a
  78                     ; 27     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  80  000f 4b00          	push	#0
  81  0011 4b04          	push	#4
  82  0013 4b00          	push	#0
  83  0015 4b00          	push	#0
  84  0017 ae00fe        	ldw	x,#254
  85  001a 89            	pushw	x
  86  001b ae86a0        	ldw	x,#34464
  87  001e 89            	pushw	x
  88  001f ae0001        	ldw	x,#1
  89  0022 89            	pushw	x
  90  0023 ae5210        	ldw	x,#21008
  91  0026 cd0000        	call	_I2C_Init
  93  0029 5b0a          	addw	sp,#10
  94                     ; 29     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
  96  002b 4bb0          	push	#176
  97  002d 4b01          	push	#1
  98  002f ae500a        	ldw	x,#20490
  99  0032 cd0000        	call	_GPIO_Init
 101  0035 85            	popw	x
 102                     ; 30     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 104  0036 4bb0          	push	#176
 105  0038 4b02          	push	#2
 106  003a ae500a        	ldw	x,#20490
 107  003d cd0000        	call	_GPIO_Init
 109  0040 85            	popw	x
 110                     ; 33 }
 113  0041 81            	ret
 182                     ; 35 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 182                     ; 36                        uint8_t *dataToWrite, uint8_t writeLength,
 182                     ; 37                        uint8_t *dataToRead, uint8_t readLength)
 182                     ; 38 {
 183                     	switch	.text
 184  0042               _mcu_i2cTransfer:
 186  0042 89            	pushw	x
 187       00000000      OFST:	set	0
 190                     ; 44     I2C_GenerateSTART(I2C1, ENABLE);
 192  0043 4b01          	push	#1
 193  0045 ae5210        	ldw	x,#21008
 194  0048 cd0000        	call	_I2C_GenerateSTART
 196  004b 84            	pop	a
 198  004c               L36:
 199                     ; 45     while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 201  004c ae0301        	ldw	x,#769
 202  004f 89            	pushw	x
 203  0050 ae5210        	ldw	x,#21008
 204  0053 cd0000        	call	_I2C_CheckEvent
 206  0056 85            	popw	x
 207  0057 4d            	tnz	a
 208  0058 27f2          	jreq	L36
 209                     ; 48     I2C_Send7bitAddress(I2C1, i2cAddr, I2C_Direction_Transmitter);
 211  005a 4b00          	push	#0
 212  005c 7b03          	ld	a,(OFST+3,sp)
 213  005e 88            	push	a
 214  005f ae5210        	ldw	x,#21008
 215  0062 cd0000        	call	_I2C_Send7bitAddress
 217  0065 85            	popw	x
 219  0066               L17:
 220                     ; 49     while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 222  0066 ae0782        	ldw	x,#1922
 223  0069 89            	pushw	x
 224  006a ae5210        	ldw	x,#21008
 225  006d cd0000        	call	_I2C_CheckEvent
 227  0070 85            	popw	x
 228  0071 4d            	tnz	a
 229  0072 27f2          	jreq	L17
 230                     ; 52     if (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 232  0074 ae0782        	ldw	x,#1922
 233  0077 89            	pushw	x
 234  0078 ae5210        	ldw	x,#21008
 235  007b cd0000        	call	_I2C_CheckEvent
 237  007e 85            	popw	x
 238  007f 4d            	tnz	a
 239  0080 271b          	jreq	L57
 240                     ; 54         I2C_SendData(I2C1, *dataToWrite);
 242  0082 1e05          	ldw	x,(OFST+5,sp)
 243  0084 f6            	ld	a,(x)
 244  0085 88            	push	a
 245  0086 ae5210        	ldw	x,#21008
 246  0089 cd0000        	call	_I2C_SendData
 248  008c 84            	pop	a
 250  008d               L101:
 251                     ; 55         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 253  008d ae0784        	ldw	x,#1924
 254  0090 89            	pushw	x
 255  0091 ae5210        	ldw	x,#21008
 256  0094 cd0000        	call	_I2C_CheckEvent
 258  0097 85            	popw	x
 259  0098 4d            	tnz	a
 260  0099 27f2          	jreq	L101
 262  009b 2025          	jra	L501
 263  009d               L57:
 264                     ; 59     else if (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 266  009d ae0302        	ldw	x,#770
 267  00a0 89            	pushw	x
 268  00a1 ae5210        	ldw	x,#21008
 269  00a4 cd0000        	call	_I2C_CheckEvent
 271  00a7 85            	popw	x
 272  00a8 4d            	tnz	a
 273  00a9 2717          	jreq	L501
 274                     ; 61         *dataToRead = I2C_ReceiveData(I2C1);
 276  00ab ae5210        	ldw	x,#21008
 277  00ae cd0000        	call	_I2C_ReceiveData
 279  00b1 1e08          	ldw	x,(OFST+8,sp)
 280  00b3 f7            	ld	(x),a
 282  00b4               L511:
 283                     ; 62         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED))
 285  00b4 ae0340        	ldw	x,#832
 286  00b7 89            	pushw	x
 287  00b8 ae5210        	ldw	x,#21008
 288  00bb cd0000        	call	_I2C_CheckEvent
 290  00be 85            	popw	x
 291  00bf 4d            	tnz	a
 292  00c0 27f2          	jreq	L511
 293  00c2               L501:
 294                     ; 66     I2C_GenerateSTOP(I2C1, ENABLE);
 296  00c2 4b01          	push	#1
 297  00c4 ae5210        	ldw	x,#21008
 298  00c7 cd0000        	call	_I2C_GenerateSTOP
 300  00ca 84            	pop	a
 301                     ; 71     return (0);
 303  00cb 4f            	clr	a
 306  00cc 85            	popw	x
 307  00cd 81            	ret
 360                     ; 76 void mcu_msWait(unsigned long msWait)
 360                     ; 77 {
 361                     	switch	.text
 362  00ce               _mcu_msWait:
 364  00ce 5208          	subw	sp,#8
 365       00000008      OFST:	set	8
 368                     ; 81     delay_ms(msWait);
 371  00d0 1e0d          	ldw	x,(OFST+5,sp)
 372  00d2 1f03          	ldw	(OFST-5,sp),x
 373  00d4 1e0b          	ldw	x,(OFST+3,sp)
 374  00d6 1f01          	ldw	(OFST-7,sp),x
 376                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 378  00d8 ae0000        	ldw	x,#0
 379  00db 1f07          	ldw	(OFST-1,sp),x
 380  00dd ae0000        	ldw	x,#0
 381  00e0 1f05          	ldw	(OFST-3,sp),x
 384  00e2 2009          	jra	L551
 385  00e4               L151:
 388  00e4 96            	ldw	x,sp
 389  00e5 1c0005        	addw	x,#OFST-3
 390  00e8 a601          	ld	a,#1
 391  00ea cd0000        	call	c_lgadc
 394  00ed               L551:
 397  00ed 96            	ldw	x,sp
 398  00ee 1c0001        	addw	x,#OFST-7
 399  00f1 cd0000        	call	c_ltor
 401  00f4 a66f          	ld	a,#111
 402  00f6 cd0000        	call	c_smul
 404  00f9 96            	ldw	x,sp
 405  00fa 1c0005        	addw	x,#OFST-3
 406  00fd cd0000        	call	c_lcmp
 408  0100 22e2          	jrugt	L151
 409                     ; 82 }
 412  0102 5b08          	addw	sp,#8
 413  0104 81            	ret
 437                     	xdef	_SensorAddr
 438                     	xdef	_mcu_msWait
 439                     	xdef	_mcu_i2cTransfer
 440                     	xdef	_mcu_i2cInit
 441                     	xref	_I2C_CheckEvent
 442                     	xref	_I2C_ReceiveData
 443                     	xref	_I2C_SendData
 444                     	xref	_I2C_Send7bitAddress
 445                     	xref	_I2C_GenerateSTOP
 446                     	xref	_I2C_GenerateSTART
 447                     	xref	_I2C_Cmd
 448                     	xref	_I2C_Init
 449                     	xref	_I2C_DeInit
 450                     	xref	_GPIO_Init
 469                     	xref	c_lcmp
 470                     	xref	c_smul
 471                     	xref	c_ltor
 472                     	xref	c_lgadc
 473                     	end
