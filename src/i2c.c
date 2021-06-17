/*
*  I2C Communication Protocol for Temperature and Humidity Sensor
*/


void i2c_init()
{
	GPIO_DeInit(GPIOC); //Might cause issues with other modules
	
	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast); 
	
	I2C_DeInit();
	I2C_Init(I2C1, 16000000, 0x00, I2C_mode_I2C);
	
}

