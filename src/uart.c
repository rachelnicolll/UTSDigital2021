/*
*  UART Communication for FTDI CHIP
*	 Allows user to collect data via PC
*/
#include <stm8l15x.h>
#include <uart.h>
//#include <fifo.h>

//TFIFO TxFIFO;
//TFIFO RxFIFO;

void UART_init()
{
	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable USART1 clock
	//Configure UART Pins
	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
	GPIOC->CR1 = 0x08; // 0b0000 1000
	
	USART1->CR2 |= USART_CR2_TEN | USART_CR2_REN;	  // Allow TX & RX
	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
	USART1->BRR2 = 0x03;
	USART1->BRR1 = 0x68; // 9600 baud
	
	//FIFO_Init(&TxFIFO); //Pass TxFIFO for initialization
	//FIFO_Init(&RxFIFO); //Pass TxFIFO for initialization
}


void UART_TX(unsigned char val)
{
	USART1->DR = val;
	while(!(USART1->SR & USART_SR_TXE));
}

unsigned char UART_RX(void)
{
	while(!(USART1->SR & USART_SR_RXNE));
	return USART1->DR;
}

void UART_Test(void)
{
	int i;
	unsigned char inChar = 0;
	if (USART1->SR & USART_SR_RXNE) //check status register is ready to receive
	{
		inChar = UART_RX();
		inChar++;
		UART_TX(inChar);
	}
	
	if (clock() % 1000 == 0){
		UART_TX('A');	}
}


/*_Bool UART_InChar(uint8_t *const dataPtr)
{
	return(FIFO_Get(&RxFIFO, dataPtr));
}
 
_Bool UART_OutChar(const uint8_t data)
{
	//Transmit data - polling
	//while (!(USART1->SR & USART_SR_TXE));
	//	FIFO_Get(&TxFIFO, USART1->DR);
	return(FIFO_Put(&TxFIFO, data));
}


void UART_Poll(void)
{
    if(USART1->SR & USART_SR_TXE) //check if transmit is ready
    {   
			uint8_t TxData; //temporarily holds Data
      UART_OutChar(TxData);
      USART1->DR = TxData; 
    }

    if(USART1->SR & USART_SR_RXNE) //check if receive transmit
    {
        UART_InChar(&USART1->DR); //gets character from RxFIFO to store the retrieved byte in UART2_D 
    }
}*/
