        .intel_syntax noprefix
        .global _start
        .text

_start:
openf:
        nop
        // open 
        //const char __user * filename
        mov     dx, 0x0066
        push    rdx
        mov     al, 0x2
        mov     rdi, rsp        
// int flags
        xor     esi, esi
        // umode_t mode
//        xor   rdx, rdx
        syscall
        push rax

openg:
        nop
        // open 
        //const char __user * filename
        mov     dx, 0x0067
        push    rdx
        mov     al, 0x2
        mov     rdi, rsp        
// int flags
        inc	esi
        // umode_t mode
//        xor   rdx, rdx
        syscall
        push	rax

sendfile:

        // size_t count
        mov     r10b, 0x3c
        // loff_t__user * offset
        xor     edx,edx
        // int out_fd
        pop 	rdi
	// int in_fd
	pop	rax
        pop     rsi

        mov     al, 40
        syscall
