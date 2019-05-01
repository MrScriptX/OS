C_SOURCES = $(wildcard kernel/*.c)
HEADERDS = $(wildcard kernel/*.h)

OBJ = ${C_SOURCES:.c=.o}

all: os_image.img

run: all
	"C:\Program Files\qemu\qemu-system-x86_64" -drive format=raw,file=os_image.img,index=0,if=floppy

os_image.img: boot_sector.bin kernel.bin
	type $^ > os_image.img

kernel.bin: kernel/kernel_entry.o
	ld -T NUL -o kernel.tmp -Ttext 0x1000 kernel/kernel_entry.o kernel/kernel.o
	objcopy -O binary -j .text  kernel.tmp kernel.bin

%.o: %.c ${HEADERDS}
	gcc -ffreestanding -c 