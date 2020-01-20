#include "shell.h"

void execute_cmd(char* cmd)
{
    if(!strcmp(cmd, "SHUTDOWN"))
    {
        clear_screen();
        __asm__ __volatile__("hlt");
    }
    else
    {
        print("\nUnknown command\n");
    }
}