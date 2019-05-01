gdt_start:

gdt_null: ; null descriptor
    dd 0x0
    dd 0x0

gdt_code: ; code segment descriptor : base=0x0, end=0xfffff
    dw 0xffff ; limit (0-15 bits)
    dw 0x0 ; base (0-15 bits)
    db 0x0 ; base (16-23 bits)
    db 10011010b ; 1st flags : (present)1 (priviledge)00 (descriptor type)1 + type flags : (code)1 (conforming)0 (readable)1 (accessed)0
    db 11001111b ; 2nd flags : (granularity)1 (32-bit)1 (64-bit seg)0 (AVL)0 + limit
    db 0x0 ; base (bits 24-31)

gdt_data: ; data segment descriptor
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b ; 1st flags + type flags : (code)0 (expand down)0 (writable)1 (accessed)0
    db 11001111b
    db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start