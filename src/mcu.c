/*
 *  Include Generic Header Files Here
 */
#include <stdint.h>
#include <stddef.h>
#include <stm8l15x_conf.h>
#include <mcu.h>
#include <delay.h>

#define OUTPUT_CLOCK_FREQ_I2C 100000UL
uint8_t SensorAddr = 0x80; // (0 - write), (1 - read)
/*
 *  Include MCU Specific Header Files Here
 */

/********* MCU SPECIFIC I2C CODE STARTS HERE**********/

void mcu_i2cInit(uint8_t busId)
{
    /* Add MCU specific init necessary for I2C to be used */

    I2C_DeInit(I2C1);
    // Enable I2C Peripheral
    I2C_Cmd(I2C1, ENABLE);

    //Initialise I2C1
    I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);

    GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
    GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
    // I2C_ITConfig(I2C1, I2C_IT_EVT | I2C_IT_BUF, ENABLE);
		// enableInterrupts();
}

int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
                       uint8_t *dataToWrite, uint8_t writeLength,
                       uint8_t *dataToRead, uint8_t readLength)
{
    int i, j;
    /*
     *  Add MCU specific I2C read/write code here.
     */
    // Generate START bit
    I2C_GenerateSTART(I2C1, ENABLE);
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
        ; // Wait til START condition is correctly released

    I2C_Send7bitAddress(I2C1, i2cAddr, I2C_Direction_Transmitter);
    while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
        ; // Wait til ACK bit sent

    if (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
    {
        I2C_SendData(I2C1, *dataToWrite);
        while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
            ;
    }

    else if (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
    {
        *dataToRead = I2C_ReceiveData(I2C1);
        while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED))
            ;
    }

    I2C_GenerateSTOP(I2C1, ENABLE);
    /*
     *  Add MCU specific return code for error handling
     */

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
