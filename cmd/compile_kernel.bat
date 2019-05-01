gcc -ffreestanding -c ../kernel/kernel.c -o ../kernel/bin/kernel.o
ld -T NUL -o kernel.tmp -Ttext 0x1000 ../kernel/kernel_entry.o ../kernel/bin/kernel.o
objcopy -O binary -j .text  kernel.tmp kernel.bin 