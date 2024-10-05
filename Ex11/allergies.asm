section .text
global allergic_to
allergic_to:
    xor    eax, eax
    bts    eax, edi
    and    eax, esi
    ret
    
global list
list:
    xor    edx, edx
    xor    ecx, ecx

.loop:
    shr    edi, 1
    jnc    .skip
    inc    ecx
    mov    [rsi + rcx * 4], edx

.skip:
    inc    edx
    cmp    edx, 8
    jne    .loop
    mov    [rsi], ecx
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
