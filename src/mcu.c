/*
 *  Include Generic Header Files Here
 */
#include <stdint.h>
#include <stddef.h>
#include <stm8l15x_conf.h>
#include <mcu.h>
#include <delay.h>

#define OUTPUT_CLOCK_FREQ_I2C 100000UL

uint8_t errCount = 0;

/*
 *  Include MCU Specific Header Files Here
 */

/********* MCU SPECIFIC I2C CODE STARTS HERE**********/

void mcu_i2cInit(uint8_t busId)
{
    /* Add MCU specific init necessary for I2C to be used */
    CLK->CKDIVR = 0x00;

    CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);

    I2C_DeInit(I2C1);

    //Initialise I2C1
    I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);

    // Enable I2C Peripheral
    I2C_Cmd(I2C1, ENABLE);

    //Initialise I2C GPIO
    GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);
    GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);

    I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY);
    I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT);
    // I2C_ITConfig(I2C1, I2C_IT_EVT | I2C_IT_BUF, ENABLE);
    // enableInterrupts();
}

int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
                       uint8_t *dataToWrite, uint8_t writeLength,
                       uint8_t *dataToRead, uint8_t readLength)
{
    // Bit shift slave address to add read/write bit
    uint8_t slaveDevAddr = i2cAddr << 1;

    int numWriteBytes, numReadBytes;

    numWriteBytes = (int)writeLength;
    numReadBytes = (int)readLength;

    // Check if WRITE bit
    if ((dataToWrite != NULL) && (writeLength != 0))
    {

        I2C1->CR2 |= I2C_CR2_ACK; // Set ACK

        I2C1->CR2 &= ~I2C_CR2_POS; // Reset POS

        while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY)) // Check bus is free
            ;

        I2C_GenerateSTART(I2C1, ENABLE);                            // Generate START bit
        while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT)) // Poll EV5 - start conditino correctly release (SB)
            ;

        I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);       // Send slave address
        while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) // Poll EV6  - slave acknowledge correctly (BUSY, MSL, ADDR, TXE & TRA)
            ;

        // Start loop - multi-byte write
        while (numWriteBytes)
        {

            I2C_SendData(I2C1, *dataToWrite); // Send data

            while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS) // Poll EV8_2 - Successfully transmitted (TRA, BUSY, MSL, TXE and BTF)
                ;

            numWriteBytes--; // Decrement number of bytes written
            dataToWrite++;   // Increment pointer to next byte to write
        }
				if (i2cAddr == 0x40)
				{
        I2C_GenerateSTOP(I2C1, ENABLE);                 // Send STOP bit
        while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF)) // Check stop was successful
            ;
			}
    }

    // Check if READ bit
    if ((dataToRead != NULL) && (readLength != 0))
    {

        while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY)) // Check if bus is busy
            ;

        I2C1->CR2 |= I2C_CR2_ACK; // Enable Ack

        I2C_GenerateSTART(I2C1, ENABLE); // Generate START bit

        while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT)) // Poll EV5 - start conditino correctly release (SB)
            ;

        I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver); // Send slave address that will be read

        //Shift ACK bit if numReadBytes is 2
        if (numReadBytes == 2)
            I2C1->CR2 |= I2C_CR2_POS;

        while (!(I2C1->SR1 & I2C_SR1_ADDR)) // Check receiver mode selected
            ;

        if (numReadBytes > 2) //Not last 2 bytes
        {

            I2C1->SR3;               // Clear ADDR flag
            while (numReadBytes > 3) // Not last three bytes
            {
                while (!(I2C1->SR1 & I2C_SR1_BTF))
                    ;                       // Wait for BTF
                *(dataToRead++) = I2C1->DR; // Reading next data byte
                --numReadBytes;             // Decrease Numbyte to reade by 1
            }
            // Last three bytes should be read
            while (!(I2C1->SR1 & I2C_SR1_BTF))
                ;                      // Wait for BTF
            I2C1->CR2 &= ~I2C_CR2_ACK; // Clear ACK

            *(dataToRead++) = I2C1->DR; // Read 1st byte
            I2C1->CR2 |= I2C_CR2_STOP;  // Generate stop here (STOP=1)
            *(dataToRead++) = I2C1->DR; // Read 2nd byte

            while (!(I2C1->SR1 & I2C_SR1_RXNE))
                ;                       // Wait for RXNE
            *(dataToRead++) = I2C1->DR; // Read 3rd Data byte
        }

        else if (numReadBytes == 2)
        {
            I2C1->SR3;                 // Clear ADDR flag
            I2C1->CR2 &= ~I2C_CR2_ACK; // Disable ACK
            while (!(I2C1->SR1 & (I2C_SR1_RXNE | I2C_SR1_BTF)))
                ;                                // Wait for BTF & RXNE
            I2C_GenerateSTOP(I2C1, ENABLE);      // Generate STOP bit
            *(dataToRead++) = (uint8_t)I2C1->DR; // Read data byte
            delay_ms(1);
            *(dataToRead) = (uint8_t)I2C1->DR; // Read data byte at next address
        }
        // Last read byte
        else
        {
            I2C1->CR2 &= ~I2C_CR2_ACK;
            ;                          // Clear ACK
            I2C1->SR3;                 // Clear ADDR Flag
            I2C1->CR2 |= I2C_CR2_STOP; // Generate STOP bit
            while (!(I2C1->SR1 & I2C_SR1_RXNE))
                ;                     // Poll EV7, wait for RxNE
            *(dataToRead) = I2C1->DR; // Read Data byte
        }

        while (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
            ;
        I2C1->CR2 &= ~I2C_CR2_POS;
    }
    return (0);
}
/********* MCU SPECIFIC I2C CODE ENDS HERE**********/

/********* MCU SPECIFIC DELAY CODE STARTS HERE************/
void mcu_msWait(unsigned long msWait)
{
    /*
     *  Add MCU specific wait loop for msWait. The unit is in milli-seconds
     */
    delay_ms(msWait);
}
/********* MCU SPECIFIC DELAY CODE ENDS HERE************/
