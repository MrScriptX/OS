#include "screen.h"
#include "low_level.h"

int get_screen_offset(int, int);
int get_cursor();
void set_cursor(int offset);
void print_char(char c, int col, int row, char attrib_byte);
void memory_copy(char* src, char* dst, int no_bytes);


void print_at(char* msg, int col, int row)
{
	char* video_memory = (char*)VIDEO_ADDRESS;
	*video_memory = 'X';
	/*if (col >= 0 && row >= 0)
	{
		set_cursor(get_screen_offset(col, row));
	}

	int i = 0;
	while (msg[i] != 0)
	{
		print_char(msg[i++], col, row, WHITE_ON_BLACK);
	}*/
}

void print(char* msg)
{
	//print_at(msg, -1, -1);
}

int get_screen_offset(int col, int row)
{
	return 2 * (row * MAX_COLS + col);
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

void memory_copy(char* src, char* dst, int no_bytes)
{
	int i;
	for (i = 0; i < no_bytes; i++)
	{
		*(dst + i) = *(src + i);
	}
}

int handle_scrolling(int cursor_offset)
{
	if (cursor_offset < MAX_ROWS * MAX_COLS * 2)
	{
		return cursor_offset;
	}

	int i;
	for (i = 0; i < MAX_ROWS; i++)
	{
		memory_copy(get_screen_offset(0, i) + VIDEO_ADDRESS, get_screen_offset(0, i - 1) + VIDEO_ADDRESS, MAX_COLS * 2);
	}

	char* last_line = get_screen_offset(0, MAX_ROWS - 1) + VIDEO_ADDRESS;
	for (i = 0; i < MAX_COLS * 2; i++)
	{
		last_line[i] = 0;
	}

	cursor_offset -= 2 * MAX_COLS;

	return cursor_offset;
}