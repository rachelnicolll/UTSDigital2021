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
 963                     	xref	_LCD_menu
 964                     	xref	_LCD_homescreen
 965                     	xref	_LCD_welcome
1005                     ; 9 void LCD_init()
1005                     ; 10 {
1006                     	switch	.text
1007  0074               _LCD_init:
1011                     ; 12     LCD_gpio_init();
1013  0074 ad8a          	call	L3_LCD_gpio_init
1015                     ; 15     LCD_CE_clear();
1017  0076 adaf          	call	L76_LCD_CE_clear
1019                     ; 16     LCD_RST_clear();
1021  0078 adb7          	call	L311_LCD_RST_clear
1023                     ; 18     LCD_delay_ms(50);
1025  007a ae0032        	ldw	x,#50
1026  007d adbb          	call	L541_LCD_delay_ms
1028                     ; 20     LCD_RST_set();
1030  007f adab          	call	L101_LCD_RST_set
1032                     ; 21     LCD_CE_set();
1034  0081 ad98          	call	L74_LCD_CE_set
1036                     ; 23     LCD_cmd(0x21); // extended commands
1038  0083 a621          	ld	a,#33
1039  0085 cd0191        	call	_LCD_cmd
1041                     ; 24     LCD_cmd(0xc0); // contrast Vop=6.4V
1043  0088 a6c0          	ld	a,#192
1044  008a cd0191        	call	_LCD_cmd
1046                     ; 25     LCD_cmd(0x04); // temperature coefficient
1048  008d a604          	ld	a,#4
1049  008f cd0191        	call	_LCD_cmd
1051                     ; 26     LCD_cmd(0x13); // bias = 1:48
1053  0092 a613          	ld	a,#19
1054  0094 cd0191        	call	_LCD_cmd
1056                     ; 28     LCD_cmd(0x20); // standard commands
1058  0097 a620          	ld	a,#32
1059  0099 cd0191        	call	_LCD_cmd
1061                     ; 29     LCD_cmd(0x0C); // normal mode
1063  009c a60c          	ld	a,#12
1064  009e cd0191        	call	_LCD_cmd
1066                     ; 31 		LCD_clear();
1068  00a1 cd01b3        	call	_LCD_clear
1070                     ; 32     LCD_welcome();
1072  00a4 ad16          	call	_LCD_welcome
1074                     ; 33     LCD_homescreen("18", "70");
1076  00a6 ae0210        	ldw	x,#L342
1077  00a9 89            	pushw	x
1078  00aa ae0213        	ldw	x,#L142
1079  00ad ad38          	call	_LCD_homescreen
1081  00af 85            	popw	x
1082                     ; 34 		LCD_clear();
1084  00b0 cd01b3        	call	_LCD_clear
1086                     ; 35 		LCD_delay_ms(2000);
1088  00b3 ae07d0        	ldw	x,#2000
1089  00b6 ad82          	call	L541_LCD_delay_ms
1091                     ; 36 		LCD_menu();
1093  00b8 cd0157        	call	_LCD_menu
1095                     ; 38 }
1098  00bb 81            	ret
1137                     ; 40 void LCD_welcome()
1137                     ; 41 {
1138                     	switch	.text
1139  00bc               _LCD_welcome:
1141  00bc 89            	pushw	x
1142       00000002      OFST:	set	2
1145                     ; 42     LCD_goto(0, 2);
1147  00bd ae0002        	ldw	x,#2
1148  00c0 cd01d2        	call	_LCD_goto
1150                     ; 45         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1152  00c3 5f            	clrw	x
1153  00c4 1f01          	ldw	(OFST-1,sp),x
1155  00c6               L362:
1156                     ; 46             LCD_putc(welcomeMSG[i]);
1158  00c6 1e01          	ldw	x,(OFST-1,sp)
1159  00c8 d601db        	ld	a,(_welcomeMSG,x)
1160  00cb cd01e0        	call	_LCD_putc
1162                     ; 45         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1164  00ce 1e01          	ldw	x,(OFST-1,sp)
1165  00d0 1c0001        	addw	x,#1
1166  00d3 1f01          	ldw	(OFST-1,sp),x
1170  00d5 1e01          	ldw	x,(OFST-1,sp)
1171  00d7 a30016        	cpw	x,#22
1172  00da 25ea          	jrult	L362
1173                     ; 48     LCD_delay_ms(3000);
1175  00dc ae0bb8        	ldw	x,#3000
1176  00df cd003a        	call	L541_LCD_delay_ms
1178                     ; 49     LCD_clear();
1180  00e2 cd01b3        	call	_LCD_clear
1182                     ; 50 }
1185  00e5 85            	popw	x
1186  00e6 81            	ret
1189                     	switch	.const
1190  01f2               L172_homeMsg:
1191  01f2 686f6d6500    	dc.b	"home",0
1192  01f7               L372_tempMsg:
1193  01f7 74656d702020  	dc.b	"temp      : ",0
1194  0204               L572_humMsg:
1195  0204 68756d696469  	dc.b	"humidity : ",0
1270                     ; 52 void LCD_homescreen(char temperature[], char humidity[])
1270                     ; 53 {
1271                     	switch	.text
1272  00e7               _LCD_homescreen:
1274  00e7 89            	pushw	x
1275  00e8 521e          	subw	sp,#30
1276       0000001e      OFST:	set	30
1279                     ; 54     char homeMsg[] = "home";
1281  00ea 96            	ldw	x,sp
1282  00eb 1c0001        	addw	x,#OFST-29
1283  00ee 90ae01f2      	ldw	y,#L172_homeMsg
1284  00f2 a605          	ld	a,#5
1285  00f4 cd0000        	call	c_xymov
1287                     ; 55     char tempMsg[] = "temp      : ";
1289  00f7 96            	ldw	x,sp
1290  00f8 1c0006        	addw	x,#OFST-24
1291  00fb 90ae01f7      	ldw	y,#L372_tempMsg
1292  00ff a60d          	ld	a,#13
1293  0101 cd0000        	call	c_xymov
1295                     ; 56     char humMsg[]  = "humidity : ";
1297  0104 96            	ldw	x,sp
1298  0105 1c0013        	addw	x,#OFST-11
1299  0108 90ae0204      	ldw	y,#L572_humMsg
1300  010c a60c          	ld	a,#12
1301  010e cd0000        	call	c_xymov
1303                     ; 58     strcat(tempMsg, temperature);
1305  0111 1e1f          	ldw	x,(OFST+1,sp)
1306  0113 89            	pushw	x
1307  0114 96            	ldw	x,sp
1308  0115 1c0008        	addw	x,#OFST-22
1309  0118 cd0000        	call	_strcat
1311  011b 85            	popw	x
1312                     ; 59     strcat(humMsg, humidity);
1314  011c 1e23          	ldw	x,(OFST+5,sp)
1315  011e 89            	pushw	x
1316  011f 96            	ldw	x,sp
1317  0120 1c0015        	addw	x,#OFST-9
1318  0123 cd0000        	call	_strcat
1320  0126 85            	popw	x
1321                     ; 61     LCD_writemsg(tempMsg, sizeof(tempMsg), 0, 1);
1323  0127 4b01          	push	#1
1324  0129 4b00          	push	#0
1325  012b 4b0d          	push	#13
1326  012d 96            	ldw	x,sp
1327  012e 1c0009        	addw	x,#OFST-21
1328  0131 cd021e        	call	_LCD_writemsg
1330  0134 5b03          	addw	sp,#3
1331                     ; 62     LCD_writemsg(humMsg, sizeof(humMsg), 0, 2);
1333  0136 4b02          	push	#2
1334  0138 4b00          	push	#0
1335  013a 4b0c          	push	#12
1336  013c 96            	ldw	x,sp
1337  013d 1c0016        	addw	x,#OFST-8
1338  0140 cd021e        	call	_LCD_writemsg
1340  0143 5b03          	addw	sp,#3
1341                     ; 63     LCD_writemsg(homeMsg, sizeof(homeMsg), 0, 5);
1343  0145 4b05          	push	#5
1344  0147 4b00          	push	#0
1345  0149 4b05          	push	#5
1346  014b 96            	ldw	x,sp
1347  014c 1c0004        	addw	x,#OFST-26
1348  014f cd021e        	call	_LCD_writemsg
1350  0152 5b03          	addw	sp,#3
1351                     ; 65 }
1354  0154 5b20          	addw	sp,#32
1355  0156 81            	ret
1358                     	bsct
1359  0000               L533_menuMsg:
1360  0000 4d656e7500    	dc.b	"Menu",0
1361  0005               L733_op1:
1362  0005 312e20446169  	dc.b	"1. Daily Min/Max",0
1363  0016               L143_op2:
1364  0016 322e2053656e  	dc.b	"2. Send Data",0
1365  0023               L343_op3:
1366  0023 332e20536574  	dc.b	"3. Settings",0
1430                     ; 67 void LCD_menu()
1430                     ; 68 {
1431                     	switch	.text
1432  0157               _LCD_menu:
1436                     ; 74     LCD_writemsg(menuMsg, sizeof(menuMsg), 0,0);
1438  0157 4b00          	push	#0
1439  0159 4b00          	push	#0
1440  015b 4b05          	push	#5
1441  015d ae0000        	ldw	x,#L533_menuMsg
1442  0160 cd021e        	call	_LCD_writemsg
1444  0163 5b03          	addw	sp,#3
1445                     ; 75     LCD_writemsg(op1, sizeof(op1), 1,1);
1447  0165 4b01          	push	#1
1448  0167 4b01          	push	#1
1449  0169 4b11          	push	#17
1450  016b ae0005        	ldw	x,#L733_op1
1451  016e cd021e        	call	_LCD_writemsg
1453  0171 5b03          	addw	sp,#3
1454                     ; 76     LCD_writemsg(op2, sizeof(op2), 1,2);
1456  0173 4b02          	push	#2
1457  0175 4b01          	push	#1
1458  0177 4b0d          	push	#13
1459  0179 ae0016        	ldw	x,#L143_op2
1460  017c cd021e        	call	_LCD_writemsg
1462  017f 5b03          	addw	sp,#3
1463                     ; 77     LCD_writemsg(op3, sizeof(op3), 1,3);
1465  0181 4b03          	push	#3
1466  0183 4b01          	push	#1
1467  0185 4b0c          	push	#12
1468  0187 ae0023        	ldw	x,#L343_op3
1469  018a cd021e        	call	_LCD_writemsg
1471  018d 5b03          	addw	sp,#3
1472                     ; 78 }
1475  018f 81            	ret
1478                     	bsct
1479  002f               L773_tempHeader:
1480  002f 54656d706572  	dc.b	"Temperature",0
1481  003b               L104_humidityHeader:
1482  003b 48756d696469  	dc.b	"Humidity",0
1525                     ; 80 void LCD_min_max()
1525                     ; 81 {
1526                     	switch	.text
1527  0190               _LCD_min_max:
1531                     ; 87 }
1534  0190 81            	ret
1572                     ; 89 void LCD_cmd(uint8_t cmd)
1572                     ; 90 {
1573                     	switch	.text
1574  0191               _LCD_cmd:
1576  0191 88            	push	a
1577       00000000      OFST:	set	0
1580                     ; 91     LCD_CE_clear();
1582  0192 cd0027        	call	L76_LCD_CE_clear
1584                     ; 92     LCD_DC_clear();
1586  0195 cd0016        	call	L53_LCD_DC_clear
1588                     ; 93     LCD_SPI_write(cmd);
1590  0198 7b01          	ld	a,(OFST+1,sp)
1591  019a cd0036        	call	L521_LCD_SPI_write
1593                     ; 94     LCD_CE_set();
1595  019d cd001b        	call	L74_LCD_CE_set
1597                     ; 95 }
1600  01a0 84            	pop	a
1601  01a1 81            	ret
1639                     ; 97 void LCD_write(uint8_t data)
1639                     ; 98 {
1640                     	switch	.text
1641  01a2               _LCD_write:
1643  01a2 88            	push	a
1644       00000000      OFST:	set	0
1647                     ; 99     LCD_CE_clear();
1649  01a3 cd0027        	call	L76_LCD_CE_clear
1651                     ; 100     LCD_DC_set();
1653  01a6 cd0011        	call	L32_LCD_DC_set
1655                     ; 101     LCD_SPI_write(data);
1657  01a9 7b01          	ld	a,(OFST+1,sp)
1658  01ab cd0036        	call	L521_LCD_SPI_write
1660                     ; 102     LCD_CE_set();
1662  01ae cd001b        	call	L74_LCD_CE_set
1664                     ; 103 }
1667  01b1 84            	pop	a
1668  01b2 81            	ret
1704                     ; 105 void LCD_clear()
1704                     ; 106 {
1705                     	switch	.text
1706  01b3               _LCD_clear:
1708  01b3 89            	pushw	x
1709       00000002      OFST:	set	2
1712                     ; 107     uint16_t i = 84 * 6;
1714  01b4 ae01f8        	ldw	x,#504
1715  01b7 1f01          	ldw	(OFST-1,sp),x
1717                     ; 108     LCD_goto(0, 0);
1719  01b9 5f            	clrw	x
1720  01ba ad16          	call	_LCD_goto
1723  01bc 2003          	jra	L105
1724  01be               L774:
1725                     ; 110         LCD_write(0);
1727  01be 4f            	clr	a
1728  01bf ade1          	call	_LCD_write
1730  01c1               L105:
1731                     ; 109     while (i-- > 0)
1733  01c1 1e01          	ldw	x,(OFST-1,sp)
1734  01c3 1d0001        	subw	x,#1
1735  01c6 1f01          	ldw	(OFST-1,sp),x
1736  01c8 1c0001        	addw	x,#1
1738  01cb a30000        	cpw	x,#0
1739  01ce 26ee          	jrne	L774
1740                     ; 111 }
1743  01d0 85            	popw	x
1744  01d1 81            	ret
1788                     ; 113 void LCD_goto(uint8_t col, uint8_t row)
1788                     ; 114 {
1789                     	switch	.text
1790  01d2               _LCD_goto:
1792  01d2 89            	pushw	x
1793       00000000      OFST:	set	0
1796                     ; 115     LCD_cmd(0x80 | col);
1798  01d3 9e            	ld	a,xh
1799  01d4 aa80          	or	a,#128
1800  01d6 adb9          	call	_LCD_cmd
1802                     ; 116     LCD_cmd(0x40 | row);
1804  01d8 7b02          	ld	a,(OFST+2,sp)
1805  01da aa40          	or	a,#64
1806  01dc adb3          	call	_LCD_cmd
1808                     ; 117 }
1811  01de 85            	popw	x
1812  01df 81            	ret
1867                     ; 119 void LCD_putc(char c)
1867                     ; 120 {
1868                     	switch	.text
1869  01e0               _LCD_putc:
1871  01e0 88            	push	a
1872  01e1 5203          	subw	sp,#3
1873       00000003      OFST:	set	3
1876                     ; 121     if (c == ' ')
1878  01e3 a120          	cp	a,#32
1879  01e5 2608          	jrne	L555
1880                     ; 123         LCD_write(0);
1882  01e7 4f            	clr	a
1883  01e8 adb8          	call	_LCD_write
1885                     ; 124         LCD_write(0);
1887  01ea 4f            	clr	a
1888  01eb adb5          	call	_LCD_write
1891  01ed 202c          	jra	L755
1892  01ef               L555:
1893                     ; 128         const char *ptr = &font[(c - 32) * FONT_WIDTH];
1895  01ef 7b04          	ld	a,(OFST+1,sp)
1896  01f1 97            	ld	xl,a
1897  01f2 a605          	ld	a,#5
1898  01f4 42            	mul	x,a
1899  01f5 1d00a0        	subw	x,#160
1900  01f8 1c0000        	addw	x,#_font
1901  01fb 1f02          	ldw	(OFST-1,sp),x
1903                     ; 130         for (i = 0; i < FONT_WIDTH; i++, ptr++)
1905  01fd 0f01          	clr	(OFST-2,sp)
1907  01ff               L165:
1908                     ; 131             if (*ptr)
1910  01ff 1e02          	ldw	x,(OFST-1,sp)
1911  0201 7d            	tnz	(x)
1912  0202 2705          	jreq	L765
1913                     ; 132                 LCD_write(*ptr);
1915  0204 1e02          	ldw	x,(OFST-1,sp)
1916  0206 f6            	ld	a,(x)
1917  0207 ad99          	call	_LCD_write
1919  0209               L765:
1920                     ; 130         for (i = 0; i < FONT_WIDTH; i++, ptr++)
1922  0209 0c01          	inc	(OFST-2,sp)
1924  020b 1e02          	ldw	x,(OFST-1,sp)
1925  020d 1c0001        	addw	x,#1
1926  0210 1f02          	ldw	(OFST-1,sp),x
1930  0212 7b01          	ld	a,(OFST-2,sp)
1931  0214 a105          	cp	a,#5
1932  0216 25e7          	jrult	L165
1933                     ; 133         LCD_write(0);
1935  0218 4f            	clr	a
1936  0219 ad87          	call	_LCD_write
1938  021b               L755:
1939                     ; 135 }
1942  021b 5b04          	addw	sp,#4
1943  021d 81            	ret
2017                     ; 137 void LCD_writemsg(char *msg, uint8_t msgSize, uint8_t col, uint8_t row)
2017                     ; 138 {
2018                     	switch	.text
2019  021e               _LCD_writemsg:
2021  021e 89            	pushw	x
2022  021f 89            	pushw	x
2023       00000002      OFST:	set	2
2026                     ; 139     LCD_goto(col, row);
2028  0220 7b09          	ld	a,(OFST+7,sp)
2029  0222 97            	ld	xl,a
2030  0223 7b08          	ld	a,(OFST+6,sp)
2031  0225 95            	ld	xh,a
2032  0226 adaa          	call	_LCD_goto
2034                     ; 142         for (i = 0; i < msgSize - 1; i++)
2036  0228 5f            	clrw	x
2037  0229 1f01          	ldw	(OFST-1,sp),x
2040  022b 200f          	jra	L336
2041  022d               L726:
2042                     ; 143             LCD_putc(msg[i]);
2044  022d 1e01          	ldw	x,(OFST-1,sp)
2045  022f 72fb03        	addw	x,(OFST+1,sp)
2046  0232 f6            	ld	a,(x)
2047  0233 adab          	call	_LCD_putc
2049                     ; 142         for (i = 0; i < msgSize - 1; i++)
2051  0235 1e01          	ldw	x,(OFST-1,sp)
2052  0237 1c0001        	addw	x,#1
2053  023a 1f01          	ldw	(OFST-1,sp),x
2055  023c               L336:
2058  023c 9c            	rvf
2059  023d 7b07          	ld	a,(OFST+5,sp)
2060  023f 5f            	clrw	x
2061  0240 97            	ld	xl,a
2062  0241 5a            	decw	x
2063  0242 1301          	cpw	x,(OFST-1,sp)
2064  0244 2ce7          	jrsgt	L726
2065                     ; 145     LCD_delay_ms(1000);
2067  0246 ae03e8        	ldw	x,#1000
2068  0249 cd003a        	call	L541_LCD_delay_ms
2070                     ; 147 }
2073  024c 5b04          	addw	sp,#4
2074  024e 81            	ret
2099                     	xdef	_LCD_min_max
2100                     	xdef	_LCD_menu
2101                     	xdef	_LCD_homescreen
2102                     	xdef	_LCD_welcome
2103                     	xdef	_welcomeMSG
2104                     	xref	_strcat
2105                     	xdef	_font
2106                     	xref	_SPI_write
2107                     	xdef	_LCD_writemsg
2108                     	xdef	_LCD_write
2109                     	xdef	_LCD_putc
2110                     	xdef	_LCD_goto
2111                     	xdef	_LCD_cmd
2112                     	xdef	_LCD_clear
2113                     	xdef	_LCD_init
2114                     	switch	.const
2115  0210               L342:
2116  0210 373000        	dc.b	"70",0
2117  0213               L142:
2118  0213 313800        	dc.b	"18",0
2119                     	xref.b	c_x
2139                     	xref	c_xymov
2140                     	xref	c_lcmp
2141                     	xref	c_smul
2142                     	xref	c_ltor
2143                     	xref	c_lgadc
2144                     	xref	c_rtol
2145                     	xref	c_itolx
2146                     	end
