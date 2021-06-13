   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  41                     ; 92 void BEEP_DeInit(void)
  41                     ; 93 {
  43                     	switch	.text
  44  0000               _BEEP_DeInit:
  48                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  50  0000 725f50f0      	clr	20720
  51                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  53  0004 351f50f3      	mov	20723,#31
  54                     ; 96 }
  57  0008 81            	ret
 122                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 122                     ; 106 {
 123                     	switch	.text
 124  0009               _BEEP_Init:
 126  0009 88            	push	a
 127       00000000      OFST:	set	0
 130                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 132                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 134  000a c650f3        	ld	a,20723
 135  000d a41f          	and	a,#31
 136  000f a11f          	cp	a,#31
 137  0011 260c          	jrne	L15
 138                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 140  0013 c650f3        	ld	a,20723
 141  0016 a4e0          	and	a,#224
 142  0018 c750f3        	ld	20723,a
 143                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 145  001b 721050f3      	bset	20723,#0
 146  001f               L15:
 147                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 149  001f c650f3        	ld	a,20723
 150  0022 a43f          	and	a,#63
 151  0024 c750f3        	ld	20723,a
 152                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 154  0027 c650f3        	ld	a,20723
 155  002a 1a01          	or	a,(OFST+1,sp)
 156  002c c750f3        	ld	20723,a
 157                     ; 122 }
 160  002f 84            	pop	a
 161  0030 81            	ret
 216                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 216                     ; 131 {
 217                     	switch	.text
 218  0031               _BEEP_Cmd:
 222                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 224                     ; 135   if (NewState != DISABLE)
 226  0031 4d            	tnz	a
 227  0032 2706          	jreq	L101
 228                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 230  0034 721a50f3      	bset	20723,#5
 232  0038 2004          	jra	L301
 233  003a               L101:
 234                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 236  003a 721b50f3      	bres	20723,#5
 237  003e               L301:
 238                     ; 145 }
 241  003e 81            	ret
 277                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 277                     ; 179 {
 278                     	switch	.text
 279  003f               _BEEP_LSClockToTIMConnectCmd:
 283                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 285                     ; 183   if (NewState != DISABLE)
 287  003f 4d            	tnz	a
 288  0040 2706          	jreq	L321
 289                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 291  0042 721050f0      	bset	20720,#0
 293  0046 2004          	jra	L521
 294  0048               L321:
 295                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 297  0048 721150f0      	bres	20720,#0
 298  004c               L521:
 299                     ; 193 }
 302  004c 81            	ret
 355                     .const:	section	.text
 356  0000               L61:
 357  0000 000003e8      	dc.l	1000
 358                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 358                     ; 208 {
 359                     	switch	.text
 360  004d               _BEEP_LSICalibrationConfig:
 362  004d 5206          	subw	sp,#6
 363       00000006      OFST:	set	6
 366                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 368                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 370  004f 96            	ldw	x,sp
 371  0050 1c0009        	addw	x,#OFST+3
 372  0053 cd0000        	call	c_ltor
 374  0056 ae0000        	ldw	x,#L61
 375  0059 cd0000        	call	c_ludv
 377  005c be02          	ldw	x,c_lreg+2
 378  005e 1f03          	ldw	(OFST-3,sp),x
 380                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 382  0060 c650f3        	ld	a,20723
 383  0063 a4e0          	and	a,#224
 384  0065 c750f3        	ld	20723,a
 385                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 387  0068 1e03          	ldw	x,(OFST-3,sp)
 388  006a 54            	srlw	x
 389  006b 54            	srlw	x
 390  006c 54            	srlw	x
 391  006d 1f05          	ldw	(OFST-1,sp),x
 393                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 395  006f 1e05          	ldw	x,(OFST-1,sp)
 396  0071 58            	sllw	x
 397  0072 58            	sllw	x
 398  0073 58            	sllw	x
 399  0074 1f01          	ldw	(OFST-5,sp),x
 401  0076 1e03          	ldw	x,(OFST-3,sp)
 402  0078 72f001        	subw	x,(OFST-5,sp)
 403  007b 1605          	ldw	y,(OFST-1,sp)
 404  007d 9058          	sllw	y
 405  007f 905c          	incw	y
 406  0081 cd0000        	call	c_imul
 408  0084 1605          	ldw	y,(OFST-1,sp)
 409  0086 9058          	sllw	y
 410  0088 9058          	sllw	y
 411  008a 9058          	sllw	y
 412  008c bf00          	ldw	c_x,x
 413  008e 90b300        	cpw	y,c_x
 414  0091 250c          	jrult	L551
 415                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 417  0093 7b06          	ld	a,(OFST+0,sp)
 418  0095 a002          	sub	a,#2
 419  0097 ca50f3        	or	a,20723
 420  009a c750f3        	ld	20723,a
 422  009d 2009          	jra	L751
 423  009f               L551:
 424                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 426  009f 7b06          	ld	a,(OFST+0,sp)
 427  00a1 4a            	dec	a
 428  00a2 ca50f3        	or	a,20723
 429  00a5 c750f3        	ld	20723,a
 430  00a8               L751:
 431                     ; 231 }
 434  00a8 5b06          	addw	sp,#6
 435  00aa 81            	ret
 448                     	xdef	_BEEP_LSICalibrationConfig
 449                     	xdef	_BEEP_LSClockToTIMConnectCmd
 450                     	xdef	_BEEP_Cmd
 451                     	xdef	_BEEP_Init
 452                     	xdef	_BEEP_DeInit
 453                     	xref.b	c_lreg
 454                     	xref.b	c_x
 473                     	xref	c_imul
 474                     	xref	c_ludv
 475                     	xref	c_ltor
 476                     	end
