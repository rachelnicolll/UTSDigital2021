#ifndef UART_H
#define UART_H

#include <stdint.h>

/*
 * Initialize UART.
 *
 * Pinout:
 * TX  -> PC3
 * RX -> PC2
 */
void UART_init();

void UART_write();

//uint8_t UART_read();

#endif /* UART_H */