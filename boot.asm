[org 0x7c00]
mov ah, 0x0e
mov al, '>'
int 0x10
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