section .data
    buffer resb 64                   ; Buffer for input

section .text
    extern subroutine_stdin
    extern subroutine_terminate
    extern setup_stack
    global _start

_start:
    call setup_stack                 ; Call the setup_stack subroutine

    mov  rdi, buffer                 ; Pass buffer as the parameter
    call subroutine_stdin            ; Call the read_stdin subroutine
    mov  byte [rsp - 1], r8          ; Push the value r8 onto the stack

    call subroutine_terminate        ; Call the exit_program subroutine



