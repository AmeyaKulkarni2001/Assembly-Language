section .data
msg db "sorted array is: ", 10
msglen equ $-msg
arr db 08h,0Bh,80h,0D2h,15h

%macro op 4
mov rax,%1
mov rdi,%2
mov rsi,%3
mov rdx,%4
syscall
%endmacro

section .bss
res resb 15

section .text
    global _start
_start:

mov bl,5
outer_loop1:
            mov cl,4
            mov rsi,arr
up1:
            mov al,byte[rsi]
            cmp al,byte[rsi + 1]
            jbe inc_num1
    
            xchg al,byte[rsi + 1]
            mov byte[rsi],al
inc_num1:
            inc rsi
            dec cl
            jnz up1
        
            dec bl
            jnz outer_loop1
            
            op 1,1,msg,msglen
            
            mov rdi, arr
            mov rsi, res
            mov al,[rdi]
            
disp_loop1:
	    mov cl,2
	    mov al,[rdi]
            
againx1:
            rol al,4
            mov bl,al
            and al,0FH
            cmp al,09H
            jbe downx1
            add al,07H
downx1:
            add al,30H
            mov byte[rsi],al
            mov al,bl
            inc rsi
            dec cl
            jnz againx1
            
            mov byte[rsi],0AH
	    inc rsi			
	    inc rdi
	    dec dl
	    jnz disp_loop1
	    op 1,1,res,15
			
	    op 60,0,0,0
