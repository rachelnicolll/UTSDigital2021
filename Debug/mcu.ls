   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _errCount:
  15  0000 00            	dc.b	0
  62                     ; 20 void mcu_i2cInit(uint8_t busId)
  62                     ; 21 {
  64                     	switch	.text
  65  0000               _mcu_i2cInit:
  69                     ; 23     CLK->CKDIVR = 0x00;
  71  0000 725f50c0      	clr	20672
  72                     ; 25     CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  74  0004 ae0301        	ldw	x,#769
  75  0007 cd0000        	call	_CLK_PeripheralClockConfig
  77                     ; 27     I2C_DeInit(I2C1);
  79  000a ae5210        	ldw	x,#21008
  80  000d cd0000        	call	_I2C_DeInit
  82                     ; 30     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  84  0010 4b00          	push	#0
  85  0012 4b04          	push	#4
  86  0014 4b00          	push	#0
  87  0016 4b00          	push	#0
  88  0018 ae00fe        	ldw	x,#254
  89  001b 89            	pushw	x
  90  001c ae86a0        	ldw	x,#34464
  91  001f 89            	pushw	x
  92  0020 ae0001        	ldw	x,#1
  93  0023 89            	pushw	x
  94  0024 ae5210        	ldw	x,#21008
  95  0027 cd0000        	call	_I2C_Init
  97  002a 5b0a          	addw	sp,#10
  98                     ; 33     I2C_Cmd(I2C1, ENABLE);
 100  002c 4b01          	push	#1
 101  002e ae5210        	ldw	x,#21008
 102  0031 cd0000        	call	_I2C_Cmd
 104  0034 84            	pop	a
 105                     ; 36     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);
 107  0035 4bb0          	push	#176
 108  0037 4b01          	push	#1
 109  0039 ae500a        	ldw	x,#20490
 110  003c cd0000        	call	_GPIO_Init
 112  003f 85            	popw	x
 113                     ; 37     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 115  0040 4bb0          	push	#176
 116  0042 4b02          	push	#2
 117  0044 ae500a        	ldw	x,#20490
 118  0047 cd0000        	call	_GPIO_Init
 120  004a 85            	popw	x
 121                     ; 39     I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY);
 123  004b ae0302        	ldw	x,#770
 124  004e 89            	pushw	x
 125  004f ae5210        	ldw	x,#21008
 126  0052 cd0000        	call	_I2C_GetFlagStatus
 128  0055 85            	popw	x
 129                     ; 40     I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT);
 131  0056 ae0301        	ldw	x,#769
 132  0059 89            	pushw	x
 133  005a ae5210        	ldw	x,#21008
 134  005d cd0000        	call	_I2C_CheckEvent
 136  0060 85            	popw	x
 137                     ; 43 }
 140  0061 81            	ret
 265                     .const:	section	.text
 266  0000               L01:
 267  0000 0000006f      	dc.l	111
 268                     ; 45 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 268                     ; 46                        uint8_t *dataToWrite, uint8_t writeLength,
 268                     ; 47                        uint8_t *dataToRead, uint8_t readLength)
 268                     ; 48 {
 269                     	switch	.text
 270  0062               _mcu_i2cTransfer:
 272  0062 89            	pushw	x
 273  0063 5209          	subw	sp,#9
 274       00000009      OFST:	set	9
 277                     ; 50     uint8_t slaveDevAddr = i2cAddr << 1;
 279  0065 9f            	ld	a,xl
 280  0066 48            	sll	a
 281  0067 6b05          	ld	(OFST-4,sp),a
 283                     ; 54     numWriteBytes = (int)writeLength;
 285  0069 7b10          	ld	a,(OFST+7,sp)
 286  006b 5f            	clrw	x
 287  006c 97            	ld	xl,a
 288  006d 1f06          	ldw	(OFST-3,sp),x
 290                     ; 55     numReadBytes = (int)readLength;
 292  006f 7b13          	ld	a,(OFST+10,sp)
 293  0071 5f            	clrw	x
 294  0072 97            	ld	xl,a
 295  0073 1f08          	ldw	(OFST-1,sp),x
 297                     ; 58     if ((dataToWrite != NULL) && (writeLength != 0))
 299  0075 1e0e          	ldw	x,(OFST+5,sp)
 300  0077 2603          	jrne	L21
 301  0079 cc0115        	jp	L311
 302  007c               L21:
 304  007c 0d10          	tnz	(OFST+7,sp)
 305  007e 2603          	jrne	L41
 306  0080 cc0115        	jp	L311
 307  0083               L41:
 308                     ; 61         I2C1->CR2 |= I2C_CR2_ACK; // Set ACK
 310  0083 72145211      	bset	21009,#2
 311                     ; 63         I2C1->CR2 &= ~I2C_CR2_POS; // Reset POS
 313  0087 72175211      	bres	21009,#3
 315  008b               L711:
 316                     ; 65         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY)) // Check bus is free
 318  008b ae0302        	ldw	x,#770
 319  008e 89            	pushw	x
 320  008f ae5210        	ldw	x,#21008
 321  0092 cd0000        	call	_I2C_GetFlagStatus
 323  0095 85            	popw	x
 324  0096 4d            	tnz	a
 325  0097 26f2          	jrne	L711
 326                     ; 68         I2C_GenerateSTART(I2C1, ENABLE);                            // Generate START bit
 328  0099 4b01          	push	#1
 329  009b ae5210        	ldw	x,#21008
 330  009e cd0000        	call	_I2C_GenerateSTART
 332  00a1 84            	pop	a
 334  00a2               L521:
 335                     ; 69         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT)) // Poll EV5 - start conditino correctly release (SB)
 337  00a2 ae0301        	ldw	x,#769
 338  00a5 89            	pushw	x
 339  00a6 ae5210        	ldw	x,#21008
 340  00a9 cd0000        	call	_I2C_CheckEvent
 342  00ac 85            	popw	x
 343  00ad 4d            	tnz	a
 344  00ae 27f2          	jreq	L521
 345                     ; 72         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);       // Send slave address
 347  00b0 4b00          	push	#0
 348  00b2 7b06          	ld	a,(OFST-3,sp)
 349  00b4 88            	push	a
 350  00b5 ae5210        	ldw	x,#21008
 351  00b8 cd0000        	call	_I2C_Send7bitAddress
 353  00bb 85            	popw	x
 355  00bc               L331:
 356                     ; 73         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) // Poll EV6  - slave acknowledge correctly (BUSY, MSL, ADDR, TXE & TRA)
 358  00bc ae0782        	ldw	x,#1922
 359  00bf 89            	pushw	x
 360  00c0 ae5210        	ldw	x,#21008
 361  00c3 cd0000        	call	_I2C_CheckEvent
 363  00c6 85            	popw	x
 364  00c7 4d            	tnz	a
 365  00c8 27f2          	jreq	L331
 367  00ca 2028          	jra	L141
 368  00cc               L731:
 369                     ; 80             I2C_SendData(I2C1, *dataToWrite); // Send data
 371  00cc 1e0e          	ldw	x,(OFST+5,sp)
 372  00ce f6            	ld	a,(x)
 373  00cf 88            	push	a
 374  00d0 ae5210        	ldw	x,#21008
 375  00d3 cd0000        	call	_I2C_SendData
 377  00d6 84            	pop	a
 379  00d7               L741:
 380                     ; 82             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS) // Poll EV8_2 - Successfully transmitted (TRA, BUSY, MSL, TXE and BTF)
 382  00d7 ae0784        	ldw	x,#1924
 383  00da 89            	pushw	x
 384  00db ae5210        	ldw	x,#21008
 385  00de cd0000        	call	_I2C_CheckEvent
 387  00e1 85            	popw	x
 388  00e2 a101          	cp	a,#1
 389  00e4 26f1          	jrne	L741
 390                     ; 85             numWriteBytes--; // Decrement number of bytes written
 392  00e6 1e06          	ldw	x,(OFST-3,sp)
 393  00e8 1d0001        	subw	x,#1
 394  00eb 1f06          	ldw	(OFST-3,sp),x
 396                     ; 86             dataToWrite++;   // Increment pointer to next byte to write
 398  00ed 1e0e          	ldw	x,(OFST+5,sp)
 399  00ef 1c0001        	addw	x,#1
 400  00f2 1f0e          	ldw	(OFST+5,sp),x
 401  00f4               L141:
 402                     ; 77         while (numWriteBytes)
 404  00f4 1e06          	ldw	x,(OFST-3,sp)
 405  00f6 26d4          	jrne	L731
 406                     ; 88 				if (i2cAddr == 0x40)
 408  00f8 7b0b          	ld	a,(OFST+2,sp)
 409  00fa a140          	cp	a,#64
 410  00fc 2617          	jrne	L311
 411                     ; 90         I2C_GenerateSTOP(I2C1, ENABLE);                 // Send STOP bit
 413  00fe 4b01          	push	#1
 414  0100 ae5210        	ldw	x,#21008
 415  0103 cd0000        	call	_I2C_GenerateSTOP
 417  0106 84            	pop	a
 419  0107               L751:
 420                     ; 91         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF)) // Check stop was successful
 422  0107 ae0110        	ldw	x,#272
 423  010a 89            	pushw	x
 424  010b ae5210        	ldw	x,#21008
 425  010e cd0000        	call	_I2C_GetFlagStatus
 427  0111 85            	popw	x
 428  0112 4d            	tnz	a
 429  0113 26f2          	jrne	L751
 430  0115               L311:
 431                     ; 97     if ((dataToRead != NULL) && (readLength != 0))
 433  0115 1e11          	ldw	x,(OFST+8,sp)
 434  0117 2603          	jrne	L61
 435  0119 cc025e        	jp	L361
 436  011c               L61:
 438  011c 0d13          	tnz	(OFST+10,sp)
 439  011e 2603          	jrne	L02
 440  0120 cc025e        	jp	L361
 441  0123               L02:
 443  0123               L761:
 444                     ; 100         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY)) // Check if bus is busy
 446  0123 ae0302        	ldw	x,#770
 447  0126 89            	pushw	x
 448  0127 ae5210        	ldw	x,#21008
 449  012a cd0000        	call	_I2C_GetFlagStatus
 451  012d 85            	popw	x
 452  012e 4d            	tnz	a
 453  012f 26f2          	jrne	L761
 454                     ; 103         I2C1->CR2 |= I2C_CR2_ACK; // Enable Ack
 456  0131 72145211      	bset	21009,#2
 457                     ; 105         I2C_GenerateSTART(I2C1, ENABLE); // Generate START bit
 459  0135 4b01          	push	#1
 460  0137 ae5210        	ldw	x,#21008
 461  013a cd0000        	call	_I2C_GenerateSTART
 463  013d 84            	pop	a
 465  013e               L571:
 466                     ; 107         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT)) // Poll EV5 - start conditino correctly release (SB)
 468  013e ae0301        	ldw	x,#769
 469  0141 89            	pushw	x
 470  0142 ae5210        	ldw	x,#21008
 471  0145 cd0000        	call	_I2C_CheckEvent
 473  0148 85            	popw	x
 474  0149 4d            	tnz	a
 475  014a 27f2          	jreq	L571
 476                     ; 110         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver); // Send slave address that will be read
 478  014c 4b01          	push	#1
 479  014e 7b06          	ld	a,(OFST-3,sp)
 480  0150 88            	push	a
 481  0151 ae5210        	ldw	x,#21008
 482  0154 cd0000        	call	_I2C_Send7bitAddress
 484  0157 85            	popw	x
 485                     ; 113         if (numReadBytes == 2)
 487  0158 1e08          	ldw	x,(OFST-1,sp)
 488  015a a30002        	cpw	x,#2
 489  015d 2604          	jrne	L502
 490                     ; 114             I2C1->CR2 |= I2C_CR2_POS;
 492  015f 72165211      	bset	21009,#3
 493  0163               L502:
 494                     ; 116         while (!(I2C1->SR1 & I2C_SR1_ADDR)) // Check receiver mode selected
 496  0163 c65217        	ld	a,21015
 497  0166 a502          	bcp	a,#2
 498  0168 27f9          	jreq	L502
 499                     ; 119         if (numReadBytes > 2) //Not last 2 bytes
 501  016a 9c            	rvf
 502  016b 1e08          	ldw	x,(OFST-1,sp)
 503  016d a30003        	cpw	x,#3
 504  0170 2f6b          	jrslt	L112
 505                     ; 122             I2C1->SR3;               // Clear ADDR flag
 507  0172 c65219        	ld	a,21017
 509  0175 201c          	jra	L512
 510  0177               L322:
 511                     ; 125                 while (!(I2C1->SR1 & I2C_SR1_BTF))
 513  0177 c65217        	ld	a,21015
 514  017a a504          	bcp	a,#4
 515  017c 27f9          	jreq	L322
 516                     ; 127                 *(dataToRead++) = I2C1->DR; // Reading next data byte
 518  017e 1e11          	ldw	x,(OFST+8,sp)
 519  0180 1c0001        	addw	x,#1
 520  0183 1f11          	ldw	(OFST+8,sp),x
 521  0185 1d0001        	subw	x,#1
 522  0188 c65216        	ld	a,21014
 523  018b f7            	ld	(x),a
 524                     ; 128                 --numReadBytes;             // Decrease Numbyte to reade by 1
 526  018c 1e08          	ldw	x,(OFST-1,sp)
 527  018e 1d0001        	subw	x,#1
 528  0191 1f08          	ldw	(OFST-1,sp),x
 530  0193               L512:
 531                     ; 123             while (numReadBytes > 3) // Not last three bytes
 533  0193 9c            	rvf
 534  0194 1e08          	ldw	x,(OFST-1,sp)
 535  0196 a30004        	cpw	x,#4
 536  0199 2edc          	jrsge	L322
 538  019b               L132:
 539                     ; 131             while (!(I2C1->SR1 & I2C_SR1_BTF))
 541  019b c65217        	ld	a,21015
 542  019e a504          	bcp	a,#4
 543  01a0 27f9          	jreq	L132
 544                     ; 133             I2C1->CR2 &= ~I2C_CR2_ACK; // Clear ACK
 546  01a2 72155211      	bres	21009,#2
 547                     ; 135             *(dataToRead++) = I2C1->DR; // Read 1st byte
 549  01a6 1e11          	ldw	x,(OFST+8,sp)
 550  01a8 1c0001        	addw	x,#1
 551  01ab 1f11          	ldw	(OFST+8,sp),x
 552  01ad 1d0001        	subw	x,#1
 553  01b0 c65216        	ld	a,21014
 554  01b3 f7            	ld	(x),a
 555                     ; 136             I2C1->CR2 |= I2C_CR2_STOP;  // Generate stop here (STOP=1)
 557  01b4 72125211      	bset	21009,#1
 558                     ; 137             *(dataToRead++) = I2C1->DR; // Read 2nd byte
 560  01b8 1e11          	ldw	x,(OFST+8,sp)
 561  01ba 1c0001        	addw	x,#1
 562  01bd 1f11          	ldw	(OFST+8,sp),x
 563  01bf 1d0001        	subw	x,#1
 564  01c2 c65216        	ld	a,21014
 565  01c5 f7            	ld	(x),a
 567  01c6               L142:
 568                     ; 139             while (!(I2C1->SR1 & I2C_SR1_RXNE))
 570  01c6 c65217        	ld	a,21015
 571  01c9 a540          	bcp	a,#64
 572  01cb 27f9          	jreq	L142
 573                     ; 141             *(dataToRead++) = I2C1->DR; // Read 3rd Data byte
 575  01cd 1e11          	ldw	x,(OFST+8,sp)
 576  01cf 1c0001        	addw	x,#1
 577  01d2 1f11          	ldw	(OFST+8,sp),x
 578  01d4 1d0001        	subw	x,#1
 579  01d7 c65216        	ld	a,21014
 580  01da f7            	ld	(x),a
 582  01db 206f          	jra	L772
 583  01dd               L112:
 584                     ; 144         else if (numReadBytes == 2)
 586  01dd 1e08          	ldw	x,(OFST-1,sp)
 587  01df a30002        	cpw	x,#2
 588  01e2 2650          	jrne	L742
 589                     ; 146             I2C1->SR3;                 // Clear ADDR flag
 591  01e4 c65219        	ld	a,21017
 592                     ; 147             I2C1->CR2 &= ~I2C_CR2_ACK; // Disable ACK
 594  01e7 72155211      	bres	21009,#2
 596  01eb               L352:
 597                     ; 148             while (!(I2C1->SR1 & (I2C_SR1_RXNE | I2C_SR1_BTF)))
 599  01eb c65217        	ld	a,21015
 600  01ee a544          	bcp	a,#68
 601  01f0 27f9          	jreq	L352
 602                     ; 150             I2C_GenerateSTOP(I2C1, ENABLE);      // Generate STOP bit
 604  01f2 4b01          	push	#1
 605  01f4 ae5210        	ldw	x,#21008
 606  01f7 cd0000        	call	_I2C_GenerateSTOP
 608  01fa 84            	pop	a
 609                     ; 151             *(dataToRead++) = (uint8_t)I2C1->DR; // Read data byte
 611  01fb 1e11          	ldw	x,(OFST+8,sp)
 612  01fd 1c0001        	addw	x,#1
 613  0200 1f11          	ldw	(OFST+8,sp),x
 614  0202 1d0001        	subw	x,#1
 615  0205 c65216        	ld	a,21014
 616  0208 f7            	ld	(x),a
 617                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 620  0209 ae0000        	ldw	x,#0
 621  020c 1f03          	ldw	(OFST-6,sp),x
 622  020e ae0000        	ldw	x,#0
 623  0211 1f01          	ldw	(OFST-8,sp),x
 625  0213               L752:
 626                     ; 14         _asm("nop");
 629  0213 9d            nop
 631                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 633  0214 96            	ldw	x,sp
 634  0215 1c0001        	addw	x,#OFST-8
 635  0218 a601          	ld	a,#1
 636  021a cd0000        	call	c_lgadc
 641  021d 96            	ldw	x,sp
 642  021e 1c0001        	addw	x,#OFST-8
 643  0221 cd0000        	call	c_ltor
 645  0224 ae0000        	ldw	x,#L01
 646  0227 cd0000        	call	c_lcmp
 648  022a 25e7          	jrult	L752
 649                     ; 153             *(dataToRead) = (uint8_t)I2C1->DR; // Read data byte at next address
 651  022c 1e11          	ldw	x,(OFST+8,sp)
 652  022e c65216        	ld	a,21014
 653  0231 f7            	ld	(x),a
 655  0232 2018          	jra	L772
 656  0234               L742:
 657                     ; 158             I2C1->CR2 &= ~I2C_CR2_ACK;
 659  0234 72155211      	bres	21009,#2
 660                     ; 160             I2C1->SR3;                 // Clear ADDR Flag
 663  0238 c65219        	ld	a,21017
 664                     ; 161             I2C1->CR2 |= I2C_CR2_STOP; // Generate STOP bit
 666  023b 72125211      	bset	21009,#1
 668  023f               L172:
 669                     ; 162             while (!(I2C1->SR1 & I2C_SR1_RXNE))
 671  023f c65217        	ld	a,21015
 672  0242 a540          	bcp	a,#64
 673  0244 27f9          	jreq	L172
 674                     ; 164             *(dataToRead) = I2C1->DR; // Read Data byte
 676  0246 1e11          	ldw	x,(OFST+8,sp)
 677  0248 c65216        	ld	a,21014
 678  024b f7            	ld	(x),a
 679  024c               L772:
 680                     ; 167         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 682  024c ae0110        	ldw	x,#272
 683  024f 89            	pushw	x
 684  0250 ae5210        	ldw	x,#21008
 685  0253 cd0000        	call	_I2C_GetFlagStatus
 687  0256 85            	popw	x
 688  0257 4d            	tnz	a
 689  0258 26f2          	jrne	L772
 690                     ; 169         I2C1->CR2 &= ~I2C_CR2_POS;
 692  025a 72175211      	bres	21009,#3
 693  025e               L361:
 694                     ; 171     return (0);
 696  025e 4f            	clr	a
 699  025f 5b0b          	addw	sp,#11
 700  0261 81            	ret
 754                     ; 176 void mcu_msWait(unsigned long msWait)
 754                     ; 177 {
 755                     	switch	.text
 756  0262               _mcu_msWait:
 758  0262 5208          	subw	sp,#8
 759       00000008      OFST:	set	8
 762                     ; 181     delay_ms(msWait);
 765  0264 1e0d          	ldw	x,(OFST+5,sp)
 766  0266 1f03          	ldw	(OFST-5,sp),x
 767  0268 1e0b          	ldw	x,(OFST+3,sp)
 768  026a 1f01          	ldw	(OFST-7,sp),x
 770                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 772  026c ae0000        	ldw	x,#0
 773  026f 1f07          	ldw	(OFST-1,sp),x
 774  0271 ae0000        	ldw	x,#0
 775  0274 1f05          	ldw	(OFST-3,sp),x
 778  0276 200a          	jra	L733
 779  0278               L333:
 780                     ; 14         _asm("nop");
 783  0278 9d            nop
 785                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 787  0279 96            	ldw	x,sp
 788  027a 1c0005        	addw	x,#OFST-3
 789  027d a601          	ld	a,#1
 790  027f cd0000        	call	c_lgadc
 793  0282               L733:
 796  0282 96            	ldw	x,sp
 797  0283 1c0001        	addw	x,#OFST-7
 798  0286 cd0000        	call	c_ltor
 800  0289 a66f          	ld	a,#111
 801  028b cd0000        	call	c_smul
 803  028e 96            	ldw	x,sp
 804  028f 1c0005        	addw	x,#OFST-3
 805  0292 cd0000        	call	c_lcmp
 807  0295 22e1          	jrugt	L333
 808                     ; 182 }
 811  0297 5b08          	addw	sp,#8
 812  0299 81            	ret
 836                     	xdef	_errCount
 837                     	xdef	_mcu_msWait
 838                     	xdef	_mcu_i2cTransfer
 839                     	xdef	_mcu_i2cInit
 840                     	xref	_I2C_GetFlagStatus
 841                     	xref	_I2C_CheckEvent
 842                     	xref	_I2C_SendData
 843                     	xref	_I2C_Send7bitAddress
 844                     	xref	_I2C_GenerateSTOP
 845                     	xref	_I2C_GenerateSTART
 846                     	xref	_I2C_Cmd
 847                     	xref	_I2C_Init
 848                     	xref	_I2C_DeInit
 849                     	xref	_GPIO_Init
 850                     	xref	_CLK_PeripheralClockConfig
 869                     	xref	c_smul
 870                     	xref	c_lcmp
 871                     	xref	c_ltor
 872                     	xref	c_lgadc
 873                     	end
