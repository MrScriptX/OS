#ifndef _SCREEN_H
#define _SCREEN_H

#include "../kernel/low_level.h"

#define VIDEO_ADDRESS 0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80

//color scheme
#define WHITE_ON_BLACK 0x0f

//screen I/O ports
#define REG_SCREEN_CTRL 0x3D4
#define REG_SCREEN_DATA 0x3D5

void print_char(char c, int col, int row, char attrib_byte);

#endif // !_SCREEN_H