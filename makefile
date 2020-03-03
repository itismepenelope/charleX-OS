#assemble boot.s file
as --32 boot.s -o boot.o

#compile kernel.c file
gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
gcc -m32 -c install.c -o install.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

#linking the kernel with kernel.o and boot.o files
ld -m elf_i386 -T linker.ld kernel.o boot.o -o charleX.bin -nostdlib
ld -m elf_i386 -T linker.ld install.o boot.o -o install.bin -nostdlib

#check charleX.bin file is x86 multiboot file or not
grub-file --is-x86-multiboot charleX.bin

#building the iso file
mkdir -p isodir/boot/grub
mkdir -p isodir/install/grub
cp charleX.bin isodir/boot/charleX.bin
cp install.bin isodir/install/install.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o charleX.iso isodir

#run it in qemu
qemu-system-x86_64 -cdrom charleX.iso
