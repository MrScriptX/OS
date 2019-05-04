[org 0x7c00]
KERNEL_OFFSET equ 0x1000

	mov [BOOT_DRIVE], dl

    mov bp, 0x9000 ; set the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print_string

	call load_kernel

    call switch_to_pm

    jmp $

%include "load-gdt.asm"
%include "disk-load.asm"
%include "print-string.asm"
%include "print-string-pm.asm"
%include "gdt.asm"

[bits 16]
load_kernel:
	mov bx, MSG_LOAD_KERNEL
	call print_string

	mov bx, KERNEL_OFFSET
	mov dh, 15
	mov dl, [BOOT_DRIVE]
	call disk_load

	mov bx, MSG_KERNEL_LOADED
	call print_string

	ret

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm
	call KERNEL_OFFSET
    jmp $

BOOT_DRIVE: db 0
MSG_LOAD_KERNEL: db "Kernel is loading", 0
MSG_KERNEL_LOADED: db "Kernel is loaded", 0
MSG_REAL_MODE: db "16-bits REAL MODE enable", 0
MSG_PROT_MODE: db "32-bits PROTECT MODE enable", 0

times 510-($-$$) db 0
dw 0xaa55