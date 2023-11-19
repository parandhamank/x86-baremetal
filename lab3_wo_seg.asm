; Below code prints 'Hello world!'

ORG 0x0
BITS 16

start:
    mov si, message
    mov ah, 0eh
    mov bx, 0000h
loop:
    lodsb
    cmp al, 0
    je end
    int 0x10
    jmp loop
end:
    jmp $

message: db 'Hello World!',0
times 510 - ($ - $$) db 0
dw 0xAA55
