#include "../drivers/screen.h"
#include "../cpu/idt.h"
#include "../drivers/keyboard.h"
#include "../drivers/timer.h"

extern __main() __asm__("__main");

__main()
{
	isr_install();

	__asm__ __volatile__("sti");

	init_timer(50);
	init_keyboard();

	//__asm__ __volatile__("int $2");
	//__asm__ __volatile__("int $3");

	clear_screen();
	print("\nHello ! I am your computer. Don't worry, I am a good computer :)\n\n");
}