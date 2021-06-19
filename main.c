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
#include "stm8l15x_config"



#define CS_PIN 1

const HDC2080_Handle HDC2080 = &HDC2080_state;
uint32_t ReadingResult[];

void main(void)
{
	HDC2080_config();
	
	for(;;)
	{
		HDC2080_read(HDC2080, ReadingResult);
	}
	
	
	
}

