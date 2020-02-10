#ifndef IDT_H
#define IDT_H

extern void interrupt_handler_0() __asm__("_interrupt_handler_0");
extern void interrupt_handler_1() __asm__("_interrupt_handler_1");
extern void interrupt_handler_2() __asm__("_interrupt_handler_2");
extern void interrupt_handler_3() __asm__("_interrupt_handler_3");
extern void interrupt_handler_4() __asm__("_interrupt_handler_4");
extern void interrupt_handler_5() __asm__("_interrupt_handler_5");
extern void interrupt_handler_6() __asm__("_interrupt_handler_6");
extern void interrupt_handler_7() __asm__("_interrupt_handler_7");
extern void interrupt_handler_8() __asm__("_interrupt_handler_8");
extern void interrupt_handler_9() __asm__("_interrupt_handler_9");
extern void interrupt_handler_10() __asm__("_interrupt_handler_10");
extern void interrupt_handler_11() __asm__("_interrupt_handler_11");
extern void interrupt_handler_12() __asm__("_interrupt_handler_12");
extern void interrupt_handler_13() __asm__("_interrupt_handler_13");
extern void interrupt_handler_14() __asm__("_interrupt_handler_14");
extern void interrupt_handler_15() __asm__("_interrupt_handler_15");
extern void interrupt_handler_16() __asm__("_interrupt_handler_16");
extern void interrupt_handler_17() __asm__("_interrupt_handler_17");
extern void interrupt_handler_18() __asm__("_interrupt_handler_18");
extern void interrupt_handler_19() __asm__("_interrupt_handler_19");
extern void interrupt_handler_20() __asm__("_interrupt_handler_20");
extern void interrupt_handler_21() __asm__("_interrupt_handler_21");
extern void interrupt_handler_22() __asm__("_interrupt_handler_22");
extern void interrupt_handler_23() __asm__("_interrupt_handler_23");
extern void interrupt_handler_24() __asm__("_interrupt_handler_24");
extern void interrupt_handler_25() __asm__("_interrupt_handler_25");
extern void interrupt_handler_26() __asm__("_interrupt_handler_26");
extern void interrupt_handler_27() __asm__("_interrupt_handler_27");
extern void interrupt_handler_28() __asm__("_interrupt_handler_28");
extern void interrupt_handler_29() __asm__("_interrupt_handler_29");
extern void interrupt_handler_30() __asm__("_interrupt_handler_30");
extern void interrupt_handler_31() __asm__("_interrupt_handler_31");

extern void irq0() __asm__("_irq0");
extern void irq1() __asm__("_irq1");
extern void irq2() __asm__("_irq2");
extern void irq3() __asm__("_irq3");
extern void irq4() __asm__("_irq4");
extern void irq5() __asm__("_irq5");
extern void irq6() __asm__("_irq6");
extern void irq7() __asm__("_irq7");
extern void irq8() __asm__("_irq8");
extern void irq9() __asm__("_irq9");
extern void irq10() __asm__("_irq10");
extern void irq11() __asm__("_irq11");
extern void irq12() __asm__("_irq12");
extern void irq13() __asm__("_irq13");
extern void irq14() __asm__("_irq14");
extern void irq15() __asm__("_irq15");

#define IRQ0 32
#define IRQ1 33


#define KERNEL_CS 0x08

typedef struct
{
	unsigned short low_offset;
	unsigned short sel;
	unsigned char always0;
	unsigned char flags;
	unsigned short high_offset;
} __attribute__((packed))idt_gate_t;

typedef struct
{
	unsigned short limit;
	unsigned int base;
} __attribute__((packed))idt_register_t;

typedef struct
{
	unsigned int ds;
	unsigned int edi, esi, ebp, esp, ebx, edx, ecx, eax;
	unsigned int int_no, err_code;
	unsigned int eip, cs, eflags, useresp, ss;
} registers_t;

#define IDT_ENTRIES 256
idt_gate_t idt[IDT_ENTRIES];
idt_register_t idt_reg;

typedef void (*isr_t)(registers_t);
void register_interrupt_handler(unsigned char n, isr_t handler);

void isr_install();
void isr_handler(registers_t r);


#endif // !IDT_H
