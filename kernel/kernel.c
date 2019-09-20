#include "../drivers/screen.h"

__main()
{
	char* video_memory = (char*)VIDEO_ADDRESS;
	*video_memory = 'X';

	print("Hello");
}