   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _RTC_Settings:
  15  0000 40            	dc.b	64
  16  0001 7c            	dc.b	124
  17  0002 07cf          	dc.w	1999
  18  0004               _SRTC_TimeNow:
  19  0004 04            	dc.b	4
  20  0005 00            	dc.b	0
  21  0006 00            	dc.b	0
  22  0007 40            	dc.b	64
  23  0008               _SRTC_DateNow:
  24  0008 04            	dc.b	4
  25  0009 06            	dc.b	6
  26  000a 11            	dc.b	17
  27  000b 15            	dc.b	21
  62                     ; 18 void RTC_init()
  62                     ; 19 {
  64                     	switch	.text
  65  0000               _RTC_init:
  69                     ; 20     RTC_DeInit();
  71  0000 cd0000        	call	_RTC_DeInit
  73                     ; 23     CLK_RTCClockConfig(CLK_RTCCLKSource_HSI, CLK_RTCCLKDiv_64);
  75  0003 ae02c0        	ldw	x,#704
  76  0006 cd0000        	call	_CLK_RTCClockConfig
  78                     ; 26     CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
  80  0009 ae1201        	ldw	x,#4609
  81  000c cd0000        	call	_CLK_PeripheralClockConfig
  83                     ; 28     RTC_Init(&RTC_Settings);
  85  000f ae0000        	ldw	x,#_RTC_Settings
  86  0012 cd0000        	call	_RTC_Init
  88                     ; 30     RTC_set_time();
  90  0015 ad01          	call	_RTC_set_time
  92                     ; 31 }
  95  0017 81            	ret
 123                     ; 36 void RTC_set_time()
 123                     ; 37 {
 124                     	switch	.text
 125  0018               _RTC_set_time:
 129                     ; 41     RTC_SetTime(RTC_Format_BIN, &SRTC_TimeNow); 
 131  0018 ae0004        	ldw	x,#_SRTC_TimeNow
 132  001b 89            	pushw	x
 133  001c 4f            	clr	a
 134  001d cd0000        	call	_RTC_SetTime
 136  0020 85            	popw	x
 137                     ; 44     RTC_SetDate(RTC_Format_BIN, &SRTC_DateNow); 
 139  0021 ae0008        	ldw	x,#_SRTC_DateNow
 140  0024 89            	pushw	x
 141  0025 4f            	clr	a
 142  0026 cd0000        	call	_RTC_SetDate
 144  0029 85            	popw	x
 145                     ; 47     RTC_ExitInitMode();
 147  002a cd0000        	call	_RTC_ExitInitMode
 149                     ; 49 }
 152  002d 81            	ret
 381                     ; 54 void RTC_read_date(RTC_DateTypeDef* RTC_DateStruct)
 381                     ; 55 {
 382                     	switch	.text
 383  002e               _RTC_read_date:
 387                     ; 56     RTC_GetDate(RTC_Format_BIN, RTC_DateStruct);  
 389  002e 89            	pushw	x
 390  002f 4f            	clr	a
 391  0030 cd0000        	call	_RTC_GetDate
 393  0033 85            	popw	x
 394                     ; 57 }
 397  0034 81            	ret
 493                     ; 61 void RTC_read_time(RTC_TimeTypeDef* RTC_TimeStruct)
 493                     ; 62 {
 494                     	switch	.text
 495  0035               _RTC_read_time:
 499                     ; 63     RTC_GetTime(RTC_Format_BIN, RTC_TimeStruct);
 501  0035 89            	pushw	x
 502  0036 4f            	clr	a
 503  0037 cd0000        	call	_RTC_GetTime
 505  003a 85            	popw	x
 506                     ; 64 }
 509  003b 81            	ret
 605                     	xdef	_RTC_read_time
 606                     	xdef	_RTC_read_date
 607                     	xdef	_SRTC_DateNow
 608                     	xdef	_SRTC_TimeNow
 609                     	xdef	_RTC_Settings
 610                     	xdef	_RTC_set_time
 611                     	xdef	_RTC_init
 612                     	xref	_RTC_GetDate
 613                     	xref	_RTC_SetDate
 614                     	xref	_RTC_GetTime
 615                     	xref	_RTC_SetTime
 616                     	xref	_RTC_ExitInitMode
 617                     	xref	_RTC_Init
 618                     	xref	_RTC_DeInit
 619                     	xref	_CLK_PeripheralClockConfig
 620                     	xref	_CLK_RTCClockConfig
 639                     	end
