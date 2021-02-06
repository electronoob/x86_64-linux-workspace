ntel_syntax noprefix
        .global _start
        .text
_start:
        mov     al, 59
        push rax
        mov     rdi, rsp
        xor esi, esi
        xor edx, edx
        syscall
