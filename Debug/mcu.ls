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
  87  001c ae86a0        	ldw	x,#34464
  88  001f 89            	pushw	x
  89  0020 ae0001        	ldw	x,#1
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
 272                     .const:	section	.text
 273  0000               L01:
 274  0000 0000006f      	dc.l	111
 275                     ; 43 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 275                     ; 44                        uint8_t *dataToWrite, uint8_t writeLength,
 275                     ; 45                        uint8_t *dataToRead, uint8_t readLength)
 275                     ; 46 {
 276                     	switch	.text
 277  0062               _mcu_i2cTransfer:
 279  0062 89            	pushw	x
 280  0063 5209          	subw	sp,#9
 281       00000009      OFST:	set	9
 284                     ; 55     uint8_t slaveDevAddr = i2cAddr << 1;
 286  0065 9f            	ld	a,xl
 287  0066 48            	sll	a
 288  0067 6b05          	ld	(OFST-4,sp),a
 290                     ; 59     numWriteBytes = (int)writeLength;
 292  0069 7b10          	ld	a,(OFST+7,sp)
 293  006b 5f            	clrw	x
 294  006c 97            	ld	xl,a
 295  006d 1f06          	ldw	(OFST-3,sp),x
 297                     ; 60     numReadBytes = (int)readLength;
 299  006f 7b13          	ld	a,(OFST+10,sp)
 300  0071 5f            	clrw	x
 301  0072 97            	ld	xl,a
 302  0073 1f08          	ldw	(OFST-1,sp),x
 304                     ; 67     if ((dataToWrite != NULL) && (writeLength != 0))
 306  0075 1e0e          	ldw	x,(OFST+5,sp)
 307  0077 2603          	jrne	L21
 308  0079 cc010f        	jp	L121
 309  007c               L21:
 311  007c 0d10          	tnz	(OFST+7,sp)
 312  007e 2603          	jrne	L41
 313  0080 cc010f        	jp	L121
 314  0083               L41:
 315                     ; 70         I2C1->CR2 |= I2C_CR2_ACK;
 317  0083 72145211      	bset	21009,#2
 318                     ; 72         I2C1->CR2 &= ~I2C_CR2_POS;
 320  0087 72175211      	bres	21009,#3
 322  008b               L521:
 323                     ; 75         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 325  008b ae0302        	ldw	x,#770
 326  008e 89            	pushw	x
 327  008f ae5210        	ldw	x,#21008
 328  0092 cd0000        	call	_I2C_GetFlagStatus
 330  0095 85            	popw	x
 331  0096 4d            	tnz	a
 332  0097 26f2          	jrne	L521
 333                     ; 78         I2C_GenerateSTART(I2C1, ENABLE);
 335  0099 4b01          	push	#1
 336  009b ae5210        	ldw	x,#21008
 337  009e cd0000        	call	_I2C_GenerateSTART
 339  00a1 84            	pop	a
 341  00a2               L331:
 342                     ; 81         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 344  00a2 ae0301        	ldw	x,#769
 345  00a5 89            	pushw	x
 346  00a6 ae5210        	ldw	x,#21008
 347  00a9 cd0000        	call	_I2C_CheckEvent
 349  00ac 85            	popw	x
 350  00ad 4d            	tnz	a
 351  00ae 27f2          	jreq	L331
 352                     ; 87         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
 354  00b0 4b00          	push	#0
 355  00b2 7b06          	ld	a,(OFST-3,sp)
 356  00b4 88            	push	a
 357  00b5 ae5210        	ldw	x,#21008
 358  00b8 cd0000        	call	_I2C_Send7bitAddress
 360  00bb 85            	popw	x
 362  00bc               L141:
 363                     ; 90         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 365  00bc ae0782        	ldw	x,#1922
 366  00bf 89            	pushw	x
 367  00c0 ae5210        	ldw	x,#21008
 368  00c3 cd0000        	call	_I2C_CheckEvent
 370  00c6 85            	popw	x
 371  00c7 4d            	tnz	a
 372  00c8 27f2          	jreq	L141
 374  00ca 2028          	jra	L741
 375  00cc               L541:
 376                     ; 97             I2C_SendData(I2C1, *dataToWrite);
 378  00cc 1e0e          	ldw	x,(OFST+5,sp)
 379  00ce f6            	ld	a,(x)
 380  00cf 88            	push	a
 381  00d0 ae5210        	ldw	x,#21008
 382  00d3 cd0000        	call	_I2C_SendData
 384  00d6 84            	pop	a
 386  00d7               L551:
 387                     ; 100             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
 389  00d7 ae0784        	ldw	x,#1924
 390  00da 89            	pushw	x
 391  00db ae5210        	ldw	x,#21008
 392  00de cd0000        	call	_I2C_CheckEvent
 394  00e1 85            	popw	x
 395  00e2 a101          	cp	a,#1
 396  00e4 26f1          	jrne	L551
 397                     ; 103             numWriteBytes--;
 399  00e6 1e06          	ldw	x,(OFST-3,sp)
 400  00e8 1d0001        	subw	x,#1
 401  00eb 1f06          	ldw	(OFST-3,sp),x
 403                     ; 104             dataToWrite++;
 405  00ed 1e0e          	ldw	x,(OFST+5,sp)
 406  00ef 1c0001        	addw	x,#1
 407  00f2 1f0e          	ldw	(OFST+5,sp),x
 408  00f4               L741:
 409                     ; 94         while (numWriteBytes)
 411  00f4 1e06          	ldw	x,(OFST-3,sp)
 412  00f6 26d4          	jrne	L541
 413                     ; 108         I2C_GenerateSTOP(I2C1, ENABLE);
 415  00f8 4b01          	push	#1
 416  00fa ae5210        	ldw	x,#21008
 417  00fd cd0000        	call	_I2C_GenerateSTOP
 419  0100 84            	pop	a
 421  0101               L361:
 422                     ; 109         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 424  0101 ae0110        	ldw	x,#272
 425  0104 89            	pushw	x
 426  0105 ae5210        	ldw	x,#21008
 427  0108 cd0000        	call	_I2C_GetFlagStatus
 429  010b 85            	popw	x
 430  010c 4d            	tnz	a
 431  010d 26f2          	jrne	L361
 432  010f               L121:
 433                     ; 113     if ((dataToRead != NULL) && (readLength != 0))
 435  010f 1e11          	ldw	x,(OFST+8,sp)
 436  0111 2603          	jrne	L61
 437  0113 cc0274        	jp	L761
 438  0116               L61:
 440  0116 0d13          	tnz	(OFST+10,sp)
 441  0118 2603          	jrne	L02
 442  011a cc0274        	jp	L761
 443  011d               L02:
 445  011d               L371:
 446                     ; 116         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 448  011d ae0302        	ldw	x,#770
 449  0120 89            	pushw	x
 450  0121 ae5210        	ldw	x,#21008
 451  0124 cd0000        	call	_I2C_GetFlagStatus
 453  0127 85            	popw	x
 454  0128 4d            	tnz	a
 455  0129 26f2          	jrne	L371
 456                     ; 118         I2C1->CR2 |= I2C_CR2_ACK;
 458  012b 72145211      	bset	21009,#2
 459                     ; 121         I2C_GenerateSTART(I2C1, ENABLE);
 461  012f 4b01          	push	#1
 462  0131 ae5210        	ldw	x,#21008
 463  0134 cd0000        	call	_I2C_GenerateSTART
 465  0137 84            	pop	a
 467  0138               L102:
 468                     ; 124         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 470  0138 ae0301        	ldw	x,#769
 471  013b 89            	pushw	x
 472  013c ae5210        	ldw	x,#21008
 473  013f cd0000        	call	_I2C_CheckEvent
 475  0142 85            	popw	x
 476  0143 4d            	tnz	a
 477  0144 27f2          	jreq	L102
 478                     ; 128         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);
 480  0146 4b01          	push	#1
 481  0148 7b06          	ld	a,(OFST-3,sp)
 482  014a 88            	push	a
 483  014b ae5210        	ldw	x,#21008
 484  014e cd0000        	call	_I2C_Send7bitAddress
 486  0151 85            	popw	x
 487                     ; 130 				I2C1->CR2 |= I2C_CR2_POS;
 489  0152 72165211      	bset	21009,#3
 491  0156               L702:
 492                     ; 132         while (!(I2C1->SR1 & I2C_SR1_ADDR))
 494  0156 c65217        	ld	a,21015
 495  0159 a502          	bcp	a,#2
 496  015b 27f9          	jreq	L702
 497                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 500  015d ae0000        	ldw	x,#0
 501  0160 1f03          	ldw	(OFST-6,sp),x
 502  0162 ae0000        	ldw	x,#0
 503  0165 1f01          	ldw	(OFST-8,sp),x
 505  0167               L312:
 506                     ; 14         _asm("nop");
 509  0167 9d            nop
 511                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 513  0168 96            	ldw	x,sp
 514  0169 1c0001        	addw	x,#OFST-8
 515  016c a601          	ld	a,#1
 516  016e cd0000        	call	c_lgadc
 521  0171 96            	ldw	x,sp
 522  0172 1c0001        	addw	x,#OFST-8
 523  0175 cd0000        	call	c_ltor
 525  0178 ae0000        	ldw	x,#L01
 526  017b cd0000        	call	c_lcmp
 528  017e 25e7          	jrult	L312
 529                     ; 142         if (numReadBytes > 2)
 531  0180 9c            	rvf
 532  0181 1e08          	ldw	x,(OFST-1,sp)
 533  0183 a30003        	cpw	x,#3
 534  0186 2f6b          	jrslt	L122
 535                     ; 144             I2C1->SR3;
 537  0188 c65219        	ld	a,21017
 539  018b 201c          	jra	L522
 540  018d               L332:
 541                     ; 147                 while (!(I2C1->SR1 & I2C_SR1_BTF))
 543  018d c65217        	ld	a,21015
 544  0190 a504          	bcp	a,#4
 545  0192 27f9          	jreq	L332
 546                     ; 149                 *(dataToRead++) = I2C1->DR; // Reading next data byte
 548  0194 1e11          	ldw	x,(OFST+8,sp)
 549  0196 1c0001        	addw	x,#1
 550  0199 1f11          	ldw	(OFST+8,sp),x
 551  019b 1d0001        	subw	x,#1
 552  019e c65216        	ld	a,21014
 553  01a1 f7            	ld	(x),a
 554                     ; 150                 --numReadBytes;             // Decrease Numbyte to reade by 1
 556  01a2 1e08          	ldw	x,(OFST-1,sp)
 557  01a4 1d0001        	subw	x,#1
 558  01a7 1f08          	ldw	(OFST-1,sp),x
 560  01a9               L522:
 561                     ; 145             while (numReadBytes > 3) // not last three bytes?
 563  01a9 9c            	rvf
 564  01aa 1e08          	ldw	x,(OFST-1,sp)
 565  01ac a30004        	cpw	x,#4
 566  01af 2edc          	jrsge	L332
 568  01b1               L142:
 569                     ; 153             while (!(I2C1->SR1 & I2C_SR1_BTF))
 571  01b1 c65217        	ld	a,21015
 572  01b4 a504          	bcp	a,#4
 573  01b6 27f9          	jreq	L142
 574                     ; 155             I2C1->CR2 &= ~I2C_CR2_ACK; // Clear ACK
 576  01b8 72155211      	bres	21009,#2
 577                     ; 157             *(dataToRead++) = I2C1->DR; // Read 1st byte
 579  01bc 1e11          	ldw	x,(OFST+8,sp)
 580  01be 1c0001        	addw	x,#1
 581  01c1 1f11          	ldw	(OFST+8,sp),x
 582  01c3 1d0001        	subw	x,#1
 583  01c6 c65216        	ld	a,21014
 584  01c9 f7            	ld	(x),a
 585                     ; 158             I2C1->CR2 |= I2C_CR2_STOP;  // Generate stop here (STOP=1)
 587  01ca 72125211      	bset	21009,#1
 588                     ; 159             *(dataToRead++) = I2C1->DR; // Read 2nd byte
 590  01ce 1e11          	ldw	x,(OFST+8,sp)
 591  01d0 1c0001        	addw	x,#1
 592  01d3 1f11          	ldw	(OFST+8,sp),x
 593  01d5 1d0001        	subw	x,#1
 594  01d8 c65216        	ld	a,21014
 595  01db f7            	ld	(x),a
 597  01dc               L152:
 598                     ; 161             while (!(I2C1->SR1 & I2C_SR1_RXNE))
 600  01dc c65217        	ld	a,21015
 601  01df a540          	bcp	a,#64
 602  01e1 27f9          	jreq	L152
 603                     ; 163             *(dataToRead++) = I2C1->DR; // Read 3rd Data byte
 605  01e3 1e11          	ldw	x,(OFST+8,sp)
 606  01e5 1c0001        	addw	x,#1
 607  01e8 1f11          	ldw	(OFST+8,sp),x
 608  01ea 1d0001        	subw	x,#1
 609  01ed c65216        	ld	a,21014
 610  01f0 f7            	ld	(x),a
 612  01f1 206f          	jra	L703
 613  01f3               L122:
 614                     ; 166         else if (numReadBytes == 2)
 616  01f3 1e08          	ldw	x,(OFST-1,sp)
 617  01f5 a30002        	cpw	x,#2
 618  01f8 2650          	jrne	L752
 619                     ; 170             I2C1->SR3;
 621  01fa c65219        	ld	a,21017
 622                     ; 172             I2C1->CR2 &= ~I2C_CR2_ACK;
 624  01fd 72155211      	bres	21009,#2
 626  0201               L362:
 627                     ; 173             while (!(I2C1->SR1 & (I2C_SR1_RXNE | I2C_SR1_BTF)))
 629  0201 c65217        	ld	a,21015
 630  0204 a544          	bcp	a,#68
 631  0206 27f9          	jreq	L362
 632                     ; 175             I2C_GenerateSTOP(I2C1, ENABLE);
 634  0208 4b01          	push	#1
 635  020a ae5210        	ldw	x,#21008
 636  020d cd0000        	call	_I2C_GenerateSTOP
 638  0210 84            	pop	a
 639                     ; 176             *(dataToRead++) = (uint8_t)I2C1->DR;
 641  0211 1e11          	ldw	x,(OFST+8,sp)
 642  0213 1c0001        	addw	x,#1
 643  0216 1f11          	ldw	(OFST+8,sp),x
 644  0218 1d0001        	subw	x,#1
 645  021b c65216        	ld	a,21014
 646  021e f7            	ld	(x),a
 647                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 650  021f ae0000        	ldw	x,#0
 651  0222 1f03          	ldw	(OFST-6,sp),x
 652  0224 ae0000        	ldw	x,#0
 653  0227 1f01          	ldw	(OFST-8,sp),x
 655  0229               L762:
 656                     ; 14         _asm("nop");
 659  0229 9d            nop
 661                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 663  022a 96            	ldw	x,sp
 664  022b 1c0001        	addw	x,#OFST-8
 665  022e a601          	ld	a,#1
 666  0230 cd0000        	call	c_lgadc
 671  0233 96            	ldw	x,sp
 672  0234 1c0001        	addw	x,#OFST-8
 673  0237 cd0000        	call	c_ltor
 675  023a ae0000        	ldw	x,#L01
 676  023d cd0000        	call	c_lcmp
 678  0240 25e7          	jrult	L762
 679                     ; 178             *(dataToRead) = (uint8_t)I2C1->DR;
 681  0242 1e11          	ldw	x,(OFST+8,sp)
 682  0244 c65216        	ld	a,21014
 683  0247 f7            	ld	(x),a
 685  0248 2018          	jra	L703
 686  024a               L752:
 687                     ; 184             I2C1->CR2 &= ~I2C_CR2_ACK;
 689  024a 72155211      	bres	21009,#2
 690                     ; 186             I2C1->SR3;                 // Clear ADDR Flag
 693  024e c65219        	ld	a,21017
 694                     ; 187             I2C1->CR2 |= I2C_CR2_STOP; // generate stop here (STOP=1)
 696  0251 72125211      	bset	21009,#1
 698  0255               L103:
 699                     ; 188             while (!(I2C1->SR1 & I2C_SR1_RXNE))
 701  0255 c65217        	ld	a,21015
 702  0258 a540          	bcp	a,#64
 703  025a 27f9          	jreq	L103
 704                     ; 190             *(dataToRead) = I2C1->DR; // Read Data byte
 706  025c 1e11          	ldw	x,(OFST+8,sp)
 707  025e c65216        	ld	a,21014
 708  0261 f7            	ld	(x),a
 709  0262               L703:
 710                     ; 193             while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 712  0262 ae0110        	ldw	x,#272
 713  0265 89            	pushw	x
 714  0266 ae5210        	ldw	x,#21008
 715  0269 cd0000        	call	_I2C_GetFlagStatus
 717  026c 85            	popw	x
 718  026d 4d            	tnz	a
 719  026e 26f2          	jrne	L703
 720                     ; 195             I2C1->CR2 &= ~I2C_CR2_POS;
 722  0270 72175211      	bres	21009,#3
 723  0274               L761:
 724                     ; 202     return (0);
 726  0274 4f            	clr	a
 729  0275 5b0b          	addw	sp,#11
 730  0277 81            	ret
 784                     ; 207 void mcu_msWait(unsigned long msWait)
 784                     ; 208 {
 785                     	switch	.text
 786  0278               _mcu_msWait:
 788  0278 5208          	subw	sp,#8
 789       00000008      OFST:	set	8
 792                     ; 212     delay_ms(msWait);
 795  027a 1e0d          	ldw	x,(OFST+5,sp)
 796  027c 1f03          	ldw	(OFST-5,sp),x
 797  027e 1e0b          	ldw	x,(OFST+3,sp)
 798  0280 1f01          	ldw	(OFST-7,sp),x
 800                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 802  0282 ae0000        	ldw	x,#0
 803  0285 1f07          	ldw	(OFST-1,sp),x
 804  0287 ae0000        	ldw	x,#0
 805  028a 1f05          	ldw	(OFST-3,sp),x
 808  028c 200a          	jra	L743
 809  028e               L343:
 810                     ; 14         _asm("nop");
 813  028e 9d            nop
 815                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 817  028f 96            	ldw	x,sp
 818  0290 1c0005        	addw	x,#OFST-3
 819  0293 a601          	ld	a,#1
 820  0295 cd0000        	call	c_lgadc
 823  0298               L743:
 826  0298 96            	ldw	x,sp
 827  0299 1c0001        	addw	x,#OFST-7
 828  029c cd0000        	call	c_ltor
 830  029f a66f          	ld	a,#111
 831  02a1 cd0000        	call	c_smul
 833  02a4 96            	ldw	x,sp
 834  02a5 1c0005        	addw	x,#OFST-3
 835  02a8 cd0000        	call	c_lcmp
 837  02ab 22e1          	jrugt	L343
 838                     ; 213 }
 841  02ad 5b08          	addw	sp,#8
 842  02af 81            	ret
 855                     	xdef	_mcu_msWait
 856                     	xdef	_mcu_i2cTransfer
 857                     	xdef	_mcu_i2cInit
 858                     	xref	_I2C_GetFlagStatus
 859                     	xref	_I2C_CheckEvent
 860                     	xref	_I2C_SendData
 861                     	xref	_I2C_Send7bitAddress
 862                     	xref	_I2C_GenerateSTOP
 863                     	xref	_I2C_GenerateSTART
 864                     	xref	_I2C_Cmd
 865                     	xref	_I2C_Init
 866                     	xref	_I2C_DeInit
 867                     	xref	_GPIO_Init
 868                     	xref	_CLK_PeripheralClockConfig
 887                     	xref	c_smul
 888                     	xref	c_lcmp
 889                     	xref	c_ltor
 890                     	xref	c_lgadc
 891                     	end
