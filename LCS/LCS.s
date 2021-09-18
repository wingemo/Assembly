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
  stwio	r4, 0(r8)
  mov   r4, r0
  br    0x20
  
END:
  .end
