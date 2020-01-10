#include "io.h"

#include "low_level.h"


#define PIC1_PORT_A 0x20
#define PIC2_PORT_A 0xA0

#define PIC1_START_INTERRUPT 0x20
#define PIC2_START_INTERRUPT 0x28
#define PIC2_END_INTERRUPT   PIC2_START_INTERRUPT + 7

#define PIC_ACK 0x20

void pic_ack(unsigned int interrupt)
{
	if (interrupt < PIC1_START_INTERRUPT || interrupt > PIC2_END_INTERRUPT)
	{
		return;
	}

	if (interrupt < PIC2_START_INTERRUPT)
	{
		port_byte_out(PIC1_PORT_A, PIC_ACK);
	}
	else
	{
		port_byte_out(PIC2_PORT_A, PIC_ACK);
	}
}

#define KBD_DATA_PORT 0x60

unsigned char read_scan_code()
{
	return port_byte_in(KBD_DATA_PORT);
}