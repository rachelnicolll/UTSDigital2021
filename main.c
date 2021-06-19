/*
* UART Communication
*/
#include <stdint.h>
#include <stm8l15x.h>
#include <stdio.h>
//#include <spi.h>
//#include <LCD.h>
//#include <delay.h>
//#include <clk.h>
#include <mcu.h>
#include <HDC2080.h>
#include "stm8l15x_conf.h"
#include <stm8l15x_clk.h>


const HDC2080_Handle HDC2080 = &HDC2080_state;
uint32_t ReadingResult[4];

void main(void)
{
	CLK->CKDIVR = 0x00;

	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);

	HDC2080_config(HDC2080);
	
	for(;;)
	{
		HDC2080_read(HDC2080, ReadingResult);
	}
}