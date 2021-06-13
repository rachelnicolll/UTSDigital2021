   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 123 void EXTI_DeInit(void)
  41                     ; 124 {
  43                     	switch	.text
  44  0000               _EXTI_DeInit:
  48                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  50  0000 725f50a0      	clr	20640
  51                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  53  0004 725f50a1      	clr	20641
  54                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  56  0008 725f50a2      	clr	20642
  57                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  59  000c 725f50aa      	clr	20650
  60                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  62  0010 35ff50a3      	mov	20643,#255
  63                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  65  0014 35ff50a4      	mov	20644,#255
  66                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  68  0018 725f50a5      	clr	20645
  69                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  71  001c 725f50ab      	clr	20651
  72                     ; 133 }
  75  0020 81            	ret
 221                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 221                     ; 161 {
 222                     	switch	.text
 223  0021               _EXTI_SetPinSensitivity:
 225  0021 89            	pushw	x
 226       00000000      OFST:	set	0
 229                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 231                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 233                     ; 168   switch (EXTI_Pin)
 235  0022 9e            	ld	a,xh
 237                     ; 202     default:
 237                     ; 203       break;
 238  0023 4d            	tnz	a
 239  0024 272f          	jreq	L12
 240  0026 a002          	sub	a,#2
 241  0028 274a          	jreq	L32
 242  002a a002          	sub	a,#2
 243  002c 2765          	jreq	L52
 244  002e a002          	sub	a,#2
 245  0030 2603cc00b2    	jreq	L72
 246  0035 a00a          	sub	a,#10
 247  0037 2603          	jrne	L05
 248  0039 cc00cf        	jp	L13
 249  003c               L05:
 250  003c a002          	sub	a,#2
 251  003e 2603          	jrne	L25
 252  0040 cc00ee        	jp	L33
 253  0043               L25:
 254  0043 a002          	sub	a,#2
 255  0045 2603          	jrne	L45
 256  0047 cc010d        	jp	L53
 257  004a               L45:
 258  004a a002          	sub	a,#2
 259  004c 2603          	jrne	L65
 260  004e cc012c        	jp	L73
 261  0051               L65:
 262  0051 ac490149      	jpf	L721
 263  0055               L12:
 264                     ; 170     case EXTI_Pin_0:
 264                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 266  0055 c650a0        	ld	a,20640
 267  0058 a4fc          	and	a,#252
 268  005a c750a0        	ld	20640,a
 269                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 271  005d 7b01          	ld	a,(OFST+1,sp)
 272  005f 5f            	clrw	x
 273  0060 97            	ld	xl,a
 274  0061 7b02          	ld	a,(OFST+2,sp)
 275  0063 5d            	tnzw	x
 276  0064 2704          	jreq	L01
 277  0066               L21:
 278  0066 48            	sll	a
 279  0067 5a            	decw	x
 280  0068 26fc          	jrne	L21
 281  006a               L01:
 282  006a ca50a0        	or	a,20640
 283  006d c750a0        	ld	20640,a
 284                     ; 173       break;
 286  0070 ac490149      	jpf	L721
 287  0074               L32:
 288                     ; 174     case EXTI_Pin_1:
 288                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 290  0074 c650a0        	ld	a,20640
 291  0077 a4f3          	and	a,#243
 292  0079 c750a0        	ld	20640,a
 293                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 295  007c 7b01          	ld	a,(OFST+1,sp)
 296  007e 5f            	clrw	x
 297  007f 97            	ld	xl,a
 298  0080 7b02          	ld	a,(OFST+2,sp)
 299  0082 5d            	tnzw	x
 300  0083 2704          	jreq	L41
 301  0085               L61:
 302  0085 48            	sll	a
 303  0086 5a            	decw	x
 304  0087 26fc          	jrne	L61
 305  0089               L41:
 306  0089 ca50a0        	or	a,20640
 307  008c c750a0        	ld	20640,a
 308                     ; 177       break;
 310  008f ac490149      	jpf	L721
 311  0093               L52:
 312                     ; 178     case EXTI_Pin_2:
 312                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 314  0093 c650a0        	ld	a,20640
 315  0096 a4cf          	and	a,#207
 316  0098 c750a0        	ld	20640,a
 317                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 319  009b 7b01          	ld	a,(OFST+1,sp)
 320  009d 5f            	clrw	x
 321  009e 97            	ld	xl,a
 322  009f 7b02          	ld	a,(OFST+2,sp)
 323  00a1 5d            	tnzw	x
 324  00a2 2704          	jreq	L02
 325  00a4               L22:
 326  00a4 48            	sll	a
 327  00a5 5a            	decw	x
 328  00a6 26fc          	jrne	L22
 329  00a8               L02:
 330  00a8 ca50a0        	or	a,20640
 331  00ab c750a0        	ld	20640,a
 332                     ; 181       break;
 334  00ae ac490149      	jpf	L721
 335  00b2               L72:
 336                     ; 182     case EXTI_Pin_3:
 336                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 338  00b2 c650a0        	ld	a,20640
 339  00b5 a43f          	and	a,#63
 340  00b7 c750a0        	ld	20640,a
 341                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 343  00ba 7b01          	ld	a,(OFST+1,sp)
 344  00bc 5f            	clrw	x
 345  00bd 97            	ld	xl,a
 346  00be 7b02          	ld	a,(OFST+2,sp)
 347  00c0 5d            	tnzw	x
 348  00c1 2704          	jreq	L42
 349  00c3               L62:
 350  00c3 48            	sll	a
 351  00c4 5a            	decw	x
 352  00c5 26fc          	jrne	L62
 353  00c7               L42:
 354  00c7 ca50a0        	or	a,20640
 355  00ca c750a0        	ld	20640,a
 356                     ; 185       break;
 358  00cd 207a          	jra	L721
 359  00cf               L13:
 360                     ; 186     case EXTI_Pin_4:
 360                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 362  00cf c650a1        	ld	a,20641
 363  00d2 a4fc          	and	a,#252
 364  00d4 c750a1        	ld	20641,a
 365                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 367  00d7 7b01          	ld	a,(OFST+1,sp)
 368  00d9 a4ef          	and	a,#239
 369  00db 5f            	clrw	x
 370  00dc 97            	ld	xl,a
 371  00dd 7b02          	ld	a,(OFST+2,sp)
 372  00df 5d            	tnzw	x
 373  00e0 2704          	jreq	L03
 374  00e2               L23:
 375  00e2 48            	sll	a
 376  00e3 5a            	decw	x
 377  00e4 26fc          	jrne	L23
 378  00e6               L03:
 379  00e6 ca50a1        	or	a,20641
 380  00e9 c750a1        	ld	20641,a
 381                     ; 189       break;
 383  00ec 205b          	jra	L721
 384  00ee               L33:
 385                     ; 190     case EXTI_Pin_5:
 385                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 387  00ee c650a1        	ld	a,20641
 388  00f1 a4f3          	and	a,#243
 389  00f3 c750a1        	ld	20641,a
 390                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 392  00f6 7b01          	ld	a,(OFST+1,sp)
 393  00f8 a4ef          	and	a,#239
 394  00fa 5f            	clrw	x
 395  00fb 97            	ld	xl,a
 396  00fc 7b02          	ld	a,(OFST+2,sp)
 397  00fe 5d            	tnzw	x
 398  00ff 2704          	jreq	L43
 399  0101               L63:
 400  0101 48            	sll	a
 401  0102 5a            	decw	x
 402  0103 26fc          	jrne	L63
 403  0105               L43:
 404  0105 ca50a1        	or	a,20641
 405  0108 c750a1        	ld	20641,a
 406                     ; 193       break;
 408  010b 203c          	jra	L721
 409  010d               L53:
 410                     ; 194     case EXTI_Pin_6:
 410                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 412  010d c650a1        	ld	a,20641
 413  0110 a4cf          	and	a,#207
 414  0112 c750a1        	ld	20641,a
 415                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 417  0115 7b01          	ld	a,(OFST+1,sp)
 418  0117 a4ef          	and	a,#239
 419  0119 5f            	clrw	x
 420  011a 97            	ld	xl,a
 421  011b 7b02          	ld	a,(OFST+2,sp)
 422  011d 5d            	tnzw	x
 423  011e 2704          	jreq	L04
 424  0120               L24:
 425  0120 48            	sll	a
 426  0121 5a            	decw	x
 427  0122 26fc          	jrne	L24
 428  0124               L04:
 429  0124 ca50a1        	or	a,20641
 430  0127 c750a1        	ld	20641,a
 431                     ; 197       break;
 433  012a 201d          	jra	L721
 434  012c               L73:
 435                     ; 198     case EXTI_Pin_7:
 435                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 437  012c c650a1        	ld	a,20641
 438  012f a43f          	and	a,#63
 439  0131 c750a1        	ld	20641,a
 440                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 442  0134 7b01          	ld	a,(OFST+1,sp)
 443  0136 a4ef          	and	a,#239
 444  0138 5f            	clrw	x
 445  0139 97            	ld	xl,a
 446  013a 7b02          	ld	a,(OFST+2,sp)
 447  013c 5d            	tnzw	x
 448  013d 2704          	jreq	L44
 449  013f               L64:
 450  013f 48            	sll	a
 451  0140 5a            	decw	x
 452  0141 26fc          	jrne	L64
 453  0143               L44:
 454  0143 ca50a1        	or	a,20641
 455  0146 c750a1        	ld	20641,a
 456                     ; 201       break;
 458  0149               L14:
 459                     ; 202     default:
 459                     ; 203       break;
 461  0149               L721:
 462                     ; 205 }
 465  0149 85            	popw	x
 466  014a 81            	ret
 549                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 549                     ; 220 {
 550                     	switch	.text
 551  014b               _EXTI_SelectPort:
 553  014b 88            	push	a
 554       00000000      OFST:	set	0
 557                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 559                     ; 224   if (EXTI_Port == EXTI_Port_B)
 561  014c 4d            	tnz	a
 562  014d 2606          	jrne	L761
 563                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 565  014f 721b50ab      	bres	20651,#5
 567  0153 2034          	jra	L171
 568  0155               L761:
 569                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 571  0155 7b01          	ld	a,(OFST+1,sp)
 572  0157 a102          	cp	a,#2
 573  0159 2606          	jrne	L371
 574                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 576  015b 721d50ab      	bres	20651,#6
 578  015f 2028          	jra	L171
 579  0161               L371:
 580                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 582  0161 7b01          	ld	a,(OFST+1,sp)
 583  0163 a104          	cp	a,#4
 584  0165 2606          	jrne	L771
 585                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 587  0167 721f50a5      	bres	20645,#7
 589  016b 201c          	jra	L171
 590  016d               L771:
 591                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 593  016d 7b01          	ld	a,(OFST+1,sp)
 594  016f a106          	cp	a,#6
 595  0171 2606          	jrne	L302
 596                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 598  0173 721e50a5      	bset	20645,#7
 600  0177 2010          	jra	L171
 601  0179               L302:
 602                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 604  0179 7b01          	ld	a,(OFST+1,sp)
 605  017b a110          	cp	a,#16
 606  017d 2606          	jrne	L702
 607                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 609  017f 721a50ab      	bset	20651,#5
 611  0183 2004          	jra	L171
 612  0185               L702:
 613                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 615  0185 721c50ab      	bset	20651,#6
 616  0189               L171:
 617                     ; 254 }
 620  0189 84            	pop	a
 621  018a 81            	ret
 789                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 789                     ; 281                                FunctionalState NewState)
 789                     ; 282 {
 790                     	switch	.text
 791  018b               _EXTI_SetHalfPortSelection:
 793  018b 89            	pushw	x
 794       00000000      OFST:	set	0
 797                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 799                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 801                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 803  018c 9e            	ld	a,xh
 804  018d a580          	bcp	a,#128
 805  018f 2619          	jrne	L103
 806                     ; 289     if (NewState != DISABLE)
 808  0191 0d02          	tnz	(OFST+2,sp)
 809  0193 270a          	jreq	L303
 810                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 812  0195 c650a5        	ld	a,20645
 813  0198 1a01          	or	a,(OFST+1,sp)
 814  019a c750a5        	ld	20645,a
 816  019d 2026          	jra	L703
 817  019f               L303:
 818                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 820  019f 7b01          	ld	a,(OFST+1,sp)
 821  01a1 43            	cpl	a
 822  01a2 c450a5        	and	a,20645
 823  01a5 c750a5        	ld	20645,a
 824  01a8 201b          	jra	L703
 825  01aa               L103:
 826                     ; 302     if (NewState != DISABLE)
 828  01aa 0d02          	tnz	(OFST+2,sp)
 829  01ac 270c          	jreq	L113
 830                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 832  01ae 7b01          	ld	a,(OFST+1,sp)
 833  01b0 a47f          	and	a,#127
 834  01b2 ca50ab        	or	a,20651
 835  01b5 c750ab        	ld	20651,a
 837  01b8 200b          	jra	L703
 838  01ba               L113:
 839                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 841  01ba 7b01          	ld	a,(OFST+1,sp)
 842  01bc a47f          	and	a,#127
 843  01be 43            	cpl	a
 844  01bf c450ab        	and	a,20651
 845  01c2 c750ab        	ld	20651,a
 846  01c5               L703:
 847                     ; 313 }
 850  01c5 85            	popw	x
 851  01c6 81            	ret
 897                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 897                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 897                     ; 340 {
 898                     	switch	.text
 899  01c7               _EXTI_SetPortSensitivity:
 901  01c7 89            	pushw	x
 902       00000000      OFST:	set	0
 905                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 907                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 909                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 911  01c8 9e            	ld	a,xh
 912  01c9 a5f0          	bcp	a,#240
 913  01cb 2629          	jrne	L733
 914                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 916  01cd 7b01          	ld	a,(OFST+1,sp)
 917  01cf 5f            	clrw	x
 918  01d0 97            	ld	xl,a
 919  01d1 a603          	ld	a,#3
 920  01d3 5d            	tnzw	x
 921  01d4 2704          	jreq	L66
 922  01d6               L07:
 923  01d6 48            	sll	a
 924  01d7 5a            	decw	x
 925  01d8 26fc          	jrne	L07
 926  01da               L66:
 927  01da 43            	cpl	a
 928  01db c450a2        	and	a,20642
 929  01de c750a2        	ld	20642,a
 930                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 932  01e1 7b01          	ld	a,(OFST+1,sp)
 933  01e3 5f            	clrw	x
 934  01e4 97            	ld	xl,a
 935  01e5 7b02          	ld	a,(OFST+2,sp)
 936  01e7 5d            	tnzw	x
 937  01e8 2704          	jreq	L27
 938  01ea               L47:
 939  01ea 48            	sll	a
 940  01eb 5a            	decw	x
 941  01ec 26fc          	jrne	L47
 942  01ee               L27:
 943  01ee ca50a2        	or	a,20642
 944  01f1 c750a2        	ld	20642,a
 946  01f4 202b          	jra	L143
 947  01f6               L733:
 948                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 950  01f6 7b01          	ld	a,(OFST+1,sp)
 951  01f8 a40f          	and	a,#15
 952  01fa 5f            	clrw	x
 953  01fb 97            	ld	xl,a
 954  01fc a603          	ld	a,#3
 955  01fe 5d            	tnzw	x
 956  01ff 2704          	jreq	L67
 957  0201               L001:
 958  0201 48            	sll	a
 959  0202 5a            	decw	x
 960  0203 26fc          	jrne	L001
 961  0205               L67:
 962  0205 43            	cpl	a
 963  0206 c450aa        	and	a,20650
 964  0209 c750aa        	ld	20650,a
 965                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 967  020c 7b01          	ld	a,(OFST+1,sp)
 968  020e a40f          	and	a,#15
 969  0210 5f            	clrw	x
 970  0211 97            	ld	xl,a
 971  0212 7b02          	ld	a,(OFST+2,sp)
 972  0214 5d            	tnzw	x
 973  0215 2704          	jreq	L201
 974  0217               L401:
 975  0217 48            	sll	a
 976  0218 5a            	decw	x
 977  0219 26fc          	jrne	L401
 978  021b               L201:
 979  021b ca50aa        	or	a,20650
 980  021e c750aa        	ld	20650,a
 981  0221               L143:
 982                     ; 360 }
 985  0221 85            	popw	x
 986  0222 81            	ret
1032                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1032                     ; 377 {
1033                     	switch	.text
1034  0223               _EXTI_GetPinSensitivity:
1036  0223 88            	push	a
1037       00000001      OFST:	set	1
1040                     ; 378   uint8_t value = 0;
1042  0224 0f01          	clr	(OFST+0,sp)
1044                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1046                     ; 383   switch (EXTI_Pin)
1049                     ; 409     default:
1049                     ; 410       break;
1050  0226 4d            	tnz	a
1051  0227 271e          	jreq	L343
1052  0229 a002          	sub	a,#2
1053  022b 2723          	jreq	L543
1054  022d a002          	sub	a,#2
1055  022f 272a          	jreq	L743
1056  0231 a002          	sub	a,#2
1057  0233 2732          	jreq	L153
1058  0235 a00a          	sub	a,#10
1059  0237 273c          	jreq	L353
1060  0239 a002          	sub	a,#2
1061  023b 2741          	jreq	L553
1062  023d a002          	sub	a,#2
1063  023f 2748          	jreq	L753
1064  0241 a002          	sub	a,#2
1065  0243 2750          	jreq	L163
1066  0245 205a          	jra	L114
1067  0247               L343:
1068                     ; 385     case EXTI_Pin_0:
1068                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1070  0247 c650a0        	ld	a,20640
1071  024a a403          	and	a,#3
1072  024c 6b01          	ld	(OFST+0,sp),a
1074                     ; 387       break;
1076  024e 2051          	jra	L114
1077  0250               L543:
1078                     ; 388     case EXTI_Pin_1:
1078                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1080  0250 c650a0        	ld	a,20640
1081  0253 a40c          	and	a,#12
1082  0255 44            	srl	a
1083  0256 44            	srl	a
1084  0257 6b01          	ld	(OFST+0,sp),a
1086                     ; 390       break;
1088  0259 2046          	jra	L114
1089  025b               L743:
1090                     ; 391     case EXTI_Pin_2:
1090                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1092  025b c650a0        	ld	a,20640
1093  025e a430          	and	a,#48
1094  0260 4e            	swap	a
1095  0261 a40f          	and	a,#15
1096  0263 6b01          	ld	(OFST+0,sp),a
1098                     ; 393       break;
1100  0265 203a          	jra	L114
1101  0267               L153:
1102                     ; 394     case EXTI_Pin_3:
1102                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1104  0267 c650a0        	ld	a,20640
1105  026a a4c0          	and	a,#192
1106  026c 4e            	swap	a
1107  026d 44            	srl	a
1108  026e 44            	srl	a
1109  026f a403          	and	a,#3
1110  0271 6b01          	ld	(OFST+0,sp),a
1112                     ; 396       break;
1114  0273 202c          	jra	L114
1115  0275               L353:
1116                     ; 397     case EXTI_Pin_4:
1116                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1118  0275 c650a1        	ld	a,20641
1119  0278 a403          	and	a,#3
1120  027a 6b01          	ld	(OFST+0,sp),a
1122                     ; 399       break;
1124  027c 2023          	jra	L114
1125  027e               L553:
1126                     ; 400     case EXTI_Pin_5:
1126                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1128  027e c650a1        	ld	a,20641
1129  0281 a40c          	and	a,#12
1130  0283 44            	srl	a
1131  0284 44            	srl	a
1132  0285 6b01          	ld	(OFST+0,sp),a
1134                     ; 402       break;
1136  0287 2018          	jra	L114
1137  0289               L753:
1138                     ; 403     case EXTI_Pin_6:
1138                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1140  0289 c650a1        	ld	a,20641
1141  028c a430          	and	a,#48
1142  028e 4e            	swap	a
1143  028f a40f          	and	a,#15
1144  0291 6b01          	ld	(OFST+0,sp),a
1146                     ; 405       break;
1148  0293 200c          	jra	L114
1149  0295               L163:
1150                     ; 406     case EXTI_Pin_7:
1150                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1152  0295 c650a1        	ld	a,20641
1153  0298 a4c0          	and	a,#192
1154  029a 4e            	swap	a
1155  029b 44            	srl	a
1156  029c 44            	srl	a
1157  029d a403          	and	a,#3
1158  029f 6b01          	ld	(OFST+0,sp),a
1160                     ; 408       break;
1162  02a1               L363:
1163                     ; 409     default:
1163                     ; 410       break;
1165  02a1               L114:
1166                     ; 412   return((EXTI_Trigger_TypeDef)value);
1168  02a1 7b01          	ld	a,(OFST+0,sp)
1171  02a3 5b01          	addw	sp,#1
1172  02a5 81            	ret
1218                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1218                     ; 428 {
1219                     	switch	.text
1220  02a6               _EXTI_GetPortSensitivity:
1222  02a6 88            	push	a
1223  02a7 88            	push	a
1224       00000001      OFST:	set	1
1227                     ; 429   uint8_t portsensitivity = 0;
1229                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1231                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1233  02a8 a5f0          	bcp	a,#240
1234  02aa 2614          	jrne	L534
1235                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1237  02ac 7b02          	ld	a,(OFST+1,sp)
1238  02ae 5f            	clrw	x
1239  02af 97            	ld	xl,a
1240  02b0 c650a2        	ld	a,20642
1241  02b3 5d            	tnzw	x
1242  02b4 2704          	jreq	L211
1243  02b6               L411:
1244  02b6 44            	srl	a
1245  02b7 5a            	decw	x
1246  02b8 26fc          	jrne	L411
1247  02ba               L211:
1248  02ba a403          	and	a,#3
1249  02bc 6b01          	ld	(OFST+0,sp),a
1252  02be 2014          	jra	L734
1253  02c0               L534:
1254                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1256  02c0 7b02          	ld	a,(OFST+1,sp)
1257  02c2 a40f          	and	a,#15
1258  02c4 5f            	clrw	x
1259  02c5 97            	ld	xl,a
1260  02c6 c650aa        	ld	a,20650
1261  02c9 5d            	tnzw	x
1262  02ca 2704          	jreq	L611
1263  02cc               L021:
1264  02cc 44            	srl	a
1265  02cd 5a            	decw	x
1266  02ce 26fc          	jrne	L021
1267  02d0               L611:
1268  02d0 a403          	and	a,#3
1269  02d2 6b01          	ld	(OFST+0,sp),a
1271  02d4               L734:
1272                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1274  02d4 7b01          	ld	a,(OFST+0,sp)
1277  02d6 85            	popw	x
1278  02d7 81            	ret
1448                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1448                     ; 488 {
1449                     	switch	.text
1450  02d8               _EXTI_GetITStatus:
1452  02d8 89            	pushw	x
1453  02d9 88            	push	a
1454       00000001      OFST:	set	1
1457                     ; 489   ITStatus status = RESET;
1459                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1461                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1463  02da 01            	rrwa	x,a
1464  02db 9f            	ld	a,xl
1465  02dc a4ff          	and	a,#255
1466  02de 97            	ld	xl,a
1467  02df 4f            	clr	a
1468  02e0 02            	rlwa	x,a
1469  02e1 a30100        	cpw	x,#256
1470  02e4 260b          	jrne	L335
1471                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1473  02e6 7b03          	ld	a,(OFST+2,sp)
1474  02e8 a4ff          	and	a,#255
1475  02ea c450a4        	and	a,20644
1476  02ed 6b01          	ld	(OFST+0,sp),a
1479  02ef 2009          	jra	L535
1480  02f1               L335:
1481                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1483  02f1 7b03          	ld	a,(OFST+2,sp)
1484  02f3 a4ff          	and	a,#255
1485  02f5 c450a3        	and	a,20643
1486  02f8 6b01          	ld	(OFST+0,sp),a
1488  02fa               L535:
1489                     ; 501   return((ITStatus)status);
1491  02fa 7b01          	ld	a,(OFST+0,sp)
1494  02fc 5b03          	addw	sp,#3
1495  02fe 81            	ret
1540                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1540                     ; 525 {
1541                     	switch	.text
1542  02ff               _EXTI_ClearITPendingBit:
1544  02ff 89            	pushw	x
1545  0300 89            	pushw	x
1546       00000002      OFST:	set	2
1549                     ; 526   uint16_t tempvalue = 0;
1551                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1553                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1555  0301 01            	rrwa	x,a
1556  0302 9f            	ld	a,xl
1557  0303 a4ff          	and	a,#255
1558  0305 97            	ld	xl,a
1559  0306 4f            	clr	a
1560  0307 02            	rlwa	x,a
1561  0308 1f01          	ldw	(OFST-1,sp),x
1562  030a 01            	rrwa	x,a
1564                     ; 533   if ( tempvalue == 0x0100)
1566  030b 1e01          	ldw	x,(OFST-1,sp)
1567  030d a30100        	cpw	x,#256
1568  0310 2609          	jrne	L165
1569                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1571  0312 7b04          	ld	a,(OFST+2,sp)
1572  0314 a4ff          	and	a,#255
1573  0316 c750a4        	ld	20644,a
1575  0319 2005          	jra	L365
1576  031b               L165:
1577                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1579  031b 7b04          	ld	a,(OFST+2,sp)
1580  031d c750a3        	ld	20643,a
1581  0320               L365:
1582                     ; 541 }
1585  0320 5b04          	addw	sp,#4
1586  0322 81            	ret
1599                     	xdef	_EXTI_ClearITPendingBit
1600                     	xdef	_EXTI_GetITStatus
1601                     	xdef	_EXTI_GetPortSensitivity
1602                     	xdef	_EXTI_GetPinSensitivity
1603                     	xdef	_EXTI_SetPortSensitivity
1604                     	xdef	_EXTI_SetHalfPortSelection
1605                     	xdef	_EXTI_SelectPort
1606                     	xdef	_EXTI_SetPinSensitivity
1607                     	xdef	_EXTI_DeInit
1626                     	end
