section .data
    num_Array = 5,12,0D3,8,0A
    msg db "Array in ascending order is: ", 10
    msglen equ $-msg

section .text
    global _start

_start:
    loop1: 
    mov rsi,num_Array   ;; rsi = 5
    mov bl,rsi          ;; bl = 5
    cmp bl,[rsi + 1]    ;; bl = 5 rsi + 1 = 12
    jbe loop1           ;; cmp 5 and 12
    
    mov dl,[rsi]
    dec rsi
    mov [rsi],dl
    inc rsi
    jmp loop1
