[bits 32]
clear_screen:
	pusha
	cld
	mov edi, VIDEO_MEMORY
	mov cx, 2000
	mov ah, WHITE_ON_BLACK
	mov al, ' '
	rep stosw

	mov byte [POS_X], 0
	mov byte [POS_Y], 0
	popa
	ret