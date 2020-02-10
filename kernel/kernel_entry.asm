global _start

[bits 32]
section .text.bootstrap

_start:
[extern __main]
call __main
jmp $