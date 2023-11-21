ORG 0000h
BITS 16

_start:
    mov ax, 7c0h
    jmp 0x7c0:start
start:
    ; Setup all segment registers except cs
    cli
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 1fdh
    sti

    ; prints Process 1 Executing
    mov si, p2_msg
    call print_str

    ; Jump back to process 1
    jmp 0x7c0:0x35

    jmp $

print_str:
    mov bx, 0000h
    mov ah, 0eh
    lodsb
    cmp al, 00h
    je print_ret
    int 0x10
    jmp print_str
print_ret:
    ret

p2_msg: db 'Process 2 Executing', 0ah, 0dh, 0
times 510 - ($ - $$) db 0
dw 0xAA55
