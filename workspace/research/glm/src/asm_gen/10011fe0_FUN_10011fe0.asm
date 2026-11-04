; FUN_10011fe0 @ 0x10011fe0 — auto-synthesized
    sub_10011f20 PROTO C
    sub_10012040 PROTO C
.CODE
FUN_10011fe0 PROC
    sub esp, 0x200
    push esi
    lea ecx, [esp + 4]
    call sub_10011f20
    xor esi, esi
    test ebx, ebx
    jle sub_10012040
    jmp L0
    lea esp, [esp]
    nop
    movzx eax, byte ptr [esi + edi]
    movzx ecx, word ptr [esp + eax*2 + 4]
    imul ecx, ecx, 0xff
    mov eax, 0x80008001
    imul ecx
    add edx, ecx
    sar edx, 0xf
    mov ecx, edx
    shr ecx, 0x1f
    add ecx, edx
    mov byte ptr [esi + edi], cl
    inc esi
    cmp esi, ebx
    jl L0
FUN_10011fe0 ENDP
END