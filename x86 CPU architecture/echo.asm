global _start

SECTION .data
    file db 'data.txt', 0h    
    f_id dq 0              ; File descriptor

section .bss
    input: resb 4   
    
section .text   
_start:

    ; System call (sys_open) 
    mov     ecx, 0         ; Open file from lesson 24
    mov     ebx, filename
    mov     eax, 5
    int     80h

    mov     [f_id], eax

    INPUT_LOOP:
    push    ecx           ; save away the return address

    ; System call (sys_read) 
    mov     edx, 1        ; number of bytes to read
    mov     ecx, input    ; reserved space to store our input (known as a buffer)
    mov     ebx, 0        ; write to the STDIN file
    mov     eax, 3        ; invoke SYS_READ (kernel opcode 3)
    int     80h

    ; System call (sys_write)
    mov     edx, 1        ; number of bytes to write - one for each letter of our contents string
    mov     ecx, input    ; move the memory address of our contents string into ecx
    mov     ebx, f_id     ; move the file descriptor of the file we created into ebx
    mov     eax, 4        ; invoke SYS_WRITE (kernel opcode 4)
    int     80h 

    pop     ecx           ; restore return address
    loop    INPUT_LOOP  

    ; System call (sys_write) 
    mov     ecx, input    ; Store arguments to the system cal,  move the memory address of sum into ecx
    mov     edx, 1        ; number of bytes to write 
    mov     ebx, 1        ; Store arguments to the system cal, write to the STDOUT file
    mov     eax, 4        ; system call number (sys_write) 
    int     0x80          ; call kernel
    
    ; System call (sys_exit)
    mov     eax, 1       ; system call number (sys_exit) 
    int     0x80         ; call kernel
   
