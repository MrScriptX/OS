get_memory_size_64mb_x32:
    push ecx
    push edx
    xor ecx, ecx
    xor edx, edx
    mov ax, 0xE881
    int 0x15
    test ax, ax
    je mem_error
    cmp ah, 0x86
    je mem_error
    cmp ah, 0x80
    je mem_error
    jcxz use_ax
    mov ax, cx
    mov bx, dx
    ret

get_memory_size_64mb:
    push ecx
    push edx
    xor ecx, ecx
    xor edx, edx
    mov ax, 0xE801
    int 0x15
    jc mem_error
    cmp ah, 0x86
    je mem_error
    cmp ah, 0x80
    je mem_error
    jcxz use_ax
    mov ax, cx
    mov bx, dx
    ret

use_ax:
    pop edx
    pop ecx
    ret

mem_error_64:
    mov ax, -1
    mov bx, 0
    pop edx
    pop ecx
    ret