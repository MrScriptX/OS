[extern __main]

global _start

[bits 32]
section .text.bootstrap

_start:

; enable paging
;mov eax, PAGE_DIRECTORY
;mov cr3, eax

mov cr0, eax
or  eax, 0x00001000
mov eax, cr0

call __main
jmp $