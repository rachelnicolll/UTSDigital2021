/*
*  UART Communication for FTDI CHIP
*	 Allows user to collect data via PC
*/
#include <stm8l15x.h>
#include <uart.h>


void UART_init()
{
	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable all clocks
	//Configure UART Pins
	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
	GPIOC->CR1 = 0x08; // 0b0000 1000
	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
	USART1->BRR2 = 0x03;
	USART1->BRR1 = 0x68; // 9600 baud
	
}

void UART_write()
{
	//Transmit data
	while (!(USART1->SR & USART_SR_TXE));
		USART1->DR = 'A';
}
