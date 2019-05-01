disk_load:
    push dx

    mov ah, 0x02 ; BIOS read sector routine
    mov al, dh
    mov ch, 0x00 ; select cylinder 0
    mov dh, 0x00 ; select head 0
    mov cl, 0x02 ; start reading second sector

    int 0x13 ; BIOS interrupt

    jc disk_error ; error jump

    pop dx
    cmp dh, al
    jne disk_error
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    jmp $

DISK_ERROR_MSG: db "Disk read error !", 0