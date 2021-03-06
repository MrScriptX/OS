#include "screen.h"
#include "low_level.h"

int get_offset_row(int);
int get_screen_offset(int, int);
int get_cursor();
void set_cursor(int offset);
int handle_scrolling(int);
void memory_copy(char* src, char* dst, int no_bytes);
void print_char(char c, int col, int row, char attrib_byte);


//print functions
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
		video_memory[offset] = ' ';
		video_memory[offset + 1] = attrib_byte;

		int rows = offset / (2 * MAX_COLS);
		offset = get_screen_offset(0, rows + 1);
	}
	else if(c == '\b')
	{
		do
		{
			offset -= 2;//select previous char
		} while (video_memory[offset] == '\0');

		video_memory[offset] = '\0';
		video_memory[offset + 1] = WHITE_ON_BLACK;
	}
	else if(c == '\t')
	{
		int i;
		for(i = 0; i < 4; i++)//make 4 spaces
		{
			video_memory[offset] = ' ';
			video_memory[offset + 1] = attrib_byte;
			offset += 2;
		}
	}
	else
	{
		video_memory[offset] = c;
		video_memory[offset + 1] = attrib_byte;
		offset += 2;//next char
	}

	offset = handle_scrolling(offset);
	set_cursor(offset);
}

void clear_screen() 
{
	int screen_size = MAX_COLS * MAX_ROWS;
	unsigned char* video_memory = (unsigned char*)VIDEO_ADDRESS;

	int i;
	for (i = 0; i < screen_size; i++) {
		video_memory[i * 2] = '\0';
		video_memory[i * 2 + 1] = WHITE_ON_BLACK;
	}

	set_cursor(get_screen_offset(0, 0));
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

	port_byte_out(REG_SCREEN_CTRL, 14);
	port_byte_out(REG_SCREEN_DATA, (unsigned char)(offset >> 8));
	port_byte_out(REG_SCREEN_CTRL, 15);
	port_byte_out(REG_SCREEN_DATA, (unsigned char)(offset & 0xff));
}

int get_screen_offset(int col, int row)
{
	return 2 * (row * MAX_COLS + col);
}

int get_offset_row(int offset)
{
	return offset / (2 * MAX_COLS);
}