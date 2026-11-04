; R_SetFog @ 0x1000bbc0 — auto-synthesized
    EXTRN g_101d61c8:DWORD
    EXTRN g_101d61f0:DWORD
    EXTRN g_101d61f4:DWORD
    EXTRN g_101d620c:DWORD
.CODE
R_SetFog PROC
    mov al, byte ptr [g_101d61c8]
    test al, al
    mov edx, dword ptr [esp + 4]
    push esi
    push edi
    mov dword ptr [g_101d620c], edx
    mov edi, 0x101d61cc
    mov ecx, 8
    je L0
    mov eax, dword ptr [esp + 0x14]
    mov esi, 0x101d61ac
    jmp L1
    mov esi, edx
    shl esi, 5
    add esi, 0x101d616c
    xor eax, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov esi, edx
    shl esi, 5
    add esi, 0x101d616c
    test eax, eax
    mov ecx, 8
    mov edi, 0x101d61ec
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    jne L2
    mov dword ptr [g_101d61f0], eax
    mov dword ptr [g_101d61f4], eax
    ret
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [g_101d61f0], ecx
    add ecx, eax
    mov dword ptr [g_101d61f4], ecx
    ret
R_SetFog ENDP
END