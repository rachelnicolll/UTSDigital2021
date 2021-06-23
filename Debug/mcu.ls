   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _SensorAddr:
  15  0000 80            	dc.b	128
  62                     ; 18 void mcu_i2cInit(uint8_t busId)
  62                     ; 19 {
  64                     	switch	.text
  65  0000               _mcu_i2cInit:
  69                     ; 21     CLK->CKDIVR = 0x00;
  71  0000 725f50c0      	clr	20672
  72                     ; 23     CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  74  0004 ae0301        	ldw	x,#769
  75  0007 cd0000        	call	_CLK_PeripheralClockConfig
  77                     ; 25     I2C_DeInit(I2C1);
  79  000a ae5210        	ldw	x,#21008
  80  000d cd0000        	call	_I2C_DeInit
  82                     ; 28     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  84  0010 4b00          	push	#0
  85  0012 4b04          	push	#4
  86  0014 4b00          	push	#0
  87  0016 4b00          	push	#0
  88  0018 ae00fe        	ldw	x,#254
  89  001b 89            	pushw	x
  90  001c aec350        	ldw	x,#50000
  91  001f 89            	pushw	x
  92  0020 ae0000        	ldw	x,#0
  93  0023 89            	pushw	x
  94  0024 ae5210        	ldw	x,#21008
  95  0027 cd0000        	call	_I2C_Init
  97  002a 5b0a          	addw	sp,#10
  98                     ; 31     I2C_Cmd(I2C1, ENABLE);
 100  002c 4b01          	push	#1
 101  002e ae5210        	ldw	x,#21008
 102  0031 cd0000        	call	_I2C_Cmd
 104  0034 84            	pop	a
 105                     ; 34     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);
 107  0035 4bb0          	push	#176
 108  0037 4b01          	push	#1
 109  0039 ae500a        	ldw	x,#20490
 110  003c cd0000        	call	_GPIO_Init
 112  003f 85            	popw	x
 113                     ; 35     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 115  0040 4bb0          	push	#176
 116  0042 4b02          	push	#2
 117  0044 ae500a        	ldw	x,#20490
 118  0047 cd0000        	call	_GPIO_Init
 120  004a 85            	popw	x
 121                     ; 37     I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY);
 123  004b ae0302        	ldw	x,#770
 124  004e 89            	pushw	x
 125  004f ae5210        	ldw	x,#21008
 126  0052 cd0000        	call	_I2C_GetFlagStatus
 128  0055 85            	popw	x
 129                     ; 38     I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT);
 131  0056 ae0301        	ldw	x,#769
 132  0059 89            	pushw	x
 133  005a ae5210        	ldw	x,#21008
 134  005d cd0000        	call	_I2C_CheckEvent
 136  0060 85            	popw	x
 137                     ; 41 }
 140  0061 81            	ret
 254                     ; 43 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 254                     ; 44                        uint8_t *dataToWrite, uint8_t writeLength,
 254                     ; 45                        uint8_t *dataToRead, uint8_t readLength)
 254                     ; 46 {
 255                     	switch	.text
 256  0062               _mcu_i2cTransfer:
 258  0062 89            	pushw	x
 259  0063 5205          	subw	sp,#5
 260       00000005      OFST:	set	5
 263                     ; 55     uint8_t slaveDevAddr = i2cAddr << 1;
 265  0065 9f            	ld	a,xl
 266  0066 48            	sll	a
 267  0067 6b01          	ld	(OFST-4,sp),a
 269                     ; 59     numWriteBytes = (int)writeLength;
 271  0069 7b0c          	ld	a,(OFST+7,sp)
 272  006b 5f            	clrw	x
 273  006c 97            	ld	xl,a
 274  006d 1f02          	ldw	(OFST-3,sp),x
 276                     ; 60     numReadBytes = (int)readLength;
 278  006f 7b0f          	ld	a,(OFST+10,sp)
 279  0071 5f            	clrw	x
 280  0072 97            	ld	xl,a
 281  0073 1f04          	ldw	(OFST-1,sp),x
 283                     ; 67     if ((dataToWrite != NULL) && (writeLength != 0))
 285  0075 1e0a          	ldw	x,(OFST+5,sp)
 286  0077 2603          	jrne	L01
 287  0079 cc010f        	jp	L501
 288  007c               L01:
 290  007c 0d0c          	tnz	(OFST+7,sp)
 291  007e 2603          	jrne	L21
 292  0080 cc010f        	jp	L501
 293  0083               L21:
 294                     ; 70         I2C1->CR2 |= I2C_CR2_ACK;
 296  0083 72145211      	bset	21009,#2
 297                     ; 72         I2C1->CR2 &= ~I2C_CR2_POS;
 299  0087 72175211      	bres	21009,#3
 301  008b               L111:
 302                     ; 75         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 304  008b ae0302        	ldw	x,#770
 305  008e 89            	pushw	x
 306  008f ae5210        	ldw	x,#21008
 307  0092 cd0000        	call	_I2C_GetFlagStatus
 309  0095 85            	popw	x
 310  0096 4d            	tnz	a
 311  0097 26f2          	jrne	L111
 312                     ; 78         I2C_GenerateSTART(I2C1, ENABLE);
 314  0099 4b01          	push	#1
 315  009b ae5210        	ldw	x,#21008
 316  009e cd0000        	call	_I2C_GenerateSTART
 318  00a1 84            	pop	a
 320  00a2               L711:
 321                     ; 81         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 323  00a2 ae0301        	ldw	x,#769
 324  00a5 89            	pushw	x
 325  00a6 ae5210        	ldw	x,#21008
 326  00a9 cd0000        	call	_I2C_CheckEvent
 328  00ac 85            	popw	x
 329  00ad 4d            	tnz	a
 330  00ae 27f2          	jreq	L711
 331                     ; 87         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
 333  00b0 4b00          	push	#0
 334  00b2 7b02          	ld	a,(OFST-3,sp)
 335  00b4 88            	push	a
 336  00b5 ae5210        	ldw	x,#21008
 337  00b8 cd0000        	call	_I2C_Send7bitAddress
 339  00bb 85            	popw	x
 341  00bc               L521:
 342                     ; 90         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 344  00bc ae0782        	ldw	x,#1922
 345  00bf 89            	pushw	x
 346  00c0 ae5210        	ldw	x,#21008
 347  00c3 cd0000        	call	_I2C_CheckEvent
 349  00c6 85            	popw	x
 350  00c7 4d            	tnz	a
 351  00c8 27f2          	jreq	L521
 353  00ca 2028          	jra	L331
 354  00cc               L131:
 355                     ; 97             I2C_SendData(I2C1, *dataToWrite);
 357  00cc 1e0a          	ldw	x,(OFST+5,sp)
 358  00ce f6            	ld	a,(x)
 359  00cf 88            	push	a
 360  00d0 ae5210        	ldw	x,#21008
 361  00d3 cd0000        	call	_I2C_SendData
 363  00d6 84            	pop	a
 365  00d7               L141:
 366                     ; 100             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
 368  00d7 ae0784        	ldw	x,#1924
 369  00da 89            	pushw	x
 370  00db ae5210        	ldw	x,#21008
 371  00de cd0000        	call	_I2C_CheckEvent
 373  00e1 85            	popw	x
 374  00e2 a101          	cp	a,#1
 375  00e4 26f1          	jrne	L141
 376                     ; 103             numWriteBytes--;
 378  00e6 1e02          	ldw	x,(OFST-3,sp)
 379  00e8 1d0001        	subw	x,#1
 380  00eb 1f02          	ldw	(OFST-3,sp),x
 382                     ; 104             dataToWrite++;
 384  00ed 1e0a          	ldw	x,(OFST+5,sp)
 385  00ef 1c0001        	addw	x,#1
 386  00f2 1f0a          	ldw	(OFST+5,sp),x
 387  00f4               L331:
 388                     ; 94         while (numWriteBytes)
 390  00f4 1e02          	ldw	x,(OFST-3,sp)
 391  00f6 26d4          	jrne	L131
 392                     ; 108         I2C_GenerateSTOP(I2C1, ENABLE);
 394  00f8 4b01          	push	#1
 395  00fa ae5210        	ldw	x,#21008
 396  00fd cd0000        	call	_I2C_GenerateSTOP
 398  0100 84            	pop	a
 400  0101               L741:
 401                     ; 109         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 403  0101 ae0110        	ldw	x,#272
 404  0104 89            	pushw	x
 405  0105 ae5210        	ldw	x,#21008
 406  0108 cd0000        	call	_I2C_GetFlagStatus
 408  010b 85            	popw	x
 409  010c 4d            	tnz	a
 410  010d 26f2          	jrne	L741
 411  010f               L501:
 412                     ; 113     if ((dataToRead != NULL) && (readLength != 0))
 414  010f 1e0d          	ldw	x,(OFST+8,sp)
 415  0111 2603          	jrne	L41
 416  0113 cc01b0        	jp	L351
 417  0116               L41:
 419  0116 0d0f          	tnz	(OFST+10,sp)
 420  0118 2603          	jrne	L61
 421  011a cc01b0        	jp	L351
 422  011d               L61:
 424  011d               L751:
 425                     ; 117         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 427  011d ae0302        	ldw	x,#770
 428  0120 89            	pushw	x
 429  0121 ae5210        	ldw	x,#21008
 430  0124 cd0000        	call	_I2C_GetFlagStatus
 432  0127 85            	popw	x
 433  0128 4d            	tnz	a
 434  0129 26f2          	jrne	L751
 435                     ; 121         I2C_GenerateSTART(I2C1, ENABLE);
 437  012b 4b01          	push	#1
 438  012d ae5210        	ldw	x,#21008
 439  0130 cd0000        	call	_I2C_GenerateSTART
 441  0133 84            	pop	a
 443  0134               L561:
 444                     ; 124         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 446  0134 ae0301        	ldw	x,#769
 447  0137 89            	pushw	x
 448  0138 ae5210        	ldw	x,#21008
 449  013b cd0000        	call	_I2C_CheckEvent
 451  013e 85            	popw	x
 452  013f 4d            	tnz	a
 453  0140 27f2          	jreq	L561
 454                     ; 128         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);
 456  0142 4b01          	push	#1
 457  0144 7b02          	ld	a,(OFST-3,sp)
 458  0146 88            	push	a
 459  0147 ae5210        	ldw	x,#21008
 460  014a cd0000        	call	_I2C_Send7bitAddress
 462  014d 85            	popw	x
 464  014e               L371:
 465                     ; 131         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 467  014e ae0302        	ldw	x,#770
 468  0151 89            	pushw	x
 469  0152 ae5210        	ldw	x,#21008
 470  0155 cd0000        	call	_I2C_CheckEvent
 472  0158 85            	popw	x
 473  0159 4d            	tnz	a
 474  015a 27f2          	jreq	L371
 475                     ; 134         I2C1->CR2 |= I2C_CR2_ACK;
 477  015c 72145211      	bset	21009,#2
 479  0160 204a          	jra	L102
 480  0162               L502:
 481                     ; 142                 I2C1->CR2 |= I2C_CR2_ACK;
 483  0162 72145211      	bset	21009,#2
 485  0166               L512:
 486                     ; 143                 while (!(I2C1->SR1 & I2C_SR1_RXNE));
 488  0166 c65217        	ld	a,21015
 489  0169 a540          	bcp	a,#64
 490  016b 27f9          	jreq	L512
 491                     ; 144                 *(dataToRead++) = I2C1->DR;
 493  016d 1e0d          	ldw	x,(OFST+8,sp)
 494  016f 1c0001        	addw	x,#1
 495  0172 1f0d          	ldw	(OFST+8,sp),x
 496  0174 1d0001        	subw	x,#1
 497  0177 c65216        	ld	a,21014
 498  017a f7            	ld	(x),a
 499  017b               L702:
 500                     ; 140             while (numReadBytes-- > 1)
 502  017b 9c            	rvf
 503  017c 1e04          	ldw	x,(OFST-1,sp)
 504  017e 1d0001        	subw	x,#1
 505  0181 1f04          	ldw	(OFST-1,sp),x
 506  0183 1c0001        	addw	x,#1
 508  0186 a30002        	cpw	x,#2
 509  0189 2ed7          	jrsge	L502
 510                     ; 147             I2C1->CR2 &=~ I2C_CR2_ACK;
 512  018b 72155211      	bres	21009,#2
 513                     ; 148             I2C_GenerateSTOP(I2C1, ENABLE);
 515  018f 4b01          	push	#1
 516  0191 ae5210        	ldw	x,#21008
 517  0194 cd0000        	call	_I2C_GenerateSTOP
 519  0197 84            	pop	a
 521  0198               L322:
 522                     ; 149                     while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 524  0198 ae0110        	ldw	x,#272
 525  019b 89            	pushw	x
 526  019c ae5210        	ldw	x,#21008
 527  019f cd0000        	call	_I2C_GetFlagStatus
 529  01a2 85            	popw	x
 530  01a3 4d            	tnz	a
 531  01a4 26f2          	jrne	L322
 532                     ; 151             *(dataToRead) = I2C1->DR;
 534  01a6 1e0d          	ldw	x,(OFST+8,sp)
 535  01a8 c65216        	ld	a,21014
 536  01ab f7            	ld	(x),a
 537  01ac               L102:
 538                     ; 138         while (numReadBytes)
 540  01ac 1e04          	ldw	x,(OFST-1,sp)
 541  01ae 26cb          	jrne	L702
 542  01b0               L351:
 543                     ; 205     return (0);
 545  01b0 4f            	clr	a
 548  01b1 5b07          	addw	sp,#7
 549  01b3 81            	ret
 602                     ; 210 void mcu_msWait(unsigned long msWait)
 602                     ; 211 {
 603                     	switch	.text
 604  01b4               _mcu_msWait:
 606  01b4 5208          	subw	sp,#8
 607       00000008      OFST:	set	8
 610                     ; 215     delay_ms(msWait);
 613  01b6 1e0d          	ldw	x,(OFST+5,sp)
 614  01b8 1f03          	ldw	(OFST-5,sp),x
 615  01ba 1e0b          	ldw	x,(OFST+3,sp)
 616  01bc 1f01          	ldw	(OFST-7,sp),x
 618                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 620  01be ae0000        	ldw	x,#0
 621  01c1 1f07          	ldw	(OFST-1,sp),x
 622  01c3 ae0000        	ldw	x,#0
 623  01c6 1f05          	ldw	(OFST-3,sp),x
 626  01c8 2009          	jra	L362
 627  01ca               L752:
 630  01ca 96            	ldw	x,sp
 631  01cb 1c0005        	addw	x,#OFST-3
 632  01ce a601          	ld	a,#1
 633  01d0 cd0000        	call	c_lgadc
 636  01d3               L362:
 639  01d3 96            	ldw	x,sp
 640  01d4 1c0001        	addw	x,#OFST-7
 641  01d7 cd0000        	call	c_ltor
 643  01da a66f          	ld	a,#111
 644  01dc cd0000        	call	c_smul
 646  01df 96            	ldw	x,sp
 647  01e0 1c0005        	addw	x,#OFST-3
 648  01e3 cd0000        	call	c_lcmp
 650  01e6 22e2          	jrugt	L752
 651                     ; 216 }
 654  01e8 5b08          	addw	sp,#8
 655  01ea 81            	ret
 679                     	xdef	_SensorAddr
 680                     	xdef	_mcu_msWait
 681                     	xdef	_mcu_i2cTransfer
 682                     	xdef	_mcu_i2cInit
 683                     	xref	_I2C_GetFlagStatus
 684                     	xref	_I2C_CheckEvent
 685                     	xref	_I2C_SendData
 686                     	xref	_I2C_Send7bitAddress
 687                     	xref	_I2C_GenerateSTOP
 688                     	xref	_I2C_GenerateSTART
 689                     	xref	_I2C_Cmd
 690                     	xref	_I2C_Init
 691                     	xref	_I2C_DeInit
 692                     	xref	_GPIO_Init
 693                     	xref	_CLK_PeripheralClockConfig
 712                     	xref	c_lcmp
 713                     	xref	c_smul
 714                     	xref	c_ltor
 715                     	xref	c_lgadc
 716                     	end
