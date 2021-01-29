section .data
Num_Array db 0DDh,0AAh,0BBh,11h,15h,12h,16h,29h,25h,40h

msg db "Result of array addition is", 10
msglen equ $-msg

newline db 10

section .bss
sum resw 1    
temp resw 1 
result resb 1  

%macro rw 4
   mov rax,%1
   mov rdi,%2
   mov rsi,%3
   mov rdx,%4
   syscall
%endmacro
section .text
global _start
  _start:                                                         
                        
             mov rsi,Num_Array           
             mov ax,00h                        
	    mov bx,00h
	    mov cl,10		
up2:	    mov bl,byte[rsi]                 
  	    add al,bl                             
	    jnc skip
	    inc ah                                  
skip:	 
	    inc rsi                                
	    dec cl                                
	    jnz up2

                          
        mov word[sum],ax
        rw 1,1,msg,msglen       
        rw 1,1,newline,1         
        call disp
       
    mov rax,60
    mov rdi,0
    syscall

disp:                               
	
	    mov bp,4
	    mov ax,word[sum]   
	   
up1:	    rol ax,4           
	    mov [temp],ax          
	    and al,0fh             	   
             cmp al,09
	    jbe down1
	    add al,07
down1: add al,30h                
	    mov [result],al
	    
            rw 1,1,result,1

	    mov ax,word[temp]      
	    dec bp                 
	    jnz up1
	    ret
