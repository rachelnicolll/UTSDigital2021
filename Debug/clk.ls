   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  47                     ; 6 void clk_init()
  47                     ; 7 {
  49                     	switch	.text
  50  0000               _clk_init:
  54                     ; 9 	CLK_DeInit();
  56  0000 cd0000        	call	_CLK_DeInit
  58                     ; 11 	CLK_HSEConfig(CLK_HSE_OFF);
  60  0003 4f            	clr	a
  61  0004 cd0000        	call	_CLK_HSEConfig
  63                     ; 13 	CLK_LSICmd(DISABLE);
  65  0007 4f            	clr	a
  66  0008 cd0000        	call	_CLK_LSICmd
  68                     ; 15 	CLK_HSICmd(ENABLE);
  70  000b a601          	ld	a,#1
  71  000d cd0000        	call	_CLK_HSICmd
  74  0010               L32:
  75                     ; 16 	while(CLK_GetFlagStatus((CLK_FLAG_HSIRDY)== FALSE));
  77  0010 4f            	clr	a
  78  0011 cd0000        	call	_CLK_GetFlagStatus
  80  0014 4d            	tnz	a
  81  0015 26f9          	jrne	L32
  82                     ; 18 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
  84  0017 ae0501        	ldw	x,#1281
  85  001a cd0000        	call	_CLK_PeripheralClockConfig
  87                     ; 19 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
  89  001d ae1101        	ldw	x,#4353
  90  0020 cd0000        	call	_CLK_PeripheralClockConfig
  92                     ; 20 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
  94  0023 ae0401        	ldw	x,#1025
  95  0026 cd0000        	call	_CLK_PeripheralClockConfig
  97                     ; 21 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  99  0029 ae0301        	ldw	x,#769
 100  002c cd0000        	call	_CLK_PeripheralClockConfig
 102                     ; 23 }
 105  002f 81            	ret
 118                     	xdef	_clk_init
 119                     	xref	_CLK_GetFlagStatus
 120                     	xref	_CLK_PeripheralClockConfig
 121                     	xref	_CLK_HSEConfig
 122                     	xref	_CLK_LSICmd
 123                     	xref	_CLK_HSICmd
 124                     	xref	_CLK_DeInit
 143                     	end
