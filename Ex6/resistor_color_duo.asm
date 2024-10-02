section .text
global value
value:
    cld
    call   color_code
    mov    r8, rax

    mov    rsi, rdi
    call   color_code

    mov    r10, 10
    mul    r10
    add    rax, r8
    ret

color_code:
    xor    rax, rax
    lodsb
    or     al, 0x20
    
    cmp    al, 'r'
    je     .red

    cmp    al, 'o'
    je     .orange

    cmp    al, 'y'
    je     .yellow

    cmp    al, 'v'
    je     .violet

    cmp    al, 'w'
    je     .white

    mov    dl, al
    add    rsi, 2
    lodsb
    or     al, 0x20

    cmp    dl, 'g'
    je     .green_grey

.black_brown_blue:
    cmp    al, 'w'
    je     .brown

    cmp    al, 'e'
    je     .blue

.black:
    mov    al, 0
    ret

.brown:
    mov    al, 1
    ret

.red:
    mov    al, 2
    ret

.orange:
    mov    al, 3
    ret

.yellow:
    mov    al, 4
    ret

.green_grey:
    cmp    al, 'y'
    je    .grey

.green:
    mov    al, 5
    ret

.blue:
    mov    al, 6
    ret

.violet:
    mov    al, 7
    ret

.grey:
    mov    al, 8
    ret

.white:
    mov    al, 9
    ret
%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
