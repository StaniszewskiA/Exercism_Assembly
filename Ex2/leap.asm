section .text
global leap_year
leap_year:
    mov    rax, rdi
    and    rax, 3
    jnz    no

    xor    rdx, rdx
    mov    rax, rdi
    mov    ecx, 400
    div    ecx
    test   rdx, rdx
    jz     yes

    xor    rdx, rdx
    mov    rax, rdi
    mov    ecx, 400
    div    ecx
    test   rdx, rdx
    jz     yes

    xor    rdx, rdx
    mov    rax, rdi
    mov    ecx, 100
    div    ecx
    test   rdx, rdx
    jnz    yes

no:
    xor    rax, rax
    ret

yes:
    xor    rax, 1
    ret
    

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
