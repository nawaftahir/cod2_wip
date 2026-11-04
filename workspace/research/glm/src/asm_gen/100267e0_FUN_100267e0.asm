; FUN_100267e0 @ 0x100267e0 — auto-synthesized
    EXTRN g_101d4928:DWORD
.CODE
FUN_100267e0 PROC
    mov dx, word ptr [g_101d4928]
    movzx eax, dx
    push ebp
    xor ebp, ebp
    test eax, eax
    jle L0
    push edi
    xor edi, edi
    test eax, eax
    jle L1
    imul eax, ebp
    add eax, edi
    shl eax, 2
    mov dl, byte ptr [esi + eax + 2]
    mov byte ptr [ecx + eax + 0x14], dl
    mov dl, byte ptr [esi + eax + 1]
    mov byte ptr [ecx + eax + 0x13], dl
    mov dl, byte ptr [eax + esi]
    mov byte ptr [eax + ecx + 0x12], dl
    mov dl, byte ptr [esi + eax + 3]
    mov byte ptr [ecx + eax + 0x15], dl
    mov dx, word ptr [g_101d4928]
    movzx eax, dx
    inc edi
    cmp edi, eax
    jl L2
    movzx eax, dx
    inc ebp
    cmp ebp, eax
    jl L3
    pop edi
    pop ebp
    ret
FUN_100267e0 ENDP
END