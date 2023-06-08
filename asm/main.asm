section .data
    buffer      resb 64             ; Buffer for input

section .text
    extern read_stdin
    extern exit_program
    global _start

section .bss
    stack_size  equ 1024
    stack       resb stack_size      ; Stack space

_start:
    mov  rsp, stack                  ; Set stack pointer to the start of the stack

    mov  rdi, buffer                 ; Pass buffer as the parameter
    call read_stdin                  ; Call the read_stdin subroutine
    mov  byte [rsp - 1], r8          ; Push the value r8 onto the stack

    call exit_program                ; Call the exit_program subroutine

