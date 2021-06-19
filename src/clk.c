/*
* Clock Setup
*/
#include <clk.h>

void clk_init()
{
	//Deinitialise Clock
	CLK_DeInit();
	//Disable External High Speed oscillator (HSE). 16 MHz factory-trimmed RC used directly as System clock source.
	CLK_HSEConfig(CLK_HSE_OFF);
	//Disable Internal Low Speed oscillator (LSI). LSI (low-speed internal), 32 KHz low consumption RC used as IWDG and/or RTC and/or BEEP clock source.
	CLK_LSICmd(DISABLE);
	//Enable HSI (high-speed internal), 16 MHz factory-trimmed RC used directly as System clock source.
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus((CLK_FLAG_HSIRDY)== FALSE));
	
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
	
}
