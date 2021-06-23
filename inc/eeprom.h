#ifndef EEPROM_H
#define EEPROM_H

#include <stdint.h>
#include <stm8l15x.h>

#define EEPROM_ADDR 0x50
typedef struct EEPROM_State {

    uint8_t busId;         /* I2C bus id */
    uint8_t devAddr;       /* Sensor address on the I2C bus */
} EEPROM_State;
typedef EEPROM_State *EEPROM_Handle;
static EEPROM_State EEPROM_state = {

    /* I2C bus ID */
    0, 

    /* Sensor address on the I2C bus */
    0x50U, 
};

uint8_t writeEEPROM(uint8_t i2cAddr,
                    uint8_t *dataToWrite, uint8_t writeLength);
uint8_t readEEPROM(uint8_t i2cAddr,
                   uint8_t *dataToWrite, uint8_t writeLength,
                   uint8_t *dataToRead, uint8_t readLength);

#endif /* EEPROM_H */