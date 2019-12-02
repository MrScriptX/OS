section .text
[extern _isr_handler]
[extern _irq_handler]

interrupt_common_handler:
	pusha
	mov ax, ds
	push eax
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	call _isr_handler

	pop eax
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	popa
	add esp, 8
	sti
	iret

global _interrupt_handler_0
global _interrupt_handler_1
global _interrupt_handler_2
global _interrupt_handler_3
global _interrupt_handler_4
global _interrupt_handler_5
global _interrupt_handler_6
global _interrupt_handler_7
global _interrupt_handler_8
global _interrupt_handler_9
global _interrupt_handler_10
global _interrupt_handler_11
global _interrupt_handler_12
global _interrupt_handler_13
global _interrupt_handler_14
global _interrupt_handler_15
global _interrupt_handler_16
global _interrupt_handler_17
global _interrupt_handler_18
global _interrupt_handler_19
global _interrupt_handler_20
global _interrupt_handler_21
global _interrupt_handler_22
global _interrupt_handler_23
global _interrupt_handler_24
global _interrupt_handler_25
global _interrupt_handler_26
global _interrupt_handler_27
global _interrupt_handler_28
global _interrupt_handler_29
global _interrupt_handler_30
global _interrupt_handler_31


;isr0 - Divide by Zero Exception
_interrupt_handler_0:
	cli
	push byte 0
	push byte 0
	jmp interrupt_common_handler

;isr1 - Debug Exception
_interrupt_handler_1:
	cli
	push byte 0
	push byte 1
	jmp interrupt_common_handler

;isr2 - Non maskable Interrupt Exception
_interrupt_handler_2:
	cli
	push byte 0
	push byte 2
	jmp interrupt_common_handler

;isr3 - Int 3 Exception
_interrupt_handler_3:
	cli
	push byte 0
	push byte 3
	jmp interrupt_common_handler

;isr4 - INTO Exception
_interrupt_handler_4:
	cli
	push byte 0
	push byte 4
	jmp interrupt_common_handler

;isr5 - Out of Bounds Exception
_interrupt_handler_5:
	cli
	push byte 0
	push byte 5
	jmp interrupt_common_handler

;isr6 - Invalid Opcode Exception
_interrupt_handler_6:
	cli
	push byte 0
	push byte 6
	jmp interrupt_common_handler

;isr7 - Coprocessor not available Exception
_interrupt_handler_7:
	cli
	push byte 0
	push byte 7
	jmp interrupt_common_handler

;isr8 - Bouble Fault Exception(err code)
_interrupt_handler_8:
	cli
	push byte 8
	jmp interrupt_common_handler

;isr9 - Coprocessor Segment Overrun Exception
_interrupt_handler_9:
	cli
	push byte 0
	push byte 9
	jmp interrupt_common_handler

;isr10 - Bad TSS Exception(err code)
_interrupt_handler_10:
	cli
	push byte 10
	jmp interrupt_common_handler

;isr11 - Segment Not Present Exception(err code)
_interrupt_handler_11:
	cli
	push byte 11
	jmp interrupt_common_handler

;isr12 - Stack Fault Exception (err code)
_interrupt_handler_12:
	cli
	push byte 12
	jmp interrupt_common_handler

;isr13 - General Protection Fault Exception (err code)
_interrupt_handler_13:
	cli
	push byte 13
	jmp interrupt_common_handler

;isr14 - Page Fault Exception (err code)
_interrupt_handler_14:
	cli
	push byte 14
	jmp interrupt_common_handler

;isr15 - Reserved Exception
_interrupt_handler_15:
	cli
	push byte 0
	push byte 15
	jmp interrupt_common_handler

;isr16 - Floating Point Exception
_interrupt_handler_16:
	cli
	push byte 0
	push byte 16
	jmp interrupt_common_handler

;isr17 - Alignement Check Exception
_interrupt_handler_17:
	cli
	push byte 0
	push byte 17
	jmp interrupt_common_handler

;isr18 - Machine Check Exception
_interrupt_handler_18:
	cli
	push byte 0
	push byte 18
	jmp interrupt_common_handler

;isr19 - Reserved
_interrupt_handler_19:
	cli
	push byte 0
	push byte 19
	jmp interrupt_common_handler

;isr20 - Reserved
_interrupt_handler_20:
	cli
	push byte 0
	push byte 20
	jmp interrupt_common_handler

;isr21 - Reserved
_interrupt_handler_21:
	cli
	push byte 0
	push byte 21
	jmp interrupt_common_handler

;isr22 - Reserved
_interrupt_handler_22:
	cli
	push byte 0
	push byte 22
	jmp interrupt_common_handler

;isr23 - Reserved
_interrupt_handler_23:
	cli
	push byte 0
	push byte 23
	jmp interrupt_common_handler

;isr24 - Reserved
_interrupt_handler_24:
	cli
	push byte 0
	push byte 24
	jmp interrupt_common_handler

;isr25 - Reserved
_interrupt_handler_25:
	cli
	push byte 0
	push byte 25
	jmp interrupt_common_handler

;isr26 - Reserved
_interrupt_handler_26:
	cli
	push byte 0
	push byte 26
	jmp interrupt_common_handler

;isr27 - Reserved
_interrupt_handler_27:
	cli
	push byte 0
	push byte 27
	jmp interrupt_common_handler

;isr28 - Reserved
_interrupt_handler_28:
	cli
	push byte 0
	push byte 28
	jmp interrupt_common_handler

;isr29 - Reserved
_interrupt_handler_29:
	cli
	push byte 0
	push byte 29
	jmp interrupt_common_handler

;isr30 - Reserved
_interrupt_handler_30:
	cli
	push byte 0
	push byte 30
	jmp interrupt_common_handler

;isr31 - Reserved
_interrupt_handler_31:
	cli
	push byte 0
	push byte 31
	jmp interrupt_common_handler




irq_common_handler:
	pusha
	mov ax, ds
	push eax
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	call _irq_handler

	pop ebx
	mov ds, bx
	mov es, bx
	mov fs, bx
	mov gs, bx
	popa
	add esp, 8
	sti
	iret

global _irq0
global _irq1
global _irq2
global _irq3
global _irq4
global _irq5
global _irq6
global _irq7
global _irq8
global _irq9
global _irq10
global _irq11
global _irq12
global _irq13
global _irq14
global _irq15

_irq0:
	cli
	push byte 0
	push byte 32
	jmp irq_common_handler

_irq1:
	cli
	push byte 1
	push byte 33
	jmp irq_common_handler

_irq2:
	cli
	push byte 2
	push byte 34
	jmp irq_common_handler

_irq3:
	cli
	push byte 3
	push byte 35
	jmp irq_common_handler

_irq4:
	cli
	push byte 4
	push byte 36
	jmp irq_common_handler

_irq5:
	cli
	push byte 5
	push byte 37
	jmp irq_common_handler

_irq6:
	cli
	push byte 6
	push byte 38
	jmp irq_common_handler

_irq7:
	cli
	push byte 7
	push byte 39
	jmp irq_common_handler

_irq8:
	cli
	push byte 8
	push byte 40
	jmp irq_common_handler

_irq9:
	cli
	push byte 9
	push byte 41
	jmp irq_common_handler

_irq10:
	cli
	push byte 10
	push byte 42
	jmp irq_common_handler

_irq11:
	cli
	push byte 11
	push byte 43
	jmp irq_common_handler

_irq12:
	cli
	push byte 12
	push byte 44
	jmp irq_common_handler

_irq13:
	cli
	push byte 13
	push byte 45
	jmp irq_common_handler

_irq14:
	cli
	push byte 14
	push byte 46
	jmp irq_common_handler

_irq15:
	cli
	push byte 15
	push byte 47
	jmp irq_common_handler