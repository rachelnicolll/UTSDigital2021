/*
*  I2C Communication Protocol for Temperature and Humidity Sensor
*/

#include <i2c.h>

#define OUTPUT_CLK_SPEED 100000
#define EEPROM_ADDR 0xb2 // 0b10100010 Last bit signifies read (1) or write (0) option
#define SENSOR_ADDR 0x80 // 0b1000000

uint8_t volatile input_clk = 0x00;

typedef enum {EEPROM = 0, SENSOR = !EEPROM} SlaveDevice;


void I2C_Setup()
{
	input_clk = CLK_GetClockFreq() / 1000000;
	
	I2C_DeInit(I2C1);

	
	// Enable I2C Peripheral
	I2C_Cmd(I2C1, ENABLE);
	
	I2C_Init(I2C1, OUTPUT_CLK_SPEED, EEPROM_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
	
	GPIO_DeInit(GPIOC); // Might cause issues with other modules
	
	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast); 
	
}

void I2C_Write_Byte(uint8_t slaveAddress, uint8_t inputData, uint8_t subAddress, SlaveDevice slDev)
{
	// Send START condition
	I2C_GenerateSTART(I2C1, ENABLE);
	//Check bus is clear and moed successfully selected
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
	
	// Send slave address to write to
	I2C_Send7bitAddress(I2C1, slaveAddress, I2C_Direction_Transmitter);
	// Check transmitted
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
	
	// Send address of first byte to be write to
	I2C_SendData(I2C1, (uint8_t) (subAddress)); // LSB
	// Check data sent
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	
	if (slDev == EEPROM)
	{
		// Send address of first byte to be write to
	I2C_SendData(I2C1, (uint8_t) (subAddress >> 8)); // MSB
	// Check data sent
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	}
	
	// Send Data
	I2C_SendData(I2C1, inputData);
	// Check successful transmission
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	
	// Send Data
	I2C_SendData(I2C1, inputData);
	// Check successful transmission
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	
	// Send STOP condition
	I2C_GenerateSTOP(I2C1, ENABLE);
	
}


void I2C_Read_Byte(uint8_t slaveAddress, uint8_t readAddress, uint8_t* buffer)
{
	// Wait until bus is free
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));
	
	// Generate START bit
	I2C_GenerateSTART(I2C1, ENABLE);
	// Check mode selection successful
	wihle(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
	
	// Send slave address in write direction
	I2C_Send7bitAddress(I2C1, slaveAddress, I2C_Direction_Transmitter);
	// Check transmitted and bus is clear
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
	
	// Send address of first byte to be read
	I2C_SendData(I2C1, (uint8_t) (readAddress)); // LSB
	// Check data sent
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	
	// Generate START bit
	I2C_GenerateSTART(I2C1, ENABLE);
	// Check mode selection successful
	wihle(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
	
	// Send slave address in read direction
	I2C_Send7bitAddress(I2C1, slaveAddress, I2C_Direction_Receiver);
	// Check transmitted and bus is clear
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
	
	// Check byte was received
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED));
	
	*buffer = I2C_ReceiveData(I2C1);
	
	I2C_AcknowledgeConfig(I2C1, DISABLE);
	
	I2C_GenerateSTOP(I2C1, ENABLE);
}
