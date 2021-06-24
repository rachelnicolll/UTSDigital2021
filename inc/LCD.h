#ifndef LCD_H
#define LCD_H

#include <stdint.h>
#include <stm8l15x_conf.h>

#define TOP_SCREEN 0
#define BOTTOM_SCREEN 5
// #include <stm8s.h>

/*
 * Initialize LCD and corresponding IO pins
 */
void LCD_init();

/*
 * Clear display
 */
void LCD_clear();

/*
 * Send command to display
 */
void LCD_cmd(uint8_t command);

/*
 * col: 0 .. 83
 * row: 0 .. 5
 */
void LCD_goto(uint8_t col, uint8_t row);

/*
 * Write char to display
 */
void LCD_putc(char c);

/*
 * Write byte to display
 */
void LCD_write(uint8_t data);

/*
 * Write msg to display
 * col: 0 ... 83
 * row: 0 ..  5
 */
void LCD_writemsg(char *msg, uint8_t msgSize, uint8_t col, uint8_t row);

void LCD_welcome();

void LCD_homescreen(RTC_DateTypeDef SDate, RTC_TimeTypeDef STime, int32_t temperature, int32_t humidity);

void LCD_min_max(float maxTemperature, float maxHumidity);

void LCD_menu();

void LCD_display_settings();

void LCD_draw_logo(const unsigned char *logo);
#endif /* LCD_H */