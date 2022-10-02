print_alphabet:
    mov al, 64
    mov ah, 0xE
    mov bl, 96
    mov cl, al
print_letters:
    inc cl
    mov al, cl
    int 0x10
    inc bl
    mov al, bl
    int 0x10
    cmp bl, 'z'
    jne print_letters
    jmp $
jmp print_alphabet
times 510-($-$$) db 0
db 0x55, 0xaa 