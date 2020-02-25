mmap_entry.baseAddress: RESQ 1
mmap_entry.length: RESQ 1
mmap_entry.type: RESD 1
mmap_entry.acqi_null: RESD 1

get_mmap:
    pusha
    xor ebx, ebx
    xor bp, bp
    mov edx, 'PAMS'
    mov eax, 0xE820
    mov ecx, 24
    int 0x15
    jc error_get_mmap
    cmp eax, 'PAMS'
    jne error_get_mmap
    test ebx, ebx
    je error_get_mmap
    jmp start_get_mmap

next_entry_get_mmap:
    mov edx, 'PAMS'
    mov ecx, 24
    mov eax, 0xE820
    int 0x15

start_get_mmap:
    jcxz skip_entry_get_mmap

no_text_get_mmap:
    mov ecx, [es:di + mmap_entry.length]
    test ecx, ecx
    jne good_entry_get_mmap
    mov ecx, [es:di + mmap_entry.length + 4]
    jecxz skip_entry_get_mmap

good_entry_get_mmap:
    inc bp
    add di, 24
    
skip_entry_get_mmap:
    cmp ebx, 0
    jne next_entry_get_mmap
    jmp done_get_mmap

error_get_mmap:
    stc

done_get_mmap:
    popa
    ret