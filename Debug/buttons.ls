   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  45                     ; 10 void BTN_init()
  45                     ; 11 {
  47                     	switch	.text
  48  0000               _BTN_init:
  52                     ; 13     GPIO_DeInit(GPIOD);
  54  0000 ae500f        	ldw	x,#20495
  55  0003 cd0000        	call	_GPIO_DeInit
  57                     ; 16     GPIO_Init(GPIOD, GPIO_Pin_4 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, GPIO_Mode_In_PU_IT);
  59  0006 4b60          	push	#96
  60  0008 4b1e          	push	#30
  61  000a ae500f        	ldw	x,#20495
  62  000d cd0000        	call	_GPIO_Init
  64  0010 85            	popw	x
  65                     ; 17     GPIO_ExternalPullUpConfig(GPIOD, GPIO_Pin_4 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, ENABLE);
  67  0011 4b01          	push	#1
  68  0013 4b1e          	push	#30
  69  0015 ae500f        	ldw	x,#20495
  70  0018 cd0000        	call	_GPIO_ExternalPullUpConfig
  72  001b 85            	popw	x
  73                     ; 19     EXTI_setup();
  75  001c ad01          	call	_EXTI_setup
  77                     ; 20 }
  80  001e 81            	ret
 107                     ; 22 void EXTI_setup(void)
 107                     ; 23 {
 108                     	switch	.text
 109  001f               _EXTI_setup:
 113                     ; 25     ITC_DeInit();
 115  001f cd0000        	call	_ITC_DeInit
 117                     ; 26     EXTI_DeInit();
 119  0022 cd0000        	call	_EXTI_DeInit
 121                     ; 28     ITC_SetSoftwarePriority(EXTI4_IRQn, ITC_PriorityLevel_3);
 123  0025 ae0c03        	ldw	x,#3075
 124  0028 cd0000        	call	_ITC_SetSoftwarePriority
 126                     ; 29     ITC_SetSoftwarePriority(EXTI1_IRQn, ITC_PriorityLevel_3);
 128  002b ae0903        	ldw	x,#2307
 129  002e cd0000        	call	_ITC_SetSoftwarePriority
 131                     ; 30     ITC_SetSoftwarePriority(EXTI2_IRQn, ITC_PriorityLevel_3);
 133  0031 ae0a03        	ldw	x,#2563
 134  0034 cd0000        	call	_ITC_SetSoftwarePriority
 136                     ; 31     ITC_SetSoftwarePriority(EXTI3_IRQn, ITC_PriorityLevel_3);
 138  0037 ae0b03        	ldw	x,#2819
 139  003a cd0000        	call	_ITC_SetSoftwarePriority
 141                     ; 33     EXTI->CR1 |= (EXTI_CR1_P1IS & (EXTI_Trigger_Falling << 2)) | (EXTI_CR1_P2IS & (EXTI_Trigger_Falling << 4)) | (EXTI_CR1_P3IS & (EXTI_Trigger_Falling << 6)); //0b00000010
 143  003d c650a0        	ld	a,20640
 144  0040 aaa8          	or	a,#168
 145  0042 c750a0        	ld	20640,a
 146                     ; 34 		EXTI->CR2 |= EXTI_CR2_P4IS & EXTI_Trigger_Falling;
 148  0045 721250a1      	bset	20641,#1
 149                     ; 35     EXTI->CONF1 &= ~EXTI_CONF1_PDLIS;
 151  0049 721550a5      	bres	20645,#2
 152                     ; 36 		EXTI->CONF1 &= ~EXTI_CONF1_PDHIS;
 154  004d 721750a5      	bres	20645,#3
 155                     ; 40     enableInterrupts();
 158  0051 9a            rim
 160                     ; 41 }
 164  0052 81            	ret
 177                     	xdef	_EXTI_setup
 178                     	xdef	_BTN_init
 179                     	xref	_ITC_SetSoftwarePriority
 180                     	xref	_ITC_DeInit
 181                     	xref	_GPIO_ExternalPullUpConfig
 182                     	xref	_GPIO_Init
 183                     	xref	_GPIO_DeInit
 184                     	xref	_EXTI_DeInit
 203                     	end
