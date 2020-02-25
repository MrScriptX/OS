#include "keyboard.h"

#define ENTER 0x1C
#define BACKSPACE 0x0E
#define MAX_CHAR 0x39

char *input_buffer = "";

char* ASCII_QWERTY[] = {(char*)'?', (char*)'?', (char*)'1', (char*)'2', (char*)'3', (char*)'4', (char*)'5',
    (char*)'6', (char*)'7', (char*)'8', (char*)'9', (char*)'0',
    (char*)'-', (char*)'+', (char*)'\b', (char*)'\t', (char*)'Q',
    (char*)'W', (char*)'E', (char*)'R', (char*)'T', (char*)'Y',
    (char*)'U', (char*)'I', (char*)'O', (char*)'P', (char*)'[',
    (char*)']', (char*)'\n', (char*)'?', (char*)'A', (char*)'S',
    (char*)'D', (char*)'F', (char*)'G', (char*)'H', (char*)'J',
    (char*)'K', (char*)'L', (char*)';', (char*)'\'', (char*)'`',
    (char*)'?', (char*)'\\', (char*)'Z', (char*)'X', (char*)'C',
    (char*)'V', (char*)'B', (char*)'N', (char*)'M', (char*)',',
    (char*)'.', (char*)'/', (char*)'?', (char*)'?', (char*)'?',
    (char*)' ', (char*)'?', (char*)'?'};

static void keyboard_callback(registers_t regs)
{
    unsigned char scancode = read_scan_code();
    /*char* hex;
    int_to_ascii(scancode, hex);
    print(hex);*/

    if(scancode > MAX_CHAR)//key up
    {
        //print("key up"); //log purpose
        return;
    }
    else if(scancode == ENTER)// press enter
    {
        execute_cmd(input_buffer);
        input_buffer[0] = '\0';
    }
    else if(scancode == BACKSPACE)//press backspace
    {
        subtract(input_buffer);
    }
    else
    {
        append(input_buffer, ASCII_QWERTY[scancode]);
        append(input_buffer, '\0');
    }

    print_letter(scancode);
}

void init_keyboard()
{
    register_interrupt_handler(IRQ1, keyboard_callback);
}

//can be better
void print_letter(unsigned char scancode)
{
    print(&ASCII_QWERTY[scancode]);
}