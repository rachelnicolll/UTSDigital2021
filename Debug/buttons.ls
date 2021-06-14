   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  45                     ; 8 void BTN_init()
  45                     ; 9 {
  47                     	switch	.text
  48  0000               _BTN_init:
  52                     ; 11     GPIO_DeInit(GPIOD);
  54  0000 ae500f        	ldw	x,#20495
  55  0003 cd0000        	call	_GPIO_DeInit
  57                     ; 14     GPIO_Init(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, GPIO_Mode_In_PU_IT);
  59  0006 4b60          	push	#96
  60  0008 4b0f          	push	#15
  61  000a ae500f        	ldw	x,#20495
  62  000d cd0000        	call	_GPIO_Init
  64  0010 85            	popw	x
  65                     ; 16     EXTI_setup();
  67  0011 ad0c          	call	_EXTI_setup
  69                     ; 17     GPIO_ExternalPullUpConfig(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, ENABLE);
  71  0013 4b01          	push	#1
  72  0015 4b0f          	push	#15
  73  0017 ae500f        	ldw	x,#20495
  74  001a cd0000        	call	_GPIO_ExternalPullUpConfig
  76  001d 85            	popw	x
  77                     ; 18 }
  80  001e 81            	ret
 108                     ; 20 void EXTI_setup(void)
 108                     ; 21 {
 109                     	switch	.text
 110  001f               _EXTI_setup:
 114                     ; 22     ITC_DeInit();
 116  001f cd0000        	call	_ITC_DeInit
 118                     ; 23     ITC_SetSoftwarePriority(EXTID_IRQn, ITC_PriorityLevel_0);
 120  0022 ae0702        	ldw	x,#1794
 121  0025 cd0000        	call	_ITC_SetSoftwarePriority
 123                     ; 25     EXTI_DeInit();
 125  0028 cd0000        	call	_EXTI_DeInit
 127                     ; 26     EXTI_SetPortSensitivity(EXTI_Port_D, EXTI_Trigger_Falling);
 129  002b ae0202        	ldw	x,#514
 130  002e cd0000        	call	_EXTI_SetPortSensitivity
 132                     ; 28     enableInterrupts();
 135  0031 9a            rim
 137                     ; 29 }
 141  0032 81            	ret
 154                     	xdef	_EXTI_setup
 155                     	xdef	_BTN_init
 156                     	xref	_ITC_SetSoftwarePriority
 157                     	xref	_ITC_DeInit
 158                     	xref	_GPIO_ExternalPullUpConfig
 159                     	xref	_GPIO_Init
 160                     	xref	_GPIO_DeInit
 161                     	xref	_EXTI_SetPortSensitivity
 162                     	xref	_EXTI_DeInit
 181                     	end
