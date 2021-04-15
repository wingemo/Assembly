********************************************************************************
* This program demonstrates use of the JTAG UART port
*
* It performs the following:
* 1. sends a text string to the JTAG UART
* 2. reads character data from the JTAG UART
* 3. echos the character data back to the JTAG UART
********************************************************************************/

.text /* executable code follows */
global _start
_start:

.macro PUSH reg
  subi    sp, sp, 4  /* reserve space on the stack */
  stw     \reg, 0(sp) /* save register */
.endm 
  
.macro POP reg
  ldw     r4, 0(sp) /* restore registers */
  addi    sp, sp, 4 
.endm

/* set up stack pointer */
movia sp, 0x007FFFFC /* stack starts from highest memory address in SDRAM */
movia r6, 0x10001000 /* JTAG UART base address */

/* print a text string */
movia r8, TEXT_STRING

MAIN_LOOP:
  ldb     r5, 0(r8)
  beq     r5, zero, */
  call    PUT_JTAG
  addi    r8, r8, 1
  br      MAIN_LOOP

GET_JTAG:
  ldwio   r4, 0(r6) /* read the JTAG UART Data register */
  andi    r8, r4, 0x8000  /* check if there is new data */
  beq     r8, r0, GET_JTAG  /* if no data, wait */
  andi    r5, r4, 0x00ff /* the data is in the least significant byte */
  PUSH    r31 /* save away the return address */
  call    PUT_JTAG /* echo character */
  POP     r31 /* restore return address */
  br      GET_JTAG /* Loop */

PUT_JTAG:
  PUSH    r5 /* reserve space on the stack */
  ldwio   r4, 4(r6) /* read the JTAG UART Control register */
  andhi   r4, r4, 0xffff  /* check for write space */	
  beq     r4, r0, END_PUT /* if no space, ignore the character */
  stwio   r5, 0(r6)  /* send the character */

END_PUT:
  POP     r5 /* restore registers */
  ret

TEXT_STRING:
.asciz "\nHello World!\n> "

.end
