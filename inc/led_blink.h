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
void led_blink_init();

void led_blink();



//uint8_t UART_read();

#endif /* UART_H */