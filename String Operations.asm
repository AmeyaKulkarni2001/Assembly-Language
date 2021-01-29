%macro scall 4
 mov rax,%1
 mov rdi,%2
 mov rsi,%3
 mov rdx,%4
 syscall
%endmacro

section .data
 menu db 10d,13d,"Menu"
      db 10d,"1. Enter the string"
      db 10d,"2. Length of the string"
      db 10d,"3. Reverse String"
      db 10d,"4. Check Palindrome"
      db 10d,"5. Exit"
 menulen equ $-menu
 
 m1 db 10d,"Enter string:"
 l1 equ $-m1
 m2 db 10d,"Length of the string:"
 l2 equ $-m2
 m3 db 10d,"Reversed string:"
 l3 equ $-m3
 m4 db 10d,"String is Palindrome"
 l4 equ $-m4
 m5 db 10d,"String is not Palindrome"
 l5 equ $-m5
 
section .bss
  string resb 50
  string2 resb 50
  length resb 16
  answer resb 16
  
section .text
 global _start
 _start:
 scall 1,1,menu,menulen
 scall 1,1,m1,l1
 scall 0,0,string,50

 
 mov[length],rax
  scall 1,1,string,10
 scall 1,1,m2,l2
 mov rax,[length]
 call display
 call stringreverse
 
 scall 1,1,m3,l3
 scall 1,1,string2,[length]
 call stringreverse
 
 mov rsi,string
 mov rdi,string2
 mov rcx,[length]

loop3:
 mov al,[rsi]
 cmp al,[rdi]
 jne skip2
 
 inc rsi
 inc rdi
 dec byte[length]
 jnz loop3
 
 scall 1,1,m4,l4
 jmp exit
 
skip2:
 scall 1,1,m5,l5
 
exit:
 mov rax,60
 mov rdx,0 
 syscall
 
display:
 mov rsi,answer+15
 mov rcx,16

loop1: 
 mov rdx,0 
 mov rbx,16
 div rbx
 cmp dl,09h
 jbe skip1
 add dl,07h
 
skip1:
 add dl,30h
 mov[rsi],dl
 
 dec rsi
 dec rcx
 jnz loop1
 scall 1,1,answer,16
ret

stringreverse:
 mov rsi,string
 mov rdi,string2
 mov rcx,[length]
 add rdi,rcx
 dec rdi
 
loop2:
 mov al,[rsi]
 mov [rdi],al
 dec rdi
 inc rsi
 loop loop2
ret
