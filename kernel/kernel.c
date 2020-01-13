#include "../drivers/screen.h"
#include "../cpu/idt.h"
#include "../drivers/keyboard.h"

__main()
{
	isr_install();
	init_keyboard();

	//__asm__ __volatile__("int $2");
	//__asm__ __volatile__("int $32");

	clear_screen();
	print("Hello ! I am your computer. Don't worry, I am a good computer :)");
}