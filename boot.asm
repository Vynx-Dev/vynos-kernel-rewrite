; so you might be thinking, why the hell is there so many commented out code? well if you uncomment the code below then when you type a character the character will only show up if you press enter.
[org 0x7c00]
mov ah, 0x0e
mov al, '>'
int 0x10
mov bp, 0x8000
mov sp, bp
;inputLabel:
    ;mov ax, 0
    ;int 0x16
    ;mov bh, al
    ;push bx
    ;cmp al, 13
    ;je print
    ;jmp inputLabel
;print:
    ;pop bx TODO: maybe change pop bx to sub bp, 2 mov al, [bp]
    ;mov ah, 0x0e
    ;mov al, bh
    ;int 0x10
    ;cmp bp, sp
    ;je end
    ;jmp print
keyboardInput:
    cmp bx, 33
    je end
    mov ah, 0
    int 0x16
    mov ah, 0x0e
    mov [bx], al
    int 0x10
    inc bx
    jmp keyboardInput
end:
    jmp $
buffer:
    times 10 db 0
    mov bx, buffer
times 510-($-$$) db 0
db 0x55, 0xaa