#ifndef FIFO_H
#define FIFO_H

#include <stm8l15x.h>
#include <stdbool.h>

// Number of bytes in a FIFO
#define FIFO_SIZE 256

//FIFO struct
typedef struct {
  uint16_t Start;							/*!< The index of the position of the oldest data in the FIFO */
  uint16_t End; 							/*!< The index of the next available empty position in the FIFO */
  uint16_t volatile NbBytes;	/*!< The number of bytes currently stored in the FIFO */
  uint8_t Buffer[FIFO_SIZE];	/*!< The actual array of bytes to store the data */
} TFIFO;

_Bool FIFO_Init(TFIFO * const fifo);

_Bool FIFO_Put(TFIFO * const fifo, const uint8_t data);

_Bool FIFO_Get(TFIFO * const fifo, uint8_t * const dataPtr);

#endif /*FIFO_H*/
