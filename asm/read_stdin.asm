; Read from stdin (standard input)

section .text
    global read_input

read_stdin:
    mov rax, 0        ; sys_read
    mov rdi, 0        ; stdin file descriptor
    mov rdx, [rsi]    ; Load buffer_size from the parameter
    syscall           ; Make the system call

    mov r8, rax       ; Save the stdin content (e.g., r8)

    ret
