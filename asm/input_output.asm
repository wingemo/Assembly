section .text
    global read_and_display

read_and_display:
    ; Read from stdin (standard input)
    mov rax, 0        ; sys_read
    mov rdi, 0        ; stdin file descriptor
    mov rdx, [rsi]    ; Load buffer_size from the parameter
    syscall           ; Make the system call

    ; Display the read input
    mov rax, 1        ; sys_write
    mov rdi, 1        ; stdout file descriptor
    mov rdx, [rsi]    ; Load buffer_size from the parameter
    syscall           ; Make the system call

    ret
