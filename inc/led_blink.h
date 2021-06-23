#ifndef LED_H
#define LED_H

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


#endif /* LED_H */