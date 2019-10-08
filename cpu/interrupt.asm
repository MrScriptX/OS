[extern interrupt_handler]

interrupt_common_handler:
	pusha
	mov ax, ds
	push eax
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	call interrupt_handler

	pop eax
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	popa
	add esp, 8
	sti
	iret

global isr0
global interrupt_handler_1
global interrupt_handler_2
global interrupt_handler_3
global interrupt_handler_4
global interrupt_handler_5
global interrupt_handler_6
global interrupt_handler_7
global interrupt_handler_8
global interrupt_handler_9
global interrupt_handler_10
global interrupt_handler_11
global interrupt_handler_12
global interrupt_handler_13
global interrupt_handler_14
global interrupt_handler_15
global interrupt_handler_16
global interrupt_handler_17
global interrupt_handler_18
global interrupt_handler_19
global interrupt_handler_20
global interrupt_handler_21
global interrupt_handler_22
global interrupt_handler_23
global interrupt_handler_24
global interrupt_handler_25
global interrupt_handler_26
global interrupt_handler_27
global interrupt_handler_28
global interrupt_handler_29
global interrupt_handler_30
global interrupt_handler_31

;isr0 - Divide by Zero Exception
interrupt_handler_0:
	cli
	push byte 0
	push byte 0
	jmp interrupt_common_handler

;isr1 - Debug Exception
interrupt_handler_1:
	cli
	push byte 0
	push byte 1
	jmp interrupt_common_handler

;isr2 - Non maskable Interrupt Exception
interrupt_handler_2:
	cli
	push byte 0
	push byte 2
	jmp interrupt_common_handler

;isr3 - Int 3 Exception
interrupt_handler_3:
	cli
	push byte 0
	push byte 3
	jmp interrupt_common_handler

;isr4 - INTO Exception
interrupt_handler_4:
	cli
	push byte 0
	push byte 4
	jmp interrupt_common_handler

;isr5 - Out of Bounds Exception
interrupt_handler_5:
	cli
	push byte 0
	push byte 5
	jmp interrupt_common_handler

;isr6 - Invalid Opcode Exception
interrupt_handler_6:
	cli
	push byte 0
	push byte 6
	jmp interrupt_common_handler

;isr7 - Coprocessor not available Exception
interrupt_handler_7:
	cli
	push byte 0
	push byte 7
	jmp interrupt_common_handler

;isr8 - Bouble Fault Exception(err code)
interrupt_handler_8:
	cli
	push byte 8
	jmp interrupt_common_handler

;isr9 - Coprocessor Segment Overrun Exception
interrupt_handler_9:
	cli
	push byte 0
	push byte 9
	jmp interrupt_common_handler

;isr10 - Bad TSS Exception(err code)
interrupt_handler_10:
	cli
	push byte 10
	jmp interrupt_common_handler

;isr11 - Segment Not Present Exception(err code)
interrupt_handler_11:
	cli
	push byte 11
	jmp interrupt_common_handler

;isr12 - Stack Fault Exception (err code)
interrupt_handler_12:
	cli
	push byte 12
	jmp interrupt_common_handler

;isr13 - General Protection Fault Exception (err code)
interrupt_handler_13:
	cli
	push byte 13
	jmp interrupt_common_handler

;isr14 - Page Fault Exception (err code)
interrupt_handler_14:
	cli
	push byte 14
	jmp interrupt_common_handler

;isr15 - Reserved Exception
interrupt_handler_15:
	cli
	push byte 0
	push byte 15
	jmp interrupt_common_handler

;isr16 - Floating Point Exception
interrupt_handler_16:
	cli
	push byte 0
	push byte 16
	jmp interrupt_common_handler

;isr17 - Alignement Check Exception
interrupt_handler_17:
	cli
	push byte 0
	push byte 17
	jmp interrupt_common_handler

;isr18 - Machine Check Exception
interrupt_handler_18:
	cli
	push byte 0
	push byte 18
	jmp interrupt_common_handler

;isr19 - Reserved
interrupt_handler_19:
	cli
	push byte 0
	push byte 19
	jmp interrupt_common_handler

;isr20 - Reserved
interrupt_handler_20:
	cli
	push byte 0
	push byte 20
	jmp interrupt_common_handler

;isr21 - Reserved
interrupt_handler_21:
	cli
	push byte 0
	push byte 21
	jmp interrupt_common_handler

;isr22 - Reserved
interrupt_handler_22:
	cli
	push byte 0
	push byte 22
	jmp interrupt_common_handler

;isr23 - Reserved
interrupt_handler_23:
	cli
	push byte 0
	push byte 23
	jmp interrupt_common_handler

;isr24 - Reserved
interrupt_handler_24:
	cli
	push byte 0
	push byte 24
	jmp interrupt_common_handler

;isr25 - Reserved
interrupt_handler_25:
	cli
	push byte 0
	push byte 25
	jmp interrupt_common_handler

;isr26 - Reserved
interrupt_handler_26:
	cli
	push byte 0
	push byte 26
	jmp interrupt_common_handler

;isr27 - Reserved
interrupt_handler_27:
	cli
	push byte 0
	push byte 27
	jmp interrupt_common_handler

;isr28 - Reserved
interrupt_handler_28:
	cli
	push byte 0
	push byte 28
	jmp interrupt_common_handler

;isr29 - Reserved
interrupt_handler_29:
	cli
	push byte 0
	push byte 29
	jmp interrupt_common_handler

;isr30 - Reserved
interrupt_handler_30:
	cli
	push byte 0
	push byte 30
	jmp interrupt_common_handler

;isr31 - Reserved
interrupt_handler_31:
	cli
	push byte 0
	push byte 31
	jmp interrupt_common_handler