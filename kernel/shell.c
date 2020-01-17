#include "shell.h"

void execute_cmd(char* cmd)
{
    if(cmd == "SHUTDOWN")
    {
        __asm__ __volatile__("hlt");
    }
    else
    {
        print("\nUnknown command\n");
    }
}