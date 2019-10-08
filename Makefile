C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c)
ASM_SOURCES = $(wildcard kernel/*.asm cpu/*.asm)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h)

OBJ = ${C_SOURCES:.c=.o} ${ASM_SOURCES:.asm=.o}

all: os_image.img

run: all
	qemu-system-x86_64 -drive format=raw,file=os_image.img,index=0,if=floppy

os_image.img: boot/boot_sector.bin kernel.bin
	type boot\boot_sector.bin kernel.bin > os_image.img

kernel.bin: ${OBJ}
	ld -mi386pe -T link.ld -o kernel.tmp $^
	objcopy -O binary kernel.tmp kernel.bin

%.o : %.c ${HEADERS}
	gcc -m32 -ffreestanding -mno-ms-bitfields -c $< -o $@

%.o : %.asm
	nasm $< -f win32 -o $@

%.bin: %.asm
	nasm $< -f bin -i 'boot/' -o $@

clean:
	del *.bin 
	del *.img
	del drivers\*.o
	del kernel\*.o 
	del cpu\*.o
	del boot\*.bin