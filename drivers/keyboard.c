#include "keyboard.h"

#define ENTER 0x1C
#define BACKSPACE 0x0E
#define MAX_CHAR 0x39

char *input_buffer = "";

char* ASCII_QWERTY[] = {'?', '?', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    '0', '-', '+', '\b', '\t', 'Q', 'W', 'E', 'R', 'T',
    'Y', 'U', 'I', 'O', 'P', '[', ']', '\n', '?', 'A',
    'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', '\'',
    '`', '?', '\\', 'Z', 'X', 'C', 'V', 'B', 'N', 'M',
    ',', '.', '/', '?', '?', '?', ' ', '?', '?'};

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