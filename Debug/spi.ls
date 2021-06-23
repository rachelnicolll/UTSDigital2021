   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  44                     ; 10 void SPI_init(void)
  44                     ; 11 {
  46                     	switch	.text
  47  0000               _SPI_init:
  51                     ; 20 	CLK->PCKENR1 |= CLK_PCKENR1_SPI1;
  53  0000 721850c3      	bset	20675,#4
  54                     ; 23 	GPIOB->DDR |= (1 << CS_PIN);
  56  0004 72125007      	bset	20487,#1
  57                     ; 24 	GPIOB->CR1 |= (1 << CS_PIN);
  59  0008 72125008      	bset	20488,#1
  60                     ; 25 	GPIOB->ODR |= (1 << CS_PIN);
  62  000c 72125005      	bset	20485,#1
  63                     ; 31 	GPIO_Init(GPIOB, GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_4, GPIO_Mode_Out_PP_High_Fast);
  65  0010 4bf0          	push	#240
  66  0012 4b70          	push	#112
  67  0014 ae5005        	ldw	x,#20485
  68  0017 cd0000        	call	_GPIO_Init
  70  001a 85            	popw	x
  71                     ; 32 	GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_4 , ENABLE);
  73  001b 4b01          	push	#1
  74  001d 4b70          	push	#112
  75  001f ae5005        	ldw	x,#20485
  76  0022 cd0000        	call	_GPIO_ExternalPullUpConfig
  78  0025 85            	popw	x
  79                     ; 37 	SPI_DeInit(SPI1);
  81  0026 ae5200        	ldw	x,#20992
  82  0029 cd0000        	call	_SPI_DeInit
  84                     ; 38 	SPI1->CR2 |= (SPI_CR2_SSM) | (SPI_CR2_SSI);
  86  002c c65201        	ld	a,20993
  87  002f aa03          	or	a,#3
  88  0031 c75201        	ld	20993,a
  89                     ; 39 	SPI1->CR1 |= (SPI_BaudRatePrescaler_32) | SPI_CR1_MSTR;
  91  0034 c65200        	ld	a,20992
  92  0037 aa24          	or	a,#36
  93  0039 c75200        	ld	20992,a
  94                     ; 41 	SPI1->CR1 |= (SPI_CR1_SPE);
  96  003c 721c5200      	bset	20992,#6
  97                     ; 45 }
 100  0040 81            	ret
 134                     ; 47 void SPI_write(uint8_t data)
 134                     ; 48 {
 135                     	switch	.text
 136  0041               _SPI_write:
 140                     ; 49 	SPI1->DR = data;
 142  0041 c75204        	ld	20996,a
 144  0044               L34:
 145                     ; 51 	while (!(SPI1->SR & SPI_SR_TXE))
 147  0044 c65203        	ld	a,20995
 148  0047 a502          	bcp	a,#2
 149  0049 27f9          	jreq	L34
 150                     ; 53 }
 153  004b 81            	ret
 177                     ; 55 uint8_t SPI_read()
 177                     ; 56 {
 178                     	switch	.text
 179  004c               _SPI_read:
 183                     ; 57 	SPI_write(0xFF);
 185  004c a6ff          	ld	a,#255
 186  004e adf1          	call	_SPI_write
 189  0050               L16:
 190                     ; 59 	while (!(SPI1->SR & SPI_SR_RXNE))
 192  0050 c65203        	ld	a,20995
 193  0053 a501          	bcp	a,#1
 194  0055 27f9          	jreq	L16
 195                     ; 61 	return SPI1->DR;
 197  0057 c65204        	ld	a,20996
 200  005a 81            	ret
 223                     ; 64 void chip_select(void)
 223                     ; 65 {
 224                     	switch	.text
 225  005b               _chip_select:
 229                     ; 66 	GPIOB->ODR &= ~(1 << CS_PIN);
 231  005b 72135005      	bres	20485,#1
 232                     ; 67 }
 235  005f 81            	ret
 258                     ; 69 void chip_deselect()
 258                     ; 70 {
 259                     	switch	.text
 260  0060               _chip_deselect:
 264  0060               L701:
 265                     ; 71  	while (SPI1->SR & SPI_SR_BSY)
 267  0060 c65203        	ld	a,20995
 268  0063 a580          	bcp	a,#128
 269  0065 26f9          	jrne	L701
 270                     ; 73 	GPIOB->ODR |= (1 << CS_PIN);
 272  0067 72125005      	bset	20485,#1
 273                     ; 74 }
 276  006b 81            	ret
 289                     	xdef	_chip_deselect
 290                     	xdef	_chip_select
 291                     	xdef	_SPI_read
 292                     	xdef	_SPI_write
 293                     	xdef	_SPI_init
 294                     	xref	_SPI_DeInit
 295                     	xref	_GPIO_ExternalPullUpConfig
 296                     	xref	_GPIO_Init
 315                     	end
