   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  43                     ; 14 @far @interrupt void NonHandledInterrupt (void)
  43                     ; 15 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 19 	return;
  52  0000 80            	iret
  75                     ; 22 @far @interrupt void EXTID0_IRQHandler(void)
  75                     ; 23 {
  76                     	switch	.text
  77  0001               f_EXTID0_IRQHandler:
  81                     ; 24 	if(EXTI->SR1 != 0x00)
  83  0001 725d50a3      	tnz	20643
  84  0005 2704          	jreq	L13
  85                     ; 25 		EXTI->SR1 |= 0x01;
  87  0007 721050a3      	bset	20643,#0
  88  000b               L13:
  89                     ; 27 	state ^= 1;
  91  000b 90100000      	bcpl	_state,#0
  92                     ; 28 	return;
  95  000f 80            	iret
  97                     .const:	section	.text
  98  0000               __vectab:
  99  0000 82            	dc.b	130
 101  0001 00            	dc.b	page(__stext)
 102  0002 0000          	dc.w	__stext
 103  0004 82            	dc.b	130
 105  0005 00            	dc.b	page(f_NonHandledInterrupt)
 106  0006 0000          	dc.w	f_NonHandledInterrupt
 107  0008 82            	dc.b	130
 109  0009 00            	dc.b	page(f_NonHandledInterrupt)
 110  000a 0000          	dc.w	f_NonHandledInterrupt
 111  000c 82            	dc.b	130
 113  000d 00            	dc.b	page(f_NonHandledInterrupt)
 114  000e 0000          	dc.w	f_NonHandledInterrupt
 115  0010 82            	dc.b	130
 117  0011 00            	dc.b	page(f_NonHandledInterrupt)
 118  0012 0000          	dc.w	f_NonHandledInterrupt
 119  0014 82            	dc.b	130
 121  0015 00            	dc.b	page(f_NonHandledInterrupt)
 122  0016 0000          	dc.w	f_NonHandledInterrupt
 123  0018 82            	dc.b	130
 125  0019 00            	dc.b	page(f_NonHandledInterrupt)
 126  001a 0000          	dc.w	f_NonHandledInterrupt
 127  001c 82            	dc.b	130
 129  001d 00            	dc.b	page(f_NonHandledInterrupt)
 130  001e 0000          	dc.w	f_NonHandledInterrupt
 131  0020 82            	dc.b	130
 133  0021 00            	dc.b	page(f_NonHandledInterrupt)
 134  0022 0000          	dc.w	f_NonHandledInterrupt
 135  0024 82            	dc.b	130
 137  0025 00            	dc.b	page(f_NonHandledInterrupt)
 138  0026 0000          	dc.w	f_NonHandledInterrupt
 139  0028 82            	dc.b	130
 141  0029 01            	dc.b	page(f_EXTID0_IRQHandler)
 142  002a 0001          	dc.w	f_EXTID0_IRQHandler
 143  002c 82            	dc.b	130
 145  002d 01            	dc.b	page(f_EXTID0_IRQHandler)
 146  002e 0001          	dc.w	f_EXTID0_IRQHandler
 147  0030 82            	dc.b	130
 149  0031 01            	dc.b	page(f_EXTID0_IRQHandler)
 150  0032 0001          	dc.w	f_EXTID0_IRQHandler
 151  0034 82            	dc.b	130
 153  0035 01            	dc.b	page(f_EXTID0_IRQHandler)
 154  0036 0001          	dc.w	f_EXTID0_IRQHandler
 155  0038 82            	dc.b	130
 157  0039 00            	dc.b	page(f_NonHandledInterrupt)
 158  003a 0000          	dc.w	f_NonHandledInterrupt
 159  003c 82            	dc.b	130
 161  003d 00            	dc.b	page(f_NonHandledInterrupt)
 162  003e 0000          	dc.w	f_NonHandledInterrupt
 163  0040 82            	dc.b	130
 165  0041 00            	dc.b	page(f_NonHandledInterrupt)
 166  0042 0000          	dc.w	f_NonHandledInterrupt
 167  0044 82            	dc.b	130
 169  0045 00            	dc.b	page(f_NonHandledInterrupt)
 170  0046 0000          	dc.w	f_NonHandledInterrupt
 171  0048 82            	dc.b	130
 173  0049 00            	dc.b	page(f_NonHandledInterrupt)
 174  004a 0000          	dc.w	f_NonHandledInterrupt
 175  004c 82            	dc.b	130
 177  004d 00            	dc.b	page(f_NonHandledInterrupt)
 178  004e 0000          	dc.w	f_NonHandledInterrupt
 179  0050 82            	dc.b	130
 181  0051 00            	dc.b	page(f_NonHandledInterrupt)
 182  0052 0000          	dc.w	f_NonHandledInterrupt
 183  0054 82            	dc.b	130
 185  0055 00            	dc.b	page(f_NonHandledInterrupt)
 186  0056 0000          	dc.w	f_NonHandledInterrupt
 187  0058 82            	dc.b	130
 189  0059 00            	dc.b	page(f_NonHandledInterrupt)
 190  005a 0000          	dc.w	f_NonHandledInterrupt
 191  005c 82            	dc.b	130
 193  005d 00            	dc.b	page(f_NonHandledInterrupt)
 194  005e 0000          	dc.w	f_NonHandledInterrupt
 195  0060 82            	dc.b	130
 197  0061 00            	dc.b	page(f_NonHandledInterrupt)
 198  0062 0000          	dc.w	f_NonHandledInterrupt
 199  0064 82            	dc.b	130
 201  0065 00            	dc.b	page(f_NonHandledInterrupt)
 202  0066 0000          	dc.w	f_NonHandledInterrupt
 203  0068 82            	dc.b	130
 205  0069 00            	dc.b	page(f_NonHandledInterrupt)
 206  006a 0000          	dc.w	f_NonHandledInterrupt
 207  006c 82            	dc.b	130
 209  006d 00            	dc.b	page(f_NonHandledInterrupt)
 210  006e 0000          	dc.w	f_NonHandledInterrupt
 211  0070 82            	dc.b	130
 213  0071 00            	dc.b	page(f_NonHandledInterrupt)
 214  0072 0000          	dc.w	f_NonHandledInterrupt
 215  0074 82            	dc.b	130
 217  0075 00            	dc.b	page(f_NonHandledInterrupt)
 218  0076 0000          	dc.w	f_NonHandledInterrupt
 219  0078 82            	dc.b	130
 221  0079 00            	dc.b	page(f_NonHandledInterrupt)
 222  007a 0000          	dc.w	f_NonHandledInterrupt
 223  007c 82            	dc.b	130
 225  007d 00            	dc.b	page(f_NonHandledInterrupt)
 226  007e 0000          	dc.w	f_NonHandledInterrupt
 277                     	xdef	__vectab
 278                     	xref	__stext
 279                     	xdef	f_EXTID0_IRQHandler
 280                     	xdef	f_NonHandledInterrupt
 281                     	xref.b	_state
 300                     	end
