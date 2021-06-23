/*
* UART Communication
*/
#include <stdint.h>
#include <stm8l15x.h>
#include <stdio.h>
//#include <spi.h>
//#include <LCD.h>
#include <delay.h>
//#include <clk.h>
#include <mcu.h>
#include <HDC2080.h>
#include "stm8l15x_conf.h"
#include <stm8l15x_clk.h>

const HDC2080_Handle HDC2080 = &HDC2080_state;

uint16_t TempRawResult;
float TempReadingResult;
uint16_t HumRawResult;
float HumReadingResult;

void main(void)
{
	CLK->CKDIVR = 0x00;
	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
	/*for(;;)
	{
			delay_ms(5);
	}*/
	
	delay_ms(4);
	HDC2080_config(HDC2080);
	delay_ms(4);
	for(;;)
	{
		TempRawResult = HDC2080_tempRead(HDC2080);
		TempReadingResult = HDC2080_tempToFloatCelsius(TempRawResult);	
		delay_ms(5000);
		HumRawResult = HDC2080_humRead(HDC2080);
		HumReadingResult = HDC2080_humToFloatRelative(HumRawResult);
		delay_ms(5000);		
	}
}