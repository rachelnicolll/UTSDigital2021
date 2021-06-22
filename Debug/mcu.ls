   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
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
