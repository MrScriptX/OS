[org 0x7c00]
KERNEL_OFFSET equ 0x1000

	mov [BOOT_DRIVE], dl

    mov bp, 0x9000 ; set the stack
    mov sp, bp

	call load_kernel
    call switch_to_pm

    jmp $

%include "load-gdt.asm"
%include "disk-load.asm"
%include "print-string.asm"
%include "print-string-pm.asm"
%include "gdt.asm"
%include "screen/clear_screen.asm"

[bits 16]
load_kernel:
	mov bx, KERNEL_OFFSET
	mov dh, 15
	mov dl, [BOOT_DRIVE]
	call disk_load
	ret ; kernel loaded

[bits 32]
BEGIN_PM:
	call clear_screen
    mov ebx, MSG_PROT_MODE
    call print_string_pm
	call KERNEL_OFFSET
    jmp $

BOOT_DRIVE: db 0
MSG_PROT_MODE: db "32-bits PROTECT MODE enable", 0

times 510-($-$$) db 0
dw 0xaa55