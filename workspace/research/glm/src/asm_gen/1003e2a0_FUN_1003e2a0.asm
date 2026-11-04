; FUN_1003e2a0 @ 0x1003e2a0 — auto-synthesized
    EXTRN g_10730550:DWORD
.CODE
FUN_1003e2a0 PROC
    mov eax, dword ptr [g_10730550]
    push esi
    imul eax, eax, 0xcd0
    push edi
    add eax, 0x1072dee0
    lea esi, [edx + 0x48]
    lea edi, [eax + 0x230]
    mov ecx, 0x10
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea esi, [edx + 0x88]
    lea edi, [eax + 0x340]
    mov ecx, 0x10
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea esi, [edx + 0xc8]
    lea edi, [eax + 0x670]
    mov ecx, 0x10
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea esi, [edx + 0x108]
    lea edi, [eax + 0x6b0]
    mov ecx, 0x10
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    ret
FUN_1003e2a0 ENDP
END