default rel

section .rodata
seconds_per_year: dd 31557600.0 

orbital_period:
    dd 0.2408467               
    dd 0.61519726          
    dd 1.0                      
    dd 1.8808158                
    dd 11.862615                
    dd 29.447498                
    dd 84.016846            
    dd 164.79132               

section .text
global age
age:
    cvtsi2ss   xmm0, rsi
    lea        rax, [orbital_period]
    divss      xmm0, dword [seconds_per_year]
    divss      xmm0, [rax + rdi * 4]
    
    ret        

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
