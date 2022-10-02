; so you might be thinking, why the hell is there so many commented out code? well if you uncomment the code below then when you type a character the character will only show up if you press enter.
[org 0x7c00]
mov bp, 0x8000
mov sp, bp
mov [disk], dl
CODE_SEG equ code_descriptor - GDT_Start
DATA_SEG equ data_descriptor - GDT_Start
cli
lgdt [GDT_Descriptor]
mov eax, cr0
or eax, 1
mov cr0, eax
jmp CODE_SEG:start_protected_mode
jmp $
GDT_Start:
    null_descriptor:
        dd 0
        dd 0
    code_descriptor:
        dw 0xffff
        dw 0
        db 0
        db 0b10011010
        db 0b11001111
        db 0
    data_descriptor:
        dw 0xffff
        dw 0
        db 0
        db 0b10010010
        db 0b11001111
        db 0
GDT_End:
GDT_Descriptor:
    dw GDT_End - GDT_Start - 1
    dd GDT_Start
[bits 32]
start_protected_mode:
    mov al, 'V'
    mov ah, 0x0f
    mov [0xb8000], ax
disk: db 0
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
; some code that i added, just for later (disk reading code)
times 512 db 'H'
mov ah, 2
mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [disk]
mov es, bx
mov bx, 0x7e00
int 0x13
mov ah, 0x0e
mov al, [0x7e00]
int 0x10