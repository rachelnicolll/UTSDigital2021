/*
* UART Communication
*/
#include <stdint.h>
#include <stdio.h>
#include "uart.h"
#include "led_blink.h"
#include "stm8l15x.h"
#include <spi.h>
#include <LCD.h>
#include <delay.h>
#include <RTC.h>
#include <buttons.h>
#include <stm8l15x_gpio.h>
#include <stm8l15x_clk.h>
#include <stm8l15x_spi.h>

const char op[] = "hehe!";
const char pressMSG[] = "PRESSED ME!";
const char settingMsg[] = "Editable!";
const char sendDataMsg[] = "Plug me in!";
bool editMode = FALSE;
float tempResults[] = {21.2, 23.3, 24.1, 22.3, 22.5, 21.8, 28.7, 26.7};
float humResults[] = {62.4, 62.3, 63.2, 61.3, 62.5, 61.8, 68.7, 66.7};
float nbReadings = sizeof(tempResults)/sizeof(tempResults[0]);

#define CS_PIN 1

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

	// // Configure LED pins
	// GPIOB->DDR |= 0x03;
	// GPIOB->CR1 |= 0x03;

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
	// Initicalise RTC
	RTC_init();
	// Initialise buttons
	BTN_init();
	// Initialise LCD
	LCD_init();
	// Initialise HMI to first state
	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
	led_blink_init();
	UART_init();
	for(;;)
	{
		// get temp and humidity readings, pass them into flash and also lcd dispaly
		// read time and date every 1 second
		if (clock() % 1000 == 0)
		{
			//Read Time
			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
			//Read Date
			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);
		}
		switch (HMIStatePtr->outState)
		{
		case DISPLAY_DORMANT:
			LCD_clear();
			// If button press, wake up
			if (buttonPressed != 0)
				HMIStatePtr = HMIStatePtr->next;
			buttonPressed = NO;
			// Wake up
			break;
		case DISPLAY_WELCOME:
			LCD_welcome();
			HMIStatePtr = HMIStatePtr->next;
			// disable buttons?
			break;
		case DISPLAY_HOME:

			// Showing temp and humidity and menu option
			LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, 18, 70);
			// If button is pressed, increment cursor pos
			if (buttonPressed == DOWN)
			{
				HMIStatePtr = HMIStatePtr->next;
				LCD_clear();
			}
			else if (buttonPressed == UP)
			{
				HMIStatePtr = HMIStatePtr->previous;
				LCD_clear();
			}
			buttonPressed = NO;
			break;

		case DISPLAY_MIN_MAX:
			LCD_min_max(12, 14, 8, 90);
			if (buttonPressed == DOWN)
			{
				HMIStatePtr = HMIStatePtr->next;
				LCD_clear();
			}
			else if (buttonPressed == UP)
			{
				HMIStatePtr = HMIStatePtr->previous;
				LCD_clear();
			}

			buttonPressed = NO;
			break;
		case DISPLAY_SETTINGS:
			// Show settings to change frequency. Need to press ok to engage with screen

			if (editMode == FALSE)
			{
				LCD_display_settings();
				if (buttonPressed == DOWN)
				{
					HMIStatePtr = HMIStatePtr->next;
					LCD_clear();
				}
				else if (buttonPressed == UP)
				{
					HMIStatePtr = HMIStatePtr->previous;
					LCD_clear();
				}
				if (buttonPressed == OK)
				{
					editMode = !editMode;
					LCD_clear();
				}
			}
			else // Edit mode is true
			{
				// Configure settings
				LCD_writemsg(settingMsg, sizeof(settingMsg), 20, 3);

				if (buttonPressed == DOWN)
				{
					// Decrement minutes
				}
				else if (buttonPressed == UP)
				{
					// Increment minutes
				}
				if (buttonPressed == OK)
				{
					editMode = !editMode;
					LCD_clear();
				}
			}

			buttonPressed = NO;
			break;

		case DISPLAY_SEND_DATA:
			// Show instructions to send data
			if (buttonPressed == DOWN)
			{
				HMIStatePtr = HMIStatePtr->next;
				LCD_clear();
			}
			else if (buttonPressed == UP)
			{
				HMIStatePtr = HMIStatePtr->previous;
				LCD_clear();
			}

			LCD_writemsg(sendDataMsg, sizeof(sendDataMsg), 20, 3);
			buttonPressed = NO;
			break;
		}
		//led_blink();
		UART_Poll();
		UART_2PC(nbReadings, tempResults, humResults);
	}
}
