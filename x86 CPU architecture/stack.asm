global _start

SECTION .data

section .bss
    input: resb 10
    
section .text   
_start:

    INPUT_LOOP:

    mov     edx, 10              ; number of bytes to read
    mov     ecx, input           ; reserved space to store our input (known as a buffer)
    mov     ebx, 0               ; write to the STDIN file
    mov     eax, 3               ; invoke SYS_READ (kernel opcode 3)
    int     0x80

    movzx   eax, byte [input]    ; start with the first digit
    sub     eax, '0'
    push    eax                  ; save away the return address
    
    loop    INPUT_LOOP  
    
    mov     eax, 1       ; system call number (sys_exit) 
    int     0x80         ; call kernel
  
