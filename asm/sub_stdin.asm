;--------------------------------------------------------------
; Subroutine: stdin
; Description: Reads input from the standard input (stdin).
; Parameters:
;   - rsi: Address of the buffer size parameter
; Return Value: 
;   - rax: Content of r8 register (stdin content)
;--------------------------------------------------------------
section .data
    buffer resb 64       ; Buffer for input

section .text
    global read_stdin

read_stdin:
    mov rax, 0           ; sys_read
    mov rdi, 0           ; stdin file descriptor
    mov rdx, [buffer]    ; Load buffer_size from the parameter
    syscall              ; Make the system call

    mov r8, rax          ; Save the stdin content (e.g., r8)

    ret
