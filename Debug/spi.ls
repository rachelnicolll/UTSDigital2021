   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 8 void SPI_init(void)
  41                     ; 9 {
  43                     	switch	.text
  44  0000               _SPI_init:
  48                     ; 23 	CLK->CKDIVR = 0x00;
  50  0000 725f50c0      	clr	20672
  51                     ; 24 	CLK->PCKENR1 |= CLK_PCKENR1_SPI1;
  53  0004 721850c3      	bset	20675,#4
  54                     ; 38 	SPI1->CR2 |= (SPI_CR2_SSM) | (SPI_CR2_SSI);
  56  0008 c65201        	ld	a,20993
  57  000b aa03          	or	a,#3
  58  000d c75201        	ld	20993,a
  59                     ; 39 	SPI1->CR1 |= 0b11100111;
  61  0010 c65200        	ld	a,20992
  62  0013 aae7          	or	a,#231
  63  0015 c75200        	ld	20992,a
  64                     ; 41 }
  67  0018 81            	ret
 101                     ; 43 void SPI_write(uint8_t data)
 101                     ; 44 {
 102                     	switch	.text
 103  0019               _SPI_write:
 107                     ; 45 	SPI1->DR = data;
 109  0019 c75204        	ld	20996,a
 111  001c               L34:
 112                     ; 47 	while (!(SPI1->SR & SPI_SR_TXE))
 114  001c c65203        	ld	a,20995
 115  001f a502          	bcp	a,#2
 116  0021 27f9          	jreq	L34
 117                     ; 49 }
 120  0023 81            	ret
 144                     ; 51 uint8_t SPI_read()
 144                     ; 52 {
 145                     	switch	.text
 146  0024               _SPI_read:
 150                     ; 53 	SPI_write(0xFF);
 152  0024 a6ff          	ld	a,#255
 153  0026 adf1          	call	_SPI_write
 156  0028               L16:
 157                     ; 55 	while (!(SPI1->SR & SPI_SR_RXNE))
 159  0028 c65203        	ld	a,20995
 160  002b a501          	bcp	a,#1
 161  002d 27f9          	jreq	L16
 162                     ; 57 	return SPI1->DR;
 164  002f c65204        	ld	a,20996
 167  0032 81            	ret
 190                     ; 60 void chip_select(void)
 190                     ; 61 {
 191                     	switch	.text
 192  0033               _chip_select:
 196                     ; 62 	GPIOB->ODR &= ~(1 << CS_PIN);
 198  0033 72135005      	bres	20485,#1
 199                     ; 63 }
 202  0037 81            	ret
 225                     ; 65 void chip_deselect()
 225                     ; 66 {
 226                     	switch	.text
 227  0038               _chip_deselect:
 231  0038               L701:
 232                     ; 67  	while (SPI1->SR & SPI_SR_BSY)
 234  0038 c65203        	ld	a,20995
 235  003b a580          	bcp	a,#128
 236  003d 26f9          	jrne	L701
 237                     ; 69 	GPIOB->ODR |= (1 << CS_PIN);
 239  003f 72125005      	bset	20485,#1
 240                     ; 70 }
 243  0043 81            	ret
 256                     	xdef	_chip_deselect
 257                     	xdef	_chip_select
 258                     	xdef	_SPI_read
 259                     	xdef	_SPI_write
 260                     	xdef	_SPI_init
 279                     	end
