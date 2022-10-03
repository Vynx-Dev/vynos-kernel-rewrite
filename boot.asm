; so you might be thinking, why the hell is there so many commented out code? well if you uncomment the code below then when you type a character the character will only show up if you press enter.
[org 0x7c00]
KERNEL_LOCATION equ 0x1000
mov bp, 0x8000
mov sp, bp
disk: db 0
mov [disk], dl
xor ax, ax
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp
mov bx, KERNEL_LOCATION
mov ah, 2
mov al, 1
mov ch, 0
mov dh, 0
mov cl, 2
mov dl, [disk]
int 0x13
mov ah, 0x0e
mov al, [0x7e00]
int 0x10
CODE_SEG equ GDT_code - GDT_start
DATA_SEG equ GDT_data - GDT_start
cli
lgdt [GDT_descriptor]
mov eax, cr0
or eax, 1
mov cr0, eax
jmp CODE_SEG:start_protected_mode
jmp $
GDT_start:
    GDT_null:
        dd 0x0
        dd 0x0
    GDT_code:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10011010
        db 0b11001111
        db 0x0
    GDT_data:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10010010
        db 0b11001111
        db 0x0
GDT_end:

GDT_descriptor:
    dw GDT_end - GDT_start - 1
    dd GDT_start

[bits 32]
start_protected_mode:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ebp, 0x90000
    mov esp, ebp
    jmp KERNEL_LOCATION
;inputLabel:
    ;mov ax, 0
    ;int 0x16
    ;mov bh, al
    ;push bx
    ;cmp al, 13
    ;je print
    ;jmp inputLabel
;print:
    ;pop bx ;TODO: maybe change pop bx to sub bp, 2 mov al, [bp]
    ;mov ah, 0x0e
    ;mov al, bh
    ;int 0x10
    ;cmp bp, sp
    ;je end
    ;jmp print
end:
    jmp $
times 510-($-$$) db 0
dw 0xaa55