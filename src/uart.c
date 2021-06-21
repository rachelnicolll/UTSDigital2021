/*
*  UART Communication for FTDI CHIP
*	 Allows user to collect data via PC
*/
#include <stm8l15x.h>
#include <stm8l15x_usart.h>
#include <stm8l15x_gpio.h>
#include <uart.h>
#include <stm8l15x_gpio.h>
#include <stdio.h>
#include <math.h>

int welcome = 0; //counter to ensure uart only transmits welcome message once

void UART_init()
{
	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock

	//Configure GPIO Pins
	GPIOC->DDR |= 0x08;					 // Put TX line on (0b0000 1000)
	GPIOC->CR1 |= 0x08;					 // USART Wakeup method (0b0000 1000)
	GPIOB->DDR &= 0xfe;					 //ensure GPIOB pin 0 is input mode (0b1111 1110)
	GPIOB->CR1 |= GPIO_Mode_In_FL_No_IT; //Set GPIO mode to be input floating, no external interrupt
	//Configure UART Pins
	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;
	USART1->CR3 &= ~(USART_CR3_STOP);					 // 1 stop bit (0b0011 0000)
	USART1->BRR2 = 0x03;								 //setting
	USART1->BRR1 = 0x68;								 // 9600 baud
	//Initialise GPIOB Pin 0 to sense of the USB is plugged in or not. SLEEP#
	GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT); 
}

// Reverses a string 'str' of length 'len'
void reverse(char* str, int len)
{
    int i = 0, j = len - 1, temp;
    while (i < j) {
        temp = str[i];
        str[i] = str[j];
        str[j] = temp;
        i++;
        j--;
    }
}

// Converts a given integer x to string str[]. 
// d is the number of digits required in the output. 
// If d is more than the number of digits in x, 
// then 0s are added at the beginning.
int intToStr(int x, char str[], int d)
{
    int i = 0;
    while (x) {
        str[i++] = (x % 10) + '0';
        x = x / 10;
    }
  
    // If number of digits required is more, then
    // add 0s at the beginning
    while (i < d)
        str[i++] = '0';
  
    reverse(str, i);
    str[i] = '\0';
    return i;
}

// Converts a floating-point/double number to a string.
void ftoa(float n, char* res, int afterpoint)
{
    // Extract integer part
    int ipart = (int)n;
  
    // Extract floating part
    float fpart = n - (float)ipart;
  
    // convert integer part to string
    int i = intToStr(ipart, res, 0);
  
    // check for display option after point
    if (afterpoint != 0) {
        res[i] = '.'; // add dot
  
        // Get the value of fraction part upto given no.
        // of points after dot. The third parameter 
        // is needed to handle cases like 233.007
        fpart = fpart * pow(10, afterpoint);
  
        intToStr((int)fpart, res + i + 1, afterpoint);
    }
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
}

void UART_2PC(uint16_t nbReadings, float readingResults[])
{
	BitStatus val; //cofirms on CBUS3 if USB-UART is awake
	int i;
	float n;
	char readyuTx;
	val = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0);
	if (val == SET && welcome == 0)
	{
		printf("Welcome to the Greenhouse Datalogger\n");
		welcome++;
	}
	printf("Transmitting Data...\n");
	for (i = 0; i < nbReadings; i++)
	{
		n = readingResults[i];
		UART_SendReading(n);
	}
}

void UART_SendReading(float n)
{
		//I2C Reads from EEPROM - stores temperature value in temporary float n
		char buff[8];
		ftoa(n, buff, 1);
		printf("$%s;\n", buff);
}