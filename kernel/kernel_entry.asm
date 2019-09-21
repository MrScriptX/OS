global _start

[bits 32]
section .text.bootstrap

_start:
[extern ___main]
call ___main
jmp $