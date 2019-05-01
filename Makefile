C_SOURCES = $(wildcard kernel/*.c)
HEADERS = $(wildcard kernel/*.h)

OBJ = ${C_SOURCES:.c=.o}

all: os_image.img

run: all
	qemu-system-x86_64 -drive format=raw,file=os_image.img,index=0,if=floppy

os_image.img: boot/boot_sector.bin kernel.bin
	type $^ > os_image.img

kernel.bin: kernel_entry.o ${OBJ}
	ld -T NUL -o kernel.tmp -Ttext 0x1000 kernel/kernel_entry.o kernel/kernel.o
	objcopy -O binary -j .text  kernel.tmp kernel.bin

%.o: %.c ${HEADERS}
	gcc -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f win64 -o $@

%.bin: %.asm
	nasm $< -f bin -I '../../16bit/' -o $@

clean:
	rm -fr *.bin *.dis *.o
	rm -fr kernel/*.o boot/*.bin