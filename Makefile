C_SOURCES = $(wildcard kernel/*.c drivers/*.c cpu/*.c)
ASM_SOURCES = $(wildcard kernel/*.asm cpu/*.asm)
HEADERS = $(wildcard kernel/*.h drivers/*.h cpu/*.h)

OBJ = ${ASM_SOURCES:.asm=.o} ${C_SOURCES:.c=.o}

BUILD := build

ifdef OS
SYSTEM = win32
COMPILE = type
DELETE = del /S /Q
PATH_KERNEL = $(BUILD)\kernel.bin
PATH_BOOT = $(BUILD)\boot_sector.bin
PATH_OUTPUT = > $(BUILD)\$@
else
SYSTEM = elf
COMPILE = cat
DELETE = rm
PATH_KERNEL = $(BUILD)/kernel.bin
PATH_BOOT = $(BUILD)/boot_sector.bin
PATH_OUTPUT = $(BUILD)/$@
endif

all: os_image.img

run: all
	qemu-system-x86_64 -drive format=raw,file=$(BUILD)/os_image.img,index=0,if=floppy

os_image.img: boot_sector.bin kernel.bin
	$(COMPILE) $(PATH_BOOT) $(PATH_KERNEL) $(PATH_OUTPUT)

kernel.bin: ${OBJ}
	ld -mi386pe -T link.ld -o kernel.tmp $^
	objcopy -O binary kernel.tmp $(BUILD)/$@
	$(DELETE) *.o *.tmp

%.o : %.c ${HEADERS}
	gcc -fno-pic -g -m32 -ffreestanding -mno-ms-bitfields -c $< -o $@

%.o : %.asm
	nasm $< -f $(SYSTEM) -o $@

%.bin: boot/%.asm ${BUILD}
	nasm $< -f bin -i 'boot/' -o $(BUILD)/$@

${BUILD}:
	mkdir build

clean:
	$(DELETE) /S /Q *.o *.tmp *.bin
	rmdir /S /Q build