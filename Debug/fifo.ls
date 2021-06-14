   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  96                     ; 5 _Bool FIFO_Init(TFIFO * const fifo)
  96                     ; 6 {
  98                     	switch	.text
  99  0000               _FIFO_Init:
 103                     ; 7     fifo->End =0;
 105  0000 905f          	clrw	y
 106  0002 ef02          	ldw	(2,x),y
 107                     ; 8     fifo->NbBytes =0;
 109  0004 905f          	clrw	y
 110  0006 ef04          	ldw	(4,x),y
 111                     ; 9     return true;
 113  0008 a601          	ld	a,#1
 116  000a 81            	ret
 163                     ; 12 _Bool FIFO_Put(TFIFO * const fifo, const uint8_t data)
 163                     ; 13 {
 164                     	switch	.text
 165  000b               _FIFO_Put:
 167  000b 89            	pushw	x
 168       00000000      OFST:	set	0
 171                     ; 15     if(fifo->NbBytes == FIFO_SIZE)
 173  000c 9093          	ldw	y,x
 174  000e 90ee04        	ldw	y,(4,y)
 175  0011 90a30100      	cpw	y,#256
 176  0015 2603          	jrne	L57
 177                     ; 16       return false;
 179  0017 4f            	clr	a
 181  0018 2038          	jra	L01
 182  001a               L57:
 183                     ; 18     fifo->Buffer[fifo->End] = data;
 185  001a 7b05          	ld	a,(OFST+5,sp)
 186  001c 1e01          	ldw	x,(OFST+1,sp)
 187  001e ee02          	ldw	x,(2,x)
 188  0020 72fb01        	addw	x,(OFST+1,sp)
 189  0023 e706          	ld	(6,x),a
 190                     ; 19     fifo->End = fifo->End +1;
 192  0025 1e01          	ldw	x,(OFST+1,sp)
 193  0027 9093          	ldw	y,x
 194  0029 ee02          	ldw	x,(2,x)
 195  002b 1c0001        	addw	x,#1
 196  002e 90ef02        	ldw	(2,y),x
 197                     ; 20     if(fifo->End > FIFO_SIZE)
 199  0031 1e01          	ldw	x,(OFST+1,sp)
 200  0033 9093          	ldw	y,x
 201  0035 90ee02        	ldw	y,(2,y)
 202  0038 90a30101      	cpw	y,#257
 203  003c 2506          	jrult	L77
 204                     ; 21       fifo->End =0;
 206  003e 1e01          	ldw	x,(OFST+1,sp)
 207  0040 905f          	clrw	y
 208  0042 ef02          	ldw	(2,x),y
 209  0044               L77:
 210                     ; 23     fifo->NbBytes++;
 212  0044 1e01          	ldw	x,(OFST+1,sp)
 213  0046 9093          	ldw	y,x
 214  0048 ee04          	ldw	x,(4,x)
 215  004a 1c0001        	addw	x,#1
 216  004d 90ef04        	ldw	(4,y),x
 217                     ; 25     return true;
 219  0050 a601          	ld	a,#1
 221  0052               L01:
 223  0052 85            	popw	x
 224  0053 81            	ret
 272                     ; 28 _Bool FIFO_Get(TFIFO * const fifo, uint8_t * const dataPtr)
 272                     ; 29 {
 273                     	switch	.text
 274  0054               _FIFO_Get:
 276  0054 89            	pushw	x
 277       00000000      OFST:	set	0
 280                     ; 31     if(fifo->NbBytes == 0)
 282  0055 e605          	ld	a,(5,x)
 283  0057 ea04          	or	a,(4,x)
 284  0059 2603          	jrne	L521
 285                     ; 32       return false;
 287  005b 4f            	clr	a
 289  005c 2032          	jra	L41
 290  005e               L521:
 291                     ; 36     *dataPtr = fifo->Buffer[fifo->Start];
 293  005e 1e01          	ldw	x,(OFST+1,sp)
 294  0060 fe            	ldw	x,(x)
 295  0061 72fb01        	addw	x,(OFST+1,sp)
 296  0064 e606          	ld	a,(6,x)
 297  0066 1e05          	ldw	x,(OFST+5,sp)
 298  0068 f7            	ld	(x),a
 299                     ; 37     fifo->Start++;
 301  0069 1e01          	ldw	x,(OFST+1,sp)
 302  006b 9093          	ldw	y,x
 303  006d fe            	ldw	x,(x)
 304  006e 1c0001        	addw	x,#1
 305  0071 90ff          	ldw	(y),x
 306                     ; 38     if (fifo->Start > FIFO_SIZE)
 308  0073 1e01          	ldw	x,(OFST+1,sp)
 309  0075 9093          	ldw	y,x
 310  0077 90fe          	ldw	y,(y)
 311  0079 90a30101      	cpw	y,#257
 312  007d 2505          	jrult	L721
 313                     ; 39       fifo->Start = 0;
 315  007f 1e01          	ldw	x,(OFST+1,sp)
 316  0081 905f          	clrw	y
 317  0083 ff            	ldw	(x),y
 318  0084               L721:
 319                     ; 41     fifo->NbBytes--;
 321  0084 1e01          	ldw	x,(OFST+1,sp)
 322  0086 9093          	ldw	y,x
 323  0088 ee04          	ldw	x,(4,x)
 324  008a 1d0001        	subw	x,#1
 325  008d 90ef04        	ldw	(4,y),x
 326                     ; 42 }
 327  0090               L41:
 330  0090 85            	popw	x
 331  0091 81            	ret
 344                     	xdef	_FIFO_Get
 345                     	xdef	_FIFO_Put
 346                     	xdef	_FIFO_Init
 365                     	end
