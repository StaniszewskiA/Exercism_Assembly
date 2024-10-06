section .text
global nucleotide_counts
nucleotide_counts:
    xor    eax, eax
    mov    [rsi], rax
    mov    [rsi + 8], rax
    mov    [rsi + 16], rax
    mov    [rsi + 24], rax
    jmp    .next

.loop:
    xor    ecx, ecx
    lea    edx, [rcx - 1]

    cmp    al, 'A'
    cmove  edx, ecx
    inc    ecx

    cmp    al, 'C'
    cmove  edx, ecx
    inc    ecx

    cmp    al, 'G'
    cmove  edx, ecx
    inc    ecx

    cmp    al, 'T'
    cmove  edx, ecx

    test   edx, edx
    jl     .invalid
    inc    qword [rsi + rdx * 8]

.next:
    mov    al, [rdi]
    inc    rdi
    test   al, al
    jnz    .loop
    ret

.invalid:
    or     rax, -1
    mov    [rsi], rax
    mov    [rsi + 8], rax
    mov    [rsi + 16], rax
    mov    [rsi + 24], rax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
