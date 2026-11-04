; __trandisp2 @ 0x10102d67 — auto-synthesized
.CODE
__trandisp2 PROC
    cmp byte ptr [edx + 0xe], 5
    jne L0
    mov bx, word ptr [ebp - 0xa4]
    or bh, 2
    and bh, 0xfe
    mov bl, 0x3f
    jmp L1
    mov bx, 0x133f
    mov word ptr [ebp - 0xa2], bx
    fldcw word ptr [ebp - 0xa2]
    mov ebx, 0x101a524c
    fxam
    mov dword ptr [ebp - 0x94], edx
    wait
    fnstsw word ptr [ebp - 0xa0]
    mov byte ptr [ebp - 0x90], 0
    fxch st(1)
    mov cl, byte ptr [ebp - 0x9f]
    fxam
    wait
    fnstsw word ptr [ebp - 0xa0]
    fxch st(1)
    mov ch, byte ptr [ebp - 0x9f]
    shl ch, 1
    sar ch, 1
    rol ch, 1
    mov al, ch
    and al, 0xf
    xlatb
    mov ah, al
    shl cl, 1
    sar cl, 1
    rol cl, 1
    mov al, cl
    and al, 0xf
    xlatb
    shl ah, 1
    shl ah, 1
    or al, ah
    movsx eax, al
    and ecx, 0x404
    mov ebx, edx
    add ebx, eax
    add ebx, 0x10
    jmp dword ptr [ebx]
__trandisp2 ENDP
END