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

    //Initialise I2C1
    I2C_Init(I2C1, OUTPUT_CLOCK_FREQ_I2C, 0xFE, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);

    // Enable I2C Peripheral
    I2C_Cmd(I2C1, ENABLE);

    GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast); //is it high impedence?
    GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
    // I2C_ITConfig(I2C1, I2C_IT_EVT | I2C_IT_BUF, ENABLE);
    // enableInterrupts();
}

int8_t mcu_i2cTransfer(uint8_t busId, uint8_t i2cAddr,
                       uint8_t *dataToWrite, uint8_t writeLength,
                       uint8_t *dataToRead, uint8_t readLength)
{
    /*
     *  Add MCU specific I2C read/write code here.
     */
    /*Calling parameter i2cAddr is 7 bit I2c address, like 0x48/49/4A/3B,  
     * not include the last R/W bit
	 * In Bit0  is 0 for Write,  IfxI2c_I2c_write
	 *                  1 for Read  IfxI2c_I2c_read
	 */
    uint8_t slaveDevAddr = i2cAddr << 1;

    int numWriteBytes, numReadBytes, errorCount;

    errorCount = 0;
    numWriteBytes = (int)writeLength;
    numReadBytes = (int)readLength;

    // Generate START bit

    // while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) != SUCCESS)
    //     ; // Wait til ACK bit sent

    if ((dataToWrite != NULL) && (writeLength != 0))
    {

        // check busy flag...
        while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));
        I2C_GenerateSTART(I2C1, ENABLE);
        //poll SB
        while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT) != SUCCESS)
        {
            errorCount++;
            if (errorCount > 100)
            {
                //I2C_GenerateSTOP(I2C1, ENABLE);
                return (errorCount);
            }
        };
        errorCount = 0; // Wait til START condition is correctly released

        //send address
        I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Transmitter);
        //Poll ADDR
        // Then the master has to wait that a slave acknowledges his address.
        while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) != SUCCESS)
        {
            errorCount++;
            if (errorCount > 100)
            {
                //I2C_GenerateSTOP(I2C1, ENABLE);
                return (errorCount);
            }
        };
        errorCount = 0;
        //poll TxE

        //send offset command?
        //start loop
        while (numWriteBytes)
        {
            //poll TxE while empty...
            //while (I2C1->SR1 & I2C_SR1_TXE)
            //   ;

            //send data
            I2C_SendData(I2C1, *dataToWrite);

            //successfully transmitted
            while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED) != SUCCESS)
            {
                errorCount++;
                if (errorCount > 100)
                {
                    //I2C_GenerateSTOP(I2C1, ENABLE);
                    return (errorCount);
                }
            };
            errorCount = 0;
            numWriteBytes--;
            dataToWrite++;
        }

        //send stop bit?
        if (I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF))
            I2C_GenerateSTOP(I2C1, ENABLE);
    }

    if ((dataToRead != NULL) && (readLength != 0))
    {
        // check busy flag...
        while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
            ;

        // generate start
        I2C_GenerateSTART(I2C1, ENABLE);

        // check master mode sleected
        while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
            ;

        // send address
        I2C_Send7bitAddress(I2C1, slaveDevAddr, I2C_Direction_Receiver);

        // check receiver mode selected
        while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED) != SUCCESS)
        {
            errorCount++;
            if (errorCount > 100)
            {

                return (errorCount);
            }
        };
        errorCount = 0; // Wait til START condition is correctly released

        if (readLength > 2)
        {
            I2C_ReadRegister(I2C1, I2C_Register_SR3);

            while (numReadBytes > 3)
            {
                //while nothing received, just wait
                // while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED) != SUCCESS)
                //     ;
                while (!(I2C1->SR1 & I2C_SR1_BTF))
                    ;
                *(dataToRead++) = I2C_ReceiveData(I2C1);
                numReadBytes--;
                // dataToRead++;
            }
            while (!(I2C1->SR1 & I2C_SR1_BTF))
                ;
            I2C_AcknowledgeConfig(I2C1, I2C_Ack_Disable);
            disableInterrupts();
            *(dataToRead++) = I2C_ReceiveData(I2C1);
            I2C_GenerateSTOP(I2C1, ENABLE);
            *(dataToRead++) = I2C_ReceiveData(I2C1);
            enableInterrupts();
            while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED) != SUCCESS)
                ;
            *(dataToRead++) = I2C_ReceiveData(I2C1);
        }
        else if (readLength == 2)
        {
            I2C1->CR2 |= I2C_CR2_POS;  // Set POS bit (NACK at next received byte)
            disableInterrupts();       // Errata workaround (Disable interrupt)
            I2C1->SR3;                 // Clear ADDR Flag
            I2C1->CR2 &= ~I2C_CR2_ACK; // Clear ACK
            enableInterrupts();        // Errata workaround (Enable interrupt)
            while (!(I2C1->SR1 & I2C_SR1_BTF))
                ;                           // Wait for BTF
            disableInterrupts();            // Errata workaround (Disable interrupt)
            I2C_GenerateSTOP(I2C1, ENABLE); // Generate stop here (STOP=1)
            *(dataToRead++) = I2C1->DR;     // Read 1st Data byte
            enableInterrupts();             // Errata workaround (Enable interrupt)
            *(dataToRead) = I2C1->DR;       // Read 2nd Data byte
        }
        else
        {
            I2C_AcknowledgeConfig(I2C1, I2C_Ack_Disable); // Clear ACK
            disableInterrupts();                          // Errata workaround (Disable interrupt)
            I2C1->SR3;                                    // Clear ADDR Flag
            I2C_GenerateSTOP(I2C1, ENABLE);               // Generate stop here (STOP=1)
            enableInterrupts();                           // Errata workaround (Enable interrupt)
            while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED) != SUCCESS)
                ;
            *(dataToRead) = I2C_ReceiveData(I2C1);
        }

        /*--------------- All Data Received -----------------------*/
        // while (I2C1->CR2 & I2C_CR2_STOP)
        //    ;                      // Wait until stop is performed (STOPF = 1)
        I2C1->CR2 &= ~I2C_CR2_POS; // return POS to default state (POS=0)

        // while (numReadBytes)
        // {
        //     //while nothing received, just wait
        //     while (I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED) != SUCCESS)
        //         ;

        //     if (numReadBytes == 1)
        //     {
        //         I2C_AcknowledgeConfig(I2C1, I2C_Ack_Disable);
        //         I2C_GenerateSTOP(I2C1, ENABLE);
        //     }

        //     *(dataToRead) = I2C_ReceiveData(I2C1);
        //     numReadBytes--;
        //     dataToRead++;
        // }
        // I2C_AcknowledgeConfig(I2C1, I2C_Ack_Enable);
    }

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
