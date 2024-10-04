default rel

section .data
R1 db "Whatever.", 0
R2 db "Sure.", 0
R3 db "Whoa, chill out!", 0
R4 db "Calm down, I know what I'm doing!", 0
R5 db "Fine. Be that way!",0
RES dq R1, R2, R3, R4, R5

section .text
global response
response:
    xor    rax, rax
    xor    rdx, rdx
    mov    rcx, 4

.check_char:
    cmp    [rdi], byte 0
    je     .exit

    cmp    [rdi], byte ' '
    je     .next

    cmp     [rdi], byte '?'
    sete    cl

    cmp     [rdi], byte 'z'
    jg      .next
    cmp     [rdi], byte 'a'
    setge   al
    or      dl, al

    cmp     [rdi], byte 'Z'
    jg      .next
    cmp     [rdi], byte 'A'
    setge   al
    or      dh, al

.next:
    inc    rdi
    jmp    .check_char

.exit:
    cmp    dh, dl
    setg   al
    lea    rcx, [rcx + 2 * rax]
    lea    rdi, RES
    mov    rax, [rdi + 8 * rcx]
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
