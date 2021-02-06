	.intel_syntax noprefix
	.global _start
	.text
_start:
	jmp offset skip
cmd: .ascii "/bin/sh\0"
skip:	mov	rax, 59
	mov	rdi, 0x40007a ;//[rip-7-7-8]
	mov	rsi, 0 ;// why
	mov	rdx, 0
	syscall

	mov	rax, 60
	xor	rdi, rdi
	syscall

