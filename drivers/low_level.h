#ifndef _LOW_LEVEL_H
#define _LOW_LEVEL_H


static inline unsigned char port_byte_in(unsigned short port)
{
	unsigned short result;
	__asm__("in %%dx, %%al" : "=a"(result) : "d"(port));
	return result;
}

static inline void port_byte_out(unsigned short port, unsigned char data)
{
	__asm__("out %%al, %%dx" : : "a"(data), "d"(port));
}

static inline unsigned short port_word_in(unsigned short port)
{
	unsigned short result;
	__asm__("in %%dx, %%ax" : "=a"(result) : "d"(port));
	return result;
}

static inline void port_word_out(unsigned short port, unsigned short data)
{
	__asm__("out %%ax, %%dx" : : "a"(data), "d"(port));
}

#endif // !_LOW_LEVEL_H