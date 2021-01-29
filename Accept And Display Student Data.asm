%macro display 4
mov rax,%1
mov rdi,%2
mov rsi,%3
mov rdx,%4
syscall
%endmacro

section .data
    name db "Enter your name", 10
    namelen equ $-name
    newline db 10
    divi db "Enter your division", 10
    divlen equ $-divi
    roll db "Enter your rollno", 10
    rolllen equ $-roll

section .bss
    msg1 resb 30
    
section .text
    global _start

_start:
    
    display 1,1,name,namelen ;; name
    
    display 0,0,msg1,30      ;; input
    
    display 1,1,newline,1    ;; newline
    
    display 1,1,divi,divlen  ;; div
    
    display 0,0,msg1,30      ;; input
    
    display 1,1,newline,1   ;; newline
    
    display 1,1,roll,rolllen ;; roll
    
    display 0,0,msg1,30
    
    display 1,1,newline,1
    
    display 1,1,msg1,30
    
    display 60,0,0,0
