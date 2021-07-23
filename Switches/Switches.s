.text
.global _start
_start:
	 movia r6,  0x10000040 /* Switches base address */
	 movia r18, 0x10000010 /* LEDs base address */
	 
MAIN_LOOP:	 
	 ldwio   r4,  0(r6)
	 stwio	 r4,  0(r18)
	 br      MAIN_LOOP

END:
         .end
