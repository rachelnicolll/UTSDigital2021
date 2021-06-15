   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  44                     ; 8 void BTN_init()
  44                     ; 9 {
  46                     	switch	.text
  47  0000               _BTN_init:
  51                     ; 11     GPIO_DeInit(GPIOD);
  53  0000 ae500f        	ldw	x,#20495
  54  0003 cd0000        	call	_GPIO_DeInit
  56                     ; 14     GPIO_Init(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, GPIO_Mode_In_PU_No_IT);
  58  0006 4b40          	push	#64
  59  0008 4b0f          	push	#15
  60  000a ae500f        	ldw	x,#20495
  61  000d cd0000        	call	_GPIO_Init
  63  0010 85            	popw	x
  64                     ; 16     EXTI_setup();
  66  0011 ad01          	call	_EXTI_setup
  68                     ; 18 }
  71  0013 81            	ret
  98                     ; 20 void EXTI_setup(void)
  98                     ; 21 {
  99                     	switch	.text
 100  0014               _EXTI_setup:
 104                     ; 22     ITC_DeInit();
 106  0014 cd0000        	call	_ITC_DeInit
 108                     ; 23     ITC_SetSoftwarePriority(EXTI0_IRQn, ITC_PriorityLevel_0);
 110  0017 ae0802        	ldw	x,#2050
 111  001a cd0000        	call	_ITC_SetSoftwarePriority
 113                     ; 25     EXTI_DeInit();
 115  001d cd0000        	call	_EXTI_DeInit
 117                     ; 26     EXTI->CR1 |= (EXTI_CR1_P0IS & EXTI_Trigger_Falling);
 119  0020 721250a0      	bset	20640,#1
 120                     ; 27     EXTI->CONF1 |= EXTI_CONF1_PDLIS;
 122  0024 721450a5      	bset	20645,#2
 123                     ; 31     enableInterrupts();
 126  0028 9a            rim
 128                     ; 32 }
 132  0029 81            	ret
 145                     	xdef	_EXTI_setup
 146                     	xdef	_BTN_init
 147                     	xref	_ITC_SetSoftwarePriority
 148                     	xref	_ITC_DeInit
 149                     	xref	_GPIO_Init
 150                     	xref	_GPIO_DeInit
 151                     	xref	_EXTI_DeInit
 170                     	end
