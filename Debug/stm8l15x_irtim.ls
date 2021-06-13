   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 97 void IRTIM_DeInit(void)
  41                     ; 98 {
  43                     	switch	.text
  44  0000               _IRTIM_DeInit:
  48                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  50  0000 725f52ff      	clr	21247
  51                     ; 100 }
  54  0004 81            	ret
 109                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
 109                     ; 109 {
 110                     	switch	.text
 111  0005               _IRTIM_Cmd:
 115                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 117                     ; 114   if (NewState ==   DISABLE)
 119  0005 4d            	tnz	a
 120  0006 2606          	jrne	L74
 121                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 123  0008 721152ff      	bres	21247,#0
 125  000c 2004          	jra	L15
 126  000e               L74:
 127                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
 129  000e 721052ff      	bset	21247,#0
 130  0012               L15:
 131                     ; 122 }
 134  0012 81            	ret
 170                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 170                     ; 131 {
 171                     	switch	.text
 172  0013               _IRTIM_HighSinkODCmd:
 176                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 178                     ; 136   if (NewState == DISABLE)
 180  0013 4d            	tnz	a
 181  0014 2606          	jrne	L17
 182                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 184  0016 721352ff      	bres	21247,#1
 186  001a 2004          	jra	L37
 187  001c               L17:
 188                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
 190  001c 721252ff      	bset	21247,#1
 191  0020               L37:
 192                     ; 144 }
 195  0020 81            	ret
 219                     ; 168 FunctionalState IRTIM_GetStatus(void)
 219                     ; 169 {
 220                     	switch	.text
 221  0021               _IRTIM_GetStatus:
 225                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 227  0021 c652ff        	ld	a,21247
 228  0024 a401          	and	a,#1
 231  0026 81            	ret
 256                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
 256                     ; 179 {
 257                     	switch	.text
 258  0027               _IRTIM_GetHighSinkODStatus:
 262                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 264  0027 c652ff        	ld	a,21247
 265  002a a402          	and	a,#2
 268  002c 81            	ret
 281                     	xdef	_IRTIM_GetHighSinkODStatus
 282                     	xdef	_IRTIM_GetStatus
 283                     	xdef	_IRTIM_HighSinkODCmd
 284                     	xdef	_IRTIM_Cmd
 285                     	xdef	_IRTIM_DeInit
 304                     	end
