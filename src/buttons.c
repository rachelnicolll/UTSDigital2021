#include <buttons.h>
#include <stm8l15x.h>
#include <stm8l15x_itc.h>
#include <stm8l15x_exti.h>
/*
 * Initialize BUTTONS and corresponding IO pins
 */
void BTN_init()
{
    // reset port A for initialisation
    GPIO_DeInit(GPIOD);

    // set all buttons as input, interrupt enabled
    GPIO_Init(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, GPIO_Mode_In_PU_IT);
    
    EXTI_setup();
    GPIO_ExternalPullUpConfig(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, ENABLE);
}

void EXTI_setup(void)
{
    ITC_DeInit();
    ITC_SetSoftwarePriority(EXTID_IRQn, ITC_PriorityLevel_0);

    EXTI_DeInit();
    EXTI_SetPortSensitivity(EXTI_Port_D, EXTI_Trigger_Falling);
    
    enableInterrupts();
}

