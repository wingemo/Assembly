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
  # Address for the green LEDs
  movhi r18, 4096
  addi  r18, r18, 16
  # Address for switches
  movhi r19, 4096
  addi  r19, r19, 64
  
MAIN_LOOP:
  ldwio r4, (r19)
  stwio	r4, 0(r18)
  mov   r4, r0
  br    MAIN_LOOP
  
END:
  .end
