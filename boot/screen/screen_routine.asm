[bits 32]

pusha
mov edi, 0xb8000

;---------------------------;
;	Get current position	;
;---------------------------;

xor eax, eax ;clear eax
mov ecx, byte [_PosY]
mul ecx
push eax

mov al, byte [_PosX]
mov cl, 2
mul cl
pop ecx
add eax, ecx

xor ecx, ecx
add edi, eax

; new line char ?
cmp bl, 0x0a
je next_line

; print char
mov dl, bl
mov dh, CHAR_ATTRIB
mov word [edi], dx

;update pos
inc byte [_PosX] ;go to next char
cmp [_PosX], 25 ; end of line?
je next_line
jmp print_done

next_line:
	mov byte [_PosX], 0 ; go to col 0
	inc byte [_PoxY] ; next row

print_done:
	popa
	ret