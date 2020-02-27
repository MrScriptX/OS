[extern __main]

global _start

[bits 32]
section .text.bootstrap

_start:
    call __main
    jmp $