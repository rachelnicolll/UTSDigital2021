#include <LCD.h>
#include <LCD_config.h>
#include <font_5x8.h>
#include <string.h>
#include <stdio.h>
#include <logos.h>

#define FONT_WIDTH 5

const char welcomeMSG[] = "Greenhouse Data Logger";

extern RTC_TimeTypeDef SRTC_TimeRead;
extern RTC_DateTypeDef SRTC_DateRead;

extern void LCD_init()
{
    // set up pins
    LCD_gpio_init();

    // unselect chip enable
    LCD_CE_clear();
    LCD_RST_clear();

    LCD_delay_ms(50);

    LCD_RST_set();
    LCD_CE_set();

    LCD_cmd(0x21); // extended commands
    LCD_cmd(0xc0); // contrast Vop=6.4V
    LCD_cmd(0x04); // temperature coefficient
    LCD_cmd(0x13); // bias = 1:48

    LCD_cmd(0x20); // standard commands
    LCD_cmd(0x0C); // normal mode

    LCD_clear();
    // LCD_welcome();
    // LCD_homescreen("18", "70");
    // 	LCD_clear();
    // 	LCD_delay_ms(2000);
    // 	LCD_menu();
    // LCD_clear();
}

void LCD_welcome()
{
    LCD_goto(0, 2);
    // {
    //     int i;
    //     for (i = 0; i < sizeof(welcomeMSG) - 1; i++)
    //         LCD_putc(welcomeMSG[i]);
    // }
    LCD_draw_logo(leaf_Bitmap);
    LCD_delay_ms(3000);
    LCD_clear();
}

LCD_showdate(RTC_DateTypeDef SDate)
{

    char displayDate[50];
    int i = sprintf(displayDate, "20%02d-%02d-%02d", (int)SDate.RTC_Year, (int)SDate.RTC_Month, (int)SDate.RTC_Date);

    LCD_writemsg(displayDate, i + 1, 0, 0);
}

LCD_showtime(RTC_TimeTypeDef STime)
{
    char displayTime[10];
    int i = sprintf(displayTime, "%02d:%02d", (int)STime.RTC_Hours, (int)STime.RTC_Minutes);

    LCD_writemsg(displayTime, i + 1, 45, 0);
}

void LCD_homescreen(RTC_DateTypeDef SDate, RTC_TimeTypeDef STime, int32_t temperature, int32_t humidity)
{

    char tempMsg[30];
    int i = sprintf(tempMsg, "temperature: %02d", (int)temperature);
    char humMsg[30];
    int j = sprintf(humMsg, "humidity: %02d %%", (int)humidity);

    LCD_showdate(SDate);
    LCD_showtime(STime);

    LCD_writemsg(tempMsg, i + 1, 0, 2);
    LCD_writemsg(humMsg, j + 1, 0, 3);
}

void LCD_menu()
{
    static char menuMsg[] = "Menu";
    static char op1[] = "1. Daily Min/Max";
    static char op2[] = "2. Send Data";
    static char op3[] = "3. Settings";

    LCD_writemsg(menuMsg, sizeof(menuMsg), 0, 0);
    LCD_writemsg(op1, sizeof(op1), 1, 1);
    LCD_writemsg(op2, sizeof(op2), 1, 2);
    LCD_writemsg(op3, sizeof(op3), 1, 3);
}

void LCD_min_max(uint8_t minTemperature, uint8_t maxTemperature, uint8_t minHumidity, uint8_t maxHumidity)
{
    static char tempHeader[] = "Temperature";
    static char humidityHeader[] = "Humidity";
    // static char minHeader[] = "Min: ";
    // static char maxHeader[] = "Max: ";

    char minTempMsg[30];
    char maxTempMsg[30];
    char minHumMsg[30];
    char maxHumMsg[30];

    int i = sprintf(minTempMsg, "Min: %02d", (int)minTemperature);
    int j = sprintf(maxTempMsg, "Max: %02d", (int)maxTemperature);
    int k = sprintf(minHumMsg, "Min: %02d", (int)minHumidity);
    int l = sprintf(maxHumMsg, "Max: %02d ", (int)maxHumidity);

    LCD_writemsg(tempHeader, sizeof(tempHeader), 20, 0);
    LCD_writemsg(minTempMsg, i + 1, 1, 1);
    LCD_writemsg(maxTempMsg, j + 1, 30, 1);

    LCD_writemsg(humidityHeader, sizeof(humidityHeader), 20, 4);
    LCD_writemsg(minHumMsg, k + 1, 1, 5);
    LCD_writemsg(maxHumMsg, l + 1, 30, 5);
}

void LCD_display_settings()
{
    static char settingsHeader[] = "Press OK";
    static char settingsHeader2[] = "to change settings";
    LCD_writemsg(settingsHeader, sizeof(settingsHeader), 20, 1);
    LCD_writemsg(settingsHeader2, sizeof(settingsHeader2), 10, 2);
}

void LCD_cmd(uint8_t cmd)
{
    LCD_CE_clear();
    LCD_DC_clear();
    LCD_SPI_write(cmd);
    LCD_CE_set();
}

void LCD_write(uint8_t data)
{
    LCD_CE_clear();
    LCD_DC_set();
    LCD_SPI_write(data);
    LCD_CE_set();
}

void LCD_clear()
{
    uint16_t i = 84 * 6;
    LCD_goto(0, 0);
    while (i-- > 0)
        LCD_write(0);
}

void LCD_goto(uint8_t col, uint8_t row)
{
    LCD_cmd(0x80 | col);
    LCD_cmd(0x40 | row);
}

void LCD_putc(char c)
{
    if (c == ' ')
    {
        LCD_write(0);
        LCD_write(0);
    }
    else
    {
        const char *ptr = &font[(c - 32) * FONT_WIDTH];
        uint8_t i;
        for (i = 0; i < FONT_WIDTH; i++, ptr++)
            if (*ptr)
                LCD_write(*ptr);
        LCD_write(0);
    }
}

void LCD_writemsg(char *msg, uint8_t msgSize, uint8_t col, uint8_t row)
{
    LCD_goto(col, row);
    {
        int i;
        for (i = 0; i < msgSize - 1; i++)
            LCD_putc(msg[i]);
    }
    // LCD_delay_ms(1000);
}

void LCD_draw_logo(const unsigned char *logo)
{
    uint16_t i = 84 * 6;
    LCD_goto(0, 0);
    while (i-- > 0)
        LCD_write(*(logo++));
}