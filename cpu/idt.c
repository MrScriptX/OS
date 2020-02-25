#include "idt.h"

#include "../drivers/screen.h"
#include "../drivers/low_level.h"


isr_t interrupt_handler[256];

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

	port_byte_out(0x20, 0x11);
	port_byte_out(0xA0, 0x11);
	port_byte_out(0x21, 0x20);
	port_byte_out(0xA1, 0x28);
	port_byte_out(0x21, 0x04);
	port_byte_out(0xA1, 0x02);
	port_byte_out(0x21, 0x01);
	port_byte_out(0xA1, 0x01);
	port_byte_out(0x21, 0x0);
	port_byte_out(0xA1, 0x0);

	set_idt_gate(32, (unsigned int)irq0);
	set_idt_gate(33, (unsigned int)irq1);
	set_idt_gate(34, (unsigned int)irq2);
	set_idt_gate(35, (unsigned int)irq3);
	set_idt_gate(36, (unsigned int)irq4);
	set_idt_gate(37, (unsigned int)irq5);
	set_idt_gate(38, (unsigned int)irq6);
	set_idt_gate(39, (unsigned int)irq7);
	set_idt_gate(40, (unsigned int)irq8);
	set_idt_gate(41, (unsigned int)irq9);
	set_idt_gate(42, (unsigned int)irq10);
	set_idt_gate(43, (unsigned int)irq11);
	set_idt_gate(44, (unsigned int)irq12);
	set_idt_gate(45, (unsigned int)irq13);
	set_idt_gate(46, (unsigned int)irq14);
	set_idt_gate(47, (unsigned int)irq15);

	set_idt();
}

extern void isr_handler() __asm__("_isr_handler");
void isr_handler(registers_t r)
{
	print("Interrupt received: ");
	print((char*)r.err_code);
	print("\n");
}

extern void irq_handler() __asm__("_irq_handler");
void irq_handler(registers_t r)
{
	if (r.int_no >= 40)
	{
		port_byte_out(0xA0, 0x20);
	}

	port_byte_out(0x20, 0x20);

	if (interrupt_handler[r.int_no] != 0)
	{
		isr_t handler = interrupt_handler[r.int_no];
		handler(r);
	}
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

void register_interrupt_handler(unsigned char n, isr_t handler)
{
	interrupt_handler[n] = handler;
}