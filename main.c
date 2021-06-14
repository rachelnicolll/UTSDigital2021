/*
* UART Communication
*/
#include <stdint.h>
#include <stdio.h>
#include "uart.h"
#include "led_blink.h"
#include "stm8l15x.h"

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
		UART_Test();
		
	}
}
