#include "screen.h"

void print_char(char c, int col, int row, char attrib_byte)
{
	unsigned char* vidmem = (unsigned char*)VIDEO_ADDRESS;

	if (!attrib_byte)
	{
		attrib_byte = WHITE_ON_BLACK;
	}

	int offset;
	if (col >= 0 && row >= 0)
	{
		offset = get_screen_offset(col, row);
	}
	else
	{
		offset = get_cursor();
	}

	if (c == '\n')
	{
		int rows = offset / (2 * MAX_COLS);
		offset = get_screen_offset(79, rows);
	}
	else
	{
		vidmem[offset] = c;
		vidmem[offset + 1] = attrib_byte;
	}

	offset += 2;
	offset = handle_scrolling(offset);

	set_cursor(offset);
}