/*
 * LCD driver platform-specific configuration.
 * This file should not be included directly.
 */
#ifndef LCD_CONFIG_H
#define LCD_CONFIG_H

#include <stdint.h>
#include <stm8l15x.h>
#include <spi.h>
#include <delay.h>

/*
 * LCD connection:
 *
 * 1 RST -> PB4
 * 2 CE  -> PB3
 * 3 DC  -> PB2
 * 4 DIN -> PA3
 * 5 CLK -> PB6
 * 6 VCC -> VCC
 * 7 LED -> VCC
 * 8 GND
 */
 
#define LCD_DC_PIN      2       // data/command mode
#define LCD_CE_PIN      3       // chip-select
#define LCD_RST_PIN     4       // reset
#define SCK             5

static void LCD_gpio_init() {
    GPIOB->DDR |= (1 << LCD_CE_PIN) | (1 << LCD_RST_PIN) | (1 << LCD_DC_PIN);
    GPIOB->CR1 |= (1 << LCD_CE_PIN) | (1 << LCD_RST_PIN) | (1 << LCD_DC_PIN);
}

static void LCD_DC_set() {
    GPIOB->ODR |= (1 << LCD_DC_PIN);
}

static void LCD_DC_clear() {
    GPIOB->ODR &= ~(1 << LCD_DC_PIN);
}

static void LCD_CE_set() {
    while ((SPI1->SR & (1 << SPI_SR_BSY)));
    GPIOB->ODR |= (1 << LCD_CE_PIN);
}

static void LCD_CE_clear() {
    GPIOB->ODR &= ~(1 << LCD_CE_PIN);
}

static void LCD_RST_set() {
    GPIOB->ODR |= (1 << LCD_RST_PIN);
}

static void LCD_RST_clear() {
    GPIOB->ODR &= ~(1 << LCD_RST_PIN);
}

static void LCD_SPI_write(uint8_t word) {
    SPI_write(word);
}

static void LCD_delay_ms(int ms) {
    delay_ms(ms);
}

#endif /* LCD_CONFIG_H */