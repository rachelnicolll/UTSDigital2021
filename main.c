/*
* UART Communication
*/
#include <stdint.h>
#include <stm8l15x.h>
#include <stdio.h>
#include <spi.h>
#include <LCD.h>
#include <delay.h>
#include <buttons.h>
#include "stm8l15x_gpio.h"
#include "stm8l15x_clk.h"
#include "stm8l15x_spi.h"

const char op[] = "hehe!";
const char pressMSG[] = "PRESSED ME!";
bool state = FALSE; 

unsigned int clock(void)
{
	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
}

void main(void)
{
	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
	CLK->PCKENR2 |= 0xff; // Enable clock to timer
	CLK->PCKENR1 |= 0xff; // Enable all clocks

	// Configure timer
	// 1000 ticks per second
	// TIM1->PSCRH = 0x3e; // 0011 1110
	// TIM1->PSCRL = 0x80; // 0111 0000
	// Enable timer
	// TIM1->CR1 = TIM1_CR1_CEN;

	// Configure LED pins
	GPIOB->DDR |= 0x03;
	GPIOB->CR1 |= 0x03;

	//Configure UART Pins
	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
	GPIOC->CR1 = 0x08; // 0b0000 1000

	//Enable and Configure UART
	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
	USART1->BRR2 = 0x03;
	USART1->BRR1 = 0x68; // 9600 baud

	// Initialise spi
	SPI_init();
	BTN_init();
	LCD_init();

	for (;;)
	{
		//Transmit data
		//while (!(USART1->SR & USART_SR_TXE))
		//	;
		//USART1->DR = 'A';

		//chip_select();
		//{
		//	uint8_t i;
		//	for (i = 0xAA; i < 0xFA; i += 0x10)
		//		SPI_write(i);
		//}
		if (state == 1)
		{
			LCD_clear();
			{int i; for (i = 0; i < sizeof(pressMSG) - 1; i++)
				LCD_putc(pressMSG[i]);}
			delay_ms(1000);
			state = FALSE;
		}

		//SPI_write(0xFF);
		//chip_deselect();

		//GPIOB->ODR &= ~0x01;
		//if (clock() % 1000 <= 500)
		//	GPIOB->ODR |= 0x01;
		//GPIOC->ODR &= 0x01;
		//if (clock() % 2000 <= 1000)
		//	GPIOC->ODR |= 0x02;
	}
}
