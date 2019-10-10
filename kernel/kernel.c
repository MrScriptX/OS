#include "../drivers/screen.h"
#include "interrupts.h"

__main()
{
	interrupt_0();

	clear_screen();
	print("Hello ! I am your computer. Don't worry, I am a good computer :)");
}