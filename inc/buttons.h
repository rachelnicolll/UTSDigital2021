#ifndef BUTTONS_H
#define BUTTONS_H

#include <stdint.h>
#include <stm8l15x.h>
#include <stm8l15x_gpio.h>

#define UP   5 //PD0
#define DOWN 4 //PD1
#define OK   3 //PD2
#define BACK 2 //PD3

/*
 * Initialize BUTTONS and corresponding IO pins
 */
void BTN_init();

/*
 * Initialize interrupts for buttons
 */
void EXTI_setup(void);

#endif /* BUTTONS_H */