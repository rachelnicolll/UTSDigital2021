/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2007 STMicroelectronics
 */

#include <stm8l15x_conf.h>

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

@far @interrupt void I2C_Interrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	// I2C_ReadRegister(I2C1,I2C_Register_CR1   )
	// I2C_ReadRegister(I2C1,I2C_Register_CR2   )
	// I2C_ReadRegister(I2C1,I2C_Register_FREQR )
	// I2C_ReadRegister(I2C1,I2C_Register_OARL  )
	// I2C_ReadRegister(I2C1,I2C_Register_OARH  )
	// I2C_ReadRegister(I2C1,I2C_Register_DR    )
	// ITEVTEN
	int i;
	if (I2C_SR1_ADDR & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
	{
		i++;
		//end up here?
	}
	if (I2C_SR1_SB & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
	{
		i++;
		//end up here?
	}
	if (I2C_SR1_ADD10 & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
	{
		i++;//end up here?
	}
	if (I2C_SR1_BTF & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
	{
		i++;//end up here?
	}
	if (I2C_SR1_TXE & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
	{
		i++;//end up here?
	}
	if (I2C_SR1_RXNE & I2C_ReadRegister(I2C1, I2C_Register_SR1 ))
	{
		i++;//end up here?
	}
	if (I2C_SR2_WUFH & I2C_ReadRegister(I2C1, I2C_Register_SR2 ))
	{
		i++;//end up here?
	}

	// I2C_ReadRegister(I2C1,I2C_Register_SR2   )
	// I2C_ReadRegister(I2C1,I2C_Register_SR3   )
	// I2C_ReadRegister(I2C1,I2C_Register_ITR   )
	// I2C_ReadRegister(I2C1,I2C_Register_CCRL  )
	// I2C_ReadRegister(I2C1,I2C_Register_CCRH  )
	// I2C_ReadRegister(I2C1,I2C_Register_TRISER)
	return;
}

extern void _stext();     /* startup routine */

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* trap  */
	{0x82, NonHandledInterrupt}, /* irq0  */
	{0x82, NonHandledInterrupt}, /* irq1  */
	{0x82, NonHandledInterrupt}, /* irq2  */
	{0x82, NonHandledInterrupt}, /* irq3  */
	{0x82, NonHandledInterrupt}, /* irq4  */
	{0x82, NonHandledInterrupt}, /* irq5  */
	{0x82, NonHandledInterrupt}, /* irq6  */
	{0x82, NonHandledInterrupt}, /* irq7  */
	{0x82, NonHandledInterrupt}, /* irq8  */
	{0x82, NonHandledInterrupt}, /* irq9  */
	{0x82, NonHandledInterrupt}, /* irq10 */
	{0x82, NonHandledInterrupt}, /* irq11 */
	{0x82, NonHandledInterrupt}, /* irq12 */
	{0x82, NonHandledInterrupt}, /* irq13 */
	{0x82, NonHandledInterrupt}, /* irq14 */
	{0x82, NonHandledInterrupt}, /* irq15 */
	{0x82, NonHandledInterrupt}, /* irq16 */
	{0x82, NonHandledInterrupt}, /* irq17 */
	{0x82, NonHandledInterrupt}, /* irq18 */
	{0x82, NonHandledInterrupt}, /* irq19 */
	{0x82, NonHandledInterrupt}, /* irq20 */
	{0x82, NonHandledInterrupt}, /* irq21 */
	{0x82, NonHandledInterrupt}, /* irq22 */
	{0x82, NonHandledInterrupt}, /* irq23 */
	{0x82, NonHandledInterrupt}, /* irq24 */
	{0x82, NonHandledInterrupt}, /* irq25 */
	{0x82, NonHandledInterrupt}, /* irq26 */
	{0x82, NonHandledInterrupt}, /* irq27 */
	{0x82, NonHandledInterrupt}, /* irq28 */
	{0x82, (interrupt_handler_t)I2C_Interrupt}, /* irq29 */
};
