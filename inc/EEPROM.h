#ifndef EEPROM_H
#define EEPROM_H

#include <stm8l15x_conf.h>
#include <stdio.h>
#include <stdint.h>


// typedef struct EEPROM_DataTypeDef
// {
//     uint8_t addressLo;
//     uint8_t addressHi;
//     RTC_DateTypeDef SDate;
//     RTC_TimeTypeDef STime;
//     uint8_t temperature;
//     uint8_t humidity;
// } EEPROM_DataTypeDef;

// EEPROM_DataTypeDef EEPROM_datax = {
//     0,
//     0,
//     0,
//     0,
//     0};

// typedef EEPROM_DataTypeDef *EEPROM_Data; //Decleare a pointer that can handle the EEPROM_DataTypeDef struct

void EEPROM_writePage(uint32_t temperature, uint32_t humidity);

void EEPROM_readPage();

#endif /*EEPROM_H*/