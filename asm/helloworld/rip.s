;nasm -felf64 hw.asm && ld hw.o && ./a.out

	global	_start
	section	.text
_start:
	mov rax, 1 ;write syscall
	mov rdi, 1 ;fd (stdout)
	mov rsi, message
	mov rdx, 13;length of string
	syscall

	mov rax, 60; exit syscall
	xor rdi, rdi; exit code
	syscall
	lea eax, $
	section	.data
message:	db	"Hello, World", 10
