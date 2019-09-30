[extern interrupt_handler]

interrupt_common_handler:
	pusha
	
	call interrupt_handler

	popa
	add esp, 8
	sti
	iret

global interrupt_handler_0
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

#endregion 0

;isr1 - Debug Exception
interrupt_handler_1:
	cli
	push byte 0
	push byte 1
	jmp interrupt_common_handler

#endregion 1

;isr2 - Non maskable Interrupt Exception
interrupt_handler_2:
	cli
	push byte 0
	push byte 2
	jmp interrupt_common_handler

#endregion 2

;isr3 - Int 3 Exception
interrupt_handler_3:
	cli
	push byte 0
	push byte 3
	jmp interrupt_common_handler

#endregion 3

;isr4 - INTO Exception
interrupt_handler_4:
	cli
	push byte 0
	push byte 4
	jmp interrupt_common_handler
#endregion 4

;isr5 - Out of Bounds Exception
	cli
	push byte 0
	push byte 5
	jmp interrupt_common_handler
#endregion 5

;isr6 - Invalid Opcode Exception
	cli
	push byte 0
	push byte 6
	jmp interrupt_common_handler
#endregion 6

;isr7 - Coprocessor not available Exception
	cli
	push byte 0
	push byte 7
	jmp interrupt_common_handler
#endregion 7

;isr8 - Bouble Fault Exception(err code)
	cli
	push byte 8
	jmp interrupt_common_handler
#endregion 8

;isr9 - Coprocessor Segment Overrun Exception
	cli
	push byte 0
	push byte 9
	jmp interrupt_common_handler
#endregion 9

;isr10 - Bad TSS Exception(err code)
	cli
	push byte 10
	jmp interrupt_common_handler
#endregion 10

;isr11 - Segment Not Present Exception(err code)
	cli
	push byte 11
	jmp interrupt_common_handler
#endregion 11

;isr12 - Stack Fault Exception (err code)
	cli
	push byte 12
	jmp interrupt_common_handler
#endregion 12

;isr13 - General Protection Fault Exception (err code)
	cli
	push byte 13
	jmp interrupt_common_handler
#endregion 13

;isr14 - Page Fault Exception (err code)
	cli
	push byte 14
	jmp interrupt_common_handler
#endregion 14

;isr15 - Reserved Exception
	cli
	push byte 0
	push byte 15
	jmp interrupt_common_handler
#endregion 15

;isr16 - Floating Point Exception
	cli
	push byte 0
	push byte 16
	jmp interrupt_common_handler
#endregion 16

;isr17 - Alignement Check Exception
	cli
	push byte 0
	push byte 17
	jmp interrupt_common_handler
#endregion 17

;isr18 - Machine Check Exception
	cli
	push byte 0
	push byte 18
	jmp interrupt_common_handler
#endregion 18

;isr19 - Reserved
	cli
	push byte 0
	push byte 19
	jmp interrupt_common_handler
#endregion 19

;isr20 - Reserved
	cli
	push byte 0
	push byte 20
	jmp interrupt_common_handler
#endregion 20

;isr21 - Reserved
	cli
	push byte 0
	push byte 21
	jmp interrupt_common_handler
#endregion 21

;isr22 - Reserved
	cli
	push byte 0
	push byte 22
	jmp interrupt_common_handler
#endregion 22

;isr23 - Reserved
	cli
	push byte 0
	push byte 23
	jmp interrupt_common_handler
#endregion 23

;isr24 - Reserved
	cli
	push byte 0
	push byte 24
	jmp interrupt_common_handler
#endregion 24

;isr25 - Reserved
	cli
	push byte 0
	push byte 25
	jmp interrupt_common_handler
#endregion 25

;isr26 - Reserved
	cli
	push byte 0
	push byte 26
	jmp interrupt_common_handler
#endregion 26

;isr27 - Reserved
	cli
	push byte 0
	push byte 27
	jmp interrupt_common_handler
#endregion 27

;isr28 - Reserved
	cli
	push byte 0
	push byte 28
	jmp interrupt_common_handler
#endregion 28

;isr29 - Reserved
	cli
	push byte 0
	push byte 29
	jmp interrupt_common_handler
#endregion 29

;isr30 - Reserved
	cli
	push byte 0
	push byte 30
	jmp interrupt_common_handler
#endregion 30

;isr31 - Reserved
	cli
	push byte 0
	push byte 31
	jmp interrupt_common_handler
#endregion 31