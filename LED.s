.text
.global _start
		
_start:
# These addresses needs to be set to the correct values
	movia	r17,0x10000000	# Address for the red LEDs
	movia	r18,0x10000010	# Address for the green LEDs
	movia  r10,0x4
	movia  r12,0x1
	movia	r9, 0xaaaaaaaa
	
# This segment writes to the green LEDs, waits
# for the timer and then turns the green LEDs off.
	
# This segment writes to the red LEDs, waits
# for the timer and then turns the red LEDs off.
RED: 
	srl        r9, r9, r12
        mov     r8, r9
	stwio	r8,0(r17)
	call	TIMER
	stwio	r0,0(r17)
	call      COUNTDOWN
	br        RED

GREEN:
	movia	r8, 0xfff
	stwio	r8,0(r18)
	call	TIMER
	stwio	r0,0(r18)
	br      END

COUNTDOWN:
	subi  r10,r10,0x1
	beq   r10,r0, GREEN  
	ret 
	
TIMER:
	movia	r8, 0x989757 # Is this value reasonable? 0xffffff
	
START_TIMER:
	subi	r8,r8,0x1
	bne	r8,r0, START_TIMER
	ret
		
END:
