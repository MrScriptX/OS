print_hex:
    pusha
    mov cx, 4 ; set counter
    call char_loop

    mov bx, HEX_OUT
    call print_string

    popa
    ret

char_loop:
    dec cx ; decrease counter

    mov ax, dx ; copy number to print to dx
    shr dx, 4
    and ax, 0xf

    mov bx, HEX_OUT
    add bx, 2
    add bx, cx

    cmp ax, 0xa
    jl set_letter
    add al, 0x27
    jl set_letter

set_letter:
    add al, 0x30
    mov byte [bx], al

    cmp cx, 0
    jne char_loop
    ret
    

HEX_OUT: db '0x0000', 0