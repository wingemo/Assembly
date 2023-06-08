section .data
    buffer resb 64                   ; Buffer for input

section .text
    extern sub_stdin
    extern sub_terminate
    extern sub_setup_stack
    global _start

_start:
    call sub_setup_stack             ; Call the setup_stack subroutine

    mov  rdi, buffer                 ; Pass buffer as the parameter
    call sub_stdin                   ; Call the read_stdin subroutine
    mov  byte [rsp - 1], r8          ; Push the value r8 onto the stack

    call sub_terminate               ; Call the exit_program subroutine



