/**EEPROM**/
#include <EEPROM.h>
#include <stdint.h>
#include <stdio.h>
#include <mcu.h>
#include <uart.h>

uint16_t EEPROM_writeSubAddress = 0x0000;
uint16_t EEPROM_readSubAddress = 0x0000;

void EEPROM_writePage(uint32_t temperature, uint32_t humidity)
{
    uint8_t txBuf[4];
    txBuf[0] = (uint8_t)(EEPROM_writeSubAddress >> 8);
    txBuf[1] = (uint8_t)(EEPROM_writeSubAddress & 0xFF);
    txBuf[2] = (uint8_t)(temperature & 0xFF);
    txBuf[3] = (uint8_t)(humidity & 0xFF);

    mcu_i2cTransfer(0x00, 0x50, txBuf, 4, NULL, 0);

    // Increment
    EEPROM_writeSubAddress+= 2;
}

void EEPROM_readPage()
{
		uint8_t txBuf[2] = {0};
    uint8_t rxBuf[2] = {0};
    int i = 0;
		txBuf[0] = (uint8_t)(EEPROM_readSubAddress >> 8);
    txBuf[1] = (uint8_t)(EEPROM_readSubAddress & 0xFF);
    for (i = 0; i < EEPROM_writeSubAddress; i+2)
    {
        mcu_i2cTransfer(0x00, 0x50, txBuf, 2, rxBuf, 2);
        UART_SendReading(rxBuf[0], rxBuf[1]);
    }
}
