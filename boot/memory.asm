get_memory_size:
    int 0x12
    jc mem_error
    test ax, ax
    je mem_error
    cmp ah, 0x86
    je mem_error
    cmp ah, 0x80
    je mem_error
    ret

get_ext_memory_size:
    mov ax, 0x88
    int 0x15
    test ax, ax
    je mem_error
    cmp ah, 0x86
    je mem_error
    cmp ah, 0x80
    je mem_error
    ret

get_memory_size_64mb_x32:
    mov eax, 0xE881
    int 0x15
    test eax, eax
    je mem_error
    cmp ah, 0x86
    je mem_error
    cmp ah, 0x80
    je mem_error
    ret

mem_error:
    mov ax, -1
    ret