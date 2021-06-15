#ifndef UART_H
#define UART_H

#include <stdint.h>

#define MAX_STR_LENGTH 256 //max file name
char filename[MAX_STR_LENGTH]; //text file name where data will be saved
char filemsg[MAX_STR_LENGTH]; //file message to be saved in text file
/*
 * Initialize UART.
 *
 * Pinout:
 * TX  -> PC3
 * RX -> PC2
 */
void UART_init();

void UART_TX(unsigned char val);

unsigned char UART_RX(void);

void UART_Poll(void);

void UART_Welcome(void);



/*_Bool UART_InChar(uint8_t *const dataPtr);

_Bool UART_OutChar(const uint8_t data);*/

#endif /* UART_H */