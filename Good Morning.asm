section .data
msg1 db "hello", 10
msg1len equ $-msg1
newline db 10
msg2 db "Good Morning", 10
msg2len equ $-msg2

section .text
    global _start
    
_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msg1len
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
                                                                                                                        
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, msg2len
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall
