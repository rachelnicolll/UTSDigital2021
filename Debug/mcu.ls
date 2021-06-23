   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
<<<<<<< HEAD
  14  0000               L3_HDC2080_state:
  15  0000 00            	dc.b	0
  16  0001 00            	dc.b	0
  17  0002 00            	dc.b	0
  18  0003 ff            	dc.b	255
  19  0004 00            	dc.b	0
  20  0005 ff            	dc.b	255
  21  0006 00            	dc.b	0
  22  0007 00            	dc.b	0
  23  0008 00            	dc.b	0
  24  0009 00            	dc.b	0
  25  000a 40            	dc.b	64
  26  000b 0003          	dc.w	3
  27  000d 0003          	dc.w	3
 156                     	bsct
 157  000f               _SensorAddr:
 158  000f 80            	dc.b	128
 159  0010               _errCnt:
 160  0010 0000          	dc.w	0
 205                     ; 21 void mcu_i2cInit(uint8_t busId)
 205                     ; 22 {
 207                     	switch	.text
 208  0000               _mcu_i2cInit:
 212                     ; 24     CLK->CKDIVR = 0x00;
 214  0000 725f50c0      	clr	20672
 215                     ; 26     CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 217  0004 ae0301        	ldw	x,#769
 218  0007 cd0000        	call	_CLK_PeripheralClockConfig
 220                     ; 28     I2C_DeInit(I2C1);
 222  000a ae5210        	ldw	x,#21008
 223  000d cd0000        	call	_I2C_DeInit
 225                     ; 31     I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 227  0010 4b00          	push	#0
 228  0012 4b04          	push	#4
 229  0014 4b00          	push	#0
 230  0016 4b00          	push	#0
 231  0018 ae00fe        	ldw	x,#254
 232  001b 89            	pushw	x
 233  001c ae86a0        	ldw	x,#34464
 234  001f 89            	pushw	x
 235  0020 ae0001        	ldw	x,#1
 236  0023 89            	pushw	x
 237  0024 ae5210        	ldw	x,#21008
 238  0027 cd0000        	call	_I2C_Init
 240  002a 5b0a          	addw	sp,#10
 241                     ; 34     I2C_Cmd(I2C1, ENABLE);
 243  002c 4b01          	push	#1
 244  002e ae5210        	ldw	x,#21008
 245  0031 cd0000        	call	_I2C_Cmd
 247  0034 84            	pop	a
 248                     ; 37     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Slow);
 250  0035 4b90          	push	#144
 251  0037 4b01          	push	#1
 252  0039 ae500a        	ldw	x,#20490
 253  003c cd0000        	call	_GPIO_Init
 255  003f 85            	popw	x
 256                     ; 38     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Slow);
 258  0040 4b90          	push	#144
 259  0042 4b02          	push	#2
 260  0044 ae500a        	ldw	x,#20490
 261  0047 cd0000        	call	_GPIO_Init
 263  004a 85            	popw	x
 264                     ; 43 }
 267  004b 81            	ret
 270                     	xref	_mcu_errorHandle
 271                     	xref	_mcu_errorHandle
 272                     	xref	_mcu_errorHandle
 273                     	xref	_mcu_errorHandle
 394                     ; 45 int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
 394                     ; 46                        uint8_t *dataToWrite, uint8_t writeLength,
 394                     ; 47                        uint8_t *dataToRead, uint8_t readLength)
 394                     ; 48 {
 395                     	switch	.text
 396  004c               _mcu_i2cTransfer:
 398  004c 89            	pushw	x
 399  004d 5205          	subw	sp,#5
 400       00000005      OFST:	set	5
 403                     ; 57     uint8_t slaveDevAddr = i2cAddr << 1;
 405  004f 9f            	ld	a,xl
 406  0050 48            	sll	a
 407  0051 6b01          	ld	(OFST-4,sp),a
 409                     ; 61     numWriteBytes = (int)writeLength;
 411  0053 7b0c          	ld	a,(OFST+7,sp)
 412  0055 5f            	clrw	x
 413  0056 97            	ld	xl,a
 414  0057 1f02          	ldw	(OFST-3,sp),x
 416                     ; 62     numReadBytes = (int)readLength;
 418  0059 7b0f          	ld	a,(OFST+10,sp)
 419  005b 5f            	clrw	x
 420  005c 97            	ld	xl,a
 421  005d 1f04          	ldw	(OFST-1,sp),x
 423                     ; 69     if ((dataToWrite != NULL) && (writeLength != 0))
 425  005f 1e0a          	ldw	x,(OFST+5,sp)
 426  0061 2603          	jrne	L01
 427  0063 cc014a        	jp	L161
 428  0066               L01:
 430  0066 0d0c          	tnz	(OFST+7,sp)
 431  0068 2603          	jrne	L21
 432  006a cc014a        	jp	L161
 433  006d               L21:
 434                     ; 72         I2C1->CR2 |= I2C_CR2_ACK;
 436  006d 72145211      	bset	21009,#2
 437                     ; 74         I2C1->CR2 &= ~I2C_CR2_POS;
 439  0071 72175211      	bres	21009,#3
 441  0075 2014          	jra	L561
 442  0077               L361:
 443                     ; 78             errCnt++;
 445  0077 be10          	ldw	x,_errCnt
 446  0079 1c0001        	addw	x,#1
 447  007c bf10          	ldw	_errCnt,x
 448                     ; 79             if (errCnt == 50)
 450  007e be10          	ldw	x,_errCnt
 451  0080 a30032        	cpw	x,#50
 452  0083 2606          	jrne	L561
 453                     ; 81                 mcu_errorHandle();
 455  0085 cd0227        	call	_mcu_errorHandle
 457                     ; 82                 errCnt = 0;
 459  0088 5f            	clrw	x
 460  0089 bf10          	ldw	_errCnt,x
 461  008b               L561:
 462                     ; 76         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 464  008b ae0302        	ldw	x,#770
 465  008e 89            	pushw	x
 466  008f ae5210        	ldw	x,#21008
 467  0092 cd0000        	call	_I2C_GetFlagStatus
 469  0095 85            	popw	x
 470  0096 4d            	tnz	a
 471  0097 26de          	jrne	L361
 472                     ; 86         I2C_GenerateSTART(I2C1, ENABLE);
 474  0099 4b01          	push	#1
 475  009b ae5210        	ldw	x,#21008
 476  009e cd0000        	call	_I2C_GenerateSTART
 478  00a1 84            	pop	a
 480  00a2 200d          	jra	L571
 481  00a4               L371:
 482                     ; 91             if (errCnt == 50)
 484  00a4 be10          	ldw	x,_errCnt
 485  00a6 a30032        	cpw	x,#50
 486  00a9 2606          	jrne	L571
 487                     ; 93                 mcu_errorHandle();
 489  00ab cd0227        	call	_mcu_errorHandle
 491                     ; 94                 errCnt = 0;
 493  00ae 5f            	clrw	x
 494  00af bf10          	ldw	_errCnt,x
 495  00b1               L571:
 496                     ; 89         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 498  00b1 ae0301        	ldw	x,#769
 499  00b4 89            	pushw	x
 500  00b5 ae5210        	ldw	x,#21008
 501  00b8 cd0000        	call	_I2C_CheckEvent
 503  00bb 85            	popw	x
 504  00bc 4d            	tnz	a
 505  00bd 27e5          	jreq	L371
 506                     ; 101         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
 508  00bf 4b00          	push	#0
 509  00c1 7b02          	ld	a,(OFST-3,sp)
 510  00c3 88            	push	a
 511  00c4 ae5210        	ldw	x,#21008
 512  00c7 cd0000        	call	_I2C_Send7bitAddress
 514  00ca 85            	popw	x
 516  00cb 2014          	jra	L502
 517  00cd               L302:
 518                     ; 106             errCnt++;
 520  00cd be10          	ldw	x,_errCnt
 521  00cf 1c0001        	addw	x,#1
 522  00d2 bf10          	ldw	_errCnt,x
 523                     ; 107             if (errCnt == 50)
 525  00d4 be10          	ldw	x,_errCnt
 526  00d6 a30032        	cpw	x,#50
 527  00d9 2606          	jrne	L502
 528                     ; 109                 mcu_errorHandle();
 530  00db cd0227        	call	_mcu_errorHandle
 532                     ; 110                 errCnt = 0;
 534  00de 5f            	clrw	x
 535  00df bf10          	ldw	_errCnt,x
 536  00e1               L502:
 537                     ; 104         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 539  00e1 ae0782        	ldw	x,#1922
 540  00e4 89            	pushw	x
 541  00e5 ae5210        	ldw	x,#21008
 542  00e8 cd0000        	call	_I2C_CheckEvent
 544  00eb 85            	popw	x
 545  00ec 4d            	tnz	a
 546  00ed 27de          	jreq	L302
 548  00ef 203e          	jra	L512
 549  00f1               L312:
 550                     ; 118             I2C_SendData(I2C1, *dataToWrite);
 552  00f1 1e0a          	ldw	x,(OFST+5,sp)
 553  00f3 f6            	ld	a,(x)
 554  00f4 88            	push	a
 555  00f5 ae5210        	ldw	x,#21008
 556  00f8 cd0000        	call	_I2C_SendData
 558  00fb 84            	pop	a
 560  00fc 2014          	jra	L322
 561  00fe               L122:
 562                     ; 123                 errCnt++;
 564  00fe be10          	ldw	x,_errCnt
 565  0100 1c0001        	addw	x,#1
 566  0103 bf10          	ldw	_errCnt,x
 567                     ; 124                 if (errCnt == 50)
 569  0105 be10          	ldw	x,_errCnt
 570  0107 a30032        	cpw	x,#50
 571  010a 2606          	jrne	L322
 572                     ; 126                     mcu_errorHandle();
 574  010c cd0227        	call	_mcu_errorHandle
 576                     ; 127                     errCnt = 0;
 578  010f 5f            	clrw	x
 579  0110 bf10          	ldw	_errCnt,x
 580  0112               L322:
 581                     ; 121             while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
 583  0112 ae0784        	ldw	x,#1924
 584  0115 89            	pushw	x
 585  0116 ae5210        	ldw	x,#21008
 586  0119 cd0000        	call	_I2C_CheckEvent
 588  011c 85            	popw	x
 589  011d a101          	cp	a,#1
 590  011f 26dd          	jrne	L122
 591                     ; 131             numWriteBytes--;
 593  0121 1e02          	ldw	x,(OFST-3,sp)
 594  0123 1d0001        	subw	x,#1
 595  0126 1f02          	ldw	(OFST-3,sp),x
 597                     ; 132             dataToWrite++;
 599  0128 1e0a          	ldw	x,(OFST+5,sp)
 600  012a 1c0001        	addw	x,#1
 601  012d 1f0a          	ldw	(OFST+5,sp),x
 602  012f               L512:
 603                     ; 115         while (numWriteBytes)
 605  012f 1e02          	ldw	x,(OFST-3,sp)
 606  0131 26be          	jrne	L312
 607                     ; 136         I2C_GenerateSTOP(I2C1, ENABLE);
 609  0133 4b01          	push	#1
 610  0135 ae5210        	ldw	x,#21008
 611  0138 cd0000        	call	_I2C_GenerateSTOP
 613  013b 84            	pop	a
 615  013c               L332:
 616                     ; 137         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
 618  013c ae0110        	ldw	x,#272
 619  013f 89            	pushw	x
 620  0140 ae5210        	ldw	x,#21008
 621  0143 cd0000        	call	_I2C_GetFlagStatus
 623  0146 85            	popw	x
 624  0147 4d            	tnz	a
 625  0148 26f2          	jrne	L332
 626  014a               L161:
 627                     ; 141     if ((dataToRead != NULL) && (readLength != 0))
 629  014a 1e0d          	ldw	x,(OFST+8,sp)
 630  014c 2603          	jrne	L41
 631  014e cc01ec        	jp	L732
 632  0151               L41:
 634  0151 0d0f          	tnz	(OFST+10,sp)
 635  0153 2603          	jrne	L61
 636  0155 cc01ec        	jp	L732
 637  0158               L61:
 639  0158               L342:
 640                     ; 145         while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 642  0158 ae0302        	ldw	x,#770
 643  015b 89            	pushw	x
 644  015c ae5210        	ldw	x,#21008
 645  015f cd0000        	call	_I2C_GetFlagStatus
 647  0162 85            	popw	x
 648  0163 4d            	tnz	a
 649  0164 26f2          	jrne	L342
 650                     ; 149         I2C_GenerateSTART(I2C1, ENABLE);
 652  0166 4b01          	push	#1
 653  0168 ae5210        	ldw	x,#21008
 654  016b cd0000        	call	_I2C_GenerateSTART
 656  016e 84            	pop	a
 658  016f               L152:
 659                     ; 152         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 661  016f ae0301        	ldw	x,#769
 662  0172 89            	pushw	x
 663  0173 ae5210        	ldw	x,#21008
 664  0176 cd0000        	call	_I2C_CheckEvent
 666  0179 85            	popw	x
 667  017a 4d            	tnz	a
 668  017b 27f2          	jreq	L152
 669                     ; 155         I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);
 671  017d 4b01          	push	#1
 672  017f 7b02          	ld	a,(OFST-3,sp)
 673  0181 88            	push	a
 674  0182 ae5210        	ldw	x,#21008
 675  0185 cd0000        	call	_I2C_Send7bitAddress
 677  0188 85            	popw	x
 679  0189               L752:
 680                     ; 158         while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 682  0189 ae0302        	ldw	x,#770
 683  018c 89            	pushw	x
 684  018d ae5210        	ldw	x,#21008
 685  0190 cd0000        	call	_I2C_CheckEvent
 687  0193 85            	popw	x
 688  0194 4d            	tnz	a
 689  0195 27f2          	jreq	L752
 691  0197 204f          	jra	L562
 692  0199               L372:
 693                     ; 162             while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED | I2C_FLAG_BTF))
 695  0199 ae0344        	ldw	x,#836
 696  019c 89            	pushw	x
 697  019d ae5210        	ldw	x,#21008
 698  01a0 cd0000        	call	_I2C_CheckEvent
 700  01a3 85            	popw	x
 701  01a4 4d            	tnz	a
 702  01a5 27f2          	jreq	L372
 703                     ; 164             I2C1->CR2 |= I2C_CR2_POS;  // Set POS bit (NACK at next received byte)
 705  01a7 72165211      	bset	21009,#3
 706                     ; 165             disableInterrupts();       // Errata workaround (Disable interrupt)
 709  01ab 9b            sim
 711                     ; 166             I2C1->SR3;                 // Clear ADDR Flag
 714  01ac c65219        	ld	a,21017
 715                     ; 167             I2C1->CR2 &= ~I2C_CR2_ACK; // Clear ACK
 717  01af 72155211      	bres	21009,#2
 718                     ; 168             enableInterrupts();        // Errata workaround (Enable interrupt)
 721  01b3 9a            rim
 725  01b4               L103:
 726                     ; 169             while (!(I2C1->SR1 & I2C_SR1_BTF))
 728  01b4 c65217        	ld	a,21015
 729  01b7 a504          	bcp	a,#4
 730  01b9 27f9          	jreq	L103
 731                     ; 171             disableInterrupts();            // Errata workaround (Disable interrupt)
 734  01bb 9b            sim
 736                     ; 172             I2C_GenerateSTOP(I2C1, ENABLE); // Generate stop here (STOP=1)
 739  01bc 4b01          	push	#1
 740  01be ae5210        	ldw	x,#21008
 741  01c1 cd0000        	call	_I2C_GenerateSTOP
 743  01c4 84            	pop	a
 744                     ; 173             *(dataToRead++) = I2C1->DR;
 746  01c5 1e0d          	ldw	x,(OFST+8,sp)
 747  01c7 1c0001        	addw	x,#1
 748  01ca 1f0d          	ldw	(OFST+8,sp),x
 749  01cc 1d0001        	subw	x,#1
 750  01cf c65216        	ld	a,21014
 751  01d2 f7            	ld	(x),a
 752                     ; 175             numReadBytes--;
 754  01d3 1e04          	ldw	x,(OFST-1,sp)
 755  01d5 1d0001        	subw	x,#1
 756  01d8 1f04          	ldw	(OFST-1,sp),x
 758                     ; 176             enableInterrupts();       // Errata workaround (Enable interrupt)
 761  01da 9a            rim
 763                     ; 177             *(dataToRead) = I2C1->DR; // Read 2nd Data byte
 766  01db 1e0d          	ldw	x,(OFST+8,sp)
 767  01dd c65216        	ld	a,21014
 768  01e0 f7            	ld	(x),a
 769                     ; 178             numReadBytes--;
 771  01e1 1e04          	ldw	x,(OFST-1,sp)
 772  01e3 1d0001        	subw	x,#1
 773  01e6 1f04          	ldw	(OFST-1,sp),x
 775  01e8               L562:
 776                     ; 160         while (numReadBytes)
 778  01e8 1e04          	ldw	x,(OFST-1,sp)
 779  01ea 26ad          	jrne	L372
 780  01ec               L732:
 781                     ; 207     return (0);
 783  01ec 4f            	clr	a
 786  01ed 5b07          	addw	sp,#7
 787  01ef 81            	ret
 840                     ; 212 void mcu_msWait(unsigned long msWait)
 840                     ; 213 {
 841                     	switch	.text
 842  01f0               _mcu_msWait:
 844  01f0 5208          	subw	sp,#8
 845       00000008      OFST:	set	8
 848                     ; 217     delay_ms(msWait);
 851  01f2 1e0d          	ldw	x,(OFST+5,sp)
 852  01f4 1f03          	ldw	(OFST-5,sp),x
 853  01f6 1e0b          	ldw	x,(OFST+3,sp)
 854  01f8 1f01          	ldw	(OFST-7,sp),x
 856                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 858  01fa ae0000        	ldw	x,#0
 859  01fd 1f07          	ldw	(OFST-1,sp),x
 860  01ff ae0000        	ldw	x,#0
 861  0202 1f05          	ldw	(OFST-3,sp),x
 864  0204 2009          	jra	L143
 865  0206               L533:
 868  0206 96            	ldw	x,sp
 869  0207 1c0005        	addw	x,#OFST-3
 870  020a a601          	ld	a,#1
 871  020c cd0000        	call	c_lgadc
 874  020f               L143:
 877  020f 96            	ldw	x,sp
 878  0210 1c0001        	addw	x,#OFST-7
 879  0213 cd0000        	call	c_ltor
 881  0216 a66f          	ld	a,#111
 882  0218 cd0000        	call	c_smul
 884  021b 96            	ldw	x,sp
 885  021c 1c0005        	addw	x,#OFST-3
 886  021f cd0000        	call	c_lcmp
 888  0222 22e2          	jrugt	L533
 889                     ; 218 }
 892  0224 5b08          	addw	sp,#8
 893  0226 81            	ret
 920                     ; 221 void mcu_errorHandle()
 920                     ; 222 {
 921                     	switch	.text
 922  0227               _mcu_errorHandle:
 926                     ; 223     I2C_Cmd(I2C1, DISABLE);
 928  0227 4b00          	push	#0
 929  0229 ae5210        	ldw	x,#21008
 930  022c cd0000        	call	_I2C_Cmd
 932  022f 84            	pop	a
 933                     ; 224     CLK_PeripheralClockConfig(CLK_PCKENR1_I2C1, DISABLE);
 935  0230 ae0800        	ldw	x,#2048
 936  0233 cd0000        	call	_CLK_PeripheralClockConfig
 938                     ; 226     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_In_FL_No_IT);
 940  0236 4b00          	push	#0
 941  0238 4b02          	push	#2
 942  023a ae500a        	ldw	x,#20490
 943  023d cd0000        	call	_GPIO_Init
 945  0240 85            	popw	x
 946                     ; 227     CLK_PeripheralClockConfig(CLK_PCKENR1_I2C1, ENABLE);
 948  0241 ae0801        	ldw	x,#2049
 949  0244 cd0000        	call	_CLK_PeripheralClockConfig
 951                     ; 228 		I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 953  0247 4b00          	push	#0
 954  0249 4b04          	push	#4
 955  024b 4b00          	push	#0
 956  024d 4b00          	push	#0
 957  024f ae00fe        	ldw	x,#254
 958  0252 89            	pushw	x
 959  0253 ae86a0        	ldw	x,#34464
 960  0256 89            	pushw	x
 961  0257 ae0001        	ldw	x,#1
 962  025a 89            	pushw	x
 963  025b ae5210        	ldw	x,#21008
 964  025e cd0000        	call	_I2C_Init
 966  0261 5b0a          	addw	sp,#10
 967                     ; 230     GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Slow);
 969  0263 4b90          	push	#144
 970  0265 4b01          	push	#1
 971  0267 ae500a        	ldw	x,#20490
 972  026a cd0000        	call	_GPIO_Init
 974  026d 85            	popw	x
 975                     ; 231     GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Slow);
 977  026e 4b90          	push	#144
 978  0270 4b02          	push	#2
 979  0272 ae500a        	ldw	x,#20490
 980  0275 cd0000        	call	_GPIO_Init
 982  0278 85            	popw	x
 983                     ; 233 }
 986  0279 81            	ret
1019                     	xdef	_mcu_errorHandle
1020                     	xdef	_errCnt
1021                     	xdef	_SensorAddr
1022                     	xdef	_mcu_msWait
1023                     	xdef	_mcu_i2cTransfer
1024                     	xdef	_mcu_i2cInit
1025                     	xref	_I2C_GetFlagStatus
1026                     	xref	_I2C_CheckEvent
1027                     	xref	_I2C_SendData
1028                     	xref	_I2C_Send7bitAddress
1029                     	xref	_I2C_GenerateSTOP
1030                     	xref	_I2C_GenerateSTART
1031                     	xref	_I2C_Cmd
1032                     	xref	_I2C_Init
1033                     	xref	_I2C_DeInit
1034                     	xref	_GPIO_Init
1035                     	xref	_CLK_PeripheralClockConfig
1054                     	xref	c_lcmp
1055                     	xref	c_smul
1056                     	xref	c_ltor
1057                     	xref	c_lgadc
1058                     	end
=======
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
>>>>>>> I2C_new
