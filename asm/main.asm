section .data
    buffer      resb 64    ; Buffer for input/

section .text
    extern read_stdin
    extern exit_program
    global _start

_start:
    mov rdi, buffer       ; Pass buffer as the parameter
    call read_stdin       ; Call the read_stdin subroutine

    call exit_program     ; Call the exit_program subroutine
