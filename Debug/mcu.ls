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
  67                     ; 21     CLK->CKDIVR = 0x00;
  69  0000 725f50c0      	clr	20672
  70                     ; 23     CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  72  0004 ae0301        	ldw	x,#769
  73  0007 cd0000        	call	_CLK_PeripheralClockConfig
  75                     ; 25     I2C_DeInit(I2C1);
  77  000a ae5210        	ldw	x,#21008
  78  000d cd0000        	call	_I2C_DeInit
  80                     ; 28     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  82  0010 4b00          	push	#0
  83  0012 4b04          	push	#4
  84  0014 4b00          	push	#0
  85  0016 4b00          	push	#0
  86  0018 ae00fe        	ldw	x,#254
  87  001b 89            	pushw	x
  88  001c ae86a0        	ldw	x,#34464
  89  001f 89            	pushw	x
  90  0020 ae0001        	ldw	x,#1
  91  0023 89            	pushw	x
  92  0024 ae5210        	ldw	x,#21008
  93  0027 cd0000        	call	_I2C_Init
  95  002a 5b0a          	addw	sp,#10
  96                     ; 31     I2C_Cmd(I2C1, ENABLE);
  98  002c 4b01          	push	#1
  99  002e ae5210        	ldw	x,#21008
 100  0031 cd0000        	call	_I2C_Cmd
 102  0034 84            	pop	a
 103                     ; 34     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);
 105  0035 4bb0          	push	#176
 106  0037 4b01          	push	#1
 107  0039 ae500a        	ldw	x,#20490
 108  003c cd0000        	call	_GPIO_Init
 110  003f 85            	popw	x
 111                     ; 35     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 113  0040 4bb0          	push	#176
 114  0042 4b02          	push	#2
 115  0044 ae500a        	ldw	x,#20490
 116  0047 cd0000        	call	_GPIO_Init
 118  004a 85            	popw	x
 119                     ; 40 }
 122  004b 81            	ret
 240                     ; 42 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 240                     ; 43                        uint8_t *dataToWrite, uint8_t writeLength,
 240                     ; 44                        uint8_t *dataToRead, uint8_t readLength)
 240                     ; 45 {
 241                     	switch	.text
 242  004c               _mcu_i2cTransfer:
 244  004c 89            	pushw	x
 245  004d 5205          	subw	sp,#5
 246       00000005      OFST:	set	5
 249                     ; 54     uint8_t slaveDevAddr = i2cAddr << 1;
 251  004f 9f            	ld	a,xl
 252  0050 48            	sll	a
 253  0051 6b01          	ld	(OFST-4,sp),a
 255                     ; 58     numWriteBytes = (int)writeLength;
 257  0053 7b0c          	ld	a,(OFST+7,sp)
 258  0055 5f            	clrw	x
 259  0056 97            	ld	xl,a
 260  0057 1f02          	ldw	(OFST-3,sp),x
 262                     ; 59     numReadBytes = (int)readLength;
 264  0059 7b0f          	ld	a,(OFST+10,sp)
 265  005b 5f            	clrw	x
 266  005c 97            	ld	xl,a
 267  005d 1f04          	ldw	(OFST-1,sp),x
 269                     ; 66     if ((dataToWrite != NULL) && (writeLength != 0))
 271  005f 1e0a          	ldw	x,(OFST+5,sp)
 272  0061 2603          	jrne	L01
 273  0063 cc00f9        	jp	L501
 274  0066               L01:
 276  0066 0d0c          	tnz	(OFST+7,sp)
 277  0068 2603          	jrne	L21
 278  006a cc00f9        	jp	L501
 279  006d               L21:
 280                     ; 69             I2C1->CR2 |= I2C_CR2_ACK;
 282  006d 72145211      	bset	21009,#2
 283                     ; 71             I2C1->CR2 &= ~I2C_CR2_POS;
 285  0071 72175211      	bres	21009,#3
 287  0075               L111:
 288                     ; 74         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 290  0075 ae0302        	ldw	x,#770
 291  0078 89            	pushw	x
 292  0079 ae5210        	ldw	x,#21008
 293  007c cd0000        	call	_I2C_GetFlagStatus
 295  007f 85            	popw	x
 296  0080 4d            	tnz	a
 297  0081 26f2          	jrne	L111
 298                     ; 77         I2C_GenerateSTART(I2C1, ENABLE);
 300  0083 4b01          	push	#1
 301  0085 ae5210        	ldw	x,#21008
 302  0088 cd0000        	call	_I2C_GenerateSTART
 304  008b 84            	pop	a
 306  008c               L711:
 307                     ; 80         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 309  008c ae0301        	ldw	x,#769
 310  008f 89            	pushw	x
 311  0090 ae5210        	ldw	x,#21008
 312  0093 cd0000        	call	_I2C_CheckEvent
 314  0096 85            	popw	x
 315  0097 4d            	tnz	a
 316  0098 27f2          	jreq	L711
 317                     ; 86         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
 319  009a 4b00          	push	#0
 320  009c 7b02          	ld	a,(OFST-3,sp)
 321  009e 88            	push	a
 322  009f ae5210        	ldw	x,#21008
 323  00a2 cd0000        	call	_I2C_Send7bitAddress
 325  00a5 85            	popw	x
 327  00a6               L521:
 328                     ; 89         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 330  00a6 ae0782        	ldw	x,#1922
 331  00a9 89            	pushw	x
 332  00aa ae5210        	ldw	x,#21008
 333  00ad cd0000        	call	_I2C_CheckEvent
 335  00b0 85            	popw	x
 336  00b1 4d            	tnz	a
 337  00b2 27f2          	jreq	L521
 339  00b4 2028          	jra	L331
 340  00b6               L131:
 341                     ; 96             I2C_SendData(I2C1, *dataToWrite);
 343  00b6 1e0a          	ldw	x,(OFST+5,sp)
 344  00b8 f6            	ld	a,(x)
 345  00b9 88            	push	a
 346  00ba ae5210        	ldw	x,#21008
 347  00bd cd0000        	call	_I2C_SendData
 349  00c0 84            	pop	a
 351  00c1               L141:
 352                     ; 99             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
 354  00c1 ae0784        	ldw	x,#1924
 355  00c4 89            	pushw	x
 356  00c5 ae5210        	ldw	x,#21008
 357  00c8 cd0000        	call	_I2C_CheckEvent
 359  00cb 85            	popw	x
 360  00cc a101          	cp	a,#1
 361  00ce 26f1          	jrne	L141
 362                     ; 102             numWriteBytes--;
 364  00d0 1e02          	ldw	x,(OFST-3,sp)
 365  00d2 1d0001        	subw	x,#1
 366  00d5 1f02          	ldw	(OFST-3,sp),x
 368                     ; 103             dataToWrite++;
 370  00d7 1e0a          	ldw	x,(OFST+5,sp)
 371  00d9 1c0001        	addw	x,#1
 372  00dc 1f0a          	ldw	(OFST+5,sp),x
 373  00de               L331:
 374                     ; 93         while (numWriteBytes)
 376  00de 1e02          	ldw	x,(OFST-3,sp)
 377  00e0 26d4          	jrne	L131
 378                     ; 107         I2C_GenerateSTOP(I2C1, ENABLE);
 380  00e2 4b01          	push	#1
 381  00e4 ae5210        	ldw	x,#21008
 382  00e7 cd0000        	call	_I2C_GenerateSTOP
 384  00ea 84            	pop	a
 386  00eb               L741:
 387                     ; 108         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 389  00eb ae0110        	ldw	x,#272
 390  00ee 89            	pushw	x
 391  00ef ae5210        	ldw	x,#21008
 392  00f2 cd0000        	call	_I2C_GetFlagStatus
 394  00f5 85            	popw	x
 395  00f6 4d            	tnz	a
 396  00f7 26f2          	jrne	L741
 397  00f9               L501:
 398                     ; 112     if ((dataToRead != NULL) && (readLength != 0))
 400  00f9 1e0d          	ldw	x,(OFST+8,sp)
 401  00fb 2603          	jrne	L41
 402  00fd cc019b        	jp	L351
 403  0100               L41:
 405  0100 0d0f          	tnz	(OFST+10,sp)
 406  0102 2603          	jrne	L61
 407  0104 cc019b        	jp	L351
 408  0107               L61:
 410  0107               L751:
 411                     ; 116         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 413  0107 ae0302        	ldw	x,#770
 414  010a 89            	pushw	x
 415  010b ae5210        	ldw	x,#21008
 416  010e cd0000        	call	_I2C_GetFlagStatus
 418  0111 85            	popw	x
 419  0112 4d            	tnz	a
 420  0113 26f2          	jrne	L751
 421                     ; 120         I2C_GenerateSTART(I2C1, ENABLE);
 423  0115 4b01          	push	#1
 424  0117 ae5210        	ldw	x,#21008
 425  011a cd0000        	call	_I2C_GenerateSTART
 427  011d 84            	pop	a
 429  011e               L561:
 430                     ; 123         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 432  011e ae0301        	ldw	x,#769
 433  0121 89            	pushw	x
 434  0122 ae5210        	ldw	x,#21008
 435  0125 cd0000        	call	_I2C_CheckEvent
 437  0128 85            	popw	x
 438  0129 4d            	tnz	a
 439  012a 27f2          	jreq	L561
 440                     ; 127         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);
 442  012c 4b01          	push	#1
 443  012e 7b02          	ld	a,(OFST-3,sp)
 444  0130 88            	push	a
 445  0131 ae5210        	ldw	x,#21008
 446  0134 cd0000        	call	_I2C_Send7bitAddress
 448  0137 85            	popw	x
 450  0138               L371:
 451                     ; 130         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 453  0138 ae0302        	ldw	x,#770
 454  013b 89            	pushw	x
 455  013c ae5210        	ldw	x,#21008
 456  013f cd0000        	call	_I2C_CheckEvent
 458  0142 85            	popw	x
 459  0143 4d            	tnz	a
 460  0144 27f2          	jreq	L371
 462  0146 204f          	jra	L102
 463  0148               L702:
 464                     ; 134             while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED | I2C_FLAG_BTF))
 466  0148 ae0344        	ldw	x,#836
 467  014b 89            	pushw	x
 468  014c ae5210        	ldw	x,#21008
 469  014f cd0000        	call	_I2C_CheckEvent
 471  0152 85            	popw	x
 472  0153 4d            	tnz	a
 473  0154 27f2          	jreq	L702
 474                     ; 136             I2C1->CR2 |= I2C_CR2_POS;  // Set POS bit (NACK at next received byte)
 476  0156 72165211      	bset	21009,#3
 477                     ; 137             disableInterrupts();       // Errata workaround (Disable interrupt)
 480  015a 9b            sim
 482                     ; 138             I2C1->SR3;                 // Clear ADDR Flag
 485  015b c65219        	ld	a,21017
 486                     ; 139             I2C1->CR2 &= ~I2C_CR2_ACK; // Clear ACK
 488  015e 72155211      	bres	21009,#2
 489                     ; 140             enableInterrupts();        // Errata workaround (Enable interrupt)
 492  0162 9a            rim
 496  0163               L512:
 497                     ; 141             while (!(I2C1->SR1 & I2C_SR1_BTF))
 499  0163 c65217        	ld	a,21015
 500  0166 a504          	bcp	a,#4
 501  0168 27f9          	jreq	L512
 502                     ; 143             disableInterrupts();            // Errata workaround (Disable interrupt)
 505  016a 9b            sim
 507                     ; 144             I2C_GenerateSTOP(I2C1, ENABLE); // Generate stop here (STOP=1)
 510  016b 4b01          	push	#1
 511  016d ae5210        	ldw	x,#21008
 512  0170 cd0000        	call	_I2C_GenerateSTOP
 514  0173 84            	pop	a
 515                     ; 145             *(dataToRead++) = I2C1->DR;
 517  0174 1e0d          	ldw	x,(OFST+8,sp)
 518  0176 1c0001        	addw	x,#1
 519  0179 1f0d          	ldw	(OFST+8,sp),x
 520  017b 1d0001        	subw	x,#1
 521  017e c65216        	ld	a,21014
 522  0181 f7            	ld	(x),a
 523                     ; 147             numReadBytes--;
 525  0182 1e04          	ldw	x,(OFST-1,sp)
 526  0184 1d0001        	subw	x,#1
 527  0187 1f04          	ldw	(OFST-1,sp),x
 529                     ; 148             enableInterrupts();       // Errata workaround (Enable interrupt)
 532  0189 9a            rim
 534                     ; 149             *(dataToRead) = I2C1->DR; // Read 2nd Data byte
 537  018a 1e0d          	ldw	x,(OFST+8,sp)
 538  018c c65216        	ld	a,21014
 539  018f f7            	ld	(x),a
 540                     ; 150             numReadBytes--;
 542  0190 1e04          	ldw	x,(OFST-1,sp)
 543  0192 1d0001        	subw	x,#1
 544  0195 1f04          	ldw	(OFST-1,sp),x
 546  0197               L102:
 547                     ; 132         while (numReadBytes)
 549  0197 1e04          	ldw	x,(OFST-1,sp)
 550  0199 26ad          	jrne	L702
 551  019b               L351:
 552                     ; 179     return (0);
 554  019b 4f            	clr	a
 557  019c 5b07          	addw	sp,#7
 558  019e 81            	ret
 611                     ; 184 void mcu_msWait(unsigned long msWait)
 611                     ; 185 {
 612                     	switch	.text
 613  019f               _mcu_msWait:
 615  019f 5208          	subw	sp,#8
 616       00000008      OFST:	set	8
 619                     ; 189     delay_ms(msWait);
 622  01a1 1e0d          	ldw	x,(OFST+5,sp)
 623  01a3 1f03          	ldw	(OFST-5,sp),x
 624  01a5 1e0b          	ldw	x,(OFST+3,sp)
 625  01a7 1f01          	ldw	(OFST-7,sp),x
 627                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 629  01a9 ae0000        	ldw	x,#0
 630  01ac 1f07          	ldw	(OFST-1,sp),x
 631  01ae ae0000        	ldw	x,#0
 632  01b1 1f05          	ldw	(OFST-3,sp),x
 635  01b3 2009          	jra	L552
 636  01b5               L152:
 639  01b5 96            	ldw	x,sp
 640  01b6 1c0005        	addw	x,#OFST-3
 641  01b9 a601          	ld	a,#1
 642  01bb cd0000        	call	c_lgadc
 645  01be               L552:
 648  01be 96            	ldw	x,sp
 649  01bf 1c0001        	addw	x,#OFST-7
 650  01c2 cd0000        	call	c_ltor
 652  01c5 a66f          	ld	a,#111
 653  01c7 cd0000        	call	c_smul
 655  01ca 96            	ldw	x,sp
 656  01cb 1c0005        	addw	x,#OFST-3
 657  01ce cd0000        	call	c_lcmp
 659  01d1 22e2          	jrugt	L152
 660                     ; 190 }
 663  01d3 5b08          	addw	sp,#8
 664  01d5 81            	ret
 688                     	xdef	_SensorAddr
 689                     	xdef	_mcu_msWait
 690                     	xdef	_mcu_i2cTransfer
 691                     	xdef	_mcu_i2cInit
 692                     	xref	_I2C_GetFlagStatus
 693                     	xref	_I2C_CheckEvent
 694                     	xref	_I2C_SendData
 695                     	xref	_I2C_Send7bitAddress
 696                     	xref	_I2C_GenerateSTOP
 697                     	xref	_I2C_GenerateSTART
 698                     	xref	_I2C_Cmd
 699                     	xref	_I2C_Init
 700                     	xref	_I2C_DeInit
 701                     	xref	_GPIO_Init
 702                     	xref	_CLK_PeripheralClockConfig
 721                     	xref	c_lcmp
 722                     	xref	c_smul
 723                     	xref	c_ltor
 724                     	xref	c_lgadc
 725                     	end
