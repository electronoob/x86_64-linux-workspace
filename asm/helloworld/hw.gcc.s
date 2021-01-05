	.intel_syntax noprefix
	.global _start

	.text
_start:
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, offset message
	mov	rdx, 13
	syscall

	mov	rax, 60
	xor	rdi, rdi
	syscall

message:
	.ascii "Hello, World\n"
