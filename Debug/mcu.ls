   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  59                     ; 18 void mcu_i2cInit(uint8_t busId)
  59                     ; 19 {
  61                     	switch	.text
  62  0000               _mcu_i2cInit:
  66                     ; 21     CLK->CKDIVR = 0x00;
  68  0000 725f50c0      	clr	20672
  69                     ; 23     CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  71  0004 ae0301        	ldw	x,#769
  72  0007 cd0000        	call	_CLK_PeripheralClockConfig
  74                     ; 25     I2C_DeInit(I2C1);
  76  000a ae5210        	ldw	x,#21008
  77  000d cd0000        	call	_I2C_DeInit
  79                     ; 28     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  81  0010 4b00          	push	#0
  82  0012 4b04          	push	#4
  83  0014 4b00          	push	#0
  84  0016 4b00          	push	#0
  85  0018 ae00fe        	ldw	x,#254
  86  001b 89            	pushw	x
  87  001c aec350        	ldw	x,#50000
  88  001f 89            	pushw	x
  89  0020 ae0000        	ldw	x,#0
  90  0023 89            	pushw	x
  91  0024 ae5210        	ldw	x,#21008
  92  0027 cd0000        	call	_I2C_Init
  94  002a 5b0a          	addw	sp,#10
  95                     ; 31     I2C_Cmd(I2C1, ENABLE);
  97  002c 4b01          	push	#1
  98  002e ae5210        	ldw	x,#21008
  99  0031 cd0000        	call	_I2C_Cmd
 101  0034 84            	pop	a
 102                     ; 34     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);
 104  0035 4bb0          	push	#176
 105  0037 4b01          	push	#1
 106  0039 ae500a        	ldw	x,#20490
 107  003c cd0000        	call	_GPIO_Init
 109  003f 85            	popw	x
 110                     ; 35     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 112  0040 4bb0          	push	#176
 113  0042 4b02          	push	#2
 114  0044 ae500a        	ldw	x,#20490
 115  0047 cd0000        	call	_GPIO_Init
 117  004a 85            	popw	x
 118                     ; 37     I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY);
 120  004b ae0302        	ldw	x,#770
 121  004e 89            	pushw	x
 122  004f ae5210        	ldw	x,#21008
 123  0052 cd0000        	call	_I2C_GetFlagStatus
 125  0055 85            	popw	x
 126                     ; 38     I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT);
 128  0056 ae0301        	ldw	x,#769
 129  0059 89            	pushw	x
 130  005a ae5210        	ldw	x,#21008
 131  005d cd0000        	call	_I2C_CheckEvent
 133  0060 85            	popw	x
 134                     ; 41 }
 137  0061 81            	ret
 251                     ; 43 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 251                     ; 44                        uint8_t *dataToWrite, uint8_t writeLength,
 251                     ; 45                        uint8_t *dataToRead, uint8_t readLength)
 251                     ; 46 {
 252                     	switch	.text
 253  0062               _mcu_i2cTransfer:
 255  0062 89            	pushw	x
 256  0063 5205          	subw	sp,#5
 257       00000005      OFST:	set	5
 260                     ; 55     uint8_t slaveDevAddr = i2cAddr << 1;
 262  0065 9f            	ld	a,xl
 263  0066 48            	sll	a
 264  0067 6b01          	ld	(OFST-4,sp),a
 266                     ; 59     numWriteBytes = (int)writeLength;
 268  0069 7b0c          	ld	a,(OFST+7,sp)
 269  006b 5f            	clrw	x
 270  006c 97            	ld	xl,a
 271  006d 1f02          	ldw	(OFST-3,sp),x
 273                     ; 60     numReadBytes = (int)readLength;
 275  006f 7b0f          	ld	a,(OFST+10,sp)
 276  0071 5f            	clrw	x
 277  0072 97            	ld	xl,a
 278  0073 1f04          	ldw	(OFST-1,sp),x
 280                     ; 67     if ((dataToWrite != NULL) && (writeLength != 0))
 282  0075 1e0a          	ldw	x,(OFST+5,sp)
 283  0077 2603          	jrne	L01
 284  0079 cc010f        	jp	L501
 285  007c               L01:
 287  007c 0d0c          	tnz	(OFST+7,sp)
 288  007e 2603          	jrne	L21
 289  0080 cc010f        	jp	L501
 290  0083               L21:
 291                     ; 70         I2C1->CR2 |= I2C_CR2_ACK;
 293  0083 72145211      	bset	21009,#2
 294                     ; 72         I2C1->CR2 &= ~I2C_CR2_POS;
 296  0087 72175211      	bres	21009,#3
 298  008b               L111:
 299                     ; 75         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 301  008b ae0302        	ldw	x,#770
 302  008e 89            	pushw	x
 303  008f ae5210        	ldw	x,#21008
 304  0092 cd0000        	call	_I2C_GetFlagStatus
 306  0095 85            	popw	x
 307  0096 4d            	tnz	a
 308  0097 26f2          	jrne	L111
 309                     ; 78         I2C_GenerateSTART(I2C1, ENABLE);
 311  0099 4b01          	push	#1
 312  009b ae5210        	ldw	x,#21008
 313  009e cd0000        	call	_I2C_GenerateSTART
 315  00a1 84            	pop	a
 317  00a2               L711:
 318                     ; 81         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 320  00a2 ae0301        	ldw	x,#769
 321  00a5 89            	pushw	x
 322  00a6 ae5210        	ldw	x,#21008
 323  00a9 cd0000        	call	_I2C_CheckEvent
 325  00ac 85            	popw	x
 326  00ad 4d            	tnz	a
 327  00ae 27f2          	jreq	L711
 328                     ; 87         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
 330  00b0 4b00          	push	#0
 331  00b2 7b02          	ld	a,(OFST-3,sp)
 332  00b4 88            	push	a
 333  00b5 ae5210        	ldw	x,#21008
 334  00b8 cd0000        	call	_I2C_Send7bitAddress
 336  00bb 85            	popw	x
 338  00bc               L521:
 339                     ; 90         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 341  00bc ae0782        	ldw	x,#1922
 342  00bf 89            	pushw	x
 343  00c0 ae5210        	ldw	x,#21008
 344  00c3 cd0000        	call	_I2C_CheckEvent
 346  00c6 85            	popw	x
 347  00c7 4d            	tnz	a
 348  00c8 27f2          	jreq	L521
 350  00ca 2028          	jra	L331
 351  00cc               L131:
 352                     ; 97             I2C_SendData(I2C1, *dataToWrite);
 354  00cc 1e0a          	ldw	x,(OFST+5,sp)
 355  00ce f6            	ld	a,(x)
 356  00cf 88            	push	a
 357  00d0 ae5210        	ldw	x,#21008
 358  00d3 cd0000        	call	_I2C_SendData
 360  00d6 84            	pop	a
 362  00d7               L141:
 363                     ; 100             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
 365  00d7 ae0784        	ldw	x,#1924
 366  00da 89            	pushw	x
 367  00db ae5210        	ldw	x,#21008
 368  00de cd0000        	call	_I2C_CheckEvent
 370  00e1 85            	popw	x
 371  00e2 a101          	cp	a,#1
 372  00e4 26f1          	jrne	L141
 373                     ; 103             numWriteBytes--;
 375  00e6 1e02          	ldw	x,(OFST-3,sp)
 376  00e8 1d0001        	subw	x,#1
 377  00eb 1f02          	ldw	(OFST-3,sp),x
 379                     ; 104             dataToWrite++;
 381  00ed 1e0a          	ldw	x,(OFST+5,sp)
 382  00ef 1c0001        	addw	x,#1
 383  00f2 1f0a          	ldw	(OFST+5,sp),x
 384  00f4               L331:
 385                     ; 94         while (numWriteBytes)
 387  00f4 1e02          	ldw	x,(OFST-3,sp)
 388  00f6 26d4          	jrne	L131
 389                     ; 108         I2C_GenerateSTOP(I2C1, ENABLE);
 391  00f8 4b01          	push	#1
 392  00fa ae5210        	ldw	x,#21008
 393  00fd cd0000        	call	_I2C_GenerateSTOP
 395  0100 84            	pop	a
 397  0101               L741:
 398                     ; 109         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 400  0101 ae0110        	ldw	x,#272
 401  0104 89            	pushw	x
 402  0105 ae5210        	ldw	x,#21008
 403  0108 cd0000        	call	_I2C_GetFlagStatus
 405  010b 85            	popw	x
 406  010c 4d            	tnz	a
 407  010d 26f2          	jrne	L741
 408  010f               L501:
 409                     ; 113     if ((dataToRead != NULL) && (readLength != 0))
 411  010f 1e0d          	ldw	x,(OFST+8,sp)
 412  0111 2603          	jrne	L41
 413  0113 cc01b0        	jp	L351
 414  0116               L41:
 416  0116 0d0f          	tnz	(OFST+10,sp)
 417  0118 2603          	jrne	L61
 418  011a cc01b0        	jp	L351
 419  011d               L61:
 421  011d               L751:
 422                     ; 117         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 424  011d ae0302        	ldw	x,#770
 425  0120 89            	pushw	x
 426  0121 ae5210        	ldw	x,#21008
 427  0124 cd0000        	call	_I2C_GetFlagStatus
 429  0127 85            	popw	x
 430  0128 4d            	tnz	a
 431  0129 26f2          	jrne	L751
 432                     ; 121         I2C_GenerateSTART(I2C1, ENABLE);
 434  012b 4b01          	push	#1
 435  012d ae5210        	ldw	x,#21008
 436  0130 cd0000        	call	_I2C_GenerateSTART
 438  0133 84            	pop	a
 440  0134               L561:
 441                     ; 124         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 443  0134 ae0301        	ldw	x,#769
 444  0137 89            	pushw	x
 445  0138 ae5210        	ldw	x,#21008
 446  013b cd0000        	call	_I2C_CheckEvent
 448  013e 85            	popw	x
 449  013f 4d            	tnz	a
 450  0140 27f2          	jreq	L561
 451                     ; 128         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);
 453  0142 4b01          	push	#1
 454  0144 7b02          	ld	a,(OFST-3,sp)
 455  0146 88            	push	a
 456  0147 ae5210        	ldw	x,#21008
 457  014a cd0000        	call	_I2C_Send7bitAddress
 459  014d 85            	popw	x
 461  014e               L371:
 462                     ; 131         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 464  014e ae0302        	ldw	x,#770
 465  0151 89            	pushw	x
 466  0152 ae5210        	ldw	x,#21008
 467  0155 cd0000        	call	_I2C_CheckEvent
 469  0158 85            	popw	x
 470  0159 4d            	tnz	a
 471  015a 27f2          	jreq	L371
 472                     ; 134         I2C1->CR2 |= I2C_CR2_ACK;
 474  015c 72145211      	bset	21009,#2
 476  0160 204a          	jra	L102
 477  0162               L502:
 478                     ; 142                 I2C1->CR2 |= I2C_CR2_ACK;
 480  0162 72145211      	bset	21009,#2
 482  0166               L512:
 483                     ; 143                 while (!(I2C1->SR1 & (I2C_SR1_RXNE | I2C_SR1_BTF)));
 485  0166 c65217        	ld	a,21015
 486  0169 a544          	bcp	a,#68
 487  016b 27f9          	jreq	L512
 488                     ; 144                 *(dataToRead++) = (uint8_t) I2C1->DR;
 490  016d 1e0d          	ldw	x,(OFST+8,sp)
 491  016f 1c0001        	addw	x,#1
 492  0172 1f0d          	ldw	(OFST+8,sp),x
 493  0174 1d0001        	subw	x,#1
 494  0177 c65216        	ld	a,21014
 495  017a f7            	ld	(x),a
 496  017b               L702:
 497                     ; 140             while (numReadBytes-- > 1)
 499  017b 9c            	rvf
 500  017c 1e04          	ldw	x,(OFST-1,sp)
 501  017e 1d0001        	subw	x,#1
 502  0181 1f04          	ldw	(OFST-1,sp),x
 503  0183 1c0001        	addw	x,#1
 505  0186 a30002        	cpw	x,#2
 506  0189 2ed7          	jrsge	L502
 507                     ; 147             I2C1->CR2 &=~ I2C_CR2_ACK;
 509  018b 72155211      	bres	21009,#2
 510                     ; 148             I2C_GenerateSTOP(I2C1, ENABLE);
 512  018f 4b01          	push	#1
 513  0191 ae5210        	ldw	x,#21008
 514  0194 cd0000        	call	_I2C_GenerateSTOP
 516  0197 84            	pop	a
 518  0198               L322:
 519                     ; 149                     while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 521  0198 ae0110        	ldw	x,#272
 522  019b 89            	pushw	x
 523  019c ae5210        	ldw	x,#21008
 524  019f cd0000        	call	_I2C_GetFlagStatus
 526  01a2 85            	popw	x
 527  01a3 4d            	tnz	a
 528  01a4 26f2          	jrne	L322
 529                     ; 151             *(dataToRead) = (uint8_t) I2C1->DR;
 531  01a6 1e0d          	ldw	x,(OFST+8,sp)
 532  01a8 c65216        	ld	a,21014
 533  01ab f7            	ld	(x),a
 534  01ac               L102:
 535                     ; 138         while (numReadBytes)
 537  01ac 1e04          	ldw	x,(OFST-1,sp)
 538  01ae 26cb          	jrne	L702
 539  01b0               L351:
 540                     ; 205     return (0);
 542  01b0 4f            	clr	a
 545  01b1 5b07          	addw	sp,#7
 546  01b3 81            	ret
 599                     ; 210 void mcu_msWait(unsigned long msWait)
 599                     ; 211 {
 600                     	switch	.text
 601  01b4               _mcu_msWait:
 603  01b4 5208          	subw	sp,#8
 604       00000008      OFST:	set	8
 607                     ; 215     delay_ms(msWait);
 610  01b6 1e0d          	ldw	x,(OFST+5,sp)
 611  01b8 1f03          	ldw	(OFST-5,sp),x
 612  01ba 1e0b          	ldw	x,(OFST+3,sp)
 613  01bc 1f01          	ldw	(OFST-7,sp),x
 615                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 617  01be ae0000        	ldw	x,#0
 618  01c1 1f07          	ldw	(OFST-1,sp),x
 619  01c3 ae0000        	ldw	x,#0
 620  01c6 1f05          	ldw	(OFST-3,sp),x
 623  01c8 2009          	jra	L362
 624  01ca               L752:
 627  01ca 96            	ldw	x,sp
 628  01cb 1c0005        	addw	x,#OFST-3
 629  01ce a601          	ld	a,#1
 630  01d0 cd0000        	call	c_lgadc
 633  01d3               L362:
 636  01d3 96            	ldw	x,sp
 637  01d4 1c0001        	addw	x,#OFST-7
 638  01d7 cd0000        	call	c_ltor
 640  01da a66f          	ld	a,#111
 641  01dc cd0000        	call	c_smul
 643  01df 96            	ldw	x,sp
 644  01e0 1c0005        	addw	x,#OFST-3
 645  01e3 cd0000        	call	c_lcmp
 647  01e6 22e2          	jrugt	L752
 648                     ; 216 }
 651  01e8 5b08          	addw	sp,#8
 652  01ea 81            	ret
 665                     	xdef	_mcu_msWait
 666                     	xdef	_mcu_i2cTransfer
 667                     	xdef	_mcu_i2cInit
 668                     	xref	_I2C_GetFlagStatus
 669                     	xref	_I2C_CheckEvent
 670                     	xref	_I2C_SendData
 671                     	xref	_I2C_Send7bitAddress
 672                     	xref	_I2C_GenerateSTOP
 673                     	xref	_I2C_GenerateSTART
 674                     	xref	_I2C_Cmd
 675                     	xref	_I2C_Init
 676                     	xref	_I2C_DeInit
 677                     	xref	_GPIO_Init
 678                     	xref	_CLK_PeripheralClockConfig
 697                     	xref	c_lcmp
 698                     	xref	c_smul
 699                     	xref	c_ltor
 700                     	xref	c_lgadc
 701                     	end
