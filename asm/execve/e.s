        .intel_syntax noprefix
        .global _start
        .text
_start:
        mov     rax, 59
        mov     rdi, offset cmd
        mov     rsi, 0
        mov     rdx, 0
        syscall

;       mov     rax, 60
;       xor     rdi, rdi
;       syscall
cmd: .ascii "/bin/shABC"
