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
1033  0085 cd0240        	call	_LCD_cmd
1035                     ; 30     LCD_cmd(0xc0); // contrast Vop=6.4V
1037  0088 a6c0          	ld	a,#192
1038  008a cd0240        	call	_LCD_cmd
1040                     ; 31     LCD_cmd(0x04); // temperature coefficient
1042  008d a604          	ld	a,#4
1043  008f cd0240        	call	_LCD_cmd
1045                     ; 32     LCD_cmd(0x13); // bias = 1:48
1047  0092 a613          	ld	a,#19
1048  0094 cd0240        	call	_LCD_cmd
1050                     ; 34     LCD_cmd(0x20); // standard commands
1052  0097 a620          	ld	a,#32
1053  0099 cd0240        	call	_LCD_cmd
1055                     ; 35     LCD_cmd(0x0C); // normal mode
1057  009c a60c          	ld	a,#12
1058  009e cd0240        	call	_LCD_cmd
1060                     ; 37     LCD_clear();
1062  00a1 cd0262        	call	_LCD_clear
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
1117  00a9 cd0281        	call	_LCD_goto
1119                     ; 51         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1121  00ac 5f            	clrw	x
1122  00ad 1f01          	ldw	(OFST-1,sp),x
1124  00af               L752:
1125                     ; 52             LCD_putc(welcomeMSG[i]);
1127  00af 1e01          	ldw	x,(OFST-1,sp)
1128  00b1 d601db        	ld	a,(_welcomeMSG,x)
1129  00b4 cd028f        	call	_LCD_putc
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
1149  00cb cd0262        	call	_LCD_clear
1151                     ; 56 }
1154  00ce 85            	popw	x
1155  00cf 81            	ret
1402                     ; 58 LCD_showdate(RTC_DateTypeDef SDate)
1402                     ; 59 {
1403                     	switch	.text
1404  00d0               _LCD_showdate:
1406  00d0 5234          	subw	sp,#52
1407       00000034      OFST:	set	52
1410                     ; 62     int i = sprintf(displayDate, "20%02d-%02d-%02d", (int)SDate.RTC_Year, (int)SDate.RTC_Month, (int)SDate.RTC_Date);
1412  00d2 7b39          	ld	a,(OFST+5,sp)
1413  00d4 5f            	clrw	x
1414  00d5 97            	ld	xl,a
1415  00d6 89            	pushw	x
1416  00d7 7b3a          	ld	a,(OFST+6,sp)
1417  00d9 5f            	clrw	x
1418  00da 97            	ld	xl,a
1419  00db 89            	pushw	x
1420  00dc 7b3e          	ld	a,(OFST+10,sp)
1421  00de 5f            	clrw	x
1422  00df 97            	ld	xl,a
1423  00e0 89            	pushw	x
1424  00e1 ae0220        	ldw	x,#L114
1425  00e4 89            	pushw	x
1426  00e5 96            	ldw	x,sp
1427  00e6 1c0009        	addw	x,#OFST-43
1428  00e9 cd0000        	call	_sprintf
1430  00ec 5b08          	addw	sp,#8
1431  00ee 1f33          	ldw	(OFST-1,sp),x
1433                     ; 64     LCD_writemsg(displayDate, i+1, 0, 0);
1435  00f0 4b00          	push	#0
1436  00f2 4b00          	push	#0
1437  00f4 7b36          	ld	a,(OFST+2,sp)
1438  00f6 4c            	inc	a
1439  00f7 88            	push	a
1440  00f8 96            	ldw	x,sp
1441  00f9 1c0004        	addw	x,#OFST-48
1442  00fc cd02cd        	call	_LCD_writemsg
1444  00ff 5b03          	addw	sp,#3
1445                     ; 65 }
1448  0101 5b34          	addw	sp,#52
1449  0103 81            	ret
1563                     ; 67 LCD_showtime(RTC_TimeTypeDef STime)
1563                     ; 68 {
1564                     	switch	.text
1565  0104               _LCD_showtime:
1567  0104 520c          	subw	sp,#12
1568       0000000c      OFST:	set	12
1571                     ; 70     int i = sprintf(displayTime, "%02d:%02d", (int)STime.RTC_Hours, (int)STime.RTC_Minutes);
1573  0106 7b10          	ld	a,(OFST+4,sp)
1574  0108 5f            	clrw	x
1575  0109 97            	ld	xl,a
1576  010a 89            	pushw	x
1577  010b 7b11          	ld	a,(OFST+5,sp)
1578  010d 5f            	clrw	x
1579  010e 97            	ld	xl,a
1580  010f 89            	pushw	x
1581  0110 ae0216        	ldw	x,#L764
1582  0113 89            	pushw	x
1583  0114 96            	ldw	x,sp
1584  0115 1c0007        	addw	x,#OFST-5
1585  0118 cd0000        	call	_sprintf
1587  011b 5b06          	addw	sp,#6
1588  011d 1f0b          	ldw	(OFST-1,sp),x
1590                     ; 72     LCD_writemsg(displayTime, i+1, 45, 0);
1592  011f 4b00          	push	#0
1593  0121 4b2d          	push	#45
1594  0123 7b0e          	ld	a,(OFST+2,sp)
1595  0125 4c            	inc	a
1596  0126 88            	push	a
1597  0127 96            	ldw	x,sp
1598  0128 1c0004        	addw	x,#OFST-8
1599  012b cd02cd        	call	_LCD_writemsg
1601  012e 5b03          	addw	sp,#3
1602                     ; 73 }
1605  0130 5b0c          	addw	sp,#12
1606  0132 81            	ret
1711                     ; 75 void LCD_homescreen(RTC_DateTypeDef SDate, RTC_TimeTypeDef STime, uint8_t temperature, uint8_t humidity)
1711                     ; 76 {
1712                     	switch	.text
1713  0133               _LCD_homescreen:
1715  0133 5240          	subw	sp,#64
1716       00000040      OFST:	set	64
1719                     ; 79     int i = sprintf(tempMsg, "temperature: %02d", (int)temperature);
1721  0135 7b4b          	ld	a,(OFST+11,sp)
1722  0137 5f            	clrw	x
1723  0138 97            	ld	xl,a
1724  0139 89            	pushw	x
1725  013a ae0204        	ldw	x,#L345
1726  013d 89            	pushw	x
1727  013e 96            	ldw	x,sp
1728  013f 1c0005        	addw	x,#OFST-59
1729  0142 cd0000        	call	_sprintf
1731  0145 5b04          	addw	sp,#4
1732  0147 1f1f          	ldw	(OFST-33,sp),x
1734                     ; 81     int j = sprintf(humMsg, "humidity: %02d %%", (int)humidity);
1736  0149 7b4c          	ld	a,(OFST+12,sp)
1737  014b 5f            	clrw	x
1738  014c 97            	ld	xl,a
1739  014d 89            	pushw	x
1740  014e ae01f2        	ldw	x,#L545
1741  0151 89            	pushw	x
1742  0152 96            	ldw	x,sp
1743  0153 1c0025        	addw	x,#OFST-27
1744  0156 cd0000        	call	_sprintf
1746  0159 5b04          	addw	sp,#4
1747  015b 1f3f          	ldw	(OFST-1,sp),x
1749                     ; 83     LCD_showdate(SDate);
1751  015d 7b46          	ld	a,(OFST+6,sp)
1752  015f 88            	push	a
1753  0160 7b46          	ld	a,(OFST+6,sp)
1754  0162 88            	push	a
1755  0163 7b46          	ld	a,(OFST+6,sp)
1756  0165 88            	push	a
1757  0166 7b46          	ld	a,(OFST+6,sp)
1758  0168 88            	push	a
1759  0169 cd00d0        	call	_LCD_showdate
1761  016c 5b04          	addw	sp,#4
1762                     ; 84     LCD_showtime(STime);
1764  016e 7b4a          	ld	a,(OFST+10,sp)
1765  0170 88            	push	a
1766  0171 7b4a          	ld	a,(OFST+10,sp)
1767  0173 88            	push	a
1768  0174 7b4a          	ld	a,(OFST+10,sp)
1769  0176 88            	push	a
1770  0177 7b4a          	ld	a,(OFST+10,sp)
1771  0179 88            	push	a
1772  017a ad88          	call	_LCD_showtime
1774  017c 5b04          	addw	sp,#4
1775                     ; 86     LCD_writemsg(tempMsg, i+1, 0, 1);
1777  017e 4b01          	push	#1
1778  0180 4b00          	push	#0
1779  0182 7b22          	ld	a,(OFST-30,sp)
1780  0184 4c            	inc	a
1781  0185 88            	push	a
1782  0186 96            	ldw	x,sp
1783  0187 1c0004        	addw	x,#OFST-60
1784  018a cd02cd        	call	_LCD_writemsg
1786  018d 5b03          	addw	sp,#3
1787                     ; 87     LCD_writemsg(humMsg, j+1, 0, 2);
1789  018f 4b02          	push	#2
1790  0191 4b00          	push	#0
1791  0193 7b42          	ld	a,(OFST+2,sp)
1792  0195 4c            	inc	a
1793  0196 88            	push	a
1794  0197 96            	ldw	x,sp
1795  0198 1c0024        	addw	x,#OFST-28
1796  019b cd02cd        	call	_LCD_writemsg
1798  019e 5b03          	addw	sp,#3
1799                     ; 88 }
1802  01a0 5b40          	addw	sp,#64
1803  01a2 81            	ret
1806                     	bsct
1807  0000               L745_menuMsg:
1808  0000 4d656e7500    	dc.b	"Menu",0
1809  0005               L155_op1:
1810  0005 312e20446169  	dc.b	"1. Daily Min/Max",0
1811  0016               L355_op2:
1812  0016 322e2053656e  	dc.b	"2. Send Data",0
1813  0023               L555_op3:
1814  0023 332e20536574  	dc.b	"3. Settings",0
1878                     ; 90 void LCD_menu()
1878                     ; 91 {
1879                     	switch	.text
1880  01a3               _LCD_menu:
1884                     ; 97     LCD_writemsg(menuMsg, sizeof(menuMsg), 0, 0);
1886  01a3 4b00          	push	#0
1887  01a5 4b00          	push	#0
1888  01a7 4b05          	push	#5
1889  01a9 ae0000        	ldw	x,#L745_menuMsg
1890  01ac cd02cd        	call	_LCD_writemsg
1892  01af 5b03          	addw	sp,#3
1893                     ; 98     LCD_writemsg(op1, sizeof(op1), 1, 1);
1895  01b1 4b01          	push	#1
1896  01b3 4b01          	push	#1
1897  01b5 4b11          	push	#17
1898  01b7 ae0005        	ldw	x,#L155_op1
1899  01ba cd02cd        	call	_LCD_writemsg
1901  01bd 5b03          	addw	sp,#3
1902                     ; 99     LCD_writemsg(op2, sizeof(op2), 1, 2);
1904  01bf 4b02          	push	#2
1905  01c1 4b01          	push	#1
1906  01c3 4b0d          	push	#13
1907  01c5 ae0016        	ldw	x,#L355_op2
1908  01c8 cd02cd        	call	_LCD_writemsg
1910  01cb 5b03          	addw	sp,#3
1911                     ; 100     LCD_writemsg(op3, sizeof(op3), 1, 3);
1913  01cd 4b03          	push	#3
1914  01cf 4b01          	push	#1
1915  01d1 4b0c          	push	#12
1916  01d3 ae0023        	ldw	x,#L555_op3
1917  01d6 cd02cd        	call	_LCD_writemsg
1919  01d9 5b03          	addw	sp,#3
1920                     ; 101 }
1923  01db 81            	ret
1926                     	bsct
1927  002f               L116_tempHeader:
1928  002f 54656d706572  	dc.b	"Temperature",0
1929  003b               L316_humidityHeader:
1930  003b 48756d696469  	dc.b	"Humidity",0
1931  0044               L516_minHeader:
1932  0044 4d696e3a2000  	dc.b	"Min: ",0
1933  004a               L716_maxHeader:
1934  004a 4d61783a2000  	dc.b	"Max: ",0
2007                     ; 103 void LCD_min_max(uint8_t minTemperature, uint8_t maxTemperature, uint8_t minHumidity, uint8_t maxHumidity)
2007                     ; 104 {
2008                     	switch	.text
2009  01dc               _LCD_min_max:
2013                     ; 110     LCD_writemsg(tempHeader, sizeof(tempHeader), 20, 0);
2015  01dc 4b00          	push	#0
2016  01de 4b14          	push	#20
2017  01e0 4b0c          	push	#12
2018  01e2 ae002f        	ldw	x,#L116_tempHeader
2019  01e5 cd02cd        	call	_LCD_writemsg
2021  01e8 5b03          	addw	sp,#3
2022                     ; 111     LCD_writemsg(minHeader, sizeof(minHeader), 1, 1);
2024  01ea 4b01          	push	#1
2025  01ec 4b01          	push	#1
2026  01ee 4b06          	push	#6
2027  01f0 ae0044        	ldw	x,#L516_minHeader
2028  01f3 cd02cd        	call	_LCD_writemsg
2030  01f6 5b03          	addw	sp,#3
2031                     ; 112     LCD_writemsg(maxHeader, sizeof(maxHeader), 30, 1);
2033  01f8 4b01          	push	#1
2034  01fa 4b1e          	push	#30
2035  01fc 4b06          	push	#6
2036  01fe ae004a        	ldw	x,#L716_maxHeader
2037  0201 cd02cd        	call	_LCD_writemsg
2039  0204 5b03          	addw	sp,#3
2040                     ; 114     LCD_writemsg(humidityHeader, sizeof(humidityHeader), 20, 4);
2042  0206 4b04          	push	#4
2043  0208 4b14          	push	#20
2044  020a 4b09          	push	#9
2045  020c ae003b        	ldw	x,#L316_humidityHeader
2046  020f cd02cd        	call	_LCD_writemsg
2048  0212 5b03          	addw	sp,#3
2049                     ; 115     LCD_writemsg(minHeader, sizeof(minHeader), 1, 5);
2051  0214 4b05          	push	#5
2052  0216 4b01          	push	#1
2053  0218 4b06          	push	#6
2054  021a ae0044        	ldw	x,#L516_minHeader
2055  021d cd02cd        	call	_LCD_writemsg
2057  0220 5b03          	addw	sp,#3
2058                     ; 116     LCD_writemsg(maxHeader, sizeof(maxHeader), 30, 5);
2060  0222 4b05          	push	#5
2061  0224 4b1e          	push	#30
2062  0226 4b06          	push	#6
2063  0228 ae004a        	ldw	x,#L716_maxHeader
2064  022b cd02cd        	call	_LCD_writemsg
2066  022e 5b03          	addw	sp,#3
2067                     ; 117 }
2070  0230 81            	ret
2073                     	bsct
2074  0050               L756_settingsHeader:
2075  0050 507265737320  	dc.b	"Press OK to change"
2076  0062 207365747469  	dc.b	" settings",0
2111                     ; 119 void LCD_display_settings()
2111                     ; 120 {
2112                     	switch	.text
2113  0231               _LCD_display_settings:
2117                     ; 122     LCD_writemsg(settingsHeader, sizeof(settingsHeader), 20, 0);
2119  0231 4b00          	push	#0
2120  0233 4b14          	push	#20
2121  0235 4b1c          	push	#28
2122  0237 ae0050        	ldw	x,#L756_settingsHeader
2123  023a cd02cd        	call	_LCD_writemsg
2125  023d 5b03          	addw	sp,#3
2126                     ; 123 }
2129  023f 81            	ret
2167                     ; 125 void LCD_cmd(uint8_t cmd)
2167                     ; 126 {
2168                     	switch	.text
2169  0240               _LCD_cmd:
2171  0240 88            	push	a
2172       00000000      OFST:	set	0
2175                     ; 127     LCD_CE_clear();
2177  0241 cd0027        	call	L76_LCD_CE_clear
2179                     ; 128     LCD_DC_clear();
2181  0244 cd0016        	call	L53_LCD_DC_clear
2183                     ; 129     LCD_SPI_write(cmd);
2185  0247 7b01          	ld	a,(OFST+1,sp)
2186  0249 cd0036        	call	L521_LCD_SPI_write
2188                     ; 130     LCD_CE_set();
2190  024c cd001b        	call	L74_LCD_CE_set
2192                     ; 131 }
2195  024f 84            	pop	a
2196  0250 81            	ret
2234                     ; 133 void LCD_write(uint8_t data)
2234                     ; 134 {
2235                     	switch	.text
2236  0251               _LCD_write:
2238  0251 88            	push	a
2239       00000000      OFST:	set	0
2242                     ; 135     LCD_CE_clear();
2244  0252 cd0027        	call	L76_LCD_CE_clear
2246                     ; 136     LCD_DC_set();
2248  0255 cd0011        	call	L32_LCD_DC_set
2250                     ; 137     LCD_SPI_write(data);
2252  0258 7b01          	ld	a,(OFST+1,sp)
2253  025a cd0036        	call	L521_LCD_SPI_write
2255                     ; 138     LCD_CE_set();
2257  025d cd001b        	call	L74_LCD_CE_set
2259                     ; 139 }
2262  0260 84            	pop	a
2263  0261 81            	ret
2299                     ; 141 void LCD_clear()
2299                     ; 142 {
2300                     	switch	.text
2301  0262               _LCD_clear:
2303  0262 89            	pushw	x
2304       00000002      OFST:	set	2
2307                     ; 143     uint16_t i = 84 * 6;
2309  0263 ae01f8        	ldw	x,#504
2310  0266 1f01          	ldw	(OFST-1,sp),x
2312                     ; 144     LCD_goto(0, 0);
2314  0268 5f            	clrw	x
2315  0269 ad16          	call	_LCD_goto
2318  026b 2003          	jra	L357
2319  026d               L157:
2320                     ; 146         LCD_write(0);
2322  026d 4f            	clr	a
2323  026e ade1          	call	_LCD_write
2325  0270               L357:
2326                     ; 145     while (i-- > 0)
2328  0270 1e01          	ldw	x,(OFST-1,sp)
2329  0272 1d0001        	subw	x,#1
2330  0275 1f01          	ldw	(OFST-1,sp),x
2331  0277 1c0001        	addw	x,#1
2333  027a a30000        	cpw	x,#0
2334  027d 26ee          	jrne	L157
2335                     ; 147 }
2338  027f 85            	popw	x
2339  0280 81            	ret
2383                     ; 149 void LCD_goto(uint8_t col, uint8_t row)
2383                     ; 150 {
2384                     	switch	.text
2385  0281               _LCD_goto:
2387  0281 89            	pushw	x
2388       00000000      OFST:	set	0
2391                     ; 151     LCD_cmd(0x80 | col);
2393  0282 9e            	ld	a,xh
2394  0283 aa80          	or	a,#128
2395  0285 adb9          	call	_LCD_cmd
2397                     ; 152     LCD_cmd(0x40 | row);
2399  0287 7b02          	ld	a,(OFST+2,sp)
2400  0289 aa40          	or	a,#64
2401  028b adb3          	call	_LCD_cmd
2403                     ; 153 }
2406  028d 85            	popw	x
2407  028e 81            	ret
2462                     ; 155 void LCD_putc(char c)
2462                     ; 156 {
2463                     	switch	.text
2464  028f               _LCD_putc:
2466  028f 88            	push	a
2467  0290 5203          	subw	sp,#3
2468       00000003      OFST:	set	3
2471                     ; 157     if (c == ' ')
2473  0292 a120          	cp	a,#32
2474  0294 2608          	jrne	L7201
2475                     ; 159         LCD_write(0);
2477  0296 4f            	clr	a
2478  0297 adb8          	call	_LCD_write
2480                     ; 160         LCD_write(0);
2482  0299 4f            	clr	a
2483  029a adb5          	call	_LCD_write
2486  029c 202c          	jra	L1301
2487  029e               L7201:
2488                     ; 164         const char *ptr = &font[(c - 32) * FONT_WIDTH];
2490  029e 7b04          	ld	a,(OFST+1,sp)
2491  02a0 97            	ld	xl,a
2492  02a1 a605          	ld	a,#5
2493  02a3 42            	mul	x,a
2494  02a4 1d00a0        	subw	x,#160
2495  02a7 1c0000        	addw	x,#_font
2496  02aa 1f02          	ldw	(OFST-1,sp),x
2498                     ; 166         for (i = 0; i < FONT_WIDTH; i++, ptr++)
2500  02ac 0f01          	clr	(OFST-2,sp)
2502  02ae               L3301:
2503                     ; 167             if (*ptr)
2505  02ae 1e02          	ldw	x,(OFST-1,sp)
2506  02b0 7d            	tnz	(x)
2507  02b1 2705          	jreq	L1401
2508                     ; 168                 LCD_write(*ptr);
2510  02b3 1e02          	ldw	x,(OFST-1,sp)
2511  02b5 f6            	ld	a,(x)
2512  02b6 ad99          	call	_LCD_write
2514  02b8               L1401:
2515                     ; 166         for (i = 0; i < FONT_WIDTH; i++, ptr++)
2517  02b8 0c01          	inc	(OFST-2,sp)
2519  02ba 1e02          	ldw	x,(OFST-1,sp)
2520  02bc 1c0001        	addw	x,#1
2521  02bf 1f02          	ldw	(OFST-1,sp),x
2525  02c1 7b01          	ld	a,(OFST-2,sp)
2526  02c3 a105          	cp	a,#5
2527  02c5 25e7          	jrult	L3301
2528                     ; 169         LCD_write(0);
2530  02c7 4f            	clr	a
2531  02c8 ad87          	call	_LCD_write
2533  02ca               L1301:
2534                     ; 171 }
2537  02ca 5b04          	addw	sp,#4
2538  02cc 81            	ret
2611                     ; 173 void LCD_writemsg(char *msg, uint8_t msgSize, uint8_t col, uint8_t row)
2611                     ; 174 {
2612                     	switch	.text
2613  02cd               _LCD_writemsg:
2615  02cd 89            	pushw	x
2616  02ce 89            	pushw	x
2617       00000002      OFST:	set	2
2620                     ; 175     LCD_goto(col, row);
2622  02cf 7b09          	ld	a,(OFST+7,sp)
2623  02d1 97            	ld	xl,a
2624  02d2 7b08          	ld	a,(OFST+6,sp)
2625  02d4 95            	ld	xh,a
2626  02d5 adaa          	call	_LCD_goto
2628                     ; 178         for (i = 0; i < msgSize - 1; i++)
2630  02d7 5f            	clrw	x
2631  02d8 1f01          	ldw	(OFST-1,sp),x
2634  02da 200f          	jra	L5011
2635  02dc               L1011:
2636                     ; 179             LCD_putc(msg[i]);
2638  02dc 1e01          	ldw	x,(OFST-1,sp)
2639  02de 72fb03        	addw	x,(OFST+1,sp)
2640  02e1 f6            	ld	a,(x)
2641  02e2 adab          	call	_LCD_putc
2643                     ; 178         for (i = 0; i < msgSize - 1; i++)
2645  02e4 1e01          	ldw	x,(OFST-1,sp)
2646  02e6 1c0001        	addw	x,#1
2647  02e9 1f01          	ldw	(OFST-1,sp),x
2649  02eb               L5011:
2652  02eb 9c            	rvf
2653  02ec 7b07          	ld	a,(OFST+5,sp)
2654  02ee 5f            	clrw	x
2655  02ef 97            	ld	xl,a
2656  02f0 5a            	decw	x
2657  02f1 1301          	cpw	x,(OFST-1,sp)
2658  02f3 2ce7          	jrsgt	L1011
2659                     ; 182 }
2662  02f5 5b04          	addw	sp,#4
2663  02f7 81            	ret
2688                     	xdef	_LCD_showtime
2689                     	xdef	_LCD_showdate
2690                     	xdef	_welcomeMSG
2691                     	xref	_sprintf
2692                     	xdef	_font
2693                     	xref	_SPI_write
2694                     	xdef	_LCD_display_settings
2695                     	xdef	_LCD_menu
2696                     	xdef	_LCD_min_max
2697                     	xdef	_LCD_homescreen
2698                     	xdef	_LCD_welcome
2699                     	xdef	_LCD_writemsg
2700                     	xdef	_LCD_write
2701                     	xdef	_LCD_putc
2702                     	xdef	_LCD_goto
2703                     	xdef	_LCD_cmd
2704                     	xdef	_LCD_clear
2705                     	xdef	_LCD_init
2706                     	switch	.const
2707  01f2               L545:
2708  01f2 68756d696469  	dc.b	"humidity: %02d %%",0
2709  0204               L345:
2710  0204 74656d706572  	dc.b	"temperature: %02d",0
2711  0216               L764:
2712  0216 253032643a25  	dc.b	"%02d:%02d",0
2713  0220               L114:
2714  0220 323025303264  	dc.b	"20%02d-%02d-%02d",0
2734                     	xref	c_lcmp
2735                     	xref	c_smul
2736                     	xref	c_ltor
2737                     	xref	c_lgadc
2738                     	xref	c_rtol
2739                     	xref	c_itolx
2740                     	end
