#ifndef _IO_H
#define _IO_H

void pic_ack(unsigned int);
unsigned char read_scan_code();
int readline(char *newbuffer, int size);

#endif