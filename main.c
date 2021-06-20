/*
* UART Communication
*/
#include <stdint.h>
#include <stdio.h>
#include "uart.h"
#include "led_blink.h"
#include "stm8l15x.h"

int nbReadings;
float readingResults[] = {2, 2.3, 44.1};
//int readingResults[] = {22, 2, 25, 22, 22, 22, 22, 2, 32, 22};
unsigned int clock(void)
{
	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
} 

void main(void)
{
	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
	led_blink_init();
	UART_init();
	nbReadings = 3; //arbitrary number, will be passed in via I2C
	for(;;)
	{
		led_blink();
		UART_Poll();
		UART_Welcome(nbReadings, readingResults);
	}
}
