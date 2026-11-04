; __trandisp1 @ 0x10102d00 — auto-synthesized
.CODE
__trandisp1 PROC
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
    wait
    mov cl, byte ptr [ebp - 0x9f]
    shl cl, 1
    sar cl, 1
    rol cl, 1
    mov al, cl
    and al, 0xf
    xlatb
    movsx eax, al
    and ecx, 0x404
    mov ebx, edx
    add ebx, eax
    add ebx, 0x10
    jmp dword ptr [ebx]
__trandisp1 ENDP
END