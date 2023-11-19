; Below code prints 'Hello world!'

ORG 0x0
BITS 16

jmp 0x7c0:start

start:
    cli ; Disable interrupts
    mov ax, 0x7c0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 1feh ; setting sp to 510th byte
    sti ; Enable interrupts
    
    mov si, message
    mov ah, 0eh
    mov bx, 0000h
    call print_char
    jmp $

print_char:
    lodsb
    cmp al, 0
    je end
    int 0x10
    jmp print_char
end:
    ret

message: db 'Hello World!',0
times 510 - ($ - $$) db 0
dw 0xAA55
