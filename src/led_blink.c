/*
*  LED Blink
*/

#include <stm8l15x.h>
#include <led_blink.h>

void led_blink_init()
{
	CLK->PCKENR2 |= CLK_PCKENR2_TIM1; // Enable timer1 for LED blink
	// Configure timer
	// 1000 ticks per second
	TIM1->PSCRH = 0x3e; // 0011 1110
	TIM1->PSCRL = 0x80; // 0111 0000
	// Enable timer
	TIM1->CR1 = TIM1_CR1_CEN;
	// Configure LED pins
	GPIOB->DDR |= 0x03;
	GPIOB->CR1 |= 0x03;
}

void led_blink()
{
	
}


