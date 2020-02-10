C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c)
ASM_SOURCES = $(wildcard kernel/*.asm cpu/*.asm)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h)

OBJ = ${ASM_SOURCES:.asm=.o} ${C_SOURCES:.c=.o}

BUILD := build

ifdef OS
COMPILE = type

else
COMPILE = cat
endif

all: os_image.img

run: all
	qemu-system-x86_64 -drive format=raw,file=$(BUILD)\os_image.img,index=0,if=floppy

os_image.img: boot_sector.bin kernel.bin
	$(COMPILE) $(BUILD)\boot_sector.bin $(BUILD)\kernel.bin > $(BUILD)\$@

kernel.bin: ${OBJ}
	ld -mi386pe -T link.ld -o kernel.tmp $^
	objcopy -O binary kernel.tmp $(BUILD)\kernel.bin
	del /S /Q *.o *.tmp

%.o : %.c ${HEADERS}
	gcc -g -m32 -ffreestanding -mno-ms-bitfields -c $< -o $@

%.o : %.asm
	nasm $< -f win32 -o $@

%.bin: boot/%.asm ${BUILD}
	nasm $< -f bin -i 'boot/' -o $(BUILD)\$@

build:
	mkdir build

clean:
	del /S /Q *.o *.tmp *.bin
	rmdir /S /Q build