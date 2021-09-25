global _start

SECTION .data
    sum db 0

section .bss
    input: resb 10
    
section .text   
_start:

    INPUT_LOOP:
    push    ecx                  ; save away the return address
    mov     edx, 10              ; number of bytes to read
    mov     ecx, input           ; reserved space to store our input (known as a buffer)
    mov     ebx, 0               ; write to the STDIN file
    mov     eax, 3               ; invoke SYS_READ (kernel opcode 3)
    int     0x80
    pop     ecx 

    movzx   eax, byte [input]    ; start with the first digit
    sub     eax, '0'
    push    eax                  ; save away the return address
    loop    INPUT_LOOP  
    
    MATH_LOOP:
    pop     ebx 
    cmp     ebx,  0              ; eax = 10?
    je      FINISH               ; If true finish
    add     sum,  ebx
    loop    MATH_LOOP 
    
    FINISH: 
    mov     ecx, sum          ; Store arguments to the system cal,  move the memory address of sum into ecx
    mov     edx, 1               ; number of bytes to write 
    mov     ebx, 1               ; Store arguments to the system cal, write to the STDOUT file
    mov     eax, 4               ; system call number (sys_write) 
    int     0x80                 ; call krenel

    mov     eax, 1               ; system call number (sys_exit) 
    int     0x80                 ; call kernel
  
