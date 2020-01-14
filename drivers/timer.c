#include "timer.h"

#include "../cpu/idt.h"
#include "../drivers/screen.h"
#include "../drivers/low_level.h"

unsigned int tick = 0;

static void timer_callback(registers_t regs)
{
    tick++;

    char* nb;
    int_to_ascii(tick, nb);

    /*print("Tick: ");
    print(nb);
    print("\n");*/
}

void init_timer(unsigned int freq)
{
    register_interrupt_handler(IRQ0, timer_callback);

    unsigned int divisor = 1193180 / freq;

    unsigned char low = (unsigned char)(divisor & 0xFF);
    unsigned char high = (unsigned char)((divisor >> 8) & 0xFF);

    port_byte_out(0x43, 0x36);
    port_byte_out(0x40, low);
    port_byte_out(0x40, high);
}