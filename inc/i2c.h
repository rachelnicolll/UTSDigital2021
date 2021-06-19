/*
* I2C Header File
*/
#ifndef I2C_H
#define I2C_H

#include <stm8l15x_conf.h>
#include <stdint.h>
#include <stdio.h>

void I2C_Setup(void);

void I2C_Write_Byte(uint8_t slaveAddress, uint8_t inputData);

void I2C_Read_Byte(uint8_t slaveAddress, uint8_t readAddress, uint8_t* buffer);



#endif /* I2C_H */
