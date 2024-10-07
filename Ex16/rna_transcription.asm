section .text
global to_rna
to_rna:
    xor    eax, eax
    lea    rdx, [rel .table]
    xchg   rsi, rdi

.loop:
    lodsb
    mov    al, [rdx + rax]
    stosb
    test   al, al
    jnz    .loop

    ret

section .data
.table:
    times 65 db 0
    db "U.G...C............A"

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
