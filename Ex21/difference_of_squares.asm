section .text
global square_of_sum
square_of_sum:
    mov    eax, edi
    add    eax, 1
    mul    edi
    sar    eax, 1
    mul    eax
    ret

global sum_of_squares
sum_of_squares:
    mov    eax, edi
    add    eax, 1
    mul    edi
    mov    esi, eax
    sal    eax, 1
    mul    edi
    add    eax, esi
    mov    ecx, 6
    idiv   ecx
    ret

global difference_of_squares
difference_of_squares:
    call   sum_of_squares
    mov    esi, eax     
    call   square_of_sum
    sub    eax, esi
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
