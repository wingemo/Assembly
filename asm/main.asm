section .data
    ; Buffer for input/output
    buffer      resb 64
    buffer_size equ 64

section .text
    extern read_and_display
    extern exit_program
    global _start

_start:
    ; Call the read_and_display subroutine
    mov rdi, buffer       ; Pass buffer as the parameter
    mov rsi, buffer_size  ; Pass buffer_size as the parameter
    call read_and_display

    ; Call the exit_program subroutine
    call exit_program
