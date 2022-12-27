DEBUG = $1
export PATH=$PATH:/usr/local/i386elfgcc/bin
if [DEBUG == 1]
then
i386-elf-gcc -ffreestanding -m32 -g -c "kernel.cpp" -o "kernel.o" -Wall
else
i386-elf-gcc -ffreestanding -m32 -g -c "kernel.cpp" -o "kernel.o" 
fi
nasm "kernel_entry.asm" -f elf -o "kernel_entry.o"
i386-elf-ld -o "full_kernel.bin" -Ttext 0x1000 "kernel_entry.o" "kernel.o" --oformat binary
nasm "boot.asm" -f bin -o "boot.bin"
nasm "zeroes.asm" -f bin -o "zeroes.bin"
cat "boot.bin" "full_kernel.bin" "zeroes.bin" > "VynOS.bin"
echo "Compilation success!"
