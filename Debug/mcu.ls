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
  71                     ; 25     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  73  0006 4b00          	push	#0
  74  0008 4b04          	push	#4
  75  000a 4b00          	push	#0
  76  000c 4b00          	push	#0
  77  000e ae00fe        	ldw	x,#254
  78  0011 89            	pushw	x
  79  0012 ae86a0        	ldw	x,#34464
  80  0015 89            	pushw	x
  81  0016 ae0001        	ldw	x,#1
  82  0019 89            	pushw	x
  83  001a ae5210        	ldw	x,#21008
  84  001d cd0000        	call	_I2C_Init
  86  0020 5b0a          	addw	sp,#10
  87                     ; 28     I2C_Cmd(I2C1, ENABLE);
  89  0022 4b01          	push	#1
  90  0024 ae5210        	ldw	x,#21008
  91  0027 cd0000        	call	_I2C_Cmd
  93  002a 84            	pop	a
  94                     ; 30     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
  96  002b 4bb0          	push	#176
  97  002d 4b01          	push	#1
  98  002f ae500a        	ldw	x,#20490
  99  0032 cd0000        	call	_GPIO_Init
 101  0035 85            	popw	x
 102                     ; 31     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 104  0036 4bb0          	push	#176
 105  0038 4b02          	push	#2
 106  003a ae500a        	ldw	x,#20490
 107  003d cd0000        	call	_GPIO_Init
 109  0040 85            	popw	x
 110                     ; 34 }
 113  0041 81            	ret
 247                     ; 36 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 247                     ; 37                        uint8_t *dataToWrite, uint8_t writeLength,
 247                     ; 38                        uint8_t *dataToRead, uint8_t readLength)
 247                     ; 39 {
 248                     	switch	.text
 249  0042               _mcu_i2cTransfer:
 251  0042 89            	pushw	x
 252  0043 5207          	subw	sp,#7
 253       00000007      OFST:	set	7
 256                     ; 48     uint8_t slaveDevAddr = i2cAddr << 1;
 258  0045 9f            	ld	a,xl
 259  0046 48            	sll	a
 260  0047 6b01          	ld	(OFST-6,sp),a
 262                     ; 52     errorCount = 0;
 264  0049 5f            	clrw	x
 265  004a 1f06          	ldw	(OFST-1,sp),x
 267                     ; 53     numWriteBytes = (int)writeLength;
 269  004c 7b0e          	ld	a,(OFST+7,sp)
 270  004e 5f            	clrw	x
 271  004f 97            	ld	xl,a
 272  0050 1f02          	ldw	(OFST-5,sp),x
 274                     ; 54     numReadBytes = (int)readLength;
 276  0052 7b11          	ld	a,(OFST+10,sp)
 277  0054 5f            	clrw	x
 278  0055 97            	ld	xl,a
 279  0056 1f04          	ldw	(OFST-3,sp),x
 281                     ; 61     if ((dataToWrite != NULL) && (writeLength != 0))
 283  0058 1e0c          	ldw	x,(OFST+5,sp)
 284  005a 2603          	jrne	L21
 285  005c cc0119        	jp	L111
 286  005f               L21:
 288  005f 0d0e          	tnz	(OFST+7,sp)
 289  0061 2603          	jrne	L41
 290  0063 cc0119        	jp	L111
 291  0066               L41:
 292                     ; 64         I2C_GenerateSTART(I2C1, ENABLE);
 294  0066 4b01          	push	#1
 295  0068 ae5210        	ldw	x,#21008
 296  006b cd0000        	call	_I2C_GenerateSTART
 298  006e 84            	pop	a
 300  006f 2013          	jra	L511
 301  0071               L311:
 302                     ; 68             errorCount++;
 304  0071 1e06          	ldw	x,(OFST-1,sp)
 305  0073 1c0001        	addw	x,#1
 306  0076 1f06          	ldw	(OFST-1,sp),x
 308                     ; 69             if (errorCount > 100)
 310  0078 9c            	rvf
 311  0079 1e06          	ldw	x,(OFST-1,sp)
 312  007b a30065        	cpw	x,#101
 313  007e 2f04          	jrslt	L511
 314                     ; 72                 return (errorCount);
 316  0080 7b07          	ld	a,(OFST+0,sp)
 318  0082 2031          	jra	L01
 319  0084               L511:
 320                     ; 66         while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT) != SUCCESS)
 322  0084 ae0301        	ldw	x,#769
 323  0087 89            	pushw	x
 324  0088 ae5210        	ldw	x,#21008
 325  008b cd0000        	call	_I2C_CheckEvent
 327  008e 85            	popw	x
 328  008f a101          	cp	a,#1
 329  0091 26de          	jrne	L311
 330                     ; 75         errorCount = 0; // Wait til START condition is correctly released
 333  0093 5f            	clrw	x
 334  0094 1f06          	ldw	(OFST-1,sp),x
 336                     ; 78         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
 338  0096 4b00          	push	#0
 339  0098 7b02          	ld	a,(OFST-5,sp)
 340  009a 88            	push	a
 341  009b ae5210        	ldw	x,#21008
 342  009e cd0000        	call	_I2C_Send7bitAddress
 344  00a1 85            	popw	x
 346  00a2 2014          	jra	L521
 347  00a4               L321:
 348                     ; 83             errorCount++;
 350  00a4 1e06          	ldw	x,(OFST-1,sp)
 351  00a6 1c0001        	addw	x,#1
 352  00a9 1f06          	ldw	(OFST-1,sp),x
 354                     ; 84             if (errorCount > 100)
 356  00ab 9c            	rvf
 357  00ac 1e06          	ldw	x,(OFST-1,sp)
 358  00ae a30065        	cpw	x,#101
 359  00b1 2f05          	jrslt	L521
 360                     ; 87                 return (errorCount);
 362  00b3 7b07          	ld	a,(OFST+0,sp)
 364  00b5               L01:
 366  00b5 5b09          	addw	sp,#9
 367  00b7 81            	ret
 368  00b8               L521:
 369                     ; 81         while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) != SUCCESS)
 371  00b8 ae0782        	ldw	x,#1922
 372  00bb 89            	pushw	x
 373  00bc ae5210        	ldw	x,#21008
 374  00bf cd0000        	call	_I2C_CheckEvent
 376  00c2 85            	popw	x
 377  00c3 a101          	cp	a,#1
 378  00c5 26dd          	jrne	L321
 379                     ; 90         errorCount = 0;
 382  00c7 5f            	clrw	x
 383  00c8 1f06          	ldw	(OFST-1,sp),x
 386  00ca 2040          	jra	L731
 387  00cc               L331:
 388                     ; 102             I2C_SendData(I2C1, *(dataToWrite));
 390  00cc 1e0c          	ldw	x,(OFST+5,sp)
 391  00ce f6            	ld	a,(x)
 392  00cf 88            	push	a
 393  00d0 ae5210        	ldw	x,#21008
 394  00d3 cd0000        	call	_I2C_SendData
 396  00d6 84            	pop	a
 398  00d7 2013          	jra	L541
 399  00d9               L341:
 400                     ; 107                 errorCount++;
 402  00d9 1e06          	ldw	x,(OFST-1,sp)
 403  00db 1c0001        	addw	x,#1
 404  00de 1f06          	ldw	(OFST-1,sp),x
 406                     ; 108                 if (errorCount > 100)
 408  00e0 9c            	rvf
 409  00e1 1e06          	ldw	x,(OFST-1,sp)
 410  00e3 a30065        	cpw	x,#101
 411  00e6 2f04          	jrslt	L541
 412                     ; 111                     return (errorCount);
 414  00e8 7b07          	ld	a,(OFST+0,sp)
 416  00ea 20c9          	jra	L01
 417  00ec               L541:
 418                     ; 105             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
 420  00ec ae0784        	ldw	x,#1924
 421  00ef 89            	pushw	x
 422  00f0 ae5210        	ldw	x,#21008
 423  00f3 cd0000        	call	_I2C_CheckEvent
 425  00f6 85            	popw	x
 426  00f7 a101          	cp	a,#1
 427  00f9 26de          	jrne	L341
 428                     ; 114             errorCount = 0;
 431  00fb 5f            	clrw	x
 432  00fc 1f06          	ldw	(OFST-1,sp),x
 434                     ; 115             numWriteBytes--;
 436  00fe 1e02          	ldw	x,(OFST-5,sp)
 437  0100 1d0001        	subw	x,#1
 438  0103 1f02          	ldw	(OFST-5,sp),x
 440                     ; 116             dataToWrite++;
 442  0105 1e0c          	ldw	x,(OFST+5,sp)
 443  0107 1c0001        	addw	x,#1
 444  010a 1f0c          	ldw	(OFST+5,sp),x
 445  010c               L731:
 446                     ; 95         while (numWriteBytes)
 448  010c 1e02          	ldw	x,(OFST-5,sp)
 449  010e 26bc          	jrne	L331
 450                     ; 120         I2C_GenerateSTOP(I2C1, ENABLE);
 452  0110 4b01          	push	#1
 453  0112 ae5210        	ldw	x,#21008
 454  0115 cd0000        	call	_I2C_GenerateSTOP
 456  0118 84            	pop	a
 457  0119               L111:
 458                     ; 123     if ((dataToRead != NULL) && (readLength != 0))
 460  0119 1e0f          	ldw	x,(OFST+8,sp)
 461  011b 2603          	jrne	L61
 462  011d cc0288        	jp	L351
 463  0120               L61:
 465  0120 0d11          	tnz	(OFST+10,sp)
 466  0122 2603          	jrne	L02
 467  0124 cc0288        	jp	L351
 468  0127               L02:
 470  0127               L751:
 471                     ; 126         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 473  0127 ae0302        	ldw	x,#770
 474  012a 89            	pushw	x
 475  012b ae5210        	ldw	x,#21008
 476  012e cd0000        	call	_I2C_GetFlagStatus
 478  0131 85            	popw	x
 479  0132 4d            	tnz	a
 480  0133 26f2          	jrne	L751
 481                     ; 130         I2C_GenerateSTART(I2C1, ENABLE);
 483  0135 4b01          	push	#1
 484  0137 ae5210        	ldw	x,#21008
 485  013a cd0000        	call	_I2C_GenerateSTART
 487  013d 84            	pop	a
 489  013e               L561:
 490                     ; 133         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 492  013e ae0301        	ldw	x,#769
 493  0141 89            	pushw	x
 494  0142 ae5210        	ldw	x,#21008
 495  0145 cd0000        	call	_I2C_CheckEvent
 497  0148 85            	popw	x
 498  0149 4d            	tnz	a
 499  014a 27f2          	jreq	L561
 500                     ; 137         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);
 502  014c 4b01          	push	#1
 503  014e 7b02          	ld	a,(OFST-5,sp)
 504  0150 88            	push	a
 505  0151 ae5210        	ldw	x,#21008
 506  0154 cd0000        	call	_I2C_Send7bitAddress
 508  0157 85            	popw	x
 510  0158 2015          	jra	L371
 511  015a               L171:
 512                     ; 142             errorCount++;
 514  015a 1e06          	ldw	x,(OFST-1,sp)
 515  015c 1c0001        	addw	x,#1
 516  015f 1f06          	ldw	(OFST-1,sp),x
 518                     ; 143             if (errorCount > 100)
 520  0161 9c            	rvf
 521  0162 1e06          	ldw	x,(OFST-1,sp)
 522  0164 a30065        	cpw	x,#101
 523  0167 2f06          	jrslt	L371
 524                     ; 146                 return (errorCount);
 526  0169 7b07          	ld	a,(OFST+0,sp)
 528  016b acb500b5      	jpf	L01
 529  016f               L371:
 530                     ; 140         while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED) != SUCCESS)
 532  016f ae0302        	ldw	x,#770
 533  0172 89            	pushw	x
 534  0173 ae5210        	ldw	x,#21008
 535  0176 cd0000        	call	_I2C_CheckEvent
 537  0179 85            	popw	x
 538  017a a101          	cp	a,#1
 539  017c 26dc          	jrne	L171
 540                     ; 149         errorCount = 0; // Wait til START condition is correctly released
 543                     ; 151         if (readLength > 2)
 545  017e 7b11          	ld	a,(OFST+10,sp)
 546  0180 a103          	cp	a,#3
 547  0182 2403          	jruge	L22
 548  0184 cc021c        	jp	L102
 549  0187               L22:
 550                     ; 153             I2C_ReadRegister(I2C1, I2C_Register_SR3);
 552  0187 4b09          	push	#9
 553  0189 ae5210        	ldw	x,#21008
 554  018c cd0000        	call	_I2C_ReadRegister
 556  018f 84            	pop	a
 558  0190 201f          	jra	L502
 559  0192               L312:
 560                     ; 160                 while (!(I2C1->SR1 & I2C_SR1_BTF))
 562  0192 c65217        	ld	a,21015
 563  0195 a504          	bcp	a,#4
 564  0197 27f9          	jreq	L312
 565                     ; 162                 *(dataToRead++) = I2C_ReceiveData(I2C1);
 567  0199 ae5210        	ldw	x,#21008
 568  019c cd0000        	call	_I2C_ReceiveData
 570  019f 1e0f          	ldw	x,(OFST+8,sp)
 571  01a1 1c0001        	addw	x,#1
 572  01a4 1f0f          	ldw	(OFST+8,sp),x
 573  01a6 1d0001        	subw	x,#1
 574  01a9 f7            	ld	(x),a
 575                     ; 163                 numReadBytes--;
 577  01aa 1e04          	ldw	x,(OFST-3,sp)
 578  01ac 1d0001        	subw	x,#1
 579  01af 1f04          	ldw	(OFST-3,sp),x
 581  01b1               L502:
 582                     ; 155             while (numReadBytes > 3)
 584  01b1 9c            	rvf
 585  01b2 1e04          	ldw	x,(OFST-3,sp)
 586  01b4 a30004        	cpw	x,#4
 587  01b7 2ed9          	jrsge	L312
 589  01b9               L122:
 590                     ; 166             while (!(I2C1->SR1 & I2C_SR1_BTF))
 592  01b9 c65217        	ld	a,21015
 593  01bc a504          	bcp	a,#4
 594  01be 27f9          	jreq	L122
 595                     ; 168             I2C_AcknowledgeConfig(I2C1, I2C_Ack_Disable);
 597  01c0 4b00          	push	#0
 598  01c2 ae5210        	ldw	x,#21008
 599  01c5 cd0000        	call	_I2C_AcknowledgeConfig
 601  01c8 84            	pop	a
 602                     ; 169             disableInterrupts();
 605  01c9 9b            sim
 607                     ; 170             *(dataToRead++) = I2C_ReceiveData(I2C1);
 610  01ca ae5210        	ldw	x,#21008
 611  01cd cd0000        	call	_I2C_ReceiveData
 613  01d0 1e0f          	ldw	x,(OFST+8,sp)
 614  01d2 1c0001        	addw	x,#1
 615  01d5 1f0f          	ldw	(OFST+8,sp),x
 616  01d7 1d0001        	subw	x,#1
 617  01da f7            	ld	(x),a
 618                     ; 171             I2C_GenerateSTOP(I2C1, ENABLE);
 620  01db 4b01          	push	#1
 621  01dd ae5210        	ldw	x,#21008
 622  01e0 cd0000        	call	_I2C_GenerateSTOP
 624  01e3 84            	pop	a
 625                     ; 172             *(dataToRead++) = I2C_ReceiveData(I2C1);
 627  01e4 ae5210        	ldw	x,#21008
 628  01e7 cd0000        	call	_I2C_ReceiveData
 630  01ea 1e0f          	ldw	x,(OFST+8,sp)
 631  01ec 1c0001        	addw	x,#1
 632  01ef 1f0f          	ldw	(OFST+8,sp),x
 633  01f1 1d0001        	subw	x,#1
 634  01f4 f7            	ld	(x),a
 635                     ; 173             enableInterrupts();
 638  01f5 9a            rim
 642  01f6               L722:
 643                     ; 174             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED) != SUCCESS)
 645  01f6 ae0340        	ldw	x,#832
 646  01f9 89            	pushw	x
 647  01fa ae5210        	ldw	x,#21008
 648  01fd cd0000        	call	_I2C_CheckEvent
 650  0200 85            	popw	x
 651  0201 a101          	cp	a,#1
 652  0203 26f1          	jrne	L722
 653                     ; 176             *(dataToRead++) = I2C_ReceiveData(I2C1);
 655  0205 ae5210        	ldw	x,#21008
 656  0208 cd0000        	call	_I2C_ReceiveData
 658  020b 1e0f          	ldw	x,(OFST+8,sp)
 659  020d 1c0001        	addw	x,#1
 660  0210 1f0f          	ldw	(OFST+8,sp),x
 661  0212 1d0001        	subw	x,#1
 662  0215 f7            	ld	(x),a
 664  0216               L332:
 665                     ; 208         I2C1->CR2 &= ~I2C_CR2_POS; // return POS to default state (POS=0)
 667  0216 72175211      	bres	21009,#3
 668  021a 206c          	jra	L351
 669  021c               L102:
 670                     ; 178         else if (readLength == 2)
 672  021c 7b11          	ld	a,(OFST+10,sp)
 673  021e a102          	cp	a,#2
 674  0220 2635          	jrne	L532
 675                     ; 180             I2C1->CR2 |= I2C_CR2_POS;  // Set POS bit (NACK at next received byte)
 677  0222 72165211      	bset	21009,#3
 678                     ; 181             disableInterrupts();       // Errata workaround (Disable interrupt)
 681  0226 9b            sim
 683                     ; 182             I2C1->SR3;                 // Clear ADDR Flag
 686  0227 c65219        	ld	a,21017
 687                     ; 183             I2C1->CR2 &= ~I2C_CR2_ACK; // Clear ACK
 689  022a 72155211      	bres	21009,#2
 690                     ; 184             enableInterrupts();        // Errata workaround (Enable interrupt)
 693  022e 9a            rim
 697  022f               L142:
 698                     ; 185             while (!(I2C1->SR1 & I2C_SR1_BTF))
 700  022f c65217        	ld	a,21015
 701  0232 a504          	bcp	a,#4
 702  0234 27f9          	jreq	L142
 703                     ; 187             disableInterrupts();            // Errata workaround (Disable interrupt)
 706  0236 9b            sim
 708                     ; 188             I2C_GenerateSTOP(I2C1, ENABLE); // Generate stop here (STOP=1)
 711  0237 4b01          	push	#1
 712  0239 ae5210        	ldw	x,#21008
 713  023c cd0000        	call	_I2C_GenerateSTOP
 715  023f 84            	pop	a
 716                     ; 189             *(dataToRead++) = I2C1->DR;     // Read 1st Data byte
 718  0240 1e0f          	ldw	x,(OFST+8,sp)
 719  0242 1c0001        	addw	x,#1
 720  0245 1f0f          	ldw	(OFST+8,sp),x
 721  0247 1d0001        	subw	x,#1
 722  024a c65216        	ld	a,21014
 723  024d f7            	ld	(x),a
 724                     ; 190             enableInterrupts();             // Errata workaround (Enable interrupt)
 727  024e 9a            rim
 729                     ; 191             *(dataToRead) = I2C1->DR;       // Read 2nd Data byte
 732  024f 1e0f          	ldw	x,(OFST+8,sp)
 733  0251 c65216        	ld	a,21014
 734  0254 f7            	ld	(x),a
 736  0255 20bf          	jra	L332
 737  0257               L532:
 738                     ; 195             I2C_AcknowledgeConfig(I2C1, I2C_Ack_Disable); // Clear ACK
 740  0257 4b00          	push	#0
 741  0259 ae5210        	ldw	x,#21008
 742  025c cd0000        	call	_I2C_AcknowledgeConfig
 744  025f 84            	pop	a
 745                     ; 196             disableInterrupts();                          // Errata workaround (Disable interrupt)
 748  0260 9b            sim
 750                     ; 197             I2C1->SR3;                                    // Clear ADDR Flag
 753  0261 c65219        	ld	a,21017
 754                     ; 198             I2C_GenerateSTOP(I2C1, ENABLE);               // Generate stop here (STOP=1)
 756  0264 4b01          	push	#1
 757  0266 ae5210        	ldw	x,#21008
 758  0269 cd0000        	call	_I2C_GenerateSTOP
 760  026c 84            	pop	a
 761                     ; 199             enableInterrupts();                           // Errata workaround (Enable interrupt)
 764  026d 9a            rim
 768  026e               L152:
 769                     ; 200             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED) != SUCCESS)
 771  026e ae0340        	ldw	x,#832
 772  0271 89            	pushw	x
 773  0272 ae5210        	ldw	x,#21008
 774  0275 cd0000        	call	_I2C_CheckEvent
 776  0278 85            	popw	x
 777  0279 a101          	cp	a,#1
 778  027b 26f1          	jrne	L152
 779                     ; 202             *(dataToRead) = I2C_ReceiveData(I2C1);
 781  027d ae5210        	ldw	x,#21008
 782  0280 cd0000        	call	_I2C_ReceiveData
 784  0283 1e0f          	ldw	x,(OFST+8,sp)
 785  0285 f7            	ld	(x),a
 786  0286 208e          	jra	L332
 787  0288               L351:
 788                     ; 233     return (0);
 790  0288 4f            	clr	a
 792  0289 acb500b5      	jpf	L01
 845                     ; 238 void mcu_msWait(unsigned long msWait)
 845                     ; 239 {
 846                     	switch	.text
 847  028d               _mcu_msWait:
 849  028d 5208          	subw	sp,#8
 850       00000008      OFST:	set	8
 853                     ; 243     delay_ms(msWait);
 856  028f 1e0d          	ldw	x,(OFST+5,sp)
 857  0291 1f03          	ldw	(OFST-5,sp),x
 858  0293 1e0b          	ldw	x,(OFST+3,sp)
 859  0295 1f01          	ldw	(OFST-7,sp),x
 861                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 863  0297 ae0000        	ldw	x,#0
 864  029a 1f07          	ldw	(OFST-1,sp),x
 865  029c ae0000        	ldw	x,#0
 866  029f 1f05          	ldw	(OFST-3,sp),x
 869  02a1 2009          	jra	L113
 870  02a3               L503:
 873  02a3 96            	ldw	x,sp
 874  02a4 1c0005        	addw	x,#OFST-3
 875  02a7 a601          	ld	a,#1
 876  02a9 cd0000        	call	c_lgadc
 879  02ac               L113:
 882  02ac 96            	ldw	x,sp
 883  02ad 1c0001        	addw	x,#OFST-7
 884  02b0 cd0000        	call	c_ltor
 886  02b3 a66f          	ld	a,#111
 887  02b5 cd0000        	call	c_smul
 889  02b8 96            	ldw	x,sp
 890  02b9 1c0005        	addw	x,#OFST-3
 891  02bc cd0000        	call	c_lcmp
 893  02bf 22e2          	jrugt	L503
 894                     ; 244 }
 897  02c1 5b08          	addw	sp,#8
 898  02c3 81            	ret
 922                     	xdef	_SensorAddr
 923                     	xdef	_mcu_msWait
 924                     	xdef	_mcu_i2cTransfer
 925                     	xdef	_mcu_i2cInit
 926                     	xref	_I2C_GetFlagStatus
 927                     	xref	_I2C_CheckEvent
 928                     	xref	_I2C_ReadRegister
 929                     	xref	_I2C_ReceiveData
 930                     	xref	_I2C_SendData
 931                     	xref	_I2C_Send7bitAddress
 932                     	xref	_I2C_AcknowledgeConfig
 933                     	xref	_I2C_GenerateSTOP
 934                     	xref	_I2C_GenerateSTART
 935                     	xref	_I2C_Cmd
 936                     	xref	_I2C_Init
 937                     	xref	_I2C_DeInit
 938                     	xref	_GPIO_Init
 957                     	xref	c_lcmp
 958                     	xref	c_smul
 959                     	xref	c_ltor
 960                     	xref	c_lgadc
 961                     	end
