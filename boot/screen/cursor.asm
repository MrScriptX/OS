[bits 32]
CURSOR_INDEX equ 0x3d5
CURSOR_DATA equ 0x3d4

move_cursor:
	pusha

	xor eax, eax
	mov ecx, COLS
	mov al, bh ; bh  = pos y
	mul ecx
	add al, bl ; bl = pos x
	mov ebx, eax

	; set low byte to vga register
	mov al, 0x0f
	mov dx, CURSOR_DATA
	out dx, al

	mov al, bl
	mov dx, CURSOR_INDEX
	out dx, al

	; set high byte to vga register
	xor eax, eax

	mov al, 0x0e
	mov dx, CURSOR_DATA
	out dx, al

	mov al, bh
	mov dx, CURSOR_INDEX
	out dx, al

	popa
	ret