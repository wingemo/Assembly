global _start

SECTION .data
    file db 'data.txt', 0h    
    f_id dq 0              ; File descriptor

section .bss
    input: resb 10
    
section .text   
_start:

    INPUT_LOOP:

    ; System call (sys_read) 
    mov     edx, 10       ; number of bytes to read
    mov     ecx, input    ; reserved space to store our input (known as a buffer)
    mov     ebx, 0        ; write to the STDIN file
    mov     eax, 3        ; invoke SYS_READ (kernel opcode 3)
    int     0x80
 
    push    ecx           ; save away the return address
    
    loop    INPUT_LOOP  
    
    ; System call (sys_exit)
    mov     eax, 1       ; system call number (sys_exit) 
    int     0x80         ; call kernel
   

