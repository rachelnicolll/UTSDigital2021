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
 999                     ; 15 void LCD_init()
 999                     ; 16 {
1000                     	switch	.text
1001  0074               _LCD_init:
1005                     ; 18     LCD_gpio_init();
1007  0074 ad8a          	call	L3_LCD_gpio_init
1009                     ; 21     LCD_CE_clear();
1011  0076 adaf          	call	L76_LCD_CE_clear
1013                     ; 22     LCD_RST_clear();
1015  0078 adb7          	call	L311_LCD_RST_clear
1017                     ; 24     LCD_delay_ms(50);
1019  007a ae0032        	ldw	x,#50
1020  007d adbb          	call	L541_LCD_delay_ms
1022                     ; 26     LCD_RST_set();
1024  007f adab          	call	L101_LCD_RST_set
1026                     ; 27     LCD_CE_set();
1028  0081 ad98          	call	L74_LCD_CE_set
1030                     ; 29     LCD_cmd(0x21); // extended commands
1032  0083 a621          	ld	a,#33
1033  0085 cd024e        	call	_LCD_cmd
1035                     ; 30     LCD_cmd(0xc0); // contrast Vop=6.4V
1037  0088 a6c0          	ld	a,#192
1038  008a cd024e        	call	_LCD_cmd
1040                     ; 31     LCD_cmd(0x04); // temperature coefficient
1042  008d a604          	ld	a,#4
1043  008f cd024e        	call	_LCD_cmd
1045                     ; 32     LCD_cmd(0x13); // bias = 1:48
1047  0092 a613          	ld	a,#19
1048  0094 cd024e        	call	_LCD_cmd
1050                     ; 34     LCD_cmd(0x20); // standard commands
1052  0097 a620          	ld	a,#32
1053  0099 cd024e        	call	_LCD_cmd
1055                     ; 35     LCD_cmd(0x0C); // normal mode
1057  009c a60c          	ld	a,#12
1058  009e cd024e        	call	_LCD_cmd
1060                     ; 37     LCD_clear();
1062  00a1 cd0270        	call	_LCD_clear
1064                     ; 44 }
1067  00a4 81            	ret
1106                     ; 46 void LCD_welcome()
1106                     ; 47 {
1107                     	switch	.text
1108  00a5               _LCD_welcome:
1110  00a5 89            	pushw	x
1111       00000002      OFST:	set	2
1114                     ; 48     LCD_goto(0, 2);
1116  00a6 ae0002        	ldw	x,#2
1117  00a9 cd028f        	call	_LCD_goto
1119                     ; 51         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1121  00ac 5f            	clrw	x
1122  00ad 1f01          	ldw	(OFST-1,sp),x
1124  00af               L752:
1125                     ; 52             LCD_putc(welcomeMSG[i]);
1127  00af 1e01          	ldw	x,(OFST-1,sp)
1128  00b1 d601db        	ld	a,(_welcomeMSG,x)
1129  00b4 cd029d        	call	_LCD_putc
1131                     ; 51         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1133  00b7 1e01          	ldw	x,(OFST-1,sp)
1134  00b9 1c0001        	addw	x,#1
1135  00bc 1f01          	ldw	(OFST-1,sp),x
1139  00be 1e01          	ldw	x,(OFST-1,sp)
1140  00c0 a30016        	cpw	x,#22
1141  00c3 25ea          	jrult	L752
1142                     ; 54     LCD_delay_ms(3000);
1144  00c5 ae0bb8        	ldw	x,#3000
1145  00c8 cd003a        	call	L541_LCD_delay_ms
1147                     ; 55     LCD_clear();
1149  00cb cd0270        	call	_LCD_clear
1151                     ; 56 }
1154  00ce 85            	popw	x
1155  00cf 81            	ret
1402                     ; 58 LCD_showdate(RTC_DateTypeDef SDate)
1402                     ; 59 {
1403                     	switch	.text
1404  00d0               _LCD_showdate:
1406  00d0 5234          	subw	sp,#52
1407       00000034      OFST:	set	52
1410                     ; 62     int i = sprintf(displayDate, "20%02d-%02d-%02d", SDate.RTC_Year, SDate.RTC_Month, SDate.RTC_Date);
1412  00d2 7b39          	ld	a,(OFST+5,sp)
1413  00d4 88            	push	a
1414  00d5 7b39          	ld	a,(OFST+5,sp)
1415  00d7 88            	push	a
1416  00d8 7b3c          	ld	a,(OFST+8,sp)
1417  00da 88            	push	a
1418  00db ae021a        	ldw	x,#L114
1419  00de 89            	pushw	x
1420  00df 96            	ldw	x,sp
1421  00e0 1c0008        	addw	x,#OFST-44
1422  00e3 cd0000        	call	_sprintf
1424  00e6 5b05          	addw	sp,#5
1425                     ; 64     LCD_writemsg(displayDate, sizeof(displayDate), 0, 0);
1427  00e8 4b00          	push	#0
1428  00ea 4b00          	push	#0
1429  00ec 4b32          	push	#50
1430  00ee 96            	ldw	x,sp
1431  00ef 1c0006        	addw	x,#OFST-46
1432  00f2 cd02db        	call	_LCD_writemsg
1434  00f5 5b03          	addw	sp,#3
1435                     ; 65 }
1438  00f7 5b34          	addw	sp,#52
1439  00f9 81            	ret
1553                     ; 67 LCD_showtime(RTC_TimeTypeDef STime)
1553                     ; 68 {
1554                     	switch	.text
1555  00fa               _LCD_showtime:
1557  00fa 520c          	subw	sp,#12
1558       0000000c      OFST:	set	12
1561                     ; 70     int i = sprintf(displayTime, "%02d:%02d", STime.RTC_Hours, STime.RTC_Minutes);
1563  00fc 7b10          	ld	a,(OFST+4,sp)
1564  00fe 88            	push	a
1565  00ff 7b10          	ld	a,(OFST+4,sp)
1566  0101 88            	push	a
1567  0102 ae0210        	ldw	x,#L764
1568  0105 89            	pushw	x
1569  0106 96            	ldw	x,sp
1570  0107 1c0007        	addw	x,#OFST-5
1571  010a cd0000        	call	_sprintf
1573  010d 5b04          	addw	sp,#4
1574                     ; 72     LCD_writemsg(displayTime, sizeof(displayTime), 40, 0);
1576  010f 4b00          	push	#0
1577  0111 4b28          	push	#40
1578  0113 4b0a          	push	#10
1579  0115 96            	ldw	x,sp
1580  0116 1c0006        	addw	x,#OFST-6
1581  0119 cd02db        	call	_LCD_writemsg
1583  011c 5b03          	addw	sp,#3
1584                     ; 73 }
1587  011e 5b0c          	addw	sp,#12
1588  0120 81            	ret
1591                     	switch	.const
1592  01f2               L174_homeMsg:
1593  01f2 686f6d6500    	dc.b	"home",0
1594  01f7               L374_tempMsg:
1595  01f7 74656d702020  	dc.b	"temp      : ",0
1596  0204               L574_humMsg:
1597  0204 68756d696469  	dc.b	"humidity : ",0
1694                     ; 75 void LCD_homescreen(RTC_DateTypeDef SDate, RTC_TimeTypeDef STime, char temperature[], char humidity[])
1694                     ; 76 {
1695                     	switch	.text
1696  0121               _LCD_homescreen:
1698  0121 521e          	subw	sp,#30
1699       0000001e      OFST:	set	30
1702                     ; 77 		char homeMsg[] = "home";
1704  0123 96            	ldw	x,sp
1705  0124 1c0001        	addw	x,#OFST-29
1706  0127 90ae01f2      	ldw	y,#L174_homeMsg
1707  012b a605          	ld	a,#5
1708  012d cd0000        	call	c_xymov
1710                     ; 78     char tempMsg[] = "temp      : ";
1712  0130 96            	ldw	x,sp
1713  0131 1c0006        	addw	x,#OFST-24
1714  0134 90ae01f7      	ldw	y,#L374_tempMsg
1715  0138 a60d          	ld	a,#13
1716  013a cd0000        	call	c_xymov
1718                     ; 79     char humMsg[] = "humidity : ";
1720  013d 96            	ldw	x,sp
1721  013e 1c0013        	addw	x,#OFST-11
1722  0141 90ae0204      	ldw	y,#L574_humMsg
1723  0145 a60c          	ld	a,#12
1724  0147 cd0000        	call	c_xymov
1726                     ; 81     LCD_showdate(SDate);
1728  014a 7b24          	ld	a,(OFST+6,sp)
1729  014c 88            	push	a
1730  014d 7b24          	ld	a,(OFST+6,sp)
1731  014f 88            	push	a
1732  0150 7b24          	ld	a,(OFST+6,sp)
1733  0152 88            	push	a
1734  0153 7b24          	ld	a,(OFST+6,sp)
1735  0155 88            	push	a
1736  0156 cd00d0        	call	_LCD_showdate
1738  0159 5b04          	addw	sp,#4
1739                     ; 82     LCD_showtime(STime);
1741  015b 7b28          	ld	a,(OFST+10,sp)
1742  015d 88            	push	a
1743  015e 7b28          	ld	a,(OFST+10,sp)
1744  0160 88            	push	a
1745  0161 7b28          	ld	a,(OFST+10,sp)
1746  0163 88            	push	a
1747  0164 7b28          	ld	a,(OFST+10,sp)
1748  0166 88            	push	a
1749  0167 ad91          	call	_LCD_showtime
1751  0169 5b04          	addw	sp,#4
1752                     ; 84     strcat(tempMsg, temperature);
1754  016b 1e29          	ldw	x,(OFST+11,sp)
1755  016d 89            	pushw	x
1756  016e 96            	ldw	x,sp
1757  016f 1c0008        	addw	x,#OFST-22
1758  0172 cd0000        	call	_strcat
1760  0175 85            	popw	x
1761                     ; 85     strcat(humMsg, humidity);
1763  0176 1e2b          	ldw	x,(OFST+13,sp)
1764  0178 89            	pushw	x
1765  0179 96            	ldw	x,sp
1766  017a 1c0015        	addw	x,#OFST-9
1767  017d cd0000        	call	_strcat
1769  0180 85            	popw	x
1770                     ; 87     LCD_writemsg(tempMsg, sizeof(tempMsg), 0, 1);
1772  0181 4b01          	push	#1
1773  0183 4b00          	push	#0
1774  0185 4b0d          	push	#13
1775  0187 96            	ldw	x,sp
1776  0188 1c0009        	addw	x,#OFST-21
1777  018b cd02db        	call	_LCD_writemsg
1779  018e 5b03          	addw	sp,#3
1780                     ; 88     LCD_writemsg(humMsg, sizeof(humMsg), 0, 2);
1782  0190 4b02          	push	#2
1783  0192 4b00          	push	#0
1784  0194 4b0c          	push	#12
1785  0196 96            	ldw	x,sp
1786  0197 1c0016        	addw	x,#OFST-8
1787  019a cd02db        	call	_LCD_writemsg
1789  019d 5b03          	addw	sp,#3
1790                     ; 89     LCD_writemsg(homeMsg, sizeof(homeMsg), 0, 5);
1792  019f 4b05          	push	#5
1793  01a1 4b00          	push	#0
1794  01a3 4b05          	push	#5
1795  01a5 96            	ldw	x,sp
1796  01a6 1c0004        	addw	x,#OFST-26
1797  01a9 cd02db        	call	_LCD_writemsg
1799  01ac 5b03          	addw	sp,#3
1800                     ; 90 }
1803  01ae 5b1e          	addw	sp,#30
1804  01b0 81            	ret
1807                     	bsct
1808  0000               L545_menuMsg:
1809  0000 4d656e7500    	dc.b	"Menu",0
1810  0005               L745_op1:
1811  0005 312e20446169  	dc.b	"1. Daily Min/Max",0
1812  0016               L155_op2:
1813  0016 322e2053656e  	dc.b	"2. Send Data",0
1814  0023               L355_op3:
1815  0023 332e20536574  	dc.b	"3. Settings",0
1879                     ; 92 void LCD_menu()
1879                     ; 93 {
1880                     	switch	.text
1881  01b1               _LCD_menu:
1885                     ; 99     LCD_writemsg(menuMsg, sizeof(menuMsg), 0, 0);
1887  01b1 4b00          	push	#0
1888  01b3 4b00          	push	#0
1889  01b5 4b05          	push	#5
1890  01b7 ae0000        	ldw	x,#L545_menuMsg
1891  01ba cd02db        	call	_LCD_writemsg
1893  01bd 5b03          	addw	sp,#3
1894                     ; 100     LCD_writemsg(op1, sizeof(op1), 1, 1);
1896  01bf 4b01          	push	#1
1897  01c1 4b01          	push	#1
1898  01c3 4b11          	push	#17
1899  01c5 ae0005        	ldw	x,#L745_op1
1900  01c8 cd02db        	call	_LCD_writemsg
1902  01cb 5b03          	addw	sp,#3
1903                     ; 101     LCD_writemsg(op2, sizeof(op2), 1, 2);
1905  01cd 4b02          	push	#2
1906  01cf 4b01          	push	#1
1907  01d1 4b0d          	push	#13
1908  01d3 ae0016        	ldw	x,#L155_op2
1909  01d6 cd02db        	call	_LCD_writemsg
1911  01d9 5b03          	addw	sp,#3
1912                     ; 102     LCD_writemsg(op3, sizeof(op3), 1, 3);
1914  01db 4b03          	push	#3
1915  01dd 4b01          	push	#1
1916  01df 4b0c          	push	#12
1917  01e1 ae0023        	ldw	x,#L355_op3
1918  01e4 cd02db        	call	_LCD_writemsg
1920  01e7 5b03          	addw	sp,#3
1921                     ; 103 }
1924  01e9 81            	ret
1927                     	bsct
1928  002f               L706_tempHeader:
1929  002f 54656d706572  	dc.b	"Temperature",0
1930  003b               L116_humidityHeader:
1931  003b 48756d696469  	dc.b	"Humidity",0
1932  0044               L316_minHeader:
1933  0044 4d696e3a2000  	dc.b	"Min: ",0
1934  004a               L516_maxHeader:
1935  004a 4d61783a2000  	dc.b	"Max: ",0
2008                     ; 105 void LCD_min_max(uint8_t minTemperature, uint8_t maxTemperature, uint8_t minHumidity, uint8_t maxHumidity)
2008                     ; 106 {
2009                     	switch	.text
2010  01ea               _LCD_min_max:
2014                     ; 112     LCD_writemsg(tempHeader, sizeof(tempHeader), 20, 0);
2016  01ea 4b00          	push	#0
2017  01ec 4b14          	push	#20
2018  01ee 4b0c          	push	#12
2019  01f0 ae002f        	ldw	x,#L706_tempHeader
2020  01f3 cd02db        	call	_LCD_writemsg
2022  01f6 5b03          	addw	sp,#3
2023                     ; 113     LCD_writemsg(minHeader, sizeof(minHeader), 1, 1);
2025  01f8 4b01          	push	#1
2026  01fa 4b01          	push	#1
2027  01fc 4b06          	push	#6
2028  01fe ae0044        	ldw	x,#L316_minHeader
2029  0201 cd02db        	call	_LCD_writemsg
2031  0204 5b03          	addw	sp,#3
2032                     ; 114     LCD_writemsg(maxHeader, sizeof(maxHeader), 30, 1);
2034  0206 4b01          	push	#1
2035  0208 4b1e          	push	#30
2036  020a 4b06          	push	#6
2037  020c ae004a        	ldw	x,#L516_maxHeader
2038  020f cd02db        	call	_LCD_writemsg
2040  0212 5b03          	addw	sp,#3
2041                     ; 116     LCD_writemsg(humidityHeader, sizeof(humidityHeader), 20, 4);
2043  0214 4b04          	push	#4
2044  0216 4b14          	push	#20
2045  0218 4b09          	push	#9
2046  021a ae003b        	ldw	x,#L116_humidityHeader
2047  021d cd02db        	call	_LCD_writemsg
2049  0220 5b03          	addw	sp,#3
2050                     ; 117     LCD_writemsg(minHeader, sizeof(minHeader), 1, 5);
2052  0222 4b05          	push	#5
2053  0224 4b01          	push	#1
2054  0226 4b06          	push	#6
2055  0228 ae0044        	ldw	x,#L316_minHeader
2056  022b cd02db        	call	_LCD_writemsg
2058  022e 5b03          	addw	sp,#3
2059                     ; 118     LCD_writemsg(maxHeader, sizeof(maxHeader), 30, 5);
2061  0230 4b05          	push	#5
2062  0232 4b1e          	push	#30
2063  0234 4b06          	push	#6
2064  0236 ae004a        	ldw	x,#L516_maxHeader
2065  0239 cd02db        	call	_LCD_writemsg
2067  023c 5b03          	addw	sp,#3
2068                     ; 119 }
2071  023e 81            	ret
2074                     	bsct
2075  0050               L556_settingsHeader:
2076  0050 507265737320  	dc.b	"Press OK to change"
2077  0062 207365747469  	dc.b	" settings",0
2112                     ; 121 void LCD_display_settings()
2112                     ; 122 {
2113                     	switch	.text
2114  023f               _LCD_display_settings:
2118                     ; 124     LCD_writemsg(settingsHeader, sizeof(settingsHeader), 20, 0);
2120  023f 4b00          	push	#0
2121  0241 4b14          	push	#20
2122  0243 4b1c          	push	#28
2123  0245 ae0050        	ldw	x,#L556_settingsHeader
2124  0248 cd02db        	call	_LCD_writemsg
2126  024b 5b03          	addw	sp,#3
2127                     ; 125 }
2130  024d 81            	ret
2168                     ; 127 void LCD_cmd(uint8_t cmd)
2168                     ; 128 {
2169                     	switch	.text
2170  024e               _LCD_cmd:
2172  024e 88            	push	a
2173       00000000      OFST:	set	0
2176                     ; 129     LCD_CE_clear();
2178  024f cd0027        	call	L76_LCD_CE_clear
2180                     ; 130     LCD_DC_clear();
2182  0252 cd0016        	call	L53_LCD_DC_clear
2184                     ; 131     LCD_SPI_write(cmd);
2186  0255 7b01          	ld	a,(OFST+1,sp)
2187  0257 cd0036        	call	L521_LCD_SPI_write
2189                     ; 132     LCD_CE_set();
2191  025a cd001b        	call	L74_LCD_CE_set
2193                     ; 133 }
2196  025d 84            	pop	a
2197  025e 81            	ret
2235                     ; 135 void LCD_write(uint8_t data)
2235                     ; 136 {
2236                     	switch	.text
2237  025f               _LCD_write:
2239  025f 88            	push	a
2240       00000000      OFST:	set	0
2243                     ; 137     LCD_CE_clear();
2245  0260 cd0027        	call	L76_LCD_CE_clear
2247                     ; 138     LCD_DC_set();
2249  0263 cd0011        	call	L32_LCD_DC_set
2251                     ; 139     LCD_SPI_write(data);
2253  0266 7b01          	ld	a,(OFST+1,sp)
2254  0268 cd0036        	call	L521_LCD_SPI_write
2256                     ; 140     LCD_CE_set();
2258  026b cd001b        	call	L74_LCD_CE_set
2260                     ; 141 }
2263  026e 84            	pop	a
2264  026f 81            	ret
2300                     ; 143 void LCD_clear()
2300                     ; 144 {
2301                     	switch	.text
2302  0270               _LCD_clear:
2304  0270 89            	pushw	x
2305       00000002      OFST:	set	2
2308                     ; 145     uint16_t i = 84 * 6;
2310  0271 ae01f8        	ldw	x,#504
2311  0274 1f01          	ldw	(OFST-1,sp),x
2313                     ; 146     LCD_goto(0, 0);
2315  0276 5f            	clrw	x
2316  0277 ad16          	call	_LCD_goto
2319  0279 2003          	jra	L157
2320  027b               L747:
2321                     ; 148         LCD_write(0);
2323  027b 4f            	clr	a
2324  027c ade1          	call	_LCD_write
2326  027e               L157:
2327                     ; 147     while (i-- > 0)
2329  027e 1e01          	ldw	x,(OFST-1,sp)
2330  0280 1d0001        	subw	x,#1
2331  0283 1f01          	ldw	(OFST-1,sp),x
2332  0285 1c0001        	addw	x,#1
2334  0288 a30000        	cpw	x,#0
2335  028b 26ee          	jrne	L747
2336                     ; 149 }
2339  028d 85            	popw	x
2340  028e 81            	ret
2384                     ; 151 void LCD_goto(uint8_t col, uint8_t row)
2384                     ; 152 {
2385                     	switch	.text
2386  028f               _LCD_goto:
2388  028f 89            	pushw	x
2389       00000000      OFST:	set	0
2392                     ; 153     LCD_cmd(0x80 | col);
2394  0290 9e            	ld	a,xh
2395  0291 aa80          	or	a,#128
2396  0293 adb9          	call	_LCD_cmd
2398                     ; 154     LCD_cmd(0x40 | row);
2400  0295 7b02          	ld	a,(OFST+2,sp)
2401  0297 aa40          	or	a,#64
2402  0299 adb3          	call	_LCD_cmd
2404                     ; 155 }
2407  029b 85            	popw	x
2408  029c 81            	ret
2463                     ; 157 void LCD_putc(char c)
2463                     ; 158 {
2464                     	switch	.text
2465  029d               _LCD_putc:
2467  029d 88            	push	a
2468  029e 5203          	subw	sp,#3
2469       00000003      OFST:	set	3
2472                     ; 159     if (c == ' ')
2474  02a0 a120          	cp	a,#32
2475  02a2 2608          	jrne	L5201
2476                     ; 161         LCD_write(0);
2478  02a4 4f            	clr	a
2479  02a5 adb8          	call	_LCD_write
2481                     ; 162         LCD_write(0);
2483  02a7 4f            	clr	a
2484  02a8 adb5          	call	_LCD_write
2487  02aa 202c          	jra	L7201
2488  02ac               L5201:
2489                     ; 166         const char *ptr = &font[(c - 32) * FONT_WIDTH];
2491  02ac 7b04          	ld	a,(OFST+1,sp)
2492  02ae 97            	ld	xl,a
2493  02af a605          	ld	a,#5
2494  02b1 42            	mul	x,a
2495  02b2 1d00a0        	subw	x,#160
2496  02b5 1c0000        	addw	x,#_font
2497  02b8 1f02          	ldw	(OFST-1,sp),x
2499                     ; 168         for (i = 0; i < FONT_WIDTH; i++, ptr++)
2501  02ba 0f01          	clr	(OFST-2,sp)
2503  02bc               L1301:
2504                     ; 169             if (*ptr)
2506  02bc 1e02          	ldw	x,(OFST-1,sp)
2507  02be 7d            	tnz	(x)
2508  02bf 2705          	jreq	L7301
2509                     ; 170                 LCD_write(*ptr);
2511  02c1 1e02          	ldw	x,(OFST-1,sp)
2512  02c3 f6            	ld	a,(x)
2513  02c4 ad99          	call	_LCD_write
2515  02c6               L7301:
2516                     ; 168         for (i = 0; i < FONT_WIDTH; i++, ptr++)
2518  02c6 0c01          	inc	(OFST-2,sp)
2520  02c8 1e02          	ldw	x,(OFST-1,sp)
2521  02ca 1c0001        	addw	x,#1
2522  02cd 1f02          	ldw	(OFST-1,sp),x
2526  02cf 7b01          	ld	a,(OFST-2,sp)
2527  02d1 a105          	cp	a,#5
2528  02d3 25e7          	jrult	L1301
2529                     ; 171         LCD_write(0);
2531  02d5 4f            	clr	a
2532  02d6 ad87          	call	_LCD_write
2534  02d8               L7201:
2535                     ; 173 }
2538  02d8 5b04          	addw	sp,#4
2539  02da 81            	ret
2612                     ; 175 void LCD_writemsg(char *msg, uint8_t msgSize, uint8_t col, uint8_t row)
2612                     ; 176 {
2613                     	switch	.text
2614  02db               _LCD_writemsg:
2616  02db 89            	pushw	x
2617  02dc 89            	pushw	x
2618       00000002      OFST:	set	2
2621                     ; 177     LCD_goto(col, row);
2623  02dd 7b09          	ld	a,(OFST+7,sp)
2624  02df 97            	ld	xl,a
2625  02e0 7b08          	ld	a,(OFST+6,sp)
2626  02e2 95            	ld	xh,a
2627  02e3 adaa          	call	_LCD_goto
2629                     ; 180         for (i = 0; i < msgSize - 1; i++)
2631  02e5 5f            	clrw	x
2632  02e6 1f01          	ldw	(OFST-1,sp),x
2635  02e8 200f          	jra	L3011
2636  02ea               L7701:
2637                     ; 181             LCD_putc(msg[i]);
2639  02ea 1e01          	ldw	x,(OFST-1,sp)
2640  02ec 72fb03        	addw	x,(OFST+1,sp)
2641  02ef f6            	ld	a,(x)
2642  02f0 adab          	call	_LCD_putc
2644                     ; 180         for (i = 0; i < msgSize - 1; i++)
2646  02f2 1e01          	ldw	x,(OFST-1,sp)
2647  02f4 1c0001        	addw	x,#1
2648  02f7 1f01          	ldw	(OFST-1,sp),x
2650  02f9               L3011:
2653  02f9 9c            	rvf
2654  02fa 7b07          	ld	a,(OFST+5,sp)
2655  02fc 5f            	clrw	x
2656  02fd 97            	ld	xl,a
2657  02fe 5a            	decw	x
2658  02ff 1301          	cpw	x,(OFST-1,sp)
2659  0301 2ce7          	jrsgt	L7701
2660                     ; 184 }
2663  0303 5b04          	addw	sp,#4
2664  0305 81            	ret
2689                     	xdef	_LCD_showtime
2690                     	xdef	_LCD_showdate
2691                     	xdef	_welcomeMSG
2692                     	xref	_sprintf
2693                     	xref	_strcat
2694                     	xdef	_font
2695                     	xref	_SPI_write
2696                     	xdef	_LCD_display_settings
2697                     	xdef	_LCD_menu
2698                     	xdef	_LCD_min_max
2699                     	xdef	_LCD_homescreen
2700                     	xdef	_LCD_welcome
2701                     	xdef	_LCD_writemsg
2702                     	xdef	_LCD_write
2703                     	xdef	_LCD_putc
2704                     	xdef	_LCD_goto
2705                     	xdef	_LCD_cmd
2706                     	xdef	_LCD_clear
2707                     	xdef	_LCD_init
2708                     	switch	.const
2709  0210               L764:
2710  0210 253032643a25  	dc.b	"%02d:%02d",0
2711  021a               L114:
2712  021a 323025303264  	dc.b	"20%02d-%02d-%02d",0
2713                     	xref.b	c_x
2733                     	xref	c_xymov
2734                     	xref	c_lcmp
2735                     	xref	c_smul
2736                     	xref	c_ltor
2737                     	xref	c_lgadc
2738                     	xref	c_rtol
2739                     	xref	c_itolx
2740                     	end
