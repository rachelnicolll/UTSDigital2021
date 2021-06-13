#include <stm8l15x.h>
#include <spi.h>
#include <stm8l15x_clk.h>

#define CS_PIN 1
#define SCK_PIN 5

void SPI_init(void)
{
    // 1.Select the BR[2:0] bits to define the serial clock baud rate (see SPI_CR1 register).
    // 2. Select the CPOL and CPHA bits to define one of the four relationships between the data transfer and the serial clock (see Figure 174).
    // 3. Configure the LSBFIRST bit in the SPI_CR1 register to define the frame format.
    // 4. In Hardware mode, connect the NSS pin to a high-level signal during the complete data transmit sequence. In software mode, set the SSM and SSI bits in the SPI_CR2 register.
    // 5. Set the MSTR and SPE bits (they remain set only if the NSS pin is connected to a high-level signal).
    // In this configuration the MOSI pin is a data output and to the MISO pin is a data input.

    // ″ SPI1_MIS0 is mapped on PB7
    // ″ SPI1_MOSI is mapped on PB6
    // ″ SPI1_SCK is mapped on PB5
    // ″ SPI1_NSS is mapped on PB4

	//CLK_PeripheralClockConfig(CLK_PCKENR1_SPI1, ENABLE);
	CLK->CKDIVR = 0x00;
	CLK->PCKENR1 |= CLK_PCKENR1_SPI1;

	// CLK->PCKENR1 |= (1 << CLK_PCKENR1_SPI1);
	/* Initialize CS pin */
	//GPIOB->DDR |= (1 << CS_PIN);
	//GPIOB->CR1 |= (1 << CS_PIN);
	//GPIOB->ODR |= (1 << CS_PIN);



	/* Initialize SPI master at 500kHz  */ 
    //CR1 = LSBFIRST|SPE|BR|BR|BR|MSTR|CPOL|CPHA|
    //0b11100111 

	SPI1->CR2 |= (SPI_CR2_SSM) | (SPI_CR2_SSI);
	SPI1->CR1 |= 0b11100111;
	// SPI1->CR1 |= (SPI_CR1_MSTR) | (SPI_CR1_SPE);
}

void SPI_write(uint8_t data)
{
	SPI1->DR = data;
    //wait while tx not empty
	while (!(SPI1->SR & SPI_SR_TXE))
		;
}

uint8_t SPI_read()
{
	SPI_write(0xFF);
    //wait while rx empty
	while (!(SPI1->SR & SPI_SR_RXNE))
		;
	return SPI1->DR;
}

void chip_select(void)
{
	GPIOB->ODR &= ~(1 << CS_PIN);
}

void chip_deselect()
{
 	while (SPI1->SR & SPI_SR_BSY)
 		;
	GPIOB->ODR |= (1 << CS_PIN);
}
