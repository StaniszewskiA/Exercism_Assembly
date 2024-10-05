section .text
global can_create
can_create:
    xor    eax, eax ; clear eax
    
    cmp    edi, 8   ; check if edi is > 8
    setb   dl

    cmp    esi, 8   ; check if esi is > 8
    setb   al

    and    al, dl   ; bitwise AND al and dl
    ret

global can_attack
can_attack:
    mov    eax, 1    ; set the default return value

    cmp    edi, edx  ; is edi and edx the same
    je     .done

    cmp    esi, ecx  ; is esi and edx the same
    je     .done

    lea    r8d, [rdi + rsi]    ; get ready for calculations
    lea    r9d, [rdx + rcx]

    cmp    r8d, r9d
    je     .done

    sub    rdi, rsi
    sub    rdx, rcx
    cmp    rdi, rdx
    sete   al

.done:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
