       .intel_syntax noprefix
        .global _start
        .text

_start:
open:
        // open 
        mov     al, 0x2
        //const char __user * filename
        mov     dx, 0x0066
//1
        push    rdx
        mov     rdi, rsp        
// int flags
        xor     esi, esi
        // umode_t mode
//        xor   rdx, rdx
        syscall
        push rax
sendfile:

        // size_t count
        mov     r10b, 0x3c
        // loff_t__user * offset
        xor     edx,edx
        // int in_fd
        pop     rsi
        // int out_fd
        // i know rsi is 0x3
        mov     rdi,rsi 
        dec     edi
        mov     al, 40
        syscall
exit:   //exit
//        mov     al, 60
        //xor     rdi, rdi // prob irrelevant
//        syscall
