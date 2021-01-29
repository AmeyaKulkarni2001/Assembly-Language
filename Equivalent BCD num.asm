%macro scall 4
mov rax,%1
mov rdi,%2
mov rsi,%3
mov rdx,%4
syscall
%endmacro

section .data
    Number dw 0FFFFH
    msg db 10d,13d,"Equivalent BCD Number: "
    msglen equ $-msg

section .bss
    num resb 5

section .text
    global _start

_start:
    mov ax,word[Number]
    
        mov bx, 0AH
        mov rdi,num+4
loop3:
        mov dx,0
        div bx
        add dl,30h
        mov [rdi],dl
    dec rdi
        cmp ax,0
        jne loop3
        
    scall 1,1,msg,msglen
    scall 1,1,num,5
    
    exit:
    mov rax, 60
    mov rdi, 0
    syscall
