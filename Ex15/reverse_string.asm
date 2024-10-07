section .text
global reverse
reverse:
    cld
    mov    rsi, rdi

.find_end:
    lodsb
    test   al, al
    jnz    .find_end
    dec    rsi

    cmp    rsi, rdi
    je     .done

.loop:
    dec    rsi
    cmp    rsi, rdi
    je     .done

    mov    al, [rsi]
    mov    dl, [rdi]
    stosb
    mov    [rsi], dl
    cmp    rsi, rdi
    jne    .loop

.done:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
