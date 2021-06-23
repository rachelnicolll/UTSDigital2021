#include <fifo.h>
#include <stm8l15x.h>

// Initial FIFO branch
_Bool FIFO_Init(TFIFO * const fifo)
{
    fifo->End =0;
    fifo->NbBytes =0;
    return true;
}

_Bool FIFO_Put(TFIFO * const fifo, const uint8_t data)
{
    //Put new data into the end of the FIFO, unless fifo full
    if(fifo->NbBytes == FIFO_SIZE)
      return false;
    
    fifo->Buffer[fifo->End] = data;
    fifo->End = fifo->End +1;
    if(fifo->End > FIFO_SIZE)
      fifo->End =0;
    
    fifo->NbBytes++;

    return true;
}

_Bool FIFO_Get(TFIFO * const fifo, uint8_t * const dataPtr)
{
    //Check to make sure the fifo is not empty
    if(fifo->NbBytes == 0)
      return false;
    
    //Change the value pointed to by the dataPtr to the start value from the buffer
    //TAKE FROM THE START
    *dataPtr = fifo->Buffer[fifo->Start];
    fifo->Start++;
    if (fifo->Start > FIFO_SIZE)
      fifo->Start = 0;
    
    fifo->NbBytes--;
}
