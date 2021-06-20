/*
*  UART Communication for FTDI CHIP
*	 Allows user to collect data via PC
*/
#include <stm8l15x.h>
#include <stm8l15x_usart.h>
#include <stm8l15x_gpio.h>
#include <uart.h>
#include <stm8l15x_gpio.h>
//#include <file.h>

int welcome = 0; //counter to ensure uart only transmits welcome message once
//
char readyuTx; //file message to be saved in text file

void UART_init()
{
	//USART_DeInit(USART1);

	//USART_Init(USART1, 9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx);
	USART1->CR2 |= USART_CR2_REN; // Allow RX
	//USART_Cmd(USART1, ENABLE); //Waheup USART1

	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock

	//Configure UART Pins
	GPIOC->DDR |= 0x08;					 // Put TX line on (0b0000 1000)
	GPIOC->CR1 |= 0x08;					 // USART Wakeup method (0b0000 1000)
	GPIOB->DDR &= 0xfe;					 //ensure GPIOB pin 0 is input mode (0b1111 1110)
	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
	USART1->CR3 &= ~(USART_CR3_STOP);					 // 1 stop bit (0b0011 0000)
	USART1->BRR2 = 0x03;								 //setting
	USART1->BRR1 = 0x68;								 // 9600 baud
	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT); //Initialise GPIOB Pin 0 to sense of the USB is plugged in or not. SLEEP#
}

char putchar(char c)
{
	while (!(USART1->SR & USART_SR_TXE))
		;
	USART1->DR = c;
	return (c);
}

char getchar(void)
{
	char c;
	while (!(USART1->SR & USART_SR_RXNE))
		;
	c = USART1->DR;
	return (c);
}

void UART_TX(unsigned char val)
{
	while (!(USART1->SR & USART_SR_TXE))
		;
	USART1->DR = val;
}

unsigned char UART_RX(void)
{
	while (!(USART1->SR & USART_SR_RXNE))
		;
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

void UART_Welcome(int nbReadings, float readingResults[])
{
	BitStatus val; //cofirms on CBUS3 if USB-UART is awake
	char readyuTx; //text file name where data will be saved
	int i;
	float f = 32.3;
	float a = 345.65412;
	char buffr[20];

	val = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0);
	//if (val == SET && welcome == 0)
	//{
	//	printf("Welcome to the Greenhouse Datalogger\n");
	//	printf("Please enter 'y' is you are ready to plot data \n");
	//	scanf("%s", &readyuTx);
	//	if (readyuTx == 'y'|| readyuTx == 'Y')
	//	{
	//		printf("Transmitting Data...\n");
	//		//Get data from EEPROM (I2C) from specific addresses
	//		//Put on UART Tx line
	//		printf("$");
	//		for (i = 0; i < nbReadings - 1; i++)
	//			printf("%d ", readingResults[i]);
	//		printf("%d", readingResults[i]);
	//		printf(";\n");
	//		printf("Data Transmission Complete.\n");
	//	}
	//	else
	//	{
	//		printf("Error no data printed.");
	//	}
	//welcome++;
	//}

	if (clock() % 1000 == 10)
	{
		
		/* --- Print Float using printf only --- */
		//printf("Float Number 1 : %f\r\n", a);
		/* --- Print Float using sprintf ---*/
		sprintf(buffr, "%f\n", a);
		printf(buffr);

		//printf("$", readingResults[i]);
		//for (i = 0; i < nbReadings - 1; i++)
		//	printf("%s", readingResults[i]);
		//printf("$%s;", readingResults[i]);
	}
}
