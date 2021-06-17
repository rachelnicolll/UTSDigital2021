   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 30 static void LCD_gpio_init() {
  43                     	switch	.text
  44  0000               L3_LCD_gpio_init:
  48                     ; 31     GPIOB->DDR |= (1 << LCD_CE_PIN) | (1 << LCD_RST_PIN) | (1 << LCD_DC_PIN);
  50  0000 c65007        	ld	a,20487
  51  0003 aa0d          	or	a,#13
  52  0005 c75007        	ld	20487,a
  53                     ; 32     GPIOB->CR1 |= (1 << LCD_CE_PIN) | (1 << LCD_RST_PIN) | (1 << LCD_DC_PIN);
  55  0008 c65008        	ld	a,20488
  56  000b aa0d          	or	a,#13
  57  000d c75008        	ld	20488,a
  58                     ; 33 }
  61  0010 81            	ret
  84                     ; 35 static void LCD_DC_set() {
  85                     	switch	.text
  86  0011               L32_LCD_DC_set:
  90                     ; 36     GPIOB->ODR |= (1 << LCD_DC_PIN);
  92  0011 72145005      	bset	20485,#2
  93                     ; 37 }
  96  0015 81            	ret
 119                     ; 39 static void LCD_DC_clear() {
 120                     	switch	.text
 121  0016               L53_LCD_DC_clear:
 125                     ; 40     GPIOB->ODR &= ~(1 << LCD_DC_PIN);
 127  0016 72155005      	bres	20485,#2
 128                     ; 41 }
 131  001a 81            	ret
 154                     ; 43 static void LCD_CE_set() {
 155                     	switch	.text
 156  001b               L74_LCD_CE_set:
 160  001b               L36:
 161                     ; 44     while (SPI1->SR &  SPI_SR_BSY);
 163  001b c65203        	ld	a,20995
 164  001e a580          	bcp	a,#128
 165  0020 26f9          	jrne	L36
 166                     ; 45     GPIOB->ODR |= (1 << LCD_CE_PIN);
 168  0022 72165005      	bset	20485,#3
 169                     ; 46 }
 172  0026 81            	ret
 195                     ; 48 static void LCD_CE_clear() {
 196                     	switch	.text
 197  0027               L76_LCD_CE_clear:
 201                     ; 49     GPIOB->ODR &= ~(1 << LCD_CE_PIN);
 203  0027 72175005      	bres	20485,#3
 204                     ; 50 }
 207  002b 81            	ret
 230                     ; 52 static void LCD_RST_set() {
 231                     	switch	.text
 232  002c               L101_LCD_RST_set:
 236                     ; 53     GPIOB->ODR |= (1 << LCD_RST_PIN);
 238  002c 72105005      	bset	20485,#0
 239                     ; 54 }
 242  0030 81            	ret
 265                     ; 56 static void LCD_RST_clear() {
 266                     	switch	.text
 267  0031               L311_LCD_RST_clear:
 271                     ; 57     GPIOB->ODR &= ~(1 << LCD_RST_PIN);
 273  0031 72115005      	bres	20485,#0
 274                     ; 58 }
 277  0035 81            	ret
 312                     ; 60 static void LCD_SPI_write(uint8_t word) {
 313                     	switch	.text
 314  0036               L521_LCD_SPI_write:
 318                     ; 61     SPI_write(word);
 320  0036 cd0000        	call	_SPI_write
 322                     ; 62 }
 325  0039 81            	ret
 379                     ; 64 static void LCD_delay_ms(int ms) {
 380                     	switch	.text
 381  003a               L541_LCD_delay_ms:
 383  003a 5208          	subw	sp,#8
 384       00000008      OFST:	set	8
 387                     ; 65     delay_ms(ms);
 390  003c cd0000        	call	c_itolx
 392  003f 96            	ldw	x,sp
 393  0040 1c0001        	addw	x,#OFST-7
 394  0043 cd0000        	call	c_rtol
 397                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 399  0046 ae0000        	ldw	x,#0
 400  0049 1f07          	ldw	(OFST-1,sp),x
 401  004b ae0000        	ldw	x,#0
 402  004e 1f05          	ldw	(OFST-3,sp),x
 405  0050 200a          	jra	L302
 406  0052               L771:
 407                     ; 14         _asm("nop");
 410  0052 9d            nop
 412                     ; 13     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 414  0053 96            	ldw	x,sp
 415  0054 1c0005        	addw	x,#OFST-3
 416  0057 a601          	ld	a,#1
 417  0059 cd0000        	call	c_lgadc
 420  005c               L302:
 423  005c 96            	ldw	x,sp
 424  005d 1c0001        	addw	x,#OFST-7
 425  0060 cd0000        	call	c_ltor
 427  0063 a66f          	ld	a,#111
 428  0065 cd0000        	call	c_smul
 430  0068 96            	ldw	x,sp
 431  0069 1c0005        	addw	x,#OFST-3
 432  006c cd0000        	call	c_lcmp
 434  006f 22e1          	jrugt	L771
 435                     ; 66 }
 438  0071 5b08          	addw	sp,#8
 439  0073 81            	ret
 452                     .const:	section	.text
 453  0000               _font:
 454  0000 00            	dc.b	0
 455  0001 00            	dc.b	0
 456  0002 00            	dc.b	0
 457  0003 00            	dc.b	0
 458  0004 00            	dc.b	0
 459  0005 00            	dc.b	0
 460  0006 5e            	dc.b	94
 461  0007 00            	dc.b	0
 462  0008 00            	dc.b	0
 463  0009 00            	dc.b	0
 464  000a 06            	dc.b	6
 465  000b 06            	dc.b	6
 466  000c 00            	dc.b	0
 467  000d 00            	dc.b	0
 468  000e 00            	dc.b	0
 469  000f 28            	dc.b	40
 470  0010 fe            	dc.b	254
 471  0011 28            	dc.b	40
 472  0012 fe            	dc.b	254
 473  0013 28            	dc.b	40
 474  0014 08            	dc.b	8
 475  0015 54            	dc.b	84
 476  0016 fe            	dc.b	254
 477  0017 54            	dc.b	84
 478  0018 20            	dc.b	32
 479  0019 40            	dc.b	64
 480  001a 2c            	dc.b	44
 481  001b 54            	dc.b	84
 482  001c 68            	dc.b	104
 483  001d 04            	dc.b	4
 484  001e 70            	dc.b	112
 485  001f 4e            	dc.b	78
 486  0020 7a            	dc.b	122
 487  0021 26            	dc.b	38
 488  0022 40            	dc.b	64
 489  0023 06            	dc.b	6
 490  0024 00            	dc.b	0
 491  0025 00            	dc.b	0
 492  0026 00            	dc.b	0
 493  0027 00            	dc.b	0
 494  0028 00            	dc.b	0
 495  0029 7e            	dc.b	126
 496  002a 81            	dc.b	129
 497  002b 00            	dc.b	0
 498  002c 00            	dc.b	0
 499  002d 81            	dc.b	129
 500  002e 7e            	dc.b	126
 501  002f 00            	dc.b	0
 502  0030 00            	dc.b	0
 503  0031 00            	dc.b	0
 504  0032 08            	dc.b	8
 505  0033 04            	dc.b	4
 506  0034 02            	dc.b	2
 507  0035 04            	dc.b	4
 508  0036 08            	dc.b	8
 509  0037 10            	dc.b	16
 510  0038 10            	dc.b	16
 511  0039 7c            	dc.b	124
 512  003a 10            	dc.b	16
 513  003b 10            	dc.b	16
 514  003c 00            	dc.b	0
 515  003d c0            	dc.b	192
 516  003e 00            	dc.b	0
 517  003f 00            	dc.b	0
 518  0040 00            	dc.b	0
 519  0041 20            	dc.b	32
 520  0042 20            	dc.b	32
 521  0043 00            	dc.b	0
 522  0044 00            	dc.b	0
 523  0045 00            	dc.b	0
 524  0046 00            	dc.b	0
 525  0047 40            	dc.b	64
 526  0048 00            	dc.b	0
 527  0049 00            	dc.b	0
 528  004a 00            	dc.b	0
 529  004b 70            	dc.b	112
 530  004c 0e            	dc.b	14
 531  004d 00            	dc.b	0
 532  004e 00            	dc.b	0
 533  004f 00            	dc.b	0
 534  0050 3c            	dc.b	60
 535  0051 42            	dc.b	66
 536  0052 42            	dc.b	66
 537  0053 3c            	dc.b	60
 538  0054 00            	dc.b	0
 539  0055 44            	dc.b	68
 540  0056 7e            	dc.b	126
 541  0057 40            	dc.b	64
 542  0058 00            	dc.b	0
 543  0059 00            	dc.b	0
 544  005a 62            	dc.b	98
 545  005b 52            	dc.b	82
 546  005c 4e            	dc.b	78
 547  005d 00            	dc.b	0
 548  005e 00            	dc.b	0
 549  005f 62            	dc.b	98
 550  0060 4a            	dc.b	74
 551  0061 7e            	dc.b	126
 552  0062 00            	dc.b	0
 553  0063 00            	dc.b	0
 554  0064 18            	dc.b	24
 555  0065 14            	dc.b	20
 556  0066 7e            	dc.b	126
 557  0067 10            	dc.b	16
 558  0068 00            	dc.b	0
 559  0069 4e            	dc.b	78
 560  006a 4a            	dc.b	74
 561  006b 7a            	dc.b	122
 562  006c 00            	dc.b	0
 563  006d 00            	dc.b	0
 564  006e 7e            	dc.b	126
 565  006f 52            	dc.b	82
 566  0070 72            	dc.b	114
 567  0071 00            	dc.b	0
 568  0072 00            	dc.b	0
 569  0073 02            	dc.b	2
 570  0074 62            	dc.b	98
 571  0075 1a            	dc.b	26
 572  0076 06            	dc.b	6
 573  0077 00            	dc.b	0
 574  0078 76            	dc.b	118
 575  0079 4a            	dc.b	74
 576  007a 76            	dc.b	118
 577  007b 00            	dc.b	0
 578  007c 00            	dc.b	0
 579  007d 4c            	dc.b	76
 580  007e 52            	dc.b	82
 581  007f 52            	dc.b	82
 582  0080 3c            	dc.b	60
 583  0081 00            	dc.b	0
 584  0082 00            	dc.b	0
 585  0083 48            	dc.b	72
 586  0084 00            	dc.b	0
 587  0085 00            	dc.b	0
 588  0086 00            	dc.b	0
 589  0087 00            	dc.b	0
 590  0088 c8            	dc.b	200
 591  0089 00            	dc.b	0
 592  008a 00            	dc.b	0
 593  008b 00            	dc.b	0
 594  008c 10            	dc.b	16
 595  008d 28            	dc.b	40
 596  008e 28            	dc.b	40
 597  008f 44            	dc.b	68
 598  0090 00            	dc.b	0
 599  0091 28            	dc.b	40
 600  0092 28            	dc.b	40
 601  0093 28            	dc.b	40
 602  0094 28            	dc.b	40
 603  0095 00            	dc.b	0
 604  0096 44            	dc.b	68
 605  0097 28            	dc.b	40
 606  0098 28            	dc.b	40
 607  0099 10            	dc.b	16
 608  009a 00            	dc.b	0
 609  009b 04            	dc.b	4
 610  009c 52            	dc.b	82
 611  009d 0a            	dc.b	10
 612  009e 0e            	dc.b	14
 613  009f 00            	dc.b	0
 614  00a0 7c            	dc.b	124
 615  00a1 82            	dc.b	130
 616  00a2 ba            	dc.b	186
 617  00a3 aa            	dc.b	170
 618  00a4 be            	dc.b	190
 619  00a5 7c            	dc.b	124
 620  00a6 12            	dc.b	18
 621  00a7 12            	dc.b	18
 622  00a8 7c            	dc.b	124
 623  00a9 00            	dc.b	0
 624  00aa 7e            	dc.b	126
 625  00ab 4a            	dc.b	74
 626  00ac 4a            	dc.b	74
 627  00ad 34            	dc.b	52
 628  00ae 00            	dc.b	0
 629  00af 3c            	dc.b	60
 630  00b0 42            	dc.b	66
 631  00b1 42            	dc.b	66
 632  00b2 42            	dc.b	66
 633  00b3 24            	dc.b	36
 634  00b4 7e            	dc.b	126
 635  00b5 42            	dc.b	66
 636  00b6 42            	dc.b	66
 637  00b7 42            	dc.b	66
 638  00b8 3c            	dc.b	60
 639  00b9 7e            	dc.b	126
 640  00ba 4a            	dc.b	74
 641  00bb 4a            	dc.b	74
 642  00bc 4a            	dc.b	74
 643  00bd 00            	dc.b	0
 644  00be 7e            	dc.b	126
 645  00bf 0a            	dc.b	10
 646  00c0 0a            	dc.b	10
 647  00c1 0a            	dc.b	10
 648  00c2 00            	dc.b	0
 649  00c3 3c            	dc.b	60
 650  00c4 42            	dc.b	66
 651  00c5 42            	dc.b	66
 652  00c6 52            	dc.b	82
 653  00c7 34            	dc.b	52
 654  00c8 7e            	dc.b	126
 655  00c9 08            	dc.b	8
 656  00ca 08            	dc.b	8
 657  00cb 08            	dc.b	8
 658  00cc 7e            	dc.b	126
 659  00cd 42            	dc.b	66
 660  00ce 7e            	dc.b	126
 661  00cf 42            	dc.b	66
 662  00d0 00            	dc.b	0
 663  00d1 00            	dc.b	0
 664  00d2 60            	dc.b	96
 665  00d3 42            	dc.b	66
 666  00d4 7e            	dc.b	126
 667  00d5 00            	dc.b	0
 668  00d6 00            	dc.b	0
 669  00d7 7e            	dc.b	126
 670  00d8 08            	dc.b	8
 671  00d9 18            	dc.b	24
 672  00da 24            	dc.b	36
 673  00db 42            	dc.b	66
 674  00dc 7e            	dc.b	126
 675  00dd 40            	dc.b	64
 676  00de 40            	dc.b	64
 677  00df 40            	dc.b	64
 678  00e0 00            	dc.b	0
 679  00e1 7e            	dc.b	126
 680  00e2 04            	dc.b	4
 681  00e3 08            	dc.b	8
 682  00e4 04            	dc.b	4
 683  00e5 7e            	dc.b	126
 684  00e6 7e            	dc.b	126
 685  00e7 04            	dc.b	4
 686  00e8 18            	dc.b	24
 687  00e9 20            	dc.b	32
 688  00ea 7e            	dc.b	126
 689  00eb 3c            	dc.b	60
 690  00ec 42            	dc.b	66
 691  00ed 42            	dc.b	66
 692  00ee 42            	dc.b	66
 693  00ef 3c            	dc.b	60
 694  00f0 7e            	dc.b	126
 695  00f1 12            	dc.b	18
 696  00f2 12            	dc.b	18
 697  00f3 0c            	dc.b	12
 698  00f4 00            	dc.b	0
 699  00f5 3c            	dc.b	60
 700  00f6 42            	dc.b	66
 701  00f7 c2            	dc.b	194
 702  00f8 c2            	dc.b	194
 703  00f9 bc            	dc.b	188
 704  00fa 7e            	dc.b	126
 705  00fb 12            	dc.b	18
 706  00fc 12            	dc.b	18
 707  00fd 32            	dc.b	50
 708  00fe 4c            	dc.b	76
 709  00ff 4c            	dc.b	76
 710  0100 52            	dc.b	82
 711  0101 52            	dc.b	82
 712  0102 22            	dc.b	34
 713  0103 00            	dc.b	0
 714  0104 02            	dc.b	2
 715  0105 02            	dc.b	2
 716  0106 7e            	dc.b	126
 717  0107 02            	dc.b	2
 718  0108 02            	dc.b	2
 719  0109 3e            	dc.b	62
 720  010a 40            	dc.b	64
 721  010b 40            	dc.b	64
 722  010c 40            	dc.b	64
 723  010d 3e            	dc.b	62
 724  010e 06            	dc.b	6
 725  010f 38            	dc.b	56
 726  0110 40            	dc.b	64
 727  0111 38            	dc.b	56
 728  0112 06            	dc.b	6
 729  0113 3e            	dc.b	62
 730  0114 60            	dc.b	96
 731  0115 18            	dc.b	24
 732  0116 60            	dc.b	96
 733  0117 3e            	dc.b	62
 734  0118 42            	dc.b	66
 735  0119 24            	dc.b	36
 736  011a 18            	dc.b	24
 737  011b 24            	dc.b	36
 738  011c 42            	dc.b	66
 739  011d 02            	dc.b	2
 740  011e 0c            	dc.b	12
 741  011f 70            	dc.b	112
 742  0120 0c            	dc.b	12
 743  0121 02            	dc.b	2
 744  0122 62            	dc.b	98
 745  0123 52            	dc.b	82
 746  0124 4a            	dc.b	74
 747  0125 46            	dc.b	70
 748  0126 00            	dc.b	0
 749  0127 00            	dc.b	0
 750  0128 ff            	dc.b	255
 751  0129 81            	dc.b	129
 752  012a 00            	dc.b	0
 753  012b 00            	dc.b	0
 754  012c 0e            	dc.b	14
 755  012d 70            	dc.b	112
 756  012e 00            	dc.b	0
 757  012f 00            	dc.b	0
 758  0130 00            	dc.b	0
 759  0131 81            	dc.b	129
 760  0132 ff            	dc.b	255
 761  0133 00            	dc.b	0
 762  0134 00            	dc.b	0
 763  0135 00            	dc.b	0
 764  0136 0c            	dc.b	12
 765  0137 02            	dc.b	2
 766  0138 0c            	dc.b	12
 767  0139 00            	dc.b	0
 768  013a 00            	dc.b	0
 769  013b 80            	dc.b	128
 770  013c 80            	dc.b	128
 771  013d 80            	dc.b	128
 772  013e 80            	dc.b	128
 773  013f 80            	dc.b	128
 774  0140 01            	dc.b	1
 775  0141 02            	dc.b	2
 776  0142 00            	dc.b	0
 777  0143 00            	dc.b	0
 778  0144 00            	dc.b	0
 779  0145 68            	dc.b	104
 780  0146 58            	dc.b	88
 781  0147 78            	dc.b	120
 782  0148 40            	dc.b	64
 783  0149 00            	dc.b	0
 784  014a 7e            	dc.b	126
 785  014b 48            	dc.b	72
 786  014c 30            	dc.b	48
 787  014d 00            	dc.b	0
 788  014e 00            	dc.b	0
 789  014f 78            	dc.b	120
 790  0150 48            	dc.b	72
 791  0151 48            	dc.b	72
 792  0152 00            	dc.b	0
 793  0153 00            	dc.b	0
 794  0154 78            	dc.b	120
 795  0155 48            	dc.b	72
 796  0156 7e            	dc.b	126
 797  0157 00            	dc.b	0
 798  0158 00            	dc.b	0
 799  0159 30            	dc.b	48
 800  015a 68            	dc.b	104
 801  015b 50            	dc.b	80
 802  015c 00            	dc.b	0
 803  015d 00            	dc.b	0
 804  015e 08            	dc.b	8
 805  015f 7c            	dc.b	124
 806  0160 0a            	dc.b	10
 807  0161 00            	dc.b	0
 808  0162 00            	dc.b	0
 809  0163 b8            	dc.b	184
 810  0164 a8            	dc.b	168
 811  0165 f8            	dc.b	248
 812  0166 00            	dc.b	0
 813  0167 00            	dc.b	0
 814  0168 7e            	dc.b	126
 815  0169 08            	dc.b	8
 816  016a 70            	dc.b	112
 817  016b 00            	dc.b	0
 818  016c 00            	dc.b	0
 819  016d 7a            	dc.b	122
 820  016e 00            	dc.b	0
 821  016f 00            	dc.b	0
 822  0170 00            	dc.b	0
 823  0171 00            	dc.b	0
 824  0172 40            	dc.b	64
 825  0173 7a            	dc.b	122
 826  0174 00            	dc.b	0
 827  0175 00            	dc.b	0
 828  0176 00            	dc.b	0
 829  0177 7e            	dc.b	126
 830  0178 30            	dc.b	48
 831  0179 48            	dc.b	72
 832  017a 00            	dc.b	0
 833  017b 00            	dc.b	0
 834  017c 7e            	dc.b	126
 835  017d 00            	dc.b	0
 836  017e 00            	dc.b	0
 837  017f 00            	dc.b	0
 838  0180 00            	dc.b	0
 839  0181 78            	dc.b	120
 840  0182 08            	dc.b	8
 841  0183 70            	dc.b	112
 842  0184 08            	dc.b	8
 843  0185 78            	dc.b	120
 844  0186 78            	dc.b	120
 845  0187 08            	dc.b	8
 846  0188 70            	dc.b	112
 847  0189 00            	dc.b	0
 848  018a 00            	dc.b	0
 849  018b 30            	dc.b	48
 850  018c 48            	dc.b	72
 851  018d 48            	dc.b	72
 852  018e 30            	dc.b	48
 853  018f 00            	dc.b	0
 854  0190 f8            	dc.b	248
 855  0191 48            	dc.b	72
 856  0192 30            	dc.b	48
 857  0193 00            	dc.b	0
 858  0194 00            	dc.b	0
 859  0195 38            	dc.b	56
 860  0196 28            	dc.b	40
 861  0197 f8            	dc.b	248
 862  0198 00            	dc.b	0
 863  0199 00            	dc.b	0
 864  019a 78            	dc.b	120
 865  019b 08            	dc.b	8
 866  019c 08            	dc.b	8
 867  019d 00            	dc.b	0
 868  019e 00            	dc.b	0
 869  019f 58            	dc.b	88
 870  01a0 58            	dc.b	88
 871  01a1 68            	dc.b	104
 872  01a2 00            	dc.b	0
 873  01a3 00            	dc.b	0
 874  01a4 7c            	dc.b	124
 875  01a5 48            	dc.b	72
 876  01a6 00            	dc.b	0
 877  01a7 00            	dc.b	0
 878  01a8 00            	dc.b	0
 879  01a9 78            	dc.b	120
 880  01aa 40            	dc.b	64
 881  01ab 78            	dc.b	120
 882  01ac 00            	dc.b	0
 883  01ad 00            	dc.b	0
 884  01ae 38            	dc.b	56
 885  01af 40            	dc.b	64
 886  01b0 38            	dc.b	56
 887  01b1 00            	dc.b	0
 888  01b2 00            	dc.b	0
 889  01b3 38            	dc.b	56
 890  01b4 60            	dc.b	96
 891  01b5 18            	dc.b	24
 892  01b6 60            	dc.b	96
 893  01b7 38            	dc.b	56
 894  01b8 48            	dc.b	72
 895  01b9 30            	dc.b	48
 896  01ba 48            	dc.b	72
 897  01bb 00            	dc.b	0
 898  01bc 00            	dc.b	0
 899  01bd 98            	dc.b	152
 900  01be 60            	dc.b	96
 901  01bf 18            	dc.b	24
 902  01c0 00            	dc.b	0
 903  01c1 00            	dc.b	0
 904  01c2 48            	dc.b	72
 905  01c3 68            	dc.b	104
 906  01c4 58            	dc.b	88
 907  01c5 00            	dc.b	0
 908  01c6 00            	dc.b	0
 909  01c7 10            	dc.b	16
 910  01c8 ef            	dc.b	239
 911  01c9 81            	dc.b	129
 912  01ca 00            	dc.b	0
 913  01cb 00            	dc.b	0
 914  01cc 00            	dc.b	0
 915  01cd ff            	dc.b	255
 916  01ce 00            	dc.b	0
 917  01cf 00            	dc.b	0
 918  01d0 00            	dc.b	0
 919  01d1 81            	dc.b	129
 920  01d2 ef            	dc.b	239
 921  01d3 10            	dc.b	16
 922  01d4 00            	dc.b	0
 923  01d5 00            	dc.b	0
 924  01d6 10            	dc.b	16
 925  01d7 10            	dc.b	16
 926  01d8 20            	dc.b	32
 927  01d9 20            	dc.b	32
 928  01da 00            	dc.b	0
 959                     	switch	.const
 960  01db               _welcomeMSG:
 961  01db 477265656e68  	dc.b	"Greenhouse Data Lo"
 962  01ed 6767657200    	dc.b	"gger",0
 999                     ; 10 void LCD_init()
 999                     ; 11 {
1000                     	switch	.text
1001  0074               _LCD_init:
1005                     ; 13     LCD_gpio_init();
1007  0074 ad8a          	call	L3_LCD_gpio_init
1009                     ; 16     LCD_CE_clear();
1011  0076 adaf          	call	L76_LCD_CE_clear
1013                     ; 17     LCD_RST_clear();
1015  0078 adb7          	call	L311_LCD_RST_clear
1017                     ; 19     LCD_delay_ms(50);
1019  007a ae0032        	ldw	x,#50
1020  007d adbb          	call	L541_LCD_delay_ms
1022                     ; 21     LCD_RST_set();
1024  007f adab          	call	L101_LCD_RST_set
1026                     ; 22     LCD_CE_set();
1028  0081 ad98          	call	L74_LCD_CE_set
1030                     ; 24     LCD_cmd(0x21); // extended commands
1032  0083 a621          	ld	a,#33
1033  0085 cd01dd        	call	_LCD_cmd
1035                     ; 25     LCD_cmd(0xc0); // contrast Vop=6.4V
1037  0088 a6c0          	ld	a,#192
1038  008a cd01dd        	call	_LCD_cmd
1040                     ; 26     LCD_cmd(0x04); // temperature coefficient
1042  008d a604          	ld	a,#4
1043  008f cd01dd        	call	_LCD_cmd
1045                     ; 27     LCD_cmd(0x13); // bias = 1:48
1047  0092 a613          	ld	a,#19
1048  0094 cd01dd        	call	_LCD_cmd
1050                     ; 29     LCD_cmd(0x20); // standard commands
1052  0097 a620          	ld	a,#32
1053  0099 cd01dd        	call	_LCD_cmd
1055                     ; 30     LCD_cmd(0x0C); // normal mode
1057  009c a60c          	ld	a,#12
1058  009e cd01dd        	call	_LCD_cmd
1060                     ; 32     LCD_clear();
1062  00a1 cd01ff        	call	_LCD_clear
1064                     ; 39 }
1067  00a4 81            	ret
1106                     ; 41 void LCD_welcome()
1106                     ; 42 {
1107                     	switch	.text
1108  00a5               _LCD_welcome:
1110  00a5 89            	pushw	x
1111       00000002      OFST:	set	2
1114                     ; 43     LCD_goto(0, 2);
1116  00a6 ae0002        	ldw	x,#2
1117  00a9 cd021e        	call	_LCD_goto
1119                     ; 46         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1121  00ac 5f            	clrw	x
1122  00ad 1f01          	ldw	(OFST-1,sp),x
1124  00af               L752:
1125                     ; 47             LCD_putc(welcomeMSG[i]);
1127  00af 1e01          	ldw	x,(OFST-1,sp)
1128  00b1 d601db        	ld	a,(_welcomeMSG,x)
1129  00b4 cd022c        	call	_LCD_putc
1131                     ; 46         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1133  00b7 1e01          	ldw	x,(OFST-1,sp)
1134  00b9 1c0001        	addw	x,#1
1135  00bc 1f01          	ldw	(OFST-1,sp),x
1139  00be 1e01          	ldw	x,(OFST-1,sp)
1140  00c0 a30016        	cpw	x,#22
1141  00c3 25ea          	jrult	L752
1142                     ; 49     LCD_delay_ms(3000);
1144  00c5 ae0bb8        	ldw	x,#3000
1145  00c8 cd003a        	call	L541_LCD_delay_ms
1147                     ; 50     LCD_clear();
1149  00cb cd01ff        	call	_LCD_clear
1151                     ; 51 }
1154  00ce 85            	popw	x
1155  00cf 81            	ret
1158                     	switch	.const
1159  01f2               L562_homeMsg:
1160  01f2 686f6d6500    	dc.b	"home",0
1161  01f7               L762_tempMsg:
1162  01f7 74656d702020  	dc.b	"temp      : ",0
1163  0204               L172_humMsg:
1164  0204 68756d696469  	dc.b	"humidity : ",0
1239                     ; 53 void LCD_homescreen(char temperature[], char humidity[])
1239                     ; 54 {
1240                     	switch	.text
1241  00d0               _LCD_homescreen:
1243  00d0 89            	pushw	x
1244  00d1 521e          	subw	sp,#30
1245       0000001e      OFST:	set	30
1248                     ; 55     char homeMsg[] = "home";
1250  00d3 96            	ldw	x,sp
1251  00d4 1c0001        	addw	x,#OFST-29
1252  00d7 90ae01f2      	ldw	y,#L562_homeMsg
1253  00db a605          	ld	a,#5
1254  00dd cd0000        	call	c_xymov
1256                     ; 56     char tempMsg[] = "temp      : ";
1258  00e0 96            	ldw	x,sp
1259  00e1 1c0006        	addw	x,#OFST-24
1260  00e4 90ae01f7      	ldw	y,#L762_tempMsg
1261  00e8 a60d          	ld	a,#13
1262  00ea cd0000        	call	c_xymov
1264                     ; 57     char humMsg[] = "humidity : ";
1266  00ed 96            	ldw	x,sp
1267  00ee 1c0013        	addw	x,#OFST-11
1268  00f1 90ae0204      	ldw	y,#L172_humMsg
1269  00f5 a60c          	ld	a,#12
1270  00f7 cd0000        	call	c_xymov
1272                     ; 59     strcat(tempMsg, temperature);
1274  00fa 1e1f          	ldw	x,(OFST+1,sp)
1275  00fc 89            	pushw	x
1276  00fd 96            	ldw	x,sp
1277  00fe 1c0008        	addw	x,#OFST-22
1278  0101 cd0000        	call	_strcat
1280  0104 85            	popw	x
1281                     ; 60     strcat(humMsg, humidity);
1283  0105 1e23          	ldw	x,(OFST+5,sp)
1284  0107 89            	pushw	x
1285  0108 96            	ldw	x,sp
1286  0109 1c0015        	addw	x,#OFST-9
1287  010c cd0000        	call	_strcat
1289  010f 85            	popw	x
1290                     ; 62     LCD_writemsg(tempMsg, sizeof(tempMsg), 0, 1);
1292  0110 4b01          	push	#1
1293  0112 4b00          	push	#0
1294  0114 4b0d          	push	#13
1295  0116 96            	ldw	x,sp
1296  0117 1c0009        	addw	x,#OFST-21
1297  011a cd026a        	call	_LCD_writemsg
1299  011d 5b03          	addw	sp,#3
1300                     ; 63     LCD_writemsg(humMsg, sizeof(humMsg), 0, 2);
1302  011f 4b02          	push	#2
1303  0121 4b00          	push	#0
1304  0123 4b0c          	push	#12
1305  0125 96            	ldw	x,sp
1306  0126 1c0016        	addw	x,#OFST-8
1307  0129 cd026a        	call	_LCD_writemsg
1309  012c 5b03          	addw	sp,#3
1310                     ; 64     LCD_writemsg(homeMsg, sizeof(homeMsg), 0, 5);
1312  012e 4b05          	push	#5
1313  0130 4b00          	push	#0
1314  0132 4b05          	push	#5
1315  0134 96            	ldw	x,sp
1316  0135 1c0004        	addw	x,#OFST-26
1317  0138 cd026a        	call	_LCD_writemsg
1319  013b 5b03          	addw	sp,#3
1320                     ; 65 }
1323  013d 5b20          	addw	sp,#32
1324  013f 81            	ret
1327                     	bsct
1328  0000               L133_menuMsg:
1329  0000 4d656e7500    	dc.b	"Menu",0
1330  0005               L333_op1:
1331  0005 312e20446169  	dc.b	"1. Daily Min/Max",0
1332  0016               L533_op2:
1333  0016 322e2053656e  	dc.b	"2. Send Data",0
1334  0023               L733_op3:
1335  0023 332e20536574  	dc.b	"3. Settings",0
1399                     ; 67 void LCD_menu()
1399                     ; 68 {
1400                     	switch	.text
1401  0140               _LCD_menu:
1405                     ; 74     LCD_writemsg(menuMsg, sizeof(menuMsg), 0, 0);
1407  0140 4b00          	push	#0
1408  0142 4b00          	push	#0
1409  0144 4b05          	push	#5
1410  0146 ae0000        	ldw	x,#L133_menuMsg
1411  0149 cd026a        	call	_LCD_writemsg
1413  014c 5b03          	addw	sp,#3
1414                     ; 75     LCD_writemsg(op1, sizeof(op1), 1, 1);
1416  014e 4b01          	push	#1
1417  0150 4b01          	push	#1
1418  0152 4b11          	push	#17
1419  0154 ae0005        	ldw	x,#L333_op1
1420  0157 cd026a        	call	_LCD_writemsg
1422  015a 5b03          	addw	sp,#3
1423                     ; 76     LCD_writemsg(op2, sizeof(op2), 1, 2);
1425  015c 4b02          	push	#2
1426  015e 4b01          	push	#1
1427  0160 4b0d          	push	#13
1428  0162 ae0016        	ldw	x,#L533_op2
1429  0165 cd026a        	call	_LCD_writemsg
1431  0168 5b03          	addw	sp,#3
1432                     ; 77     LCD_writemsg(op3, sizeof(op3), 1, 3);
1434  016a 4b03          	push	#3
1435  016c 4b01          	push	#1
1436  016e 4b0c          	push	#12
1437  0170 ae0023        	ldw	x,#L733_op3
1438  0173 cd026a        	call	_LCD_writemsg
1440  0176 5b03          	addw	sp,#3
1441                     ; 78 }
1444  0178 81            	ret
1447                     	bsct
1448  002f               L373_tempHeader:
1449  002f 54656d706572  	dc.b	"Temperature",0
1450  003b               L573_humidityHeader:
1451  003b 48756d696469  	dc.b	"Humidity",0
1452  0044               L773_minHeader:
1453  0044 4d696e3a2000  	dc.b	"Min: ",0
1454  004a               L104_maxHeader:
1455  004a 4d61783a2000  	dc.b	"Max: ",0
1528                     ; 80 void LCD_min_max(uint8_t minTemperature, uint8_t maxTemperature, uint8_t minHumidity, uint8_t maxHumidity)
1528                     ; 81 {
1529                     	switch	.text
1530  0179               _LCD_min_max:
1534                     ; 87     LCD_writemsg(tempHeader, sizeof(tempHeader), 20, 0);
1536  0179 4b00          	push	#0
1537  017b 4b14          	push	#20
1538  017d 4b0c          	push	#12
1539  017f ae002f        	ldw	x,#L373_tempHeader
1540  0182 cd026a        	call	_LCD_writemsg
1542  0185 5b03          	addw	sp,#3
1543                     ; 88     LCD_writemsg(minHeader, sizeof(minHeader), 1, 1);
1545  0187 4b01          	push	#1
1546  0189 4b01          	push	#1
1547  018b 4b06          	push	#6
1548  018d ae0044        	ldw	x,#L773_minHeader
1549  0190 cd026a        	call	_LCD_writemsg
1551  0193 5b03          	addw	sp,#3
1552                     ; 89     LCD_writemsg(maxHeader, sizeof(maxHeader), 30, 1);
1554  0195 4b01          	push	#1
1555  0197 4b1e          	push	#30
1556  0199 4b06          	push	#6
1557  019b ae004a        	ldw	x,#L104_maxHeader
1558  019e cd026a        	call	_LCD_writemsg
1560  01a1 5b03          	addw	sp,#3
1561                     ; 91     LCD_writemsg(humidityHeader, sizeof(humidityHeader), 20, 4);
1563  01a3 4b04          	push	#4
1564  01a5 4b14          	push	#20
1565  01a7 4b09          	push	#9
1566  01a9 ae003b        	ldw	x,#L573_humidityHeader
1567  01ac cd026a        	call	_LCD_writemsg
1569  01af 5b03          	addw	sp,#3
1570                     ; 92     LCD_writemsg(minHeader, sizeof(minHeader), 1, 5);
1572  01b1 4b05          	push	#5
1573  01b3 4b01          	push	#1
1574  01b5 4b06          	push	#6
1575  01b7 ae0044        	ldw	x,#L773_minHeader
1576  01ba cd026a        	call	_LCD_writemsg
1578  01bd 5b03          	addw	sp,#3
1579                     ; 93     LCD_writemsg(maxHeader, sizeof(maxHeader), 30, 5);
1581  01bf 4b05          	push	#5
1582  01c1 4b1e          	push	#30
1583  01c3 4b06          	push	#6
1584  01c5 ae004a        	ldw	x,#L104_maxHeader
1585  01c8 cd026a        	call	_LCD_writemsg
1587  01cb 5b03          	addw	sp,#3
1588                     ; 94 }
1591  01cd 81            	ret
1594                     	bsct
1595  0050               L144_settingsHeader:
1596  0050 507265737320  	dc.b	"Press OK to change"
1597  0062 207365747469  	dc.b	" settings",0
1632                     ; 96 void LCD_display_settings()
1632                     ; 97 {
1633                     	switch	.text
1634  01ce               _LCD_display_settings:
1638                     ; 99     LCD_writemsg(settingsHeader, sizeof(settingsHeader), 20, 0);
1640  01ce 4b00          	push	#0
1641  01d0 4b14          	push	#20
1642  01d2 4b1c          	push	#28
1643  01d4 ae0050        	ldw	x,#L144_settingsHeader
1644  01d7 cd026a        	call	_LCD_writemsg
1646  01da 5b03          	addw	sp,#3
1647                     ; 100 }
1650  01dc 81            	ret
1688                     ; 102 void LCD_cmd(uint8_t cmd)
1688                     ; 103 {
1689                     	switch	.text
1690  01dd               _LCD_cmd:
1692  01dd 88            	push	a
1693       00000000      OFST:	set	0
1696                     ; 104     LCD_CE_clear();
1698  01de cd0027        	call	L76_LCD_CE_clear
1700                     ; 105     LCD_DC_clear();
1702  01e1 cd0016        	call	L53_LCD_DC_clear
1704                     ; 106     LCD_SPI_write(cmd);
1706  01e4 7b01          	ld	a,(OFST+1,sp)
1707  01e6 cd0036        	call	L521_LCD_SPI_write
1709                     ; 107     LCD_CE_set();
1711  01e9 cd001b        	call	L74_LCD_CE_set
1713                     ; 108 }
1716  01ec 84            	pop	a
1717  01ed 81            	ret
1755                     ; 110 void LCD_write(uint8_t data)
1755                     ; 111 {
1756                     	switch	.text
1757  01ee               _LCD_write:
1759  01ee 88            	push	a
1760       00000000      OFST:	set	0
1763                     ; 112     LCD_CE_clear();
1765  01ef cd0027        	call	L76_LCD_CE_clear
1767                     ; 113     LCD_DC_set();
1769  01f2 cd0011        	call	L32_LCD_DC_set
1771                     ; 114     LCD_SPI_write(data);
1773  01f5 7b01          	ld	a,(OFST+1,sp)
1774  01f7 cd0036        	call	L521_LCD_SPI_write
1776                     ; 115     LCD_CE_set();
1778  01fa cd001b        	call	L74_LCD_CE_set
1780                     ; 116 }
1783  01fd 84            	pop	a
1784  01fe 81            	ret
1820                     ; 118 void LCD_clear()
1820                     ; 119 {
1821                     	switch	.text
1822  01ff               _LCD_clear:
1824  01ff 89            	pushw	x
1825       00000002      OFST:	set	2
1828                     ; 120     uint16_t i = 84 * 6;
1830  0200 ae01f8        	ldw	x,#504
1831  0203 1f01          	ldw	(OFST-1,sp),x
1833                     ; 121     LCD_goto(0, 0);
1835  0205 5f            	clrw	x
1836  0206 ad16          	call	_LCD_goto
1839  0208 2003          	jra	L535
1840  020a               L335:
1841                     ; 123         LCD_write(0);
1843  020a 4f            	clr	a
1844  020b ade1          	call	_LCD_write
1846  020d               L535:
1847                     ; 122     while (i-- > 0)
1849  020d 1e01          	ldw	x,(OFST-1,sp)
1850  020f 1d0001        	subw	x,#1
1851  0212 1f01          	ldw	(OFST-1,sp),x
1852  0214 1c0001        	addw	x,#1
1854  0217 a30000        	cpw	x,#0
1855  021a 26ee          	jrne	L335
1856                     ; 124 }
1859  021c 85            	popw	x
1860  021d 81            	ret
1904                     ; 126 void LCD_goto(uint8_t col, uint8_t row)
1904                     ; 127 {
1905                     	switch	.text
1906  021e               _LCD_goto:
1908  021e 89            	pushw	x
1909       00000000      OFST:	set	0
1912                     ; 128     LCD_cmd(0x80 | col);
1914  021f 9e            	ld	a,xh
1915  0220 aa80          	or	a,#128
1916  0222 adb9          	call	_LCD_cmd
1918                     ; 129     LCD_cmd(0x40 | row);
1920  0224 7b02          	ld	a,(OFST+2,sp)
1921  0226 aa40          	or	a,#64
1922  0228 adb3          	call	_LCD_cmd
1924                     ; 130 }
1927  022a 85            	popw	x
1928  022b 81            	ret
1983                     ; 132 void LCD_putc(char c)
1983                     ; 133 {
1984                     	switch	.text
1985  022c               _LCD_putc:
1987  022c 88            	push	a
1988  022d 5203          	subw	sp,#3
1989       00000003      OFST:	set	3
1992                     ; 134     if (c == ' ')
1994  022f a120          	cp	a,#32
1995  0231 2608          	jrne	L116
1996                     ; 136         LCD_write(0);
1998  0233 4f            	clr	a
1999  0234 adb8          	call	_LCD_write
2001                     ; 137         LCD_write(0);
2003  0236 4f            	clr	a
2004  0237 adb5          	call	_LCD_write
2007  0239 202c          	jra	L316
2008  023b               L116:
2009                     ; 141         const char *ptr = &font[(c - 32) * FONT_WIDTH];
2011  023b 7b04          	ld	a,(OFST+1,sp)
2012  023d 97            	ld	xl,a
2013  023e a605          	ld	a,#5
2014  0240 42            	mul	x,a
2015  0241 1d00a0        	subw	x,#160
2016  0244 1c0000        	addw	x,#_font
2017  0247 1f02          	ldw	(OFST-1,sp),x
2019                     ; 143         for (i = 0; i < FONT_WIDTH; i++, ptr++)
2021  0249 0f01          	clr	(OFST-2,sp)
2023  024b               L516:
2024                     ; 144             if (*ptr)
2026  024b 1e02          	ldw	x,(OFST-1,sp)
2027  024d 7d            	tnz	(x)
2028  024e 2705          	jreq	L326
2029                     ; 145                 LCD_write(*ptr);
2031  0250 1e02          	ldw	x,(OFST-1,sp)
2032  0252 f6            	ld	a,(x)
2033  0253 ad99          	call	_LCD_write
2035  0255               L326:
2036                     ; 143         for (i = 0; i < FONT_WIDTH; i++, ptr++)
2038  0255 0c01          	inc	(OFST-2,sp)
2040  0257 1e02          	ldw	x,(OFST-1,sp)
2041  0259 1c0001        	addw	x,#1
2042  025c 1f02          	ldw	(OFST-1,sp),x
2046  025e 7b01          	ld	a,(OFST-2,sp)
2047  0260 a105          	cp	a,#5
2048  0262 25e7          	jrult	L516
2049                     ; 146         LCD_write(0);
2051  0264 4f            	clr	a
2052  0265 ad87          	call	_LCD_write
2054  0267               L316:
2055                     ; 148 }
2058  0267 5b04          	addw	sp,#4
2059  0269 81            	ret
2132                     ; 150 void LCD_writemsg(char *msg, uint8_t msgSize, uint8_t col, uint8_t row)
2132                     ; 151 {
2133                     	switch	.text
2134  026a               _LCD_writemsg:
2136  026a 89            	pushw	x
2137  026b 89            	pushw	x
2138       00000002      OFST:	set	2
2141                     ; 152     LCD_goto(col, row);
2143  026c 7b09          	ld	a,(OFST+7,sp)
2144  026e 97            	ld	xl,a
2145  026f 7b08          	ld	a,(OFST+6,sp)
2146  0271 95            	ld	xh,a
2147  0272 adaa          	call	_LCD_goto
2149                     ; 155         for (i = 0; i < msgSize - 1; i++)
2151  0274 5f            	clrw	x
2152  0275 1f01          	ldw	(OFST-1,sp),x
2155  0277 200f          	jra	L766
2156  0279               L366:
2157                     ; 156             LCD_putc(msg[i]);
2159  0279 1e01          	ldw	x,(OFST-1,sp)
2160  027b 72fb03        	addw	x,(OFST+1,sp)
2161  027e f6            	ld	a,(x)
2162  027f adab          	call	_LCD_putc
2164                     ; 155         for (i = 0; i < msgSize - 1; i++)
2166  0281 1e01          	ldw	x,(OFST-1,sp)
2167  0283 1c0001        	addw	x,#1
2168  0286 1f01          	ldw	(OFST-1,sp),x
2170  0288               L766:
2173  0288 9c            	rvf
2174  0289 7b07          	ld	a,(OFST+5,sp)
2175  028b 5f            	clrw	x
2176  028c 97            	ld	xl,a
2177  028d 5a            	decw	x
2178  028e 1301          	cpw	x,(OFST-1,sp)
2179  0290 2ce7          	jrsgt	L366
2180                     ; 159 }
2183  0292 5b04          	addw	sp,#4
2184  0294 81            	ret
2209                     	xdef	_welcomeMSG
2210                     	xref	_strcat
2211                     	xdef	_font
2212                     	xref	_SPI_write
2213                     	xdef	_LCD_display_settings
2214                     	xdef	_LCD_menu
2215                     	xdef	_LCD_min_max
2216                     	xdef	_LCD_homescreen
2217                     	xdef	_LCD_welcome
2218                     	xdef	_LCD_writemsg
2219                     	xdef	_LCD_write
2220                     	xdef	_LCD_putc
2221                     	xdef	_LCD_goto
2222                     	xdef	_LCD_cmd
2223                     	xdef	_LCD_clear
2224                     	xdef	_LCD_init
2225                     	xref.b	c_x
2244                     	xref	c_xymov
2245                     	xref	c_lcmp
2246                     	xref	c_smul
2247                     	xref	c_ltor
2248                     	xref	c_lgadc
2249                     	xref	c_rtol
2250                     	xref	c_itolx
2251                     	end
