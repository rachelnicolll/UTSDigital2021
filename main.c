/*
* UART Communication
*/
#include <stdint.h>
#include <stdio.h>
#include "uart.h"
#include "stm8l15x.h"
#include <spi.h>
#include <LCD.h>
#include <delay.h>
#include <RTC.h>
#include <buttons.h>
#include <stm8l15x_gpio.h>
#include <stm8l15x_clk.h>
#include <stm8l15x_spi.h>


const char settingMsg[] = "Editable!";
const char sendDataMsg[] = "Plug me in!";

float tempResults[] = {21.2, 23.3, 24.1, 22.3, 22.5, 21.8, 28.7, 26.7};
float humResults[] = {62.4, 62.3, 63.2, 61.3, 62.5, 61.8, 68.7, 66.7};
float nbReadings = sizeof(tempResults)/sizeof(tempResults[0]);

// HMI varables
bool editMode = FALSE;
uint8_t buttonPressed;
TState *HMIStatePtr;
TState HMIFSM[6] =
	{
		{DISPLAY_DORMANT, &HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_WELCOME]},
		{DISPLAY_WELCOME, &HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_HOME]},
		{DISPLAY_HOME, &HMIFSM[DISPLAY_SETTINGS], &HMIFSM[DISPLAY_MIN_MAX]},
		{DISPLAY_MIN_MAX, &HMIFSM[DISPLAY_HOME], &HMIFSM[DISPLAY_SETTINGS]},
		{DISPLAY_SETTINGS, &HMIFSM[DISPLAY_MIN_MAX], &HMIFSM[DISPLAY_HOME]},
		{DISPLAY_SEND_DATA, &HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_SEND_DATA]},
};

// RTC variable declaration
RTC_TimeTypeDef SRTC_TimeRead;
RTC_DateTypeDef SRTC_DateRead;

unsigned int clock(void)
{
	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
} 

void main(void)
{
	// Initialise local variables
	uint8_t cursorPos = 0;

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
	// Initialise UART
	// UART_init();
	
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
		// UART_Poll();
		// UART_2PC(nbReadings, tempResults, humResults);
	}
}
