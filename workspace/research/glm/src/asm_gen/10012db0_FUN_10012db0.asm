; FUN_10012db0 @ 0x10012db0 — auto-synthesized
    EXTRN g_1010c1c8:DWORD
    EXTRN g_1010c1e0:DWORD
    EXTRN g_101d1bf4:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d4938:DWORD
    EXTRN g_1076a830:DWORD
    sub_10012215 PROTO C
.CODE
FUN_10012db0 PROC
    call sub_10012215
    mov eax, dword ptr [g_101d4938]
    test eax, eax
    je L0
    push esi
    mov esi, dword ptr [g_1010c1e0]
    push edi
    mov edi, dword ptr [g_1010c1c8]
    lea esp, [esp]
    dec eax
    mov dword ptr [g_101d4938], eax
    shl eax, 4
    mov eax, dword ptr [eax + 0x101d493c]
    push eax
    call esi
    test eax, eax
    je L1
    mov ecx, dword ptr [g_101d4938]
    shl ecx, 4
    mov edx, dword ptr [ecx + 0x101d493c]
    push edx
    call edi
    mov eax, dword ptr [g_101d4938]
    shl eax, 4
    mov dword ptr [eax + 0x101d493c], 0
    mov eax, dword ptr [g_101d4938]
    test eax, eax
    jne L2
    pop edi
    pop esi
    mov eax, dword ptr [g_101d1bf8]
    test eax, eax
    je L3
    mov edi, edi
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076a830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101d1bf8], eax
    jne L4
    mov eax, dword ptr [g_101d1bf4]
    test eax, eax
    je L5
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076a830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101d1bf4], eax
    jne L6
    ret
FUN_10012db0 ENDP
END