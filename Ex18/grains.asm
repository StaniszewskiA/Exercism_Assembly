section .text
global square
square:
    xor    eax, eax
    xor    esi, esi
    dec    edi
    test   rdi, -64
    bts    rsi, rdi
    cmovz  rax, rsi
    ret

global total
total:
    mov    rax, -1
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
