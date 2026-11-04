; R_SaveCubemapShot @ 0x100270e0 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    EXTRN fp_101d49e0:DWORD
    EXTRN g_101d4928:DWORD
    sub_10026edb PROTO C
    sub_1002703e PROTO C
.CODE
R_SaveCubemapShot PROC
    sub esp, 0x18
    push esi
    movzx esi, word ptr [g_101d4928]
    imul esi, esi
    lea eax, [esi + esi*8]
    shl eax, 3
    push edi
    push eax
    call dword ptr [fp_101d49dc]
    mov edi, eax
    lea eax, [esi + esi*2]
    shl eax, 2
    lea ecx, [eax + edi]
    mov dword ptr [esp + 0x10], ecx
    add ecx, eax
    mov dword ptr [esp + 0x14], ecx
    add ecx, eax
    mov dword ptr [esp + 0x18], ecx
    add ecx, eax
    add eax, ecx
    mov dword ptr [esp + 0x20], eax
    movzx eax, word ptr [g_101d4928]
    push eax
    push eax
    push 0x10696bb4
    lea eax, [esp + 0x18]
    mov dword ptr [esp + 0x18], edi
    mov dword ptr [esp + 0x28], ecx
    call sub_1002703e
    movzx eax, word ptr [g_101d4928]
    mov ecx, dword ptr [esp + 0x34]
    push 0x10696bb4
    push ecx
    push eax
    push eax
    lea edx, [esp + 0x28]
    push edx
    call sub_10026edb
    push edi
    call dword ptr [fp_101d49e0]
    add esp, 0x28
    pop edi
    pop esi
    add esp, 0x18
    ret
R_SaveCubemapShot ENDP
END