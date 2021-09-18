********************************************************************************
* This program demonstrates use of the JTAG UART port
*
* It performs the following:
* 1. sends a text string to the JTAG UART
* 2. reads character data from the JTAG UART
* 3. echos the character data back to the JTAG UART
********************************************************************************/
.text /* executable code follows */
.global _start
_start:
  movia	r18,0x10000010	# Address for the green LEDs
  movia	r19,0x10000040	# Address for switches

MAIN_LOOP:
  call  READ_SWITCHES
  call  LIT_LEDS
  br    MAIN_LOOP
  
READ_SWITCHES:
  ldwio r4, (r19)
  ret 
  
LIT_LEDS:
  stwio	r4, 0(r18)
  mov   r4, r0
  ret 

END:
  .end
