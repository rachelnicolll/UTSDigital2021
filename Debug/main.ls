   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.4 - 04 Feb 2021
   3                     ; Generator (Limited) V4.5.2 - 04 Feb 2021
  13                     	bsct
  14  0000               _tempResults:
  15  0000 41a99999      	dc.w	16809,-26215
  16  0004 41ba6666      	dc.w	16826,26214
  17  0008 41c0cccc      	dc.w	16832,-13108
  18  000c 41b26666      	dc.w	16818,26214
  19  0010 41b40000      	dc.w	16820,0
  20  0014 41ae6666      	dc.w	16814,26214
  21  0018 41e59999      	dc.w	16869,-26215
  22  001c 41d59999      	dc.w	16853,-26215
  23  0020               _humResults:
  24  0020 42799999      	dc.w	17017,-26215
  25  0024 42793333      	dc.w	17017,13107
  26  0028 427ccccc      	dc.w	17020,-13108
  27  002c 42753333      	dc.w	17013,13107
  28  0030 427a0000      	dc.w	17018,0
  29  0034 42773333      	dc.w	17015,13107
  30  0038 42896666      	dc.w	17033,26214
  31  003c 42856666      	dc.w	17029,26214
  32  0040               _nbReadings:
  33  0040 41000000      	dc.w	16640,0
  62                     ; 15 unsigned int clock(void)
  62                     ; 16 {
  64                     	switch	.text
  65  0000               _clock:
  69                     ; 17 	return ((unsigned int)(TIM1->CNTRH) << 8 | TIM1->CNTRL);
  71  0000 c652bf        	ld	a,21183
  72  0003 5f            	clrw	x
  73  0004 97            	ld	xl,a
  74  0005 c652c0        	ld	a,21184
  75  0008 02            	rlwa	x,a
  78  0009 81            	ret
 109                     ; 20 void main(void)
 109                     ; 21 {
 110                     	switch	.text
 111  000a               _main:
 115                     ; 22 	CLK->CKDIVR = 0x00;	  // Set the frequency to 16 MHz
 117  000a 725f50c0      	clr	20672
 118                     ; 23 	led_blink_init();
 120  000e cd0000        	call	_led_blink_init
 122                     ; 24 	UART_init();
 124  0011 cd0000        	call	_UART_init
 126  0014               L13:
 127                     ; 27 		led_blink();
 129  0014 cd0000        	call	_led_blink
 131                     ; 28 		UART_Poll();
 133  0017 cd0000        	call	_UART_Poll
 135                     ; 29 		UART_2PC(nbReadings, tempResults, humResults);
 137  001a ae0020        	ldw	x,#_humResults
 138  001d 89            	pushw	x
 139  001e ae0000        	ldw	x,#_tempResults
 140  0021 89            	pushw	x
 141  0022 ae0040        	ldw	x,#_nbReadings
 142  0025 cd0000        	call	c_ltor
 144  0028 cd0000        	call	c_ftoi
 146  002b cd0000        	call	_UART_2PC
 148  002e 5b04          	addw	sp,#4
 150  0030 20e2          	jra	L13
 194                     	xdef	_main
 195                     	xdef	_clock
 196                     	xdef	_nbReadings
 197                     	xdef	_humResults
 198                     	xdef	_tempResults
 199                     	xref	_led_blink
 200                     	xref	_led_blink_init
 201                     	xref	_UART_2PC
 202                     	xref	_UART_Poll
 203                     	xref	_UART_init
 222                     	xref	c_ftoi
 223                     	xref	c_ltor
 224                     	end
