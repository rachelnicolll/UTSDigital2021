#include <eeprom.h>
#include <stdio.h>

uint8_t writeEEPROM(uint8_t i2cAddr,
                    uint8_t *dataToWrite, uint8_t writeLength)
{
    mcu_i2cTransfer(0, i2cAddr, dataToWrite, writeLength, NULL, 0);
    return 0;
}

uint8_t readEEPROM(uint8_t i2cAddr,
                   uint8_t *dataToWrite, uint8_t writeLength,
                   uint8_t *dataToRead, uint8_t readLength)
{
    // START

    // SLAVE ADDR (W) (A) | 1/2 BYTE ADDR (A) | 2/2 BYTE ADDR (A) | START | SLAVE ADDR (A) (R) | DATA ........ | NACK | STOP
    mcu_i2cTransfer(0, i2cAddr, dataToWrite, writeLength, dataToRead, readLength);
    return 0;
}
