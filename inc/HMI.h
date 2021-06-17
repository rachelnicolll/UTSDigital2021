#ifndef HMI_H
#define HMI_H

#include <stdint.h>
#include <stm8l15x.h>
#include <stm8l15x_gpio.h>

#define UP   5 //PD0 - EXTI0
#define DOWN 4 //PD1 - EXTI1
#define OK   3 //PD2 - EXTI2
#define BACK 2 //PD3 - EXTI3
#define NO   0 //No press

typedef enum
{
  DISPLAY_DORMANT,
  DISPLAY_WELCOME,
  DISPLAY_HOME,
  DISPLAY_MENU,
  DISPLAY_MIN_MAX,
  DISPLAY_SETTINGS,
  DISPLAY_SEND_DATA 
} THMIDisplayStates;

typedef struct State
{
  THMIDisplayStates  outState;
  const struct State* previous;
  const struct State* next;
}TState;

//FSM for the HMI
extern TState* HMIStatePtr;
extern TState HMIFSM[7];

/*
 * Initialize HMI
 */
void HMI_init();

/*
 * Initialize HMI
 */
void HMI_init();
#endif /* BUTTONS_H */