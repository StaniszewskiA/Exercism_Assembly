section .text
global is_pangram
is_pangram:
    xor    esi, esi

.loop:
    movzx  eax, byte [rdi]
    inc    rdi

    test   al, al
    jz     .next

    sub    al, 'A'
    cmp    al, 26
    jb     .check

    sub    al, 'a'-'A'
    cmp    al, 26 
    jae    .loop

.check:
    bts    esi, eax
    jmp    .loop

.next:
    cmp    esi, 0b11111111111111111111111111
    sete   al
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
