/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2007 STMicroelectronics
 */
#include "stm8l15x_itc.h"
#include <stm8l15x.h>
#include <stm8l15x_gpio.h>
#include <buttons.h>

typedef void @far (*interrupt_handler_t)(void);

extern bool state;
extern uint8_t buttonPressed;

struct interrupt_vector
{
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

#define UP 5   //PD4 - EXTI4
#define DOWN 4 //PD1 - EXTI1
#define OK 3   //PD2 - EXTI2
#define BACK 2 //PD3 - EXTI3

#define ON 1
#define OFF 0

@far @interrupt void NonHandledInterrupt(void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

@far @interrupt void EXTID4_IRQHandler(void)
{
	// if the interrupt has occurred, clear flag  -- SHOULD ALSO CHECK PORT D bit is low
	if (EXTI->SR1 == 0x10 )//&& GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_4) == ON)
		EXTI->SR1 |= 0x10;

	buttonPressed = UP;
	return;
}

@far @interrupt void EXTID1_IRQHandler(void)
{
	// if the interrupt has occurred, clear flag
	if (EXTI->SR1 == 0x02) // && GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_1) == ON)
		EXTI->SR1 |= 0x02;

	buttonPressed = DOWN;
	return;
}

@far @interrupt void EXTID2_IRQHandler(void)
{
	// if the interrupt has occurred, clear flag
	if (EXTI->SR1 == 0x04) // && GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_2) == ON)
		EXTI->SR1 |= 0x04;

	buttonPressed = OK;
	return;
}

@far @interrupt void EXTID3_IRQHandler(void)
{
	// if the interrupt has occurred, clear flag
	if (EXTI->SR1 == 0x08) // && GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_3) == ON)
		EXTI->SR1 |= 0x08;

	buttonPressed = BACK;
	return;
}

extern void _stext(); /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext},			/* reset */
	{0x82, NonHandledInterrupt},					/* trap  */
	{0x82, NonHandledInterrupt},					/* irq0  */
	{0x82, NonHandledInterrupt},					/* irq1  */
	{0x82, NonHandledInterrupt},					/* irq2  */
	{0x82, NonHandledInterrupt},					/* irq3  */
	{0x82, NonHandledInterrupt},					/* irq4  */
	{0x82, NonHandledInterrupt},					/* irq5  */
	{0x82, NonHandledInterrupt},					/* irq6  */
	{0x82, NonHandledInterrupt},					/* irq7  */
	{0x82, NonHandledInterrupt},					/* irq8  */
	{0x82, (interrupt_handler_t)EXTID1_IRQHandler}, /* irq9  */
	{0x82, (interrupt_handler_t)EXTID2_IRQHandler}, /* irq10 */
	{0x82, (interrupt_handler_t)EXTID3_IRQHandler}, /* irq11 */
	{0x82, (interrupt_handler_t)EXTID4_IRQHandler}, /* irq12 */
	{0x82, NonHandledInterrupt},					/* irq13 */
	{0x82, NonHandledInterrupt},					/* irq14 */
	{0x82, NonHandledInterrupt},					/* irq15 */
	{0x82, NonHandledInterrupt},					/* irq16 */
	{0x82, NonHandledInterrupt},					/* irq17 */
	{0x82, NonHandledInterrupt},					/* irq18 */
	{0x82, NonHandledInterrupt},					/* irq19 */
	{0x82, NonHandledInterrupt},					/* irq20 */
	{0x82, NonHandledInterrupt},					/* irq21 */
	{0x82, NonHandledInterrupt},					/* irq22 */
	{0x82, NonHandledInterrupt},					/* irq23 */
	{0x82, NonHandledInterrupt},					/* irq24 */
	{0x82, NonHandledInterrupt},					/* irq25 */
	{0x82, NonHandledInterrupt},					/* irq26 */
	{0x82, NonHandledInterrupt},					/* irq27 */
	{0x82, NonHandledInterrupt},					/* irq28 */
	{0x82, NonHandledInterrupt},					/* irq29 */
};
