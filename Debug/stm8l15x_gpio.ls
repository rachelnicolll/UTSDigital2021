   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
 107                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 107                     ; 97 {
 109                     	switch	.text
 110  0000               _GPIO_DeInit:
 114                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 116  0000 6f04          	clr	(4,x)
 117                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 119  0002 7f            	clr	(x)
 120                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 122  0003 6f02          	clr	(2,x)
 123                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 125  0005 6f03          	clr	(3,x)
 126                     ; 102 }
 129  0007 81            	ret
 285                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 285                     ; 134 {
 286                     	switch	.text
 287  0008               _GPIO_Init:
 289  0008 89            	pushw	x
 290       00000000      OFST:	set	0
 293                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 295                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 297                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 299  0009 7b05          	ld	a,(OFST+5,sp)
 300  000b 43            	cpl	a
 301  000c e404          	and	a,(4,x)
 302  000e e704          	ld	(4,x),a
 303                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 305  0010 7b06          	ld	a,(OFST+6,sp)
 306  0012 a580          	bcp	a,#128
 307  0014 271d          	jreq	L541
 308                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 310  0016 7b06          	ld	a,(OFST+6,sp)
 311  0018 a510          	bcp	a,#16
 312  001a 2706          	jreq	L741
 313                     ; 153       GPIOx->ODR |= GPIO_Pin;
 315  001c f6            	ld	a,(x)
 316  001d 1a05          	or	a,(OFST+5,sp)
 317  001f f7            	ld	(x),a
 319  0020 2007          	jra	L151
 320  0022               L741:
 321                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 323  0022 1e01          	ldw	x,(OFST+1,sp)
 324  0024 7b05          	ld	a,(OFST+5,sp)
 325  0026 43            	cpl	a
 326  0027 f4            	and	a,(x)
 327  0028 f7            	ld	(x),a
 328  0029               L151:
 329                     ; 159     GPIOx->DDR |= GPIO_Pin;
 331  0029 1e01          	ldw	x,(OFST+1,sp)
 332  002b e602          	ld	a,(2,x)
 333  002d 1a05          	or	a,(OFST+5,sp)
 334  002f e702          	ld	(2,x),a
 336  0031 2009          	jra	L351
 337  0033               L541:
 338                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 340  0033 1e01          	ldw	x,(OFST+1,sp)
 341  0035 7b05          	ld	a,(OFST+5,sp)
 342  0037 43            	cpl	a
 343  0038 e402          	and	a,(2,x)
 344  003a e702          	ld	(2,x),a
 345  003c               L351:
 346                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 348  003c 7b06          	ld	a,(OFST+6,sp)
 349  003e a540          	bcp	a,#64
 350  0040 270a          	jreq	L551
 351                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 353  0042 1e01          	ldw	x,(OFST+1,sp)
 354  0044 e603          	ld	a,(3,x)
 355  0046 1a05          	or	a,(OFST+5,sp)
 356  0048 e703          	ld	(3,x),a
 358  004a 2009          	jra	L751
 359  004c               L551:
 360                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 362  004c 1e01          	ldw	x,(OFST+1,sp)
 363  004e 7b05          	ld	a,(OFST+5,sp)
 364  0050 43            	cpl	a
 365  0051 e403          	and	a,(3,x)
 366  0053 e703          	ld	(3,x),a
 367  0055               L751:
 368                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 370  0055 7b06          	ld	a,(OFST+6,sp)
 371  0057 a520          	bcp	a,#32
 372  0059 270a          	jreq	L161
 373                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 375  005b 1e01          	ldw	x,(OFST+1,sp)
 376  005d e604          	ld	a,(4,x)
 377  005f 1a05          	or	a,(OFST+5,sp)
 378  0061 e704          	ld	(4,x),a
 380  0063 2009          	jra	L361
 381  0065               L161:
 382                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 384  0065 1e01          	ldw	x,(OFST+1,sp)
 385  0067 7b05          	ld	a,(OFST+5,sp)
 386  0069 43            	cpl	a
 387  006a e404          	and	a,(4,x)
 388  006c e704          	ld	(4,x),a
 389  006e               L361:
 390                     ; 190 }
 393  006e 85            	popw	x
 394  006f 81            	ret
 471                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 471                     ; 210 {
 472                     	switch	.text
 473  0070               _GPIO_ExternalPullUpConfig:
 475  0070 89            	pushw	x
 476       00000000      OFST:	set	0
 479                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 481                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 483                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 485  0071 0d06          	tnz	(OFST+6,sp)
 486  0073 2708          	jreq	L522
 487                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 489  0075 e603          	ld	a,(3,x)
 490  0077 1a05          	or	a,(OFST+5,sp)
 491  0079 e703          	ld	(3,x),a
 493  007b 2009          	jra	L722
 494  007d               L522:
 495                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 497  007d 1e01          	ldw	x,(OFST+1,sp)
 498  007f 7b05          	ld	a,(OFST+5,sp)
 499  0081 43            	cpl	a
 500  0082 e403          	and	a,(3,x)
 501  0084 e703          	ld	(3,x),a
 502  0086               L722:
 503                     ; 222 }
 506  0086 85            	popw	x
 507  0087 81            	ret
 553                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 553                     ; 249 {
 554                     	switch	.text
 555  0088               _GPIO_Write:
 557  0088 89            	pushw	x
 558       00000000      OFST:	set	0
 561                     ; 250   GPIOx->ODR = GPIO_PortVal;
 563  0089 7b05          	ld	a,(OFST+5,sp)
 564  008b 1e01          	ldw	x,(OFST+1,sp)
 565  008d f7            	ld	(x),a
 566                     ; 251 }
 569  008e 85            	popw	x
 570  008f 81            	ret
 730                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 730                     ; 271 {
 731                     	switch	.text
 732  0090               _GPIO_WriteBit:
 734  0090 89            	pushw	x
 735       00000000      OFST:	set	0
 738                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 740                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 742                     ; 276   if (GPIO_BitVal != RESET)
 744  0091 0d06          	tnz	(OFST+6,sp)
 745  0093 2706          	jreq	L743
 746                     ; 278     GPIOx->ODR |= GPIO_Pin;
 748  0095 f6            	ld	a,(x)
 749  0096 1a05          	or	a,(OFST+5,sp)
 750  0098 f7            	ld	(x),a
 752  0099 2007          	jra	L153
 753  009b               L743:
 754                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 756  009b 1e01          	ldw	x,(OFST+1,sp)
 757  009d 7b05          	ld	a,(OFST+5,sp)
 758  009f 43            	cpl	a
 759  00a0 f4            	and	a,(x)
 760  00a1 f7            	ld	(x),a
 761  00a2               L153:
 762                     ; 285 }
 765  00a2 85            	popw	x
 766  00a3 81            	ret
 812                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 812                     ; 304 {
 813                     	switch	.text
 814  00a4               _GPIO_SetBits:
 816  00a4 89            	pushw	x
 817       00000000      OFST:	set	0
 820                     ; 305   GPIOx->ODR |= GPIO_Pin;
 822  00a5 f6            	ld	a,(x)
 823  00a6 1a05          	or	a,(OFST+5,sp)
 824  00a8 f7            	ld	(x),a
 825                     ; 306 }
 828  00a9 85            	popw	x
 829  00aa 81            	ret
 875                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 875                     ; 325 {
 876                     	switch	.text
 877  00ab               _GPIO_ResetBits:
 879  00ab 89            	pushw	x
 880       00000000      OFST:	set	0
 883                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 885  00ac 7b05          	ld	a,(OFST+5,sp)
 886  00ae 43            	cpl	a
 887  00af f4            	and	a,(x)
 888  00b0 f7            	ld	(x),a
 889                     ; 327 }
 892  00b1 85            	popw	x
 893  00b2 81            	ret
 939                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 939                     ; 337 {
 940                     	switch	.text
 941  00b3               _GPIO_ToggleBits:
 943  00b3 89            	pushw	x
 944       00000000      OFST:	set	0
 947                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 949  00b4 f6            	ld	a,(x)
 950  00b5 1805          	xor	a,(OFST+5,sp)
 951  00b7 f7            	ld	(x),a
 952                     ; 339 }
 955  00b8 85            	popw	x
 956  00b9 81            	ret
 993                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 993                     ; 348 {
 994                     	switch	.text
 995  00ba               _GPIO_ReadInputData:
 999                     ; 349   return ((uint8_t)GPIOx->IDR);
1001  00ba e601          	ld	a,(1,x)
1004  00bc 81            	ret
1042                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1042                     ; 359 {
1043                     	switch	.text
1044  00bd               _GPIO_ReadOutputData:
1048                     ; 360   return ((uint8_t)GPIOx->ODR);
1050  00bd f6            	ld	a,(x)
1053  00be 81            	ret
1102                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1102                     ; 379 {
1103                     	switch	.text
1104  00bf               _GPIO_ReadInputDataBit:
1106  00bf 89            	pushw	x
1107       00000000      OFST:	set	0
1110                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1112  00c0 e601          	ld	a,(1,x)
1113  00c2 1405          	and	a,(OFST+5,sp)
1116  00c4 85            	popw	x
1117  00c5 81            	ret
1166                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1166                     ; 390 {
1167                     	switch	.text
1168  00c6               _GPIO_ReadOutputDataBit:
1170  00c6 89            	pushw	x
1171       00000000      OFST:	set	0
1174                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1176  00c7 f6            	ld	a,(x)
1177  00c8 1405          	and	a,(OFST+5,sp)
1180  00ca 85            	popw	x
1181  00cb 81            	ret
1194                     	xdef	_GPIO_ReadOutputDataBit
1195                     	xdef	_GPIO_ReadInputDataBit
1196                     	xdef	_GPIO_ReadOutputData
1197                     	xdef	_GPIO_ReadInputData
1198                     	xdef	_GPIO_ToggleBits
1199                     	xdef	_GPIO_ResetBits
1200                     	xdef	_GPIO_SetBits
1201                     	xdef	_GPIO_WriteBit
1202                     	xdef	_GPIO_Write
1203                     	xdef	_GPIO_ExternalPullUpConfig
1204                     	xdef	_GPIO_Init
1205                     	xdef	_GPIO_DeInit
1224                     	end
