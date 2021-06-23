#ifndef RTC_H
#define RTC_H

#include <stdint.h>
#include <stm8l15x_conf.h>



/*
 * Initialize RTC 
 */
void RTC_init();

void RTC_set_time();

#endif /* RTC_H */