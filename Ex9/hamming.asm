section .text
global distance
distance:
    xor    eax, eax

.loop:
    mov    cl, [rdi]
    mov    ch, [rsi]
    
    test   cl, ch
    jz     .done

    inc    rdi
    inc    rsi
    lea    edx, [rax + 1]
    cmp    cl, ch
    cmovne eax, edx
    jmp    .loop

.done:
    mov    edx, -1
    or     cl, ch
    cmovnz eax, edx
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
