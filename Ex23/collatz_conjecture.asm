section .text
global steps
steps:
    test    edi, edi
    jle     .fail
    xor     eax, eax
    cmp     edi, 1
    je      .ret

.loop:
    add     eax, 1
    test    dil, 1
    jne     .odd
    mov     edx, edi
    sar     edi, 1
    cmp     edi, 1
    jne     .loop
    ret

.odd:
    lea     edi, [rdi+1+rdi*2]  
    cmp     edi, 1
    jne     .loop
    ret

.fail:
    mov     eax, -1

.ret:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
