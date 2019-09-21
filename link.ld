ENTRY(_start)

SECTIONS
{
	. = 0x1000;

	.text :
	{
		*(.text.bootstrap)
		*(.text*)
	}
	
	.rodata :
	{
		*(.rodata)
		*(.rdata*)
	}

	.data :
	{
		*(.data)
	}

	.bss :
	{
		*(COMMON)
		*(.bss)
	}
}