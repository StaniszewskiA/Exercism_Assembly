%macro push_o 1
    cmp    cl, %1
    je     .push
%endmacro

%macro pop_c 1
    cmp    cl, %1
    je     .pop
%endmacro

section .text
global is_paired
is_paired:
    mov    r8, rsp
    xor    eax, eax
    xor    ecx, ecx
.loop:
    mov    cl, byte [rdi]
    inc    rdi
    test   cl, cl
    jz     .check
    push_o '{'
    push_o '['
    cmp    cl, '('
    je     .meh
    pop_c  ')'
    pop_c  ']'
    pop_c  '}'
    jmp    .loop
.meh:
    dec     ecx
.push:
    add    rcx, 2
    push   rcx
    jmp    .loop
.pop:
    pop    rsi    
    cmp    rcx, rsi
    je     .loop
    jmp    .restore
.check:
    cmp    r8, rsp
    sete   al
.restore:
    mov    rsp, r8
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
