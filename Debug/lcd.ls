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
 378                     ; 64 static void LCD_delay_ms(int ms) {
 379                     	switch	.text
 380  003a               L541_LCD_delay_ms:
 382  003a 5208          	subw	sp,#8
 383       00000008      OFST:	set	8
 386                     ; 65     delay_ms(ms);
 389  003c cd0000        	call	c_itolx
 391  003f 96            	ldw	x,sp
 392  0040 1c0001        	addw	x,#OFST-7
 393  0043 cd0000        	call	c_rtol
 396                     ; 14     for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
 398  0046 ae0000        	ldw	x,#0
 399  0049 1f07          	ldw	(OFST-1,sp),x
 400  004b ae0000        	ldw	x,#0
 401  004e 1f05          	ldw	(OFST-3,sp),x
 404  0050 2009          	jra	L302
 405  0052               L771:
 408  0052 96            	ldw	x,sp
 409  0053 1c0005        	addw	x,#OFST-3
 410  0056 a601          	ld	a,#1
 411  0058 cd0000        	call	c_lgadc
 414  005b               L302:
 417  005b 96            	ldw	x,sp
 418  005c 1c0001        	addw	x,#OFST-7
 419  005f cd0000        	call	c_ltor
 421  0062 a66f          	ld	a,#111
 422  0064 cd0000        	call	c_smul
 424  0067 96            	ldw	x,sp
 425  0068 1c0005        	addw	x,#OFST-3
 426  006b cd0000        	call	c_lcmp
 428  006e 22e2          	jrugt	L771
 429                     ; 66 }
 432  0070 5b08          	addw	sp,#8
 433  0072 81            	ret
 446                     .const:	section	.text
 447  0000               _font:
 448  0000 00            	dc.b	0
 449  0001 00            	dc.b	0
 450  0002 00            	dc.b	0
 451  0003 00            	dc.b	0
 452  0004 00            	dc.b	0
 453  0005 00            	dc.b	0
 454  0006 5e            	dc.b	94
 455  0007 00            	dc.b	0
 456  0008 00            	dc.b	0
 457  0009 00            	dc.b	0
 458  000a 06            	dc.b	6
 459  000b 06            	dc.b	6
 460  000c 00            	dc.b	0
 461  000d 00            	dc.b	0
 462  000e 00            	dc.b	0
 463  000f 28            	dc.b	40
 464  0010 fe            	dc.b	254
 465  0011 28            	dc.b	40
 466  0012 fe            	dc.b	254
 467  0013 28            	dc.b	40
 468  0014 08            	dc.b	8
 469  0015 54            	dc.b	84
 470  0016 fe            	dc.b	254
 471  0017 54            	dc.b	84
 472  0018 20            	dc.b	32
 473  0019 40            	dc.b	64
 474  001a 2c            	dc.b	44
 475  001b 54            	dc.b	84
 476  001c 68            	dc.b	104
 477  001d 04            	dc.b	4
 478  001e 70            	dc.b	112
 479  001f 4e            	dc.b	78
 480  0020 7a            	dc.b	122
 481  0021 26            	dc.b	38
 482  0022 40            	dc.b	64
 483  0023 06            	dc.b	6
 484  0024 00            	dc.b	0
 485  0025 00            	dc.b	0
 486  0026 00            	dc.b	0
 487  0027 00            	dc.b	0
 488  0028 00            	dc.b	0
 489  0029 7e            	dc.b	126
 490  002a 81            	dc.b	129
 491  002b 00            	dc.b	0
 492  002c 00            	dc.b	0
 493  002d 81            	dc.b	129
 494  002e 7e            	dc.b	126
 495  002f 00            	dc.b	0
 496  0030 00            	dc.b	0
 497  0031 00            	dc.b	0
 498  0032 08            	dc.b	8
 499  0033 04            	dc.b	4
 500  0034 02            	dc.b	2
 501  0035 04            	dc.b	4
 502  0036 08            	dc.b	8
 503  0037 10            	dc.b	16
 504  0038 10            	dc.b	16
 505  0039 7c            	dc.b	124
 506  003a 10            	dc.b	16
 507  003b 10            	dc.b	16
 508  003c 00            	dc.b	0
 509  003d c0            	dc.b	192
 510  003e 00            	dc.b	0
 511  003f 00            	dc.b	0
 512  0040 00            	dc.b	0
 513  0041 20            	dc.b	32
 514  0042 20            	dc.b	32
 515  0043 00            	dc.b	0
 516  0044 00            	dc.b	0
 517  0045 00            	dc.b	0
 518  0046 00            	dc.b	0
 519  0047 40            	dc.b	64
 520  0048 00            	dc.b	0
 521  0049 00            	dc.b	0
 522  004a 00            	dc.b	0
 523  004b 70            	dc.b	112
 524  004c 0e            	dc.b	14
 525  004d 00            	dc.b	0
 526  004e 00            	dc.b	0
 527  004f 00            	dc.b	0
 528  0050 3c            	dc.b	60
 529  0051 42            	dc.b	66
 530  0052 42            	dc.b	66
 531  0053 3c            	dc.b	60
 532  0054 00            	dc.b	0
 533  0055 44            	dc.b	68
 534  0056 7e            	dc.b	126
 535  0057 40            	dc.b	64
 536  0058 00            	dc.b	0
 537  0059 00            	dc.b	0
 538  005a 62            	dc.b	98
 539  005b 52            	dc.b	82
 540  005c 4e            	dc.b	78
 541  005d 00            	dc.b	0
 542  005e 00            	dc.b	0
 543  005f 62            	dc.b	98
 544  0060 4a            	dc.b	74
 545  0061 7e            	dc.b	126
 546  0062 00            	dc.b	0
 547  0063 00            	dc.b	0
 548  0064 18            	dc.b	24
 549  0065 14            	dc.b	20
 550  0066 7e            	dc.b	126
 551  0067 10            	dc.b	16
 552  0068 00            	dc.b	0
 553  0069 4e            	dc.b	78
 554  006a 4a            	dc.b	74
 555  006b 7a            	dc.b	122
 556  006c 00            	dc.b	0
 557  006d 00            	dc.b	0
 558  006e 7e            	dc.b	126
 559  006f 52            	dc.b	82
 560  0070 72            	dc.b	114
 561  0071 00            	dc.b	0
 562  0072 00            	dc.b	0
 563  0073 02            	dc.b	2
 564  0074 62            	dc.b	98
 565  0075 1a            	dc.b	26
 566  0076 06            	dc.b	6
 567  0077 00            	dc.b	0
 568  0078 76            	dc.b	118
 569  0079 4a            	dc.b	74
 570  007a 76            	dc.b	118
 571  007b 00            	dc.b	0
 572  007c 00            	dc.b	0
 573  007d 4c            	dc.b	76
 574  007e 52            	dc.b	82
 575  007f 52            	dc.b	82
 576  0080 3c            	dc.b	60
 577  0081 00            	dc.b	0
 578  0082 00            	dc.b	0
 579  0083 48            	dc.b	72
 580  0084 00            	dc.b	0
 581  0085 00            	dc.b	0
 582  0086 00            	dc.b	0
 583  0087 00            	dc.b	0
 584  0088 c8            	dc.b	200
 585  0089 00            	dc.b	0
 586  008a 00            	dc.b	0
 587  008b 00            	dc.b	0
 588  008c 10            	dc.b	16
 589  008d 28            	dc.b	40
 590  008e 28            	dc.b	40
 591  008f 44            	dc.b	68
 592  0090 00            	dc.b	0
 593  0091 28            	dc.b	40
 594  0092 28            	dc.b	40
 595  0093 28            	dc.b	40
 596  0094 28            	dc.b	40
 597  0095 00            	dc.b	0
 598  0096 44            	dc.b	68
 599  0097 28            	dc.b	40
 600  0098 28            	dc.b	40
 601  0099 10            	dc.b	16
 602  009a 00            	dc.b	0
 603  009b 04            	dc.b	4
 604  009c 52            	dc.b	82
 605  009d 0a            	dc.b	10
 606  009e 0e            	dc.b	14
 607  009f 00            	dc.b	0
 608  00a0 7c            	dc.b	124
 609  00a1 82            	dc.b	130
 610  00a2 ba            	dc.b	186
 611  00a3 aa            	dc.b	170
 612  00a4 be            	dc.b	190
 613  00a5 7c            	dc.b	124
 614  00a6 12            	dc.b	18
 615  00a7 12            	dc.b	18
 616  00a8 7c            	dc.b	124
 617  00a9 00            	dc.b	0
 618  00aa 7e            	dc.b	126
 619  00ab 4a            	dc.b	74
 620  00ac 4a            	dc.b	74
 621  00ad 34            	dc.b	52
 622  00ae 00            	dc.b	0
 623  00af 3c            	dc.b	60
 624  00b0 42            	dc.b	66
 625  00b1 42            	dc.b	66
 626  00b2 42            	dc.b	66
 627  00b3 24            	dc.b	36
 628  00b4 7e            	dc.b	126
 629  00b5 42            	dc.b	66
 630  00b6 42            	dc.b	66
 631  00b7 42            	dc.b	66
 632  00b8 3c            	dc.b	60
 633  00b9 7e            	dc.b	126
 634  00ba 4a            	dc.b	74
 635  00bb 4a            	dc.b	74
 636  00bc 4a            	dc.b	74
 637  00bd 00            	dc.b	0
 638  00be 7e            	dc.b	126
 639  00bf 0a            	dc.b	10
 640  00c0 0a            	dc.b	10
 641  00c1 0a            	dc.b	10
 642  00c2 00            	dc.b	0
 643  00c3 3c            	dc.b	60
 644  00c4 42            	dc.b	66
 645  00c5 42            	dc.b	66
 646  00c6 52            	dc.b	82
 647  00c7 34            	dc.b	52
 648  00c8 7e            	dc.b	126
 649  00c9 08            	dc.b	8
 650  00ca 08            	dc.b	8
 651  00cb 08            	dc.b	8
 652  00cc 7e            	dc.b	126
 653  00cd 42            	dc.b	66
 654  00ce 7e            	dc.b	126
 655  00cf 42            	dc.b	66
 656  00d0 00            	dc.b	0
 657  00d1 00            	dc.b	0
 658  00d2 60            	dc.b	96
 659  00d3 42            	dc.b	66
 660  00d4 7e            	dc.b	126
 661  00d5 00            	dc.b	0
 662  00d6 00            	dc.b	0
 663  00d7 7e            	dc.b	126
 664  00d8 08            	dc.b	8
 665  00d9 18            	dc.b	24
 666  00da 24            	dc.b	36
 667  00db 42            	dc.b	66
 668  00dc 7e            	dc.b	126
 669  00dd 40            	dc.b	64
 670  00de 40            	dc.b	64
 671  00df 40            	dc.b	64
 672  00e0 00            	dc.b	0
 673  00e1 7e            	dc.b	126
 674  00e2 04            	dc.b	4
 675  00e3 08            	dc.b	8
 676  00e4 04            	dc.b	4
 677  00e5 7e            	dc.b	126
 678  00e6 7e            	dc.b	126
 679  00e7 04            	dc.b	4
 680  00e8 18            	dc.b	24
 681  00e9 20            	dc.b	32
 682  00ea 7e            	dc.b	126
 683  00eb 3c            	dc.b	60
 684  00ec 42            	dc.b	66
 685  00ed 42            	dc.b	66
 686  00ee 42            	dc.b	66
 687  00ef 3c            	dc.b	60
 688  00f0 7e            	dc.b	126
 689  00f1 12            	dc.b	18
 690  00f2 12            	dc.b	18
 691  00f3 0c            	dc.b	12
 692  00f4 00            	dc.b	0
 693  00f5 3c            	dc.b	60
 694  00f6 42            	dc.b	66
 695  00f7 c2            	dc.b	194
 696  00f8 c2            	dc.b	194
 697  00f9 bc            	dc.b	188
 698  00fa 7e            	dc.b	126
 699  00fb 12            	dc.b	18
 700  00fc 12            	dc.b	18
 701  00fd 32            	dc.b	50
 702  00fe 4c            	dc.b	76
 703  00ff 4c            	dc.b	76
 704  0100 52            	dc.b	82
 705  0101 52            	dc.b	82
 706  0102 22            	dc.b	34
 707  0103 00            	dc.b	0
 708  0104 02            	dc.b	2
 709  0105 02            	dc.b	2
 710  0106 7e            	dc.b	126
 711  0107 02            	dc.b	2
 712  0108 02            	dc.b	2
 713  0109 3e            	dc.b	62
 714  010a 40            	dc.b	64
 715  010b 40            	dc.b	64
 716  010c 40            	dc.b	64
 717  010d 3e            	dc.b	62
 718  010e 06            	dc.b	6
 719  010f 38            	dc.b	56
 720  0110 40            	dc.b	64
 721  0111 38            	dc.b	56
 722  0112 06            	dc.b	6
 723  0113 3e            	dc.b	62
 724  0114 60            	dc.b	96
 725  0115 18            	dc.b	24
 726  0116 60            	dc.b	96
 727  0117 3e            	dc.b	62
 728  0118 42            	dc.b	66
 729  0119 24            	dc.b	36
 730  011a 18            	dc.b	24
 731  011b 24            	dc.b	36
 732  011c 42            	dc.b	66
 733  011d 02            	dc.b	2
 734  011e 0c            	dc.b	12
 735  011f 70            	dc.b	112
 736  0120 0c            	dc.b	12
 737  0121 02            	dc.b	2
 738  0122 62            	dc.b	98
 739  0123 52            	dc.b	82
 740  0124 4a            	dc.b	74
 741  0125 46            	dc.b	70
 742  0126 00            	dc.b	0
 743  0127 00            	dc.b	0
 744  0128 ff            	dc.b	255
 745  0129 81            	dc.b	129
 746  012a 00            	dc.b	0
 747  012b 00            	dc.b	0
 748  012c 0e            	dc.b	14
 749  012d 70            	dc.b	112
 750  012e 00            	dc.b	0
 751  012f 00            	dc.b	0
 752  0130 00            	dc.b	0
 753  0131 81            	dc.b	129
 754  0132 ff            	dc.b	255
 755  0133 00            	dc.b	0
 756  0134 00            	dc.b	0
 757  0135 00            	dc.b	0
 758  0136 0c            	dc.b	12
 759  0137 02            	dc.b	2
 760  0138 0c            	dc.b	12
 761  0139 00            	dc.b	0
 762  013a 00            	dc.b	0
 763  013b 80            	dc.b	128
 764  013c 80            	dc.b	128
 765  013d 80            	dc.b	128
 766  013e 80            	dc.b	128
 767  013f 80            	dc.b	128
 768  0140 01            	dc.b	1
 769  0141 02            	dc.b	2
 770  0142 00            	dc.b	0
 771  0143 00            	dc.b	0
 772  0144 00            	dc.b	0
 773  0145 68            	dc.b	104
 774  0146 58            	dc.b	88
 775  0147 78            	dc.b	120
 776  0148 40            	dc.b	64
 777  0149 00            	dc.b	0
 778  014a 7e            	dc.b	126
 779  014b 48            	dc.b	72
 780  014c 30            	dc.b	48
 781  014d 00            	dc.b	0
 782  014e 00            	dc.b	0
 783  014f 78            	dc.b	120
 784  0150 48            	dc.b	72
 785  0151 48            	dc.b	72
 786  0152 00            	dc.b	0
 787  0153 00            	dc.b	0
 788  0154 78            	dc.b	120
 789  0155 48            	dc.b	72
 790  0156 7e            	dc.b	126
 791  0157 00            	dc.b	0
 792  0158 00            	dc.b	0
 793  0159 30            	dc.b	48
 794  015a 68            	dc.b	104
 795  015b 50            	dc.b	80
 796  015c 00            	dc.b	0
 797  015d 00            	dc.b	0
 798  015e 08            	dc.b	8
 799  015f 7c            	dc.b	124
 800  0160 0a            	dc.b	10
 801  0161 00            	dc.b	0
 802  0162 00            	dc.b	0
 803  0163 b8            	dc.b	184
 804  0164 a8            	dc.b	168
 805  0165 f8            	dc.b	248
 806  0166 00            	dc.b	0
 807  0167 00            	dc.b	0
 808  0168 7e            	dc.b	126
 809  0169 08            	dc.b	8
 810  016a 70            	dc.b	112
 811  016b 00            	dc.b	0
 812  016c 00            	dc.b	0
 813  016d 7a            	dc.b	122
 814  016e 00            	dc.b	0
 815  016f 00            	dc.b	0
 816  0170 00            	dc.b	0
 817  0171 00            	dc.b	0
 818  0172 40            	dc.b	64
 819  0173 7a            	dc.b	122
 820  0174 00            	dc.b	0
 821  0175 00            	dc.b	0
 822  0176 00            	dc.b	0
 823  0177 7e            	dc.b	126
 824  0178 30            	dc.b	48
 825  0179 48            	dc.b	72
 826  017a 00            	dc.b	0
 827  017b 00            	dc.b	0
 828  017c 7e            	dc.b	126
 829  017d 00            	dc.b	0
 830  017e 00            	dc.b	0
 831  017f 00            	dc.b	0
 832  0180 00            	dc.b	0
 833  0181 78            	dc.b	120
 834  0182 08            	dc.b	8
 835  0183 70            	dc.b	112
 836  0184 08            	dc.b	8
 837  0185 78            	dc.b	120
 838  0186 78            	dc.b	120
 839  0187 08            	dc.b	8
 840  0188 70            	dc.b	112
 841  0189 00            	dc.b	0
 842  018a 00            	dc.b	0
 843  018b 30            	dc.b	48
 844  018c 48            	dc.b	72
 845  018d 48            	dc.b	72
 846  018e 30            	dc.b	48
 847  018f 00            	dc.b	0
 848  0190 f8            	dc.b	248
 849  0191 48            	dc.b	72
 850  0192 30            	dc.b	48
 851  0193 00            	dc.b	0
 852  0194 00            	dc.b	0
 853  0195 38            	dc.b	56
 854  0196 28            	dc.b	40
 855  0197 f8            	dc.b	248
 856  0198 00            	dc.b	0
 857  0199 00            	dc.b	0
 858  019a 78            	dc.b	120
 859  019b 08            	dc.b	8
 860  019c 08            	dc.b	8
 861  019d 00            	dc.b	0
 862  019e 00            	dc.b	0
 863  019f 58            	dc.b	88
 864  01a0 58            	dc.b	88
 865  01a1 68            	dc.b	104
 866  01a2 00            	dc.b	0
 867  01a3 00            	dc.b	0
 868  01a4 7c            	dc.b	124
 869  01a5 48            	dc.b	72
 870  01a6 00            	dc.b	0
 871  01a7 00            	dc.b	0
 872  01a8 00            	dc.b	0
 873  01a9 78            	dc.b	120
 874  01aa 40            	dc.b	64
 875  01ab 78            	dc.b	120
 876  01ac 00            	dc.b	0
 877  01ad 00            	dc.b	0
 878  01ae 38            	dc.b	56
 879  01af 40            	dc.b	64
 880  01b0 38            	dc.b	56
 881  01b1 00            	dc.b	0
 882  01b2 00            	dc.b	0
 883  01b3 38            	dc.b	56
 884  01b4 60            	dc.b	96
 885  01b5 18            	dc.b	24
 886  01b6 60            	dc.b	96
 887  01b7 38            	dc.b	56
 888  01b8 48            	dc.b	72
 889  01b9 30            	dc.b	48
 890  01ba 48            	dc.b	72
 891  01bb 00            	dc.b	0
 892  01bc 00            	dc.b	0
 893  01bd 98            	dc.b	152
 894  01be 60            	dc.b	96
 895  01bf 18            	dc.b	24
 896  01c0 00            	dc.b	0
 897  01c1 00            	dc.b	0
 898  01c2 48            	dc.b	72
 899  01c3 68            	dc.b	104
 900  01c4 58            	dc.b	88
 901  01c5 00            	dc.b	0
 902  01c6 00            	dc.b	0
 903  01c7 10            	dc.b	16
 904  01c8 ef            	dc.b	239
 905  01c9 81            	dc.b	129
 906  01ca 00            	dc.b	0
 907  01cb 00            	dc.b	0
 908  01cc 00            	dc.b	0
 909  01cd ff            	dc.b	255
 910  01ce 00            	dc.b	0
 911  01cf 00            	dc.b	0
 912  01d0 00            	dc.b	0
 913  01d1 81            	dc.b	129
 914  01d2 ef            	dc.b	239
 915  01d3 10            	dc.b	16
 916  01d4 00            	dc.b	0
 917  01d5 00            	dc.b	0
 918  01d6 10            	dc.b	16
 919  01d7 10            	dc.b	16
 920  01d8 20            	dc.b	32
 921  01d9 20            	dc.b	32
 922  01da 00            	dc.b	0
 988                     ; 7 void LCD_init() {
 989                     	switch	.text
 990  0073               _LCD_init:
 994                     ; 9     LCD_gpio_init();
 996  0073 ad8b          	call	L3_LCD_gpio_init
 998                     ; 12     LCD_CE_clear();
1000  0075 adb0          	call	L76_LCD_CE_clear
1002                     ; 13     LCD_RST_clear();
1004  0077 adb8          	call	L311_LCD_RST_clear
1006                     ; 15     LCD_delay_ms(50);
1008  0079 ae0032        	ldw	x,#50
1009  007c adbc          	call	L541_LCD_delay_ms
1011                     ; 17     LCD_RST_set();
1013  007e adac          	call	L101_LCD_RST_set
1015                     ; 18     LCD_CE_set();
1017  0080 ad99          	call	L74_LCD_CE_set
1019                     ; 20     LCD_cmd(0x21); // extended commands
1021  0082 a621          	ld	a,#33
1022  0084 ad17          	call	_LCD_cmd
1024                     ; 21     LCD_cmd(0xc0); // contrast Vop=6.4V
1026  0086 a6c0          	ld	a,#192
1027  0088 ad13          	call	_LCD_cmd
1029                     ; 22     LCD_cmd(0x04); // temperature coefficient
1031  008a a604          	ld	a,#4
1032  008c ad0f          	call	_LCD_cmd
1034                     ; 23     LCD_cmd(0x13); // bias = 1:48
1036  008e a613          	ld	a,#19
1037  0090 ad0b          	call	_LCD_cmd
1039                     ; 25     LCD_cmd(0x20); // standard commands
1041  0092 a620          	ld	a,#32
1042  0094 ad07          	call	_LCD_cmd
1044                     ; 26     LCD_cmd(0x0C); // normal mode
1046  0096 a60c          	ld	a,#12
1047  0098 ad03          	call	_LCD_cmd
1049                     ; 28     LCD_clear();
1051  009a ad21          	call	_LCD_clear
1053                     ; 29 }
1056  009c 81            	ret
1094                     ; 31 void LCD_cmd(uint8_t cmd) {
1095                     	switch	.text
1096  009d               _LCD_cmd:
1098  009d 88            	push	a
1099       00000000      OFST:	set	0
1102                     ; 32     LCD_CE_clear();
1104  009e ad87          	call	L76_LCD_CE_clear
1106                     ; 33     LCD_DC_clear();
1108  00a0 cd0016        	call	L53_LCD_DC_clear
1110                     ; 34     LCD_SPI_write(cmd);
1112  00a3 7b01          	ld	a,(OFST+1,sp)
1113  00a5 ad8f          	call	L521_LCD_SPI_write
1115                     ; 35     LCD_CE_set();
1117  00a7 cd001b        	call	L74_LCD_CE_set
1119                     ; 36 }
1122  00aa 84            	pop	a
1123  00ab 81            	ret
1161                     ; 38 void LCD_write(uint8_t data) {
1162                     	switch	.text
1163  00ac               _LCD_write:
1165  00ac 88            	push	a
1166       00000000      OFST:	set	0
1169                     ; 39     LCD_CE_clear();
1171  00ad cd0027        	call	L76_LCD_CE_clear
1173                     ; 40     LCD_DC_set();
1175  00b0 cd0011        	call	L32_LCD_DC_set
1177                     ; 41     LCD_SPI_write(data);
1179  00b3 7b01          	ld	a,(OFST+1,sp)
1180  00b5 cd0036        	call	L521_LCD_SPI_write
1182                     ; 42     LCD_CE_set();
1184  00b8 cd001b        	call	L74_LCD_CE_set
1186                     ; 43 }
1189  00bb 84            	pop	a
1190  00bc 81            	ret
1226                     ; 45 void LCD_clear() {
1227                     	switch	.text
1228  00bd               _LCD_clear:
1230  00bd 89            	pushw	x
1231       00000002      OFST:	set	2
1234                     ; 46     uint16_t i = 84 * 6;
1236  00be ae01f8        	ldw	x,#504
1237  00c1 1f01          	ldw	(OFST-1,sp),x
1239                     ; 47     LCD_goto(0, 0);
1241  00c3 5f            	clrw	x
1242  00c4 ad16          	call	_LCD_goto
1245  00c6 2003          	jra	L513
1246  00c8               L313:
1247                     ; 49         LCD_write(0);
1249  00c8 4f            	clr	a
1250  00c9 ade1          	call	_LCD_write
1252  00cb               L513:
1253                     ; 48     while (i-- > 0)
1255  00cb 1e01          	ldw	x,(OFST-1,sp)
1256  00cd 1d0001        	subw	x,#1
1257  00d0 1f01          	ldw	(OFST-1,sp),x
1258  00d2 1c0001        	addw	x,#1
1260  00d5 a30000        	cpw	x,#0
1261  00d8 26ee          	jrne	L313
1262                     ; 50 }
1265  00da 85            	popw	x
1266  00db 81            	ret
1310                     ; 52 void LCD_goto(uint8_t col, uint8_t row) {
1311                     	switch	.text
1312  00dc               _LCD_goto:
1314  00dc 89            	pushw	x
1315       00000000      OFST:	set	0
1318                     ; 53     LCD_cmd(0x80 | col);
1320  00dd 9e            	ld	a,xh
1321  00de aa80          	or	a,#128
1322  00e0 adbb          	call	_LCD_cmd
1324                     ; 54     LCD_cmd(0x40 | row);
1326  00e2 7b02          	ld	a,(OFST+2,sp)
1327  00e4 aa40          	or	a,#64
1328  00e6 adb5          	call	_LCD_cmd
1330                     ; 55 }
1333  00e8 85            	popw	x
1334  00e9 81            	ret
1389                     ; 57 void LCD_putc(char c) {
1390                     	switch	.text
1391  00ea               _LCD_putc:
1393  00ea 88            	push	a
1394  00eb 5203          	subw	sp,#3
1395       00000003      OFST:	set	3
1398                     ; 58     if (c == ' ') {
1400  00ed a120          	cp	a,#32
1401  00ef 2608          	jrne	L173
1402                     ; 59         LCD_write(0);
1404  00f1 4f            	clr	a
1405  00f2 adb8          	call	_LCD_write
1407                     ; 60         LCD_write(0);
1409  00f4 4f            	clr	a
1410  00f5 adb5          	call	_LCD_write
1413  00f7 202c          	jra	L373
1414  00f9               L173:
1415                     ; 62         const char *ptr = &font[(c - 32) * FONT_WIDTH];
1417  00f9 7b04          	ld	a,(OFST+1,sp)
1418  00fb 97            	ld	xl,a
1419  00fc a605          	ld	a,#5
1420  00fe 42            	mul	x,a
1421  00ff 1d00a0        	subw	x,#160
1422  0102 1c0000        	addw	x,#_font
1423  0105 1f02          	ldw	(OFST-1,sp),x
1425                     ; 64         for (i = 0; i < FONT_WIDTH; i++, ptr++)
1427  0107 0f01          	clr	(OFST-2,sp)
1429  0109               L573:
1430                     ; 65             if (*ptr)
1432  0109 1e02          	ldw	x,(OFST-1,sp)
1433  010b 7d            	tnz	(x)
1434  010c 2705          	jreq	L304
1435                     ; 66                 LCD_write(*ptr);
1437  010e 1e02          	ldw	x,(OFST-1,sp)
1438  0110 f6            	ld	a,(x)
1439  0111 ad99          	call	_LCD_write
1441  0113               L304:
1442                     ; 64         for (i = 0; i < FONT_WIDTH; i++, ptr++)
1444  0113 0c01          	inc	(OFST-2,sp)
1446  0115 1e02          	ldw	x,(OFST-1,sp)
1447  0117 1c0001        	addw	x,#1
1448  011a 1f02          	ldw	(OFST-1,sp),x
1452  011c 7b01          	ld	a,(OFST-2,sp)
1453  011e a105          	cp	a,#5
1454  0120 25e7          	jrult	L573
1455                     ; 67         LCD_write(0);
1457  0122 4f            	clr	a
1458  0123 ad87          	call	_LCD_write
1460  0125               L373:
1461                     ; 69 }
1464  0125 5b04          	addw	sp,#4
1465  0127 81            	ret
1478                     	xdef	_font
1479                     	xref	_SPI_write
1480                     	xdef	_LCD_write
1481                     	xdef	_LCD_putc
1482                     	xdef	_LCD_goto
1483                     	xdef	_LCD_cmd
1484                     	xdef	_LCD_clear
1485                     	xdef	_LCD_init
1504                     	xref	c_lcmp
1505                     	xref	c_smul
1506                     	xref	c_ltor
1507                     	xref	c_lgadc
1508                     	xref	c_rtol
1509                     	xref	c_itolx
1510                     	end
