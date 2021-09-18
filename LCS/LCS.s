.text /* executable code follows */
.global _start
_start:

.macro PUSH reg
  subi    sp, sp, 4  /* reserve space on the stack */
  stw     \reg, 0(sp) /* save register */
.endm 
  
.macro POP reg
  ldw     r4, 0(sp) /* restore registers */
  addi    sp, sp, 4 
.endm

  # Address for the red LEDs
  movhi r17, 4096
  addi  r17, r17, 0
  # Address for the green LEDs
  movhi r18, 4096
  addi  r18, r18, 16
  # Address for switches
  movhi r19, 4096
  addi  r19, r19, 64
  # Address for buttons
  movhi r20, 4096
  addi  r20, r20, 80
  
MAIN_LOOP:
  call  0x2c
  call  0x3c
  br    0x20
  
READ_SWITCHES:
  ldwio r4, (r19)
  stwio	r4, 0(r8)
  mov   r4, r0
  ret 
  
READ_BUTTONS:  
  ldwio r5, (r19)
  PUSH  r31 
  beq   r5, r7, 0x58
  POP   r31 
  ret 
  
CHANGE_COLOR:
  

END:
  .end
