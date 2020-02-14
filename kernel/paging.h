#ifndef PAGING_H
#define PAGING_H

extern void load_page_directory(unsigned int*) __asm__("load_page_directory");
extern void enable_paging() __asm__("enable_paging");

#endif // !PAGING_H