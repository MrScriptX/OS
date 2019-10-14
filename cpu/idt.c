#include "idt.h"

#include "../drivers/screen.h"

void set_idt_gate(int gate, unsigned int handler);
void set_idt();

void isr_install()
{
	set_idt_gate(0, (unsigned int)interrupt_handler_0);
	set_idt_gate(1, (unsigned int)interrupt_handler_1);
	set_idt_gate(2, (unsigned int)interrupt_handler_2);
	set_idt_gate(3, (unsigned int)interrupt_handler_3);
	set_idt_gate(4, (unsigned int)interrupt_handler_4);
	set_idt_gate(5, (unsigned int)interrupt_handler_5);
	set_idt_gate(6, (unsigned int)interrupt_handler_6);
	set_idt_gate(7, (unsigned int)interrupt_handler_7);
	set_idt_gate(8, (unsigned int)interrupt_handler_8);
	set_idt_gate(9, (unsigned int)interrupt_handler_9);
	set_idt_gate(10, (unsigned int)interrupt_handler_10);
	set_idt_gate(11, (unsigned int)interrupt_handler_11);
	set_idt_gate(12, (unsigned int)interrupt_handler_12);
	set_idt_gate(13, (unsigned int)interrupt_handler_13);
	set_idt_gate(14, (unsigned int)interrupt_handler_14);
	set_idt_gate(15, (unsigned int)interrupt_handler_15);
	set_idt_gate(16, (unsigned int)interrupt_handler_16);
	set_idt_gate(17, (unsigned int)interrupt_handler_17);
	set_idt_gate(18, (unsigned int)interrupt_handler_18);
	set_idt_gate(19, (unsigned int)interrupt_handler_19);
	set_idt_gate(20, (unsigned int)interrupt_handler_20);
	set_idt_gate(21, (unsigned int)interrupt_handler_21);
	set_idt_gate(22, (unsigned int)interrupt_handler_22);
	set_idt_gate(23, (unsigned int)interrupt_handler_23);
	set_idt_gate(24, (unsigned int)interrupt_handler_24);
	set_idt_gate(25, (unsigned int)interrupt_handler_25);
	set_idt_gate(26, (unsigned int)interrupt_handler_26);
	set_idt_gate(27, (unsigned int)interrupt_handler_27);
	set_idt_gate(28, (unsigned int)interrupt_handler_28);
	set_idt_gate(29, (unsigned int)interrupt_handler_29);
	set_idt_gate(30, (unsigned int)interrupt_handler_30);
	set_idt_gate(31, (unsigned int)interrupt_handler_31);

	set_idt();
}

void isr_handler(registers_t r)
{
	print("Interrupt received: ");
}

void set_idt_gate(int gate, unsigned int handler)
{
	idt[gate].low_offset = (unsigned short)(handler & 0xFFFF);
	idt[gate].sel = KERNEL_CS;
	idt[gate].always0 = 0;
	idt[gate].flags = 0x8E;
	idt[gate].high_offset = (unsigned short)((handler >> 16) & 0xFFFF);
}

void set_idt()
{
	idt_reg.base = (unsigned int)& idt;
	idt_reg.limit = IDT_ENTRIES * sizeof(idt_gate_t) - 1;

	__asm__ __volatile__("lidtl (%0)" : : "r" (&idt_reg));
}