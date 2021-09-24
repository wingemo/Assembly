global _start

section .bss
    input: resb 4   
    
section .text   
_start:

    ; System call (sys_read) 
    mov     edx, 1        ; number of bytes to read
    mov     ecx, input    ; reserved space to store our input (known as a buffer)
    mov     ebx, 0        ; write to the STDIN file
    mov     eax, 3        ; invoke SYS_READ (kernel opcode 3)
    int     80h

    ; System call (sys_write) 
    mov     ecx, input  ; Store arguments to the system cal,  move the memory address of sum into ecx
    mov     edx, 1     ; number of bytes to write 
    mov     ebx, 1     ; Store arguments to the system cal, write to the STDOUT file
    mov     eax, 4     ; system call number (sys_write) 
    int     0x80       ; call kernel
    
    ; System call (sys_exit)
    mov     eax, 1     ; system call number (sys_exit) 
    int     0x80       ; call kernel
