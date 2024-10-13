section .text
global egg_count
egg_count:
    mov    rax, 0

loop:
    cmp    rdi, 0
    je     done
    mov    r8, rdi
    dec    r8
    and    rdi, r8
    inc    rax
    jmp    loop

done:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
