#ifndef DELAY_H
#define DELAY_H

#ifndef F_CPU

#define F_CPU 2000000UL
#endif

#include <stdint.h>
#include <stm8l15x.h>

@inline void delay_ms(uint32_t ms) {
		uint32_t i;
    for (i = 0; i < ((F_CPU / 18 / 1000UL) * ms); i++) {
        //__asm__("nop");
    }
}


#endif /* DELAY_H */