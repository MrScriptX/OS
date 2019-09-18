#include "screen.h"

int get_screen_offset(int col, int row)
{
	int offset;

	port_byte_out(REG_SCREEN_CTRL, 14);
	port_byte_out(REG_SCREEN_DATA, (unsigned char)(offset >> 8));
	port_byte_out(REG_SCREEN_CTRL, 15);

	offset -= 2 * MAX_COLS;

	return offset;
}

int get_cursor()
{
	port_byte_out(REG_SCREEN_CTRL, 14);
	int offset = port_byte_in(REG_SCREEN_DATA) << 8;
	port_byte_out(REG_SCREEN_CTRL, 15);
	offset += port_byte_in(REG_SCREEN_DATA);

	return offset * 2;
}

void set_cursor(int offset)
{
	offset /= 2;
}

void print(char* msg)
{
	print_at(msg, -1, -1);
}

void print_at(char* msg, int col, int row)
{
	if (col >= 0 && row >= 0)
	{
		set_cursor(get_screen_offset(col, row));
	}

	int i = 0;
	while (msg[i] != 0)
	{
		print_char(msg[i++], col, row, WHITE_ON_BLACK);
	}
}

void print_char(char c, int col, int row, char attrib_byte)
{
	unsigned char* video_memory = (unsigned char*)VIDEO_ADDRESS;

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
		video_memory[offset] = c;
		video_memory[offset + 1] = attrib_byte;
	}

	offset += 2;
	offset = handle_scrolling(offset);
	set_cursor(offset);
}