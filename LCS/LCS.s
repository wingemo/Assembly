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
  call  LIT_LEDS
  br    MAIN_LOOP
  
READ_SWITCHES:
  ldwio r4, (r19)
  ret 
  
READ_BUTTONS:  
  ldwio r4, (r19)
  ret 

LIT_LEDS:
  stwio	r4, 0(r8)
  mov   r4, r0
  ret 

END:
  .end
	
