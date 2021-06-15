/*
*  UART Communication for FTDI CHIP
*	 Allows user to collect data via PC
*/
#include <stm8l15x.h>
#include <uart.h>
#include <stm8l15x_gpio.h>
#include <file.h>

int welcome = 0;//counter to ensure uart only transmits welcome message once


void UART_init()
{
	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
	//Configure UART Pins
	GPIOC->DDR |= 0x08; // Put TX line on (0b0000 1000)
	GPIOC->CR1 |= 0x08; // USART Wakeup method (0b0000 1000)
	GPIOB->DDR &= 0xfe; //ensure GPIOB pin 0 is input mode (0b1111 1110)
	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;	  // Allow TX & RX
	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit (0b0011 0000)
	USART1->BRR2 = 0x03; //setting 
	USART1->BRR1 = 0x68; // 9600 baud
	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT); //Initialise GPIOB Pin 0 to sense of the USB is plugged in or not.
}

char putchar(char c)
{
	while(!(USART1->SR & USART_SR_TXE));
	USART1->DR = c;
	return(c);
}

char getchar(void)
{
	char c;
	while(!(USART1->SR & USART_SR_RXNE));
	c = USART1->DR;
	return(c);
}

void UART_TX(unsigned char val)
{
	while(!(USART1->SR & USART_SR_TXE));
	USART1->DR = val;

}

unsigned char UART_RX(void)
{
	while(!(USART1->SR & USART_SR_RXNE));
	return USART1->DR;
}

void UART_Poll(void)
{
	int i;
	unsigned char inChar = 0;
	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
	{
		inChar = UART_RX();
		UART_TX(inChar);
	}
	//Transmit Check
	//if (clock() % 1000 == 10)
		//UART_TX('A');
}	

void UART_Welcome()
{
	if (GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0) == SET && welcome == 0)
	{
		printf("Welcome to the Greenhouse Datalogger\n");
		printf("Please enter the text file name where today's data will be saved: \n");
		printf("Note: if the filename already exists in the current directory, it will be overwritten.");
		scanf("%s", &filename);
		printf("What would you like to write to %s:\n", filename);
		scanf("%s", &filemsg);
		
  	welcome++;
	}
	
	if (clock() % 1000 == 10)
		printf("Hello World! \n");
}
