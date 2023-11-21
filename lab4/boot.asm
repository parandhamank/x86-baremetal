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
    mov si, p1_msg
    call print_str

    ; load process 2
    mov ah, 02h
    mov al, 01h
    mov cl, 02h
    mov ch, 00h
    mov dh, 00h
    mov bx, buffer
    int 13h
    jc error

    ; prints Process 2 Loaded
    mov si, p2_msg
    call print_str

    ; Jump to process 2
    mov ax, 7e0h
    jmp 0x7e0:start

    ; Setting back all of my segment registers
    cli
    mov ax, 7c0h
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 1fdh
    sti

    ; Prints Back to process 1
    mov si, p1_msg1
    call print_str
    jmp $

error:
    mov si, err_msg
    call print_str
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

p1_msg: db 'Process 1 Executing', 0ah, 0dh, 0
p2_msg: db 'Process 2 Loaded', 0ah, 0dh, 0
p1_msg1: db 'Back to process 1', 0ah, 0dh, 0
err_msg: db 'Error while loading the sector', 0ah, 0dh, 0
times 510 - ($ - $$) db 0
dw 0xAA55
buffer: