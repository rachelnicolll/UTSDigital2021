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
    GPIO_ExternalPullUpConfig(GPIOD, GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3, ENABLE);

    EXTI_setup();
}

void EXTI_setup(void)
{
    // De initialise 
    ITC_DeInit();
    EXTI_DeInit();

    ITC_SetSoftwarePriority(EXTI0_IRQn, ITC_PriorityLevel_3);
    ITC_SetSoftwarePriority(EXTI1_IRQn, ITC_PriorityLevel_3);
    ITC_SetSoftwarePriority(EXTI2_IRQn, ITC_PriorityLevel_3);
    ITC_SetSoftwarePriority(EXTI3_IRQn, ITC_PriorityLevel_3);

    EXTI->CR1 |= (EXTI_CR1_P0IS & EXTI_Trigger_Falling) | (EXTI_CR1_P1IS & (EXTI_Trigger_Falling << 2)) | (EXTI_CR1_P2IS & (EXTI_Trigger_Falling << 4)) | (EXTI_CR1_P3IS & (EXTI_Trigger_Falling << 6)); //0b00000010
    EXTI->CONF1 &= ~EXTI_CONF1_PDLIS;
    //EXTI_SetPortSensitivity(EXTI_Port_D, EXTI_Trigger_Falling);
    //EXTI_SetPinSensitivity(GPIO_Pin_0, EXTI_Trigger_Falling);

    enableInterrupts();
}
