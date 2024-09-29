default rel

section .rodata
you: db "you", 0
prefix: db "One for ", 0
suffix: db ", one for me.", 0

section .text
global two_fer
two_fer:
    cld
    cmp rdi, 0
    jne proceed
    lea rdi, [you]

proceed:
    mov rdx, rdi
    mov rdi, rsi

    lea rsi, [prefix]
    mov rcx, 8
    rep movsb

    mov rsi, rdx

.copy_name:
    lodsb
    stosb
    test al, al
    jne .copy_name
    dec rdi

    lea rsi, [suffix]
    mov rcx, 14
    rep movsb
    ret
    

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
