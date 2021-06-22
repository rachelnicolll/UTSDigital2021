#include <stm8l15x.h>
#include <stm8l15x_rtc.h>
#include <stm8l15x_clk.h>
#include <rtc.h>

//  190 *  200 = 38 kHz
RTC_InitTypeDef RTC_Settings = {RTC_HourFormat_12, 0x7C, 0x7CF};

// Set Time
RTC_TimeTypeDef SRTC_TimeNow = {4, 00, 00, RTC_H12_PM};

// Set Date
RTC_DateTypeDef SRTC_DateNow = {RTC_Weekday_Thursday, RTC_Month_June, 17, 21};

/*
 * Initialize RTC 
 */
void RTC_init()
{
    RTC_DeInit();

    // Select clock to feed RTC
    CLK_RTCClockConfig(CLK_RTCCLKSource_HSI, CLK_RTCCLKDiv_64);

    // Enable clock
    CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);

    RTC_Init(&RTC_Settings);

    RTC_set_time();
}

/*
 * Initialize time and date
 */
void RTC_set_time()
{
    // 12 hour format, prescaler options

    // Set time
    RTC_SetTime(RTC_Format_BIN, &SRTC_TimeNow); 

    // Set date
    RTC_SetDate(RTC_Format_BIN, &SRTC_DateNow); 

    // Exit init
    RTC_ExitInitMode();

}

/*
 * Read date
 */
void RTC_read_date(RTC_DateTypeDef* RTC_DateStruct)
{
    RTC_GetDate(RTC_Format_BIN, RTC_DateStruct);  
}
/*
 * Read time
 */
void RTC_read_time(RTC_TimeTypeDef* RTC_TimeStruct)
{
    RTC_GetTime(RTC_Format_BIN, RTC_TimeStruct);
}
