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
 963                     	xref	_LCD_homescreen
 964                     	xref	_LCD_welcome
1002                     ; 8 void LCD_init()
1002                     ; 9 {
1003                     	switch	.text
1004  0074               _LCD_init:
1008                     ; 11     LCD_gpio_init();
1010  0074 ad8a          	call	L3_LCD_gpio_init
1012                     ; 14     LCD_CE_clear();
1014  0076 adaf          	call	L76_LCD_CE_clear
1016                     ; 15     LCD_RST_clear();
1018  0078 adb7          	call	L311_LCD_RST_clear
1020                     ; 17     LCD_delay_ms(50);
1022  007a ae0032        	ldw	x,#50
1023  007d adbb          	call	L541_LCD_delay_ms
1025                     ; 19     LCD_RST_set();
1027  007f adab          	call	L101_LCD_RST_set
1029                     ; 20     LCD_CE_set();
1031  0081 ad98          	call	L74_LCD_CE_set
1033                     ; 22     LCD_cmd(0x21); // extended commands
1035  0083 a621          	ld	a,#33
1036  0085 cd0131        	call	_LCD_cmd
1038                     ; 23     LCD_cmd(0xc0); // contrast Vop=6.4V
1040  0088 a6c0          	ld	a,#192
1041  008a cd0131        	call	_LCD_cmd
1043                     ; 24     LCD_cmd(0x04); // temperature coefficient
1045  008d a604          	ld	a,#4
1046  008f cd0131        	call	_LCD_cmd
1048                     ; 25     LCD_cmd(0x13); // bias = 1:48
1050  0092 a613          	ld	a,#19
1051  0094 cd0131        	call	_LCD_cmd
1053                     ; 27     LCD_cmd(0x20); // standard commands
1055  0097 a620          	ld	a,#32
1056  0099 cd0131        	call	_LCD_cmd
1058                     ; 28     LCD_cmd(0x0C); // normal mode
1060  009c a60c          	ld	a,#12
1061  009e cd0131        	call	_LCD_cmd
1063                     ; 30     LCD_welcome();
1065  00a1 ad0b          	call	_LCD_welcome
1067                     ; 31     LCD_homescreen("18", "70%%");
1069  00a3 ae0214        	ldw	x,#L342
1070  00a6 89            	pushw	x
1071  00a7 ae0219        	ldw	x,#L142
1072  00aa ad2c          	call	_LCD_homescreen
1074  00ac 85            	popw	x
1075                     ; 33 }
1078  00ad 81            	ret
1117                     ; 35 void LCD_welcome()
1117                     ; 36 {
1118                     	switch	.text
1119  00ae               _LCD_welcome:
1121  00ae 89            	pushw	x
1122       00000002      OFST:	set	2
1125                     ; 37     LCD_goto(0, 2);
1127  00af ae0002        	ldw	x,#2
1128  00b2 cd0172        	call	_LCD_goto
1130                     ; 40         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1132  00b5 5f            	clrw	x
1133  00b6 1f01          	ldw	(OFST-1,sp),x
1135  00b8               L362:
1136                     ; 41             LCD_putc(welcomeMSG[i]);
1138  00b8 1e01          	ldw	x,(OFST-1,sp)
1139  00ba d601db        	ld	a,(_welcomeMSG,x)
1140  00bd cd0180        	call	_LCD_putc
1142                     ; 40         for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
1144  00c0 1e01          	ldw	x,(OFST-1,sp)
1145  00c2 1c0001        	addw	x,#1
1146  00c5 1f01          	ldw	(OFST-1,sp),x
1150  00c7 1e01          	ldw	x,(OFST-1,sp)
1151  00c9 a30016        	cpw	x,#22
1152  00cc 25ea          	jrult	L362
1153                     ; 43     LCD_delay_ms(3000);
1155  00ce ae0bb8        	ldw	x,#3000
1156  00d1 cd003a        	call	L541_LCD_delay_ms
1158                     ; 44     LCD_clear();
1160  00d4 ad7d          	call	_LCD_clear
1162                     ; 45 }
1165  00d6 85            	popw	x
1166  00d7 81            	ret
1169                     	switch	.const
1170  01f2               L172_homeMsg:
1171  01f2 686f6d6500    	dc.b	"home",0
1172  01f7               L372_tempMsg:
1173  01f7 74656d702020  	dc.b	"temp     : 18",0
1174  0205               L572_humMsg:
1175  0205 68756d696469  	dc.b	"humidity : 54%",0
1239                     ; 47 void LCD_homescreen(char temperature[], char humidity[])
1239                     ; 48 {
1240                     	switch	.text
1241  00d8               _LCD_homescreen:
1243  00d8 5222          	subw	sp,#34
1244       00000022      OFST:	set	34
1247                     ; 49     char homeMsg[] = "home";
1249  00da 96            	ldw	x,sp
1250  00db 1c0001        	addw	x,#OFST-33
1251  00de 90ae01f2      	ldw	y,#L172_homeMsg
1252  00e2 a605          	ld	a,#5
1253  00e4 cd0000        	call	c_xymov
1255                     ; 50     char tempMsg[] = "temp     : 18";
1257  00e7 96            	ldw	x,sp
1258  00e8 1c0006        	addw	x,#OFST-28
1259  00eb 90ae01f7      	ldw	y,#L372_tempMsg
1260  00ef a60e          	ld	a,#14
1261  00f1 cd0000        	call	c_xymov
1263                     ; 51     char humMsg[]  = "humidity : 54%";
1265  00f4 96            	ldw	x,sp
1266  00f5 1c0014        	addw	x,#OFST-14
1267  00f8 90ae0205      	ldw	y,#L572_humMsg
1268  00fc a60f          	ld	a,#15
1269  00fe cd0000        	call	c_xymov
1271                     ; 53     LCD_writemsg(tempMsg, sizeof(tempMsg), 0, 1);
1273  0101 4b01          	push	#1
1274  0103 4b00          	push	#0
1275  0105 4b0e          	push	#14
1276  0107 96            	ldw	x,sp
1277  0108 1c0009        	addw	x,#OFST-25
1278  010b cd01be        	call	_LCD_writemsg
1280  010e 5b03          	addw	sp,#3
1281                     ; 54     LCD_writemsg(humMsg, sizeof(humMsg), 0, 2);
1283  0110 4b02          	push	#2
1284  0112 4b00          	push	#0
1285  0114 4b0f          	push	#15
1286  0116 96            	ldw	x,sp
1287  0117 1c0017        	addw	x,#OFST-11
1288  011a cd01be        	call	_LCD_writemsg
1290  011d 5b03          	addw	sp,#3
1291                     ; 55     LCD_writemsg(homeMsg, sizeof(homeMsg), 0, 5);
1293  011f 4b05          	push	#5
1294  0121 4b00          	push	#0
1295  0123 4b05          	push	#5
1296  0125 96            	ldw	x,sp
1297  0126 1c0004        	addw	x,#OFST-30
1298  0129 cd01be        	call	_LCD_writemsg
1300  012c 5b03          	addw	sp,#3
1301                     ; 57 }
1304  012e 5b22          	addw	sp,#34
1305  0130 81            	ret
1343                     ; 58 void LCD_cmd(uint8_t cmd)
1343                     ; 59 {
1344                     	switch	.text
1345  0131               _LCD_cmd:
1347  0131 88            	push	a
1348       00000000      OFST:	set	0
1351                     ; 60     LCD_CE_clear();
1353  0132 cd0027        	call	L76_LCD_CE_clear
1355                     ; 61     LCD_DC_clear();
1357  0135 cd0016        	call	L53_LCD_DC_clear
1359                     ; 62     LCD_SPI_write(cmd);
1361  0138 7b01          	ld	a,(OFST+1,sp)
1362  013a cd0036        	call	L521_LCD_SPI_write
1364                     ; 63     LCD_CE_set();
1366  013d cd001b        	call	L74_LCD_CE_set
1368                     ; 64 }
1371  0140 84            	pop	a
1372  0141 81            	ret
1410                     ; 66 void LCD_write(uint8_t data)
1410                     ; 67 {
1411                     	switch	.text
1412  0142               _LCD_write:
1414  0142 88            	push	a
1415       00000000      OFST:	set	0
1418                     ; 68     LCD_CE_clear();
1420  0143 cd0027        	call	L76_LCD_CE_clear
1422                     ; 69     LCD_DC_set();
1424  0146 cd0011        	call	L32_LCD_DC_set
1426                     ; 70     LCD_SPI_write(data);
1428  0149 7b01          	ld	a,(OFST+1,sp)
1429  014b cd0036        	call	L521_LCD_SPI_write
1431                     ; 71     LCD_CE_set();
1433  014e cd001b        	call	L74_LCD_CE_set
1435                     ; 72 }
1438  0151 84            	pop	a
1439  0152 81            	ret
1475                     ; 74 void LCD_clear()
1475                     ; 75 {
1476                     	switch	.text
1477  0153               _LCD_clear:
1479  0153 89            	pushw	x
1480       00000002      OFST:	set	2
1483                     ; 76     uint16_t i = 84 * 6;
1485  0154 ae01f8        	ldw	x,#504
1486  0157 1f01          	ldw	(OFST-1,sp),x
1488                     ; 77     LCD_goto(0, 0);
1490  0159 5f            	clrw	x
1491  015a ad16          	call	_LCD_goto
1494  015c 2003          	jra	L504
1495  015e               L304:
1496                     ; 79         LCD_write(0);
1498  015e 4f            	clr	a
1499  015f ade1          	call	_LCD_write
1501  0161               L504:
1502                     ; 78     while (i-- > 0)
1504  0161 1e01          	ldw	x,(OFST-1,sp)
1505  0163 1d0001        	subw	x,#1
1506  0166 1f01          	ldw	(OFST-1,sp),x
1507  0168 1c0001        	addw	x,#1
1509  016b a30000        	cpw	x,#0
1510  016e 26ee          	jrne	L304
1511                     ; 80 }
1514  0170 85            	popw	x
1515  0171 81            	ret
1559                     ; 82 void LCD_goto(uint8_t col, uint8_t row)
1559                     ; 83 {
1560                     	switch	.text
1561  0172               _LCD_goto:
1563  0172 89            	pushw	x
1564       00000000      OFST:	set	0
1567                     ; 84     LCD_cmd(0x80 | col);
1569  0173 9e            	ld	a,xh
1570  0174 aa80          	or	a,#128
1571  0176 adb9          	call	_LCD_cmd
1573                     ; 85     LCD_cmd(0x40 | row);
1575  0178 7b02          	ld	a,(OFST+2,sp)
1576  017a aa40          	or	a,#64
1577  017c adb3          	call	_LCD_cmd
1579                     ; 86 }
1582  017e 85            	popw	x
1583  017f 81            	ret
1638                     ; 88 void LCD_putc(char c)
1638                     ; 89 {
1639                     	switch	.text
1640  0180               _LCD_putc:
1642  0180 88            	push	a
1643  0181 5203          	subw	sp,#3
1644       00000003      OFST:	set	3
1647                     ; 90     if (c == ' ')
1649  0183 a120          	cp	a,#32
1650  0185 2608          	jrne	L164
1651                     ; 92         LCD_write(0);
1653  0187 4f            	clr	a
1654  0188 adb8          	call	_LCD_write
1656                     ; 93         LCD_write(0);
1658  018a 4f            	clr	a
1659  018b adb5          	call	_LCD_write
1662  018d 202c          	jra	L364
1663  018f               L164:
1664                     ; 97         const char *ptr = &font[(c - 32) * FONT_WIDTH];
1666  018f 7b04          	ld	a,(OFST+1,sp)
1667  0191 97            	ld	xl,a
1668  0192 a605          	ld	a,#5
1669  0194 42            	mul	x,a
1670  0195 1d00a0        	subw	x,#160
1671  0198 1c0000        	addw	x,#_font
1672  019b 1f02          	ldw	(OFST-1,sp),x
1674                     ; 99         for (i = 0; i < FONT_WIDTH; i++, ptr++)
1676  019d 0f01          	clr	(OFST-2,sp)
1678  019f               L564:
1679                     ; 100             if (*ptr)
1681  019f 1e02          	ldw	x,(OFST-1,sp)
1682  01a1 7d            	tnz	(x)
1683  01a2 2705          	jreq	L374
1684                     ; 101                 LCD_write(*ptr);
1686  01a4 1e02          	ldw	x,(OFST-1,sp)
1687  01a6 f6            	ld	a,(x)
1688  01a7 ad99          	call	_LCD_write
1690  01a9               L374:
1691                     ; 99         for (i = 0; i < FONT_WIDTH; i++, ptr++)
1693  01a9 0c01          	inc	(OFST-2,sp)
1695  01ab 1e02          	ldw	x,(OFST-1,sp)
1696  01ad 1c0001        	addw	x,#1
1697  01b0 1f02          	ldw	(OFST-1,sp),x
1701  01b2 7b01          	ld	a,(OFST-2,sp)
1702  01b4 a105          	cp	a,#5
1703  01b6 25e7          	jrult	L564
1704                     ; 102         LCD_write(0);
1706  01b8 4f            	clr	a
1707  01b9 ad87          	call	_LCD_write
1709  01bb               L364:
1710                     ; 104 }
1713  01bb 5b04          	addw	sp,#4
1714  01bd 81            	ret
1788                     ; 106 void LCD_writemsg(char *msg, uint8_t msgSize, uint8_t col, uint8_t row)
1788                     ; 107 {
1789                     	switch	.text
1790  01be               _LCD_writemsg:
1792  01be 89            	pushw	x
1793  01bf 89            	pushw	x
1794       00000002      OFST:	set	2
1797                     ; 108     LCD_goto(col, row);
1799  01c0 7b09          	ld	a,(OFST+7,sp)
1800  01c2 97            	ld	xl,a
1801  01c3 7b08          	ld	a,(OFST+6,sp)
1802  01c5 95            	ld	xh,a
1803  01c6 adaa          	call	_LCD_goto
1805                     ; 111         for (i = 0; i < msgSize - 1; i++)
1807  01c8 5f            	clrw	x
1808  01c9 1f01          	ldw	(OFST-1,sp),x
1811  01cb 200f          	jra	L735
1812  01cd               L335:
1813                     ; 112             LCD_putc(msg[i]);
1815  01cd 1e01          	ldw	x,(OFST-1,sp)
1816  01cf 72fb03        	addw	x,(OFST+1,sp)
1817  01d2 f6            	ld	a,(x)
1818  01d3 adab          	call	_LCD_putc
1820                     ; 111         for (i = 0; i < msgSize - 1; i++)
1822  01d5 1e01          	ldw	x,(OFST-1,sp)
1823  01d7 1c0001        	addw	x,#1
1824  01da 1f01          	ldw	(OFST-1,sp),x
1826  01dc               L735:
1829  01dc 9c            	rvf
1830  01dd 7b07          	ld	a,(OFST+5,sp)
1831  01df 5f            	clrw	x
1832  01e0 97            	ld	xl,a
1833  01e1 5a            	decw	x
1834  01e2 1301          	cpw	x,(OFST-1,sp)
1835  01e4 2ce7          	jrsgt	L335
1836                     ; 114     LCD_delay_ms(1000);
1838  01e6 ae03e8        	ldw	x,#1000
1839  01e9 cd003a        	call	L541_LCD_delay_ms
1841                     ; 116 }
1844  01ec 5b04          	addw	sp,#4
1845  01ee 81            	ret
1870                     	xdef	_LCD_homescreen
1871                     	xdef	_LCD_welcome
1872                     	xdef	_welcomeMSG
1873                     	xdef	_font
1874                     	xref	_SPI_write
1875                     	xdef	_LCD_writemsg
1876                     	xdef	_LCD_write
1877                     	xdef	_LCD_putc
1878                     	xdef	_LCD_goto
1879                     	xdef	_LCD_cmd
1880                     	xdef	_LCD_clear
1881                     	xdef	_LCD_init
1882                     	switch	.const
1883  0214               L342:
1884  0214 3730252500    	dc.b	"70%%",0
1885  0219               L142:
1886  0219 313800        	dc.b	"18",0
1887                     	xref.b	c_x
1907                     	xref	c_xymov
1908                     	xref	c_lcmp
1909                     	xref	c_smul
1910                     	xref	c_ltor
1911                     	xref	c_lgadc
1912                     	xref	c_rtol
1913                     	xref	c_itolx
1914                     	end
