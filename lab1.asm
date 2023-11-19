; Below code prints Character 'P' in the console

ORG 0x7c00
BITS 16

mov bx, 0000h
mov ah, 0eh
mov al, 'P'
int 0x10
jmp $

times 510 - ($ - $$) db 0
dw 0xAA55
