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

// HMI varables
uint8_t buttonPressed;
TState* HMIStatePtr;
TState HMIFSM[7] =
{
  {DISPLAY_DORMANT, 	&HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_WELCOME]},
  {DISPLAY_WELCOME, 	&HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_HOME]},
  {DISPLAY_HOME, 		&HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_MENU]},
  {DISPLAY_MENU, 		&HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_MIN_MAX]},
  {DISPLAY_MIN_MAX, 	&HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_SETTINGS]},
  {DISPLAY_SETTINGS,	&HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_HOME]},
  {DISPLAY_SEND_DATA, 	&HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_SEND_DATA]}, 
};

unsigned int clock(void)
{
	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
}

void main(void)
{
	// Initialise local variables
	uint8_t cursorPos = 0;

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

	// Configure UART Pins
	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
	GPIOC->CR1 = 0x08; // 0b0000 1000

	// Enable and Configure UART
	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
	USART1->BRR2 = 0x03;
	USART1->BRR1 = 0x68; // 9600 baud

	// Initialise spi
	SPI_init();
	// Initialise buttons
	BTN_init();
	// Initialise LCD
	LCD_init();
	// Initialise HMI to first state
	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT]

	for (;;)
	{
		// get temp and humidity readings, pass them into flash and also lcd dispaly
		switch (StatePtr->outState)
		{
		case DISPLAY_DORMANT:
			// If button press, wake up
			if (buttonPressed != 0)
				HMIStatePtr = HMIStatePtr->next;
			// Wake up
			break;
		case DISPLAY_WELCOME:
			LCD_welcome();
			HMIStatePtr = HMIStatePtr->next;
			// disable buttons?
			break;
		case DISPLAY_HOME:
			// Showing temp and humidity and menu option
			LCD_homescreen("18", "70");
			// If button is pressed, increment cursor pos
			if (buttonPressed == DOWN)
			{
				cursorPos++;
				buttonPressed = NO;
				if (cursorPos > 1)
					cursorPos = 1;
			}
			else if (buttonPressed == UP)
			{
				cursorPos--;
				buttonPressed = NO;
				if (cursorPos < 0)
					cursorPos = 0;
			}
			else if (buttonPressed == BACK)
			{
				// Sleep?
			}

			// If ok is pressed go to display menu
			if (cursorPos == 1)
			{
				LCD_writemsg(".", sizeof("."), 0, BOTTOM_SCREEN);
				if (buttonPressed == OK)
				{
					LCD_menu();
					HMIStatePtr = HMIStatePtr->next;
				}
			}
			else
				LCD_writemsg(" ", sizeof(" "), 0, BOTTOM_SCREEN);

			// If back is pressed, do nothing
			break;
		case DISPLAY_MENU:
			// Navigation 1 - 3 min max
			// Op 1: min max
			// OK is pressed, go to display min max
			// Op 2:
			// OK is pressed, go to settings
			// If back is pressed go to display home

		case DISPLAY_MIN_MAX:
			// Back is pressed/ OK is pressed, go to display home
			break;
		case DISPLAY_SETTINGS:

			break;
		case DISPLAY_SEND_DATA:
			// Show instructions to send data
			break;
		}

		// Transmit data
		// while (!(USART1->SR & USART_SR_TXE))
		// 	;
		// USART1->DR = 'A';

		// Chip_select();
		// {
		// 	uint8_t i;
		// 	for (i = 0xAA; i < 0xFA; i += 0x10)
		// 		SPI_write(i);
		// }
		// If (state == 1)
		// {
		// 	LCD_clear();
		// 	{
		// 		int i;
		// 		for (i = 0; i < sizeof(pressMSG) - 1; i++)
		// 			LCD_putc(pressMSG[i]);
		// 	}
		// 	delay_ms(1000);
		// 	state = FALSE;
		// }

		// SPI_write(0xFF);
		// Chip_deselect();

		// GPIOB->ODR &= ~0x01;
		// If (clock() % 1000 <= 500)
		// 	GPIOB->ODR |= 0x01;
		// GPIOC->ODR &= 0x01;
		// If (clock() % 2000 <= 1000)
		// 	GPIOC->ODR |= 0x02;
	}
}
