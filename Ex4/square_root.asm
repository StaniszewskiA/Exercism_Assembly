section .text
global square_root
square_root:
    mov    rax, -1
    mov    rcx, 0
    mov    rsi, rdi

.loop:
    cmp    rcx, rsi
    jg     .exit
    lea    rax, [rsi + rcx]
    shr    rax, 1
    mov    rdx, rax
    imul   rdx, rdx
    cmp    rdx, rdi
    jl     .inc_lower_bound
    jg     .dec_lower_bound

.exit:
    ret

.inc_lower_bound:
    lea    rcx, [rax + 1]
    jmp    .loop

.dec_lower_bound:
    lea    rsi, [rax - 1]
    jmp    .loop

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
