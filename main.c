/*
* UART Communication
*/
#include <stdint.h>
#include <stdio.h>
#include "uart.h"
#include "led_blink.h"
#include "stm8l15x.h"

float tempResults[] = {21.2, 23.3, 24.1, 22.3, 22.5, 21.8, 28.7, 26.7};
float humResults[] = {62.4, 62.3, 63.2, 61.3, 62.5, 61.8, 68.7, 66.7};
float nbReadings = sizeof(tempResults)/sizeof(tempResults[0]);

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
	for(;;)
	{
		led_blink();
		UART_Poll();
		UART_2PC(nbReadings, tempResults, humResults);
	}
}
