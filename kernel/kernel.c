#include "../drivers/screen.h"
#include "../cpu/idt.h"

__main()
{
	isr_install();

	//__asm__ __volatile__("int $2");
	//__asm__ __volatile__("int $3");

	clear_screen();
	print("Hello ! I am your computer. Don't worry, I am a good computer :)");
}