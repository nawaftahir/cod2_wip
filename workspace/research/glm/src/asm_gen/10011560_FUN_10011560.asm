; FUN_10011560 @ 0x10011560 — auto-synthesized
    EXTRN fp_1010c1d4:DWORD
    EXTRN g_1010c1e8:DWORD
    EXTRN g_101d1bf4:DWORD
    EXTRN g_101d1bfc:DWORD
    EXTRN g_101d4c6c:DWORD
    EXTRN g_101d4c70:DWORD
    EXTRN g_101d4c78:DWORD
.CODE
FUN_10011560 PROC
    mov eax, dword ptr [g_101d4c78]
    sub esp, 0x28
    test eax, eax
    push edi
    je L0
    mov edx, dword ptr [g_101d1bfc]
    mov eax, dword ptr [g_101d1bf4]
    mov ecx, dword ptr [eax]
    push edx
    push eax
    call dword ptr [ecx + 0x3c]
    lea ecx, [esp + 4]
    push ecx
    push eax
    mov dword ptr [esp + 0xc], 0x28
    call dword ptr [fp_1010c1d4]
    test eax, eax
    je L1
    mov edi, dword ptr [esp + 8]
    mov edx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0x14]
    mov ecx, dword ptr [esp + 0xc]
    sub edx, edi
    sub eax, ecx
    mov dword ptr [esi], edx
    mov dword ptr [ebx], eax
    pop edi
    add esp, 0x28
    ret
    mov edi, dword ptr [g_1010c1e8]
    push 0
    call edi
    push 1
    mov dword ptr [esi], eax
    call edi
    mov dword ptr [ebx], eax
    cmp dword ptr [esi], 0
    jle L0
    test eax, eax
    jg L2
    mov ecx, dword ptr [g_101d4c6c]
    mov edx, dword ptr [g_101d4c70]
    mov dword ptr [esi], ecx
    mov dword ptr [ebx], edx
    pop edi
    add esp, 0x28
    ret
FUN_10011560 ENDP
END