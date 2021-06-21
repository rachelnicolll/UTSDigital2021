   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _SensorAddr:
  15  0000 80            	dc.b	128
  61                     ; 18 void mcu_i2cInit(uint8_t busId)
  61                     ; 19 {
  63                     	switch	.text
  64  0000               _mcu_i2cInit:
  68                     ; 21     CLK->CKDIVR = 0x00;
  70  0000 725f50c0      	clr	20672
  71                     ; 23     CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  73  0004 ae0301        	ldw	x,#769
  74  0007 cd0000        	call	_CLK_PeripheralClockConfig
  76                     ; 25     I2C_DeInit(I2C1);
  78  000a ae5210        	ldw	x,#21008
  79  000d cd0000        	call	_I2C_DeInit
  81                     ; 28     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  83  0010 4b00          	push	#0
  84  0012 4b04          	push	#4
  85  0014 4b00          	push	#0
  86  0016 4b00          	push	#0
  87  0018 ae00fe        	ldw	x,#254
  88  001b 89            	pushw	x
  89  001c aec350        	ldw	x,#50000
  90  001f 89            	pushw	x
  91  0020 ae0000        	ldw	x,#0
  92  0023 89            	pushw	x
  93  0024 ae5210        	ldw	x,#21008
  94  0027 cd0000        	call	_I2C_Init
  96  002a 5b0a          	addw	sp,#10
  97                     ; 31     I2C_Cmd(I2C1, ENABLE);
  99  002c 4b01          	push	#1
 100  002e ae5210        	ldw	x,#21008
 101  0031 cd0000        	call	_I2C_Cmd
 103  0034 84            	pop	a
 104                     ; 34     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);
 106  0035 4bb0          	push	#176
 107  0037 4b01          	push	#1
 108  0039 ae500a        	ldw	x,#20490
 109  003c cd0000        	call	_GPIO_Init
 111  003f 85            	popw	x
 112                     ; 35     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 114  0040 4bb0          	push	#176
 115  0042 4b02          	push	#2
 116  0044 ae500a        	ldw	x,#20490
 117  0047 cd0000        	call	_GPIO_Init
 119  004a 85            	popw	x
 120                     ; 37     I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY);
 122  004b ae0302        	ldw	x,#770
 123  004e 89            	pushw	x
 124  004f ae5210        	ldw	x,#21008
 125  0052 cd0000        	call	_I2C_GetFlagStatus
 127  0055 85            	popw	x
 128                     ; 40 }
 131  0056 81            	ret
 247                     ; 42 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 247                     ; 43                        uint8_t *dataToWrite, uint8_t writeLength,
 247                     ; 44                        uint8_t *dataToRead, uint8_t readLength)
 247                     ; 45 {
 248                     	switch	.text
 249  0057               _mcu_i2cTransfer:
 251  0057 89            	pushw	x
 252  0058 5205          	subw	sp,#5
 253       00000005      OFST:	set	5
 256                     ; 54     uint8_t slaveDevAddr = i2cAddr << 1;
 258  005a 9f            	ld	a,xl
 259  005b 48            	sll	a
 260  005c 6b01          	ld	(OFST-4,sp),a
 262                     ; 58     numWriteBytes = (int)writeLength;
 264  005e 7b0c          	ld	a,(OFST+7,sp)
 265  0060 5f            	clrw	x
 266  0061 97            	ld	xl,a
 267  0062 1f02          	ldw	(OFST-3,sp),x
 269                     ; 59     numReadBytes = (int)readLength;
 271  0064 7b0f          	ld	a,(OFST+10,sp)
 272  0066 5f            	clrw	x
 273  0067 97            	ld	xl,a
 274  0068 1f04          	ldw	(OFST-1,sp),x
 276                     ; 66     if ((dataToWrite != NULL) && (writeLength != 0))
 278  006a 1e0a          	ldw	x,(OFST+5,sp)
 279  006c 2603          	jrne	L01
 280  006e cc00f9        	jp	L501
 281  0071               L01:
 283  0071 0d0c          	tnz	(OFST+7,sp)
 284  0073 27f9          	jreq	L501
 286  0075               L111:
 287                     ; 69         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 289  0075 ae0302        	ldw	x,#770
 290  0078 89            	pushw	x
 291  0079 ae5210        	ldw	x,#21008
 292  007c cd0000        	call	_I2C_GetFlagStatus
 294  007f 85            	popw	x
 295  0080 4d            	tnz	a
 296  0081 26f2          	jrne	L111
 297                     ; 72         I2C_GenerateSTART(I2C1, ENABLE);
 299  0083 4b01          	push	#1
 300  0085 ae5210        	ldw	x,#21008
 301  0088 cd0000        	call	_I2C_GenerateSTART
 303  008b 84            	pop	a
 305  008c               L711:
 306                     ; 75         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 308  008c ae0301        	ldw	x,#769
 309  008f 89            	pushw	x
 310  0090 ae5210        	ldw	x,#21008
 311  0093 cd0000        	call	_I2C_CheckEvent
 313  0096 85            	popw	x
 314  0097 4d            	tnz	a
 315  0098 27f2          	jreq	L711
 316                     ; 81         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
 318  009a 4b00          	push	#0
 319  009c 7b02          	ld	a,(OFST-3,sp)
 320  009e 88            	push	a
 321  009f ae5210        	ldw	x,#21008
 322  00a2 cd0000        	call	_I2C_Send7bitAddress
 324  00a5 85            	popw	x
 326  00a6               L521:
 327                     ; 84         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 329  00a6 ae0782        	ldw	x,#1922
 330  00a9 89            	pushw	x
 331  00aa ae5210        	ldw	x,#21008
 332  00ad cd0000        	call	_I2C_CheckEvent
 334  00b0 85            	popw	x
 335  00b1 4d            	tnz	a
 336  00b2 27f2          	jreq	L521
 338  00b4 2028          	jra	L331
 339  00b6               L131:
 340                     ; 91             I2C_SendData(I2C1, *dataToWrite);
 342  00b6 1e0a          	ldw	x,(OFST+5,sp)
 343  00b8 f6            	ld	a,(x)
 344  00b9 88            	push	a
 345  00ba ae5210        	ldw	x,#21008
 346  00bd cd0000        	call	_I2C_SendData
 348  00c0 84            	pop	a
 350  00c1               L141:
 351                     ; 94             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
 353  00c1 ae0784        	ldw	x,#1924
 354  00c4 89            	pushw	x
 355  00c5 ae5210        	ldw	x,#21008
 356  00c8 cd0000        	call	_I2C_CheckEvent
 358  00cb 85            	popw	x
 359  00cc a101          	cp	a,#1
 360  00ce 26f1          	jrne	L141
 361                     ; 97             numWriteBytes--;
 363  00d0 1e02          	ldw	x,(OFST-3,sp)
 364  00d2 1d0001        	subw	x,#1
 365  00d5 1f02          	ldw	(OFST-3,sp),x
 367                     ; 98             dataToWrite++;
 369  00d7 1e0a          	ldw	x,(OFST+5,sp)
 370  00d9 1c0001        	addw	x,#1
 371  00dc 1f0a          	ldw	(OFST+5,sp),x
 372  00de               L331:
 373                     ; 88         while (numWriteBytes)
 375  00de 1e02          	ldw	x,(OFST-3,sp)
 376  00e0 26d4          	jrne	L131
 377                     ; 102         I2C_GenerateSTOP(I2C1, ENABLE);
 379  00e2 4b01          	push	#1
 380  00e4 ae5210        	ldw	x,#21008
 381  00e7 cd0000        	call	_I2C_GenerateSTOP
 383  00ea 84            	pop	a
 385  00eb               L741:
 386                     ; 103 				        while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 388  00eb ae0110        	ldw	x,#272
 389  00ee 89            	pushw	x
 390  00ef ae5210        	ldw	x,#21008
 391  00f2 cd0000        	call	_I2C_GetFlagStatus
 393  00f5 85            	popw	x
 394  00f6 4d            	tnz	a
 395  00f7 26f2          	jrne	L741
 396  00f9               L501:
 397                     ; 107     if ((dataToRead != NULL) && (readLength != 0))
 399  00f9 1e0d          	ldw	x,(OFST+8,sp)
 400  00fb 2603          	jrne	L21
 401  00fd cc01ac        	jp	L351
 402  0100               L21:
 404  0100 0d0f          	tnz	(OFST+10,sp)
 405  0102 2603          	jrne	L41
 406  0104 cc01ac        	jp	L351
 407  0107               L41:
 409  0107               L751:
 410                     ; 111         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 412  0107 ae0302        	ldw	x,#770
 413  010a 89            	pushw	x
 414  010b ae5210        	ldw	x,#21008
 415  010e cd0000        	call	_I2C_GetFlagStatus
 417  0111 85            	popw	x
 418  0112 4d            	tnz	a
 419  0113 26f2          	jrne	L751
 420                     ; 115         I2C_GenerateSTART(I2C1, ENABLE);
 422  0115 4b01          	push	#1
 423  0117 ae5210        	ldw	x,#21008
 424  011a cd0000        	call	_I2C_GenerateSTART
 426  011d 84            	pop	a
 428  011e               L561:
 429                     ; 118         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 431  011e ae0301        	ldw	x,#769
 432  0121 89            	pushw	x
 433  0122 ae5210        	ldw	x,#21008
 434  0125 cd0000        	call	_I2C_CheckEvent
 436  0128 85            	popw	x
 437  0129 4d            	tnz	a
 438  012a 27f2          	jreq	L561
 439                     ; 122         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);
 441  012c 4b01          	push	#1
 442  012e 7b02          	ld	a,(OFST-3,sp)
 443  0130 88            	push	a
 444  0131 ae5210        	ldw	x,#21008
 445  0134 cd0000        	call	_I2C_Send7bitAddress
 447  0137 85            	popw	x
 449  0138               L371:
 450                     ; 125         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 452  0138 ae0302        	ldw	x,#770
 453  013b 89            	pushw	x
 454  013c ae5210        	ldw	x,#21008
 455  013f cd0000        	call	_I2C_CheckEvent
 457  0142 85            	popw	x
 458  0143 4d            	tnz	a
 459  0144 27f2          	jreq	L371
 461  0146 2040          	jra	L102
 462  0148               L702:
 463                     ; 132             while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED | I2C_FLAG_BTF))
 465  0148 ae0344        	ldw	x,#836
 466  014b 89            	pushw	x
 467  014c ae5210        	ldw	x,#21008
 468  014f cd0000        	call	_I2C_CheckEvent
 470  0152 85            	popw	x
 471  0153 4d            	tnz	a
 472  0154 27f2          	jreq	L702
 473                     ; 134 						if (numReadBytes == 1)
 475  0156 1e04          	ldw	x,(OFST-1,sp)
 476  0158 a30001        	cpw	x,#1
 477  015b 260b          	jrne	L312
 478                     ; 135 							I2C_AcknowledgeConfig(I2C1, DISABLE);
 480  015d 4b00          	push	#0
 481  015f ae5210        	ldw	x,#21008
 482  0162 cd0000        	call	_I2C_AcknowledgeConfig
 484  0165 84            	pop	a
 486  0166 2009          	jra	L512
 487  0168               L312:
 488                     ; 137             I2C_AcknowledgeConfig(I2C1, ENABLE);
 490  0168 4b01          	push	#1
 491  016a ae5210        	ldw	x,#21008
 492  016d cd0000        	call	_I2C_AcknowledgeConfig
 494  0170 84            	pop	a
 495  0171               L512:
 496                     ; 139             *dataToRead = I2C_ReceiveData(I2C1);
 498  0171 ae5210        	ldw	x,#21008
 499  0174 cd0000        	call	_I2C_ReceiveData
 501  0177 1e0d          	ldw	x,(OFST+8,sp)
 502  0179 f7            	ld	(x),a
 503                     ; 140             numReadBytes--;
 505  017a 1e04          	ldw	x,(OFST-1,sp)
 506  017c 1d0001        	subw	x,#1
 507  017f 1f04          	ldw	(OFST-1,sp),x
 509                     ; 141             dataToRead++;
 511  0181 1e0d          	ldw	x,(OFST+8,sp)
 512  0183 1c0001        	addw	x,#1
 513  0186 1f0d          	ldw	(OFST+8,sp),x
 514  0188               L102:
 515                     ; 128         while (numReadBytes)
 517  0188 1e04          	ldw	x,(OFST-1,sp)
 518  018a 26bc          	jrne	L702
 519                     ; 144 				I2C_AcknowledgeConfig(I2C1, DISABLE);
 521  018c 4b00          	push	#0
 522  018e ae5210        	ldw	x,#21008
 523  0191 cd0000        	call	_I2C_AcknowledgeConfig
 525  0194 84            	pop	a
 526                     ; 145         I2C_GenerateSTOP(I2C1, ENABLE);
 528  0195 4b01          	push	#1
 529  0197 ae5210        	ldw	x,#21008
 530  019a cd0000        	call	_I2C_GenerateSTOP
 532  019d 84            	pop	a
 534  019e               L122:
 535                     ; 146         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 537  019e ae0110        	ldw	x,#272
 538  01a1 89            	pushw	x
 539  01a2 ae5210        	ldw	x,#21008
 540  01a5 cd0000        	call	_I2C_GetFlagStatus
 542  01a8 85            	popw	x
 543  01a9 4d            	tnz	a
 544  01aa 26f2          	jrne	L122
 545  01ac               L351:
 546                     ; 156 return (0);
 548  01ac 4f            	clr	a
 551  01ad 5b07          	addw	sp,#7
 552  01af 81            	ret
 605                     ; 161 void mcu_msWait(unsigned long msWait)
 605                     ; 162 {
 606                     	switch	.text
 607  01b0               _mcu_msWait:
 609  01b0 5208          	subw	sp,#8
 610       00000008      OFST:	set	8
 613                     ; 166     delay_ms(msWait);
 616  01b2 1e0d          	ldw	x,(OFST+5,sp)
 617  01b4 1f03          	ldw	(OFST-5,sp),x
 618  01b6 1e0b          	ldw	x,(OFST+3,sp)
 619  01b8 1f01          	ldw	(OFST-7,sp),x
 621                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 623  01ba ae0000        	ldw	x,#0
 624  01bd 1f07          	ldw	(OFST-1,sp),x
 625  01bf ae0000        	ldw	x,#0
 626  01c2 1f05          	ldw	(OFST-3,sp),x
 629  01c4 2009          	jra	L162
 630  01c6               L552:
 633  01c6 96            	ldw	x,sp
 634  01c7 1c0005        	addw	x,#OFST-3
 635  01ca a601          	ld	a,#1
 636  01cc cd0000        	call	c_lgadc
 639  01cf               L162:
 642  01cf 96            	ldw	x,sp
 643  01d0 1c0001        	addw	x,#OFST-7
 644  01d3 cd0000        	call	c_ltor
 646  01d6 a66f          	ld	a,#111
 647  01d8 cd0000        	call	c_smul
 649  01db 96            	ldw	x,sp
 650  01dc 1c0005        	addw	x,#OFST-3
 651  01df cd0000        	call	c_lcmp
 653  01e2 22e2          	jrugt	L552
 654                     ; 167 }
 657  01e4 5b08          	addw	sp,#8
 658  01e6 81            	ret
 682                     	xdef	_SensorAddr
 683                     	xdef	_mcu_msWait
 684                     	xdef	_mcu_i2cTransfer
 685                     	xdef	_mcu_i2cInit
 686                     	xref	_I2C_GetFlagStatus
 687                     	xref	_I2C_CheckEvent
 688                     	xref	_I2C_ReceiveData
 689                     	xref	_I2C_SendData
 690                     	xref	_I2C_Send7bitAddress
 691                     	xref	_I2C_AcknowledgeConfig
 692                     	xref	_I2C_GenerateSTOP
 693                     	xref	_I2C_GenerateSTART
 694                     	xref	_I2C_Cmd
 695                     	xref	_I2C_Init
 696                     	xref	_I2C_DeInit
 697                     	xref	_GPIO_Init
 698                     	xref	_CLK_PeripheralClockConfig
 717                     	xref	c_lcmp
 718                     	xref	c_smul
 719                     	xref	c_ltor
 720                     	xref	c_lgadc
 721                     	end
