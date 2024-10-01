default rel

section .data
black:    db "black", 0
brown:    db "brown", 0
red:      db "red", 0
orange:   db "orange", 0
yellow:   db "yellow", 0
green:    db "green", 0
blue:     db "blue", 0
violet:   db "violet", 0
grey:     db "grey", 0
white:    db "white", 0

array: dq black, brown, red, orange, yellow, green, blue, violet, grey, white, 0

section .text
global color_code
color_code:
    cld
    xor    rax, rax
    mov    rsi, rdi
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
    je     .grey

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

global colors
colors:
    lea rax, [array]
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
