   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 9 void UART_init()
  41                     ; 10 {
  43                     	switch	.text
  44  0000               _UART_init:
  48                     ; 11 	CLK->PCKENR1 |= CLK_PCKENR1_USART1; // Enable all clocks
  50  0000 721a50c3      	bset	20675,#5
  51                     ; 13 	GPIOC->DDR = 0x08; // Put TX line on 0b0000 1000
  53  0004 3508500c      	mov	20492,#8
  54                     ; 14 	GPIOC->CR1 = 0x08; // 0b0000 1000
  56  0008 3508500d      	mov	20493,#8
  57                     ; 15 	USART1->CR2 = USART_CR2_TEN;	  // Allow TX and RX
  59  000c 35085235      	mov	21045,#8
  60                     ; 16 	USART1->CR3 &= ~(USART_CR3_STOP); // 1 stop bit
  62  0010 c65236        	ld	a,21046
  63  0013 a4cf          	and	a,#207
  64  0015 c75236        	ld	21046,a
  65                     ; 17 	USART1->BRR2 = 0x03;
  67  0018 35035233      	mov	21043,#3
  68                     ; 18 	USART1->BRR1 = 0x68; // 9600 baud
  70  001c 35685232      	mov	21042,#104
  71                     ; 20 }
  74  0020 81            	ret
  97                     ; 22 void UART_write()
  97                     ; 23 {
  98                     	switch	.text
  99  0021               _UART_write:
 103  0021               L33:
 104                     ; 25 	while (!(USART1->SR & USART_SR_TXE));
 106  0021 c65230        	ld	a,21040
 107  0024 a580          	bcp	a,#128
 108  0026 27f9          	jreq	L33
 109                     ; 26 		USART1->DR = 'A';
 111  0028 35415231      	mov	21041,#65
 112                     ; 27 }
 115  002c 81            	ret
 128                     	xdef	_UART_write
 129                     	xdef	_UART_init
 148                     	end
