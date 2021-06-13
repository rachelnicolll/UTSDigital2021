   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
 122                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 122                     ; 100 {
 124                     	switch	.text
 125  0000               _RST_GetFlagStatus:
 129                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 131                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 133  0000 c450b1        	and	a,20657
 134  0003 2603          	jrne	L6
 135  0005 4f            	clr	a
 136  0006 2002          	jra	L01
 137  0008               L6:
 138  0008 a601          	ld	a,#1
 139  000a               L01:
 142  000a 81            	ret
 177                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 177                     ; 121 {
 178                     	switch	.text
 179  000b               _RST_ClearFlag:
 183                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 185                     ; 125   RST->SR = (uint8_t)RST_Flag;
 187  000b c750b1        	ld	20657,a
 188                     ; 126 }
 191  000e 81            	ret
 214                     ; 149 void RST_GPOutputEnable(void)
 214                     ; 150 {
 215                     	switch	.text
 216  000f               _RST_GPOutputEnable:
 220                     ; 152   RST->CR = RST_CR_MASK;
 222  000f 35d050b0      	mov	20656,#208
 223                     ; 153 }
 226  0013 81            	ret
 239                     	xdef	_RST_GPOutputEnable
 240                     	xdef	_RST_ClearFlag
 241                     	xdef	_RST_GetFlagStatus
 260                     	end
