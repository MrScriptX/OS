[bits 32]
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f
COLS equ 80
LINES equ 25

; screen coordinate offsets
POS_X : db 0
POS_Y : db 0

%include "screen/cursor.asm"

print_string_pm:
    pusha
	call get_current_position

print_string_pm_loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je print_string_pm_done

	;cmp ax, '\n' 
	;je next_line

	mov [edx], ax

    inc ebx ; next char
	;add edx, 2
	call next_char
	call get_current_position

    jmp print_string_pm_loop

print_string_pm_done:
	mov bh, byte [POS_Y]
	mov bl, byte [POS_X]
	call move_cursor

    popa
    ret

next_char:
	inc byte [POS_X]
	cmp byte [POS_X], COLS
	je next_line
	ret

next_line:
	mov byte [POS_X], 0
	inc byte [POS_Y]
	ret

get_current_position:
	; compute the column byte
	xor eax, eax
	mov ecx, COLS * 2 ; number of bytes for columns
	mov al, byte [POS_Y] ; POS_Y in eax
	mul ecx ; multiply eax * ecx
	push eax ; save byte in eax

	;compute the lign byte
	mov al, byte [POS_X] ; put POS_X in eax
	mov cl, 2 ; multiply eax by 2(char is 2 bytes)
	mul cl

	pop ecx ; get back result from eax put it in ecx
	add eax, ecx ; add the computed X pos and computed Y pos(stor in eax)

	xor ecx, ecx ; clear ecx
	mov edx, VIDEO_MEMORY
	add edx, eax ; add final byte offsets to video address

	ret