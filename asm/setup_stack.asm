section .data
    stack_size  equ 1024
    stack       resb stack_size      ; Stack space

section .text
    global setup_stack

setup_stack:
    mov  rsp, stack                  ; Set stack pointer to the start of the stack
    ret
