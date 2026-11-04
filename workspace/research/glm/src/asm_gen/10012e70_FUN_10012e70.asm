; FUN_10012e70 @ 0x10012e70 — auto-synthesized
    EXTRN g_101ce644:DWORD
    EXTRN g_101d4c6c:DWORD
    EXTRN g_101d4c70:DWORD
    EXTRN g_1072dde8:DWORD
    EXTRN g_1072ddec:DWORD
    EXTRN g_1072de48:DWORD
    EXTRN g_1072debe:DWORD
    EXTRN g_10730554:DWORD
    EXTRN g_10730558:DWORD
.CODE
FUN_10012e70 PROC
    mov edx, dword ptr [g_101ce644]
    push edi
    xor eax, eax
    mov ecx, 0xc68
    mov edi, 0x101d4d00
    rep stosd dword ptr es:[edi], eax
    mov ecx, 0x43c
    mov edi, 0x101d0b00
    rep stosd dword ptr es:[edi], eax
    mov ecx, 0xdad8
    mov edi, 0x1072da00
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [g_101d4c70]
    mov eax, 0xe
    mov dword ptr [g_10730554], eax
    mov dword ptr [g_10730558], eax
    mov eax, dword ptr [g_101d4c6c]
    mov dword ptr [g_1072ddec], ecx
    mov dword ptr [g_1072de48], 3
    mov dword ptr [g_1072dde8], eax
    mov eax, dword ptr [edx + 8]
    mov cl, byte ptr [eax + 0x101906b0]
    mov byte ptr [g_1072debe], cl
    pop edi
    ret
FUN_10012e70 ENDP
END