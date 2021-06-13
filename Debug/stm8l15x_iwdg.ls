   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  76                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  76                     ; 129 {
  78                     	switch	.text
  79  0000               _IWDG_WriteAccessCmd:
  83                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  85                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  87  0000 c750e0        	ld	20704,a
  88                     ; 133 }
  91  0003 81            	ret
 181                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 181                     ; 149 {
 182                     	switch	.text
 183  0004               _IWDG_SetPrescaler:
 187                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 189                     ; 152   IWDG->PR = IWDG_Prescaler;
 191  0004 c750e1        	ld	20705,a
 192                     ; 153 }
 195  0007 81            	ret
 229                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 229                     ; 163 {
 230                     	switch	.text
 231  0008               _IWDG_SetReload:
 235                     ; 164   IWDG->RLR = IWDG_Reload;
 237  0008 c750e2        	ld	20706,a
 238                     ; 165 }
 241  000b 81            	ret
 264                     ; 173 void IWDG_ReloadCounter(void)
 264                     ; 174 {
 265                     	switch	.text
 266  000c               _IWDG_ReloadCounter:
 270                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 272  000c 35aa50e0      	mov	20704,#170
 273                     ; 176 }
 276  0010 81            	ret
 299                     ; 199 void IWDG_Enable(void)
 299                     ; 200 {
 300                     	switch	.text
 301  0011               _IWDG_Enable:
 305                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 307  0011 35cc50e0      	mov	20704,#204
 308                     ; 202 }
 311  0015 81            	ret
 324                     	xdef	_IWDG_Enable
 325                     	xdef	_IWDG_ReloadCounter
 326                     	xdef	_IWDG_SetReload
 327                     	xdef	_IWDG_SetPrescaler
 328                     	xdef	_IWDG_WriteAccessCmd
 347                     	end
