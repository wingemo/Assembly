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
  movia	r17,0x10000000	# Address for the red LEDs
  movia	r18,0x10000010	# Address for the green LEDs
  movia	r19,0x10000040	# Address for switches
  movia	r20,0x10000050	# Address for buttons
  
SETUP: 
  mov   r8, r18
  call  MAIN_LOOP
  
MAIN_LOOP:
  call  READ_SWITCHES
  call  READ_BUTTONS
  br    MAIN_LOOP
  
READ_SWITCHES:
  ldwio r4, (r19)
  stwio	r4, 0(r8)
  mov   r4, r0
  ret 
  
READ_BUTTONS:  
  ldwio r4, (r19)
  ret 

END:
  .end
	
