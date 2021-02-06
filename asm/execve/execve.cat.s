	.intel_syntax noprefix
	.global _start
	.text
_start:
	jmp offset skip
cmd: .ascii "/bin/cat\0"
skip:	mov	rax, 59
	mov	rdi, offset cmd ;//[rip-7-7-8]
	mov	rsi, 0
	mov	rdx, 0
	syscall

	mov	rax, 60
	xor	rdi, rdi
	syscall

