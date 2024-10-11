section .text
global find
find:
    dec    esi
    xor    ecx, ecx

.loop:
    cmp    ecx, esi
    jg     .fail

    mov    eax, esi; calculating the middle
    sub    eax, ecx
    sar    eax, 1
    add    eax, ecx

    movsx  r8, eax
    cmp    dword [rdi + r8 * 4], edx
    je     .fin
    jge    .move_right
    lea    ecx, [rax + 1]
    jmp    .loop
    
.move_right:
    lea    esi, [rax - 1]
    jmp    .loop

.fail:
    or     eax, -1

.fin:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
