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
	GPIOE->DDR |= 0x80;
	GPIOE->CR1 |= 0x80;
}

void led_blink()
{
	GPIOE->ODR &= 0x7f; //0b0111 1111
	if (clock() % 1000 <= 500)
			GPIOE->ODR |= 0x80; //0b1000 000
}
