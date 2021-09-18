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
	
