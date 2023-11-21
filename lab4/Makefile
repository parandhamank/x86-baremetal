all:
	nasm -f bin ./boot.asm -o ./boot.bin
	nasm -f bin ./boot1.asm -o ./boot1.bin
	dd if=./boot.bin > ./final.bin
	dd if=./boot1.bin >> ./final.bin