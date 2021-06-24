/*
* UART Communication
*/
#include <stdint.h>
#include <stm8l15x.h>
#include <stdio.h>
#include <spi.h>
#include <LCD.h>
#include <delay.h>
#include <RTC.h>
#include <uart.h>
#include <mcu.h>
#include <HDC2080.h>
#include <buttons.h>
#include <stm8l15x_gpio.h>
#include <stm8l15x_clk.h>
#include <stm8l15x_spi.h>
#include <EEPROM.h>

const char settingMsg[] = "Editable!";

bool FINISH_READ_FLAG = FALSE;
float tempResults = 21.2;
float humResults = 66.7;

// HMI varables
HDC2080_MaxReading MaxReadings;
uint8_t buttonPressed;
bool editMode = FALSE;
bool LCDUpdated = TRUE;
TState *HMIStatePtr;
TState HMIFSM[4] =
	{
		{DISPLAY_DORMANT, &HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_WELCOME]},
		{DISPLAY_WELCOME, &HMIFSM[DISPLAY_DORMANT], &HMIFSM[DISPLAY_HOME]},
		{DISPLAY_HOME, &HMIFSM[DISPLAY_MIN_MAX], &HMIFSM[DISPLAY_MIN_MAX]},
		{DISPLAY_MIN_MAX, &HMIFSM[DISPLAY_HOME], &HMIFSM[DISPLAY_HOME]},
};

// RTC variable declaration
RTC_TimeTypeDef SRTC_TimeRead;
RTC_DateTypeDef SRTC_DateRead;

// Temp reading
const HDC2080_Handle HDC2080 = &HDC2080_state;

//EEPROM Struct
//EEPROM_Data EEPROM_SREAD = &EEPROM_datax;

uint16_t TempRawResult;
float TempReadingResult;
uint32_t TempIntResult;
uint16_t HumRawResult;
float HumReadingResult;
uint32_t HumIntResult;
bool LCD_Mode = TRUE;
unsigned int clock(void)
{
	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
}

void main(void)
{
	// Initialise local variables
	uint8_t cursorPos = 0;
	bool toggleReading = TRUE;
	uint8_t value = 5;
	uint8_t rxBuf[2] = {0};
	uint8_t txBuf[2] = {0};

	HDC2080_MaxReading maxReadings = {0, 0};

	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
	CLK->PCKENR2 |= 0xff; // Enable clock to timer
	CLK->PCKENR1 |= 0xff; // Enable all clocks

	// Configure timer
	// 1000 ticks per second
	TIM1->PSCRH = 0x3e; // 0011 1110
	TIM1->PSCRL = 0x80; // 0111 0000
	// Enable timer
	TIM1->CR1 = TIM1_CR1_CEN;
	disableInterrupts();
	// Initailise sensor
	delay_ms(4);
	//mcu_i2cInit(0x00);
	HDC2080_config(HDC2080);
	delay_ms(4);
	// Initialise spi
	SPI_init();
	// Initicalise RTC
	RTC_init();
	// Initialise buttons
	BTN_init();
	// Initialise LCD
	LCD_init();
	// Initialise USART
	UART_init();
	// Initialise HMI to first state
	HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
	enableInterrupts();

	//Read Time
	RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
	//Read Date
	RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);

	disableInterrupts();
	// Sensor aquisition
	TempRawResult = HDC2080_tempRead(HDC2080);
	TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
	TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
	//delay_ms(5000);
	HumRawResult = HDC2080_humRead(HDC2080);
	HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
	HumIntResult = HDC2080_humToIntRelative(HumRawResult);
	enableInterrupts();

	for (;;)
	{
		// get temp and humidity readings, pass them into flash and also lcd dispaly
		// read time and date every 1 second
		if (clock() % 1000 == 0)
		{
			//Read Time
			RTC_GetTime(RTC_Format_BIN, &SRTC_TimeRead);
			//Read Date
			RTC_GetDate(RTC_Format_BIN, &SRTC_DateRead);

			disableInterrupts();
			// Sensor aquisition
			if (toggleReading)
			{
				TempRawResult = HDC2080_tempRead(HDC2080);
				TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);
				TempIntResult = HDC2080_tempToIntCelsius(TempRawResult);
				toggleReading = !toggleReading;
			}
			else
			{
				HumRawResult = HDC2080_humRead(HDC2080);
				HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
				HumIntResult = HDC2080_humToIntRelative(HumRawResult);
				toggleReading = !toggleReading;
			}
			//EEPROM_writePage(TempIntResult, HumIntResult);
			enableInterrupts();
			// while (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
			// {
			// 	if (FINISH_READ_FLAG == FALSE)
			// 	{
			// 		disableInterrupts();
			// 		EEPROM_readPage();
			// 		FINISH_READ_FLAG == TRUE;
			// 		enableInterrupts();
			// 	}
			// }
			// if (!GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
			// 	FINISH_READ_FLAG = FALSE;
		}

		// USART check
		if (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_5))
		{
			LCD_Mode = FALSE;
			UART_SendReading(TempReadingResult, HumReadingResult);
		}
		else
			LCD_Mode = TRUE;

		if (LCD_Mode)
		{
			// DISPLAY CONTROLLER - if statechanged == TRUE, update display

			if (buttonPressed == BACK)
			{
				LCD_clear();
				LCD_writemsg("Sleeping...", sizeof("Sleeping..."), 10, 3);
				HMIStatePtr = &HMIFSM[DISPLAY_DORMANT];
				buttonPressed = NO;
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
				LCD_homescreen(SRTC_DateRead, SRTC_TimeRead, TempIntResult, HumIntResult);
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
				//get max
				MaxReadings = HDC2080_maxReads(HDC2080);
				LCD_min_max(HDC2080_tempToFloatCelsius((uint16_t)maxReadings.tempMax), HDC2080_humToIntRelative((uint16_t)maxReadings.humMax));

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
			}
		}
	}
}