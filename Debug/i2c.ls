   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _input_clk:
  15  0000 00            	dc.b	0
  51                     .const:	section	.text
  52  0000               L6:
  53  0000 000f4240      	dc.l	1000000
  54                     ; 13 void I2C_Setup()
  54                     ; 14 {
  55                     	scross	off
  56                     	switch	.text
  57  0000               _I2C_Setup:
  61                     ; 15 	input_clk = CLK_GetClockFreq() / 1000000;
  63  0000 cd0000        	call	_CLK_GetClockFreq
  65  0003 ae0000        	ldw	x,#L6
  66  0006 cd0000        	call	c_ludv
  68  0009 b603          	ld	a,c_lreg+3
  69  000b b700          	ld	_input_clk,a
  70                     ; 17 	I2C_DeInit(I2C1);
  72  000d ae5210        	ldw	x,#21008
  73  0010 cd0000        	call	_I2C_DeInit
  75                     ; 21 	I2C_Cmd(I2C1, ENABLE);
  77  0013 4b01          	push	#1
  78  0015 ae5210        	ldw	x,#21008
  79  0018 cd0000        	call	_I2C_Cmd
  81  001b 84            	pop	a
  82                     ; 23 	I2C_Init(I2C1, OUTPUT_CLK_SPEED, EEPROM_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  84  001c 4b00          	push	#0
  85  001e 4b04          	push	#4
  86  0020 4b00          	push	#0
  87  0022 4b00          	push	#0
  88  0024 ae00b2        	ldw	x,#178
  89  0027 89            	pushw	x
  90  0028 ae86a0        	ldw	x,#34464
  91  002b 89            	pushw	x
  92  002c ae0001        	ldw	x,#1
  93  002f 89            	pushw	x
  94  0030 ae5210        	ldw	x,#21008
  95  0033 cd0000        	call	_I2C_Init
  97  0036 5b0a          	addw	sp,#10
  98                     ; 25 	GPIO_DeInit(GPIOC); // Might cause issues with other modules
 100  0038 ae500a        	ldw	x,#20490
 101  003b cd0000        	call	_GPIO_DeInit
 103                     ; 27 	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
 105  003e 4bb0          	push	#176
 106  0040 4b01          	push	#1
 107  0042 ae500a        	ldw	x,#20490
 108  0045 cd0000        	call	_GPIO_Init
 110  0048 85            	popw	x
 111                     ; 28 	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast); 
 113  0049 4bb0          	push	#176
 114  004b 4b02          	push	#2
 115  004d ae500a        	ldw	x,#20490
 116  0050 cd0000        	call	_GPIO_Init
 118  0053 85            	popw	x
 119                     ; 30 }
 122  0054 81            	ret
 170                     ; 32 void I2C_Write_Byte(uint8_t slaveAddress, uint8_t inputData)
 170                     ; 33 {
 171                     	switch	.text
 172  0055               _I2C_Write_Byte:
 174  0055 89            	pushw	x
 175       00000000      OFST:	set	0
 178                     ; 35 	I2C_GenerateSTART(I2C1, ENABLE);
 180  0056 4b01          	push	#1
 181  0058 ae5210        	ldw	x,#21008
 182  005b cd0000        	call	_I2C_GenerateSTART
 184  005e 84            	pop	a
 186  005f               L54:
 187                     ; 37 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
 189  005f ae0301        	ldw	x,#769
 190  0062 89            	pushw	x
 191  0063 ae5210        	ldw	x,#21008
 192  0066 cd0000        	call	_I2C_CheckEvent
 194  0069 85            	popw	x
 195  006a 4d            	tnz	a
 196  006b 27f2          	jreq	L54
 197                     ; 40 	I2C_Send7bitAddress(I2C1, slaveAddress, I2C_Direction_Transmitter);
 199  006d 4b00          	push	#0
 200  006f 7b02          	ld	a,(OFST+2,sp)
 201  0071 88            	push	a
 202  0072 ae5210        	ldw	x,#21008
 203  0075 cd0000        	call	_I2C_Send7bitAddress
 205  0078 85            	popw	x
 207  0079               L35:
 208                     ; 42 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 210  0079 ae0782        	ldw	x,#1922
 211  007c 89            	pushw	x
 212  007d ae5210        	ldw	x,#21008
 213  0080 cd0000        	call	_I2C_CheckEvent
 215  0083 85            	popw	x
 216  0084 4d            	tnz	a
 217  0085 27f2          	jreq	L35
 218                     ; 45 	I2C_SendData(I2C1, inputData);
 220  0087 7b02          	ld	a,(OFST+2,sp)
 221  0089 88            	push	a
 222  008a ae5210        	ldw	x,#21008
 223  008d cd0000        	call	_I2C_SendData
 225  0090 84            	pop	a
 227  0091               L16:
 228                     ; 47 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 230  0091 ae0784        	ldw	x,#1924
 231  0094 89            	pushw	x
 232  0095 ae5210        	ldw	x,#21008
 233  0098 cd0000        	call	_I2C_CheckEvent
 235  009b 85            	popw	x
 236  009c 4d            	tnz	a
 237  009d 27f2          	jreq	L16
 238                     ; 50 	I2C_GenerateSTOP(I2C1, ENABLE);
 240  009f 4b01          	push	#1
 241  00a1 ae5210        	ldw	x,#21008
 242  00a4 cd0000        	call	_I2C_GenerateSTOP
 244  00a7 84            	pop	a
 245                     ; 52 }
 248  00a8 85            	popw	x
 249  00a9 81            	ret
 252                     	xref	_wihle
 311                     ; 55 void I2C_Read_Byte(uint8_t slaveAddress, uint8_t readAddress, uint8_t* buffer)
 311                     ; 56 {
 312                     	switch	.text
 313  00aa               _I2C_Read_Byte:
 315  00aa 89            	pushw	x
 316       00000000      OFST:	set	0
 319  00ab               L511:
 320                     ; 58 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));
 322  00ab ae0302        	ldw	x,#770
 323  00ae 89            	pushw	x
 324  00af ae5210        	ldw	x,#21008
 325  00b2 cd0000        	call	_I2C_GetFlagStatus
 327  00b5 85            	popw	x
 328  00b6 4d            	tnz	a
 329  00b7 26f2          	jrne	L511
 330                     ; 61 	I2C_GenerateSTART(I2C1, ENABLE);
 332  00b9 4b01          	push	#1
 333  00bb ae5210        	ldw	x,#21008
 334  00be cd0000        	call	_I2C_GenerateSTART
 336  00c1 84            	pop	a
 337                     ; 63 	wihle(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
 339  00c2 ae0301        	ldw	x,#769
 340  00c5 89            	pushw	x
 341  00c6 ae5210        	ldw	x,#21008
 342  00c9 cd0000        	call	_I2C_CheckEvent
 344  00cc 85            	popw	x
 345  00cd 4d            	tnz	a
 346  00ce 2605          	jrne	L41
 347  00d0 ae0001        	ldw	x,#1
 348  00d3 2001          	jra	L61
 349  00d5               L41:
 350  00d5 5f            	clrw	x
 351  00d6               L61:
 352  00d6 cd0000        	call	_wihle
 354                     ; 66 	I2C_Send7bitAddress(I2C1, slaveAddress, I2C_Direction_Transmitter);
 356  00d9 4b00          	push	#0
 357  00db 7b02          	ld	a,(OFST+2,sp)
 358  00dd 88            	push	a
 359  00de ae5210        	ldw	x,#21008
 360  00e1 cd0000        	call	_I2C_Send7bitAddress
 362  00e4 85            	popw	x
 364  00e5               L321:
 365                     ; 68 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 367  00e5 ae0782        	ldw	x,#1922
 368  00e8 89            	pushw	x
 369  00e9 ae5210        	ldw	x,#21008
 370  00ec cd0000        	call	_I2C_CheckEvent
 372  00ef 85            	popw	x
 373  00f0 4d            	tnz	a
 374  00f1 27f2          	jreq	L321
 375                     ; 71 	I2C_SendData(I2C1, (uint8_t) (readAddress)); // LSB
 377  00f3 7b02          	ld	a,(OFST+2,sp)
 378  00f5 88            	push	a
 379  00f6 ae5210        	ldw	x,#21008
 380  00f9 cd0000        	call	_I2C_SendData
 382  00fc 84            	pop	a
 384  00fd               L131:
 385                     ; 73 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 387  00fd ae0784        	ldw	x,#1924
 388  0100 89            	pushw	x
 389  0101 ae5210        	ldw	x,#21008
 390  0104 cd0000        	call	_I2C_CheckEvent
 392  0107 85            	popw	x
 393  0108 4d            	tnz	a
 394  0109 27f2          	jreq	L131
 395                     ; 76 	I2C_GenerateSTART(I2C1, ENABLE);
 397  010b 4b01          	push	#1
 398  010d ae5210        	ldw	x,#21008
 399  0110 cd0000        	call	_I2C_GenerateSTART
 401  0113 84            	pop	a
 402                     ; 78 	wihle(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
 404  0114 ae0301        	ldw	x,#769
 405  0117 89            	pushw	x
 406  0118 ae5210        	ldw	x,#21008
 407  011b cd0000        	call	_I2C_CheckEvent
 409  011e 85            	popw	x
 410  011f 4d            	tnz	a
 411  0120 2605          	jrne	L02
 412  0122 ae0001        	ldw	x,#1
 413  0125 2001          	jra	L22
 414  0127               L02:
 415  0127 5f            	clrw	x
 416  0128               L22:
 417  0128 cd0000        	call	_wihle
 419                     ; 81 	I2C_Send7bitAddress(I2C1, slaveAddress, I2C_Direction_Receiver);
 421  012b 4b01          	push	#1
 422  012d 7b02          	ld	a,(OFST+2,sp)
 423  012f 88            	push	a
 424  0130 ae5210        	ldw	x,#21008
 425  0133 cd0000        	call	_I2C_Send7bitAddress
 427  0136 85            	popw	x
 429  0137               L731:
 430                     ; 83 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 432  0137 ae0302        	ldw	x,#770
 433  013a 89            	pushw	x
 434  013b ae5210        	ldw	x,#21008
 435  013e cd0000        	call	_I2C_CheckEvent
 437  0141 85            	popw	x
 438  0142 4d            	tnz	a
 439  0143 27f2          	jreq	L731
 441  0145               L541:
 442                     ; 86 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED));
 444  0145 ae0340        	ldw	x,#832
 445  0148 89            	pushw	x
 446  0149 ae5210        	ldw	x,#21008
 447  014c cd0000        	call	_I2C_CheckEvent
 449  014f 85            	popw	x
 450  0150 4d            	tnz	a
 451  0151 27f2          	jreq	L541
 452                     ; 88 	*buffer = I2C_ReceiveData(I2C1);
 454  0153 ae5210        	ldw	x,#21008
 455  0156 cd0000        	call	_I2C_ReceiveData
 457  0159 1e05          	ldw	x,(OFST+5,sp)
 458  015b f7            	ld	(x),a
 459                     ; 90 	I2C_AcknowledgeConfig(I2C1, DISABLE);
 461  015c 4b00          	push	#0
 462  015e ae5210        	ldw	x,#21008
 463  0161 cd0000        	call	_I2C_AcknowledgeConfig
 465  0164 84            	pop	a
 466                     ; 92 	I2C_GenerateSTOP(I2C1, ENABLE);
 468  0165 4b01          	push	#1
 469  0167 ae5210        	ldw	x,#21008
 470  016a cd0000        	call	_I2C_GenerateSTOP
 472  016d 84            	pop	a
 473                     ; 93 }
 476  016e 85            	popw	x
 477  016f 81            	ret
 501                     	xdef	_input_clk
 502                     	xdef	_I2C_Read_Byte
 503                     	xdef	_I2C_Write_Byte
 504                     	xdef	_I2C_Setup
 505                     	xref	_I2C_GetFlagStatus
 506                     	xref	_I2C_CheckEvent
 507                     	xref	_I2C_ReceiveData
 508                     	xref	_I2C_SendData
 509                     	xref	_I2C_Send7bitAddress
 510                     	xref	_I2C_AcknowledgeConfig
 511                     	xref	_I2C_GenerateSTOP
 512                     	xref	_I2C_GenerateSTART
 513                     	xref	_I2C_Cmd
 514                     	xref	_I2C_Init
 515                     	xref	_I2C_DeInit
 516                     	xref	_GPIO_Init
 517                     	xref	_GPIO_DeInit
 518                     	xref	_CLK_GetClockFreq
 519                     	xref.b	c_lreg
 520                     	xref.b	c_x
 539                     	xref	c_ludv
 540                     	end
