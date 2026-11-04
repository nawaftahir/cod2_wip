; FUN_10011e60 @ 0x10011e60 — auto-synthesized
    EXTRN fp_101d49f4:DWORD
    EXTRN g_101d4978:DWORD
    EXTRN g_101d49a0:DWORD
    EXTRN g_101d49c0:DWORD
    EXTRN g_101d49c4:DWORD
    EXTRN g_1076a830:DWORD
.CODE
FUN_10011e60 PROC
    mov eax, dword ptr [g_101d4978]
    test eax, eax
    je L0
    lea esp, [esp]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076a830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101d4978], eax
    jne L1
    mov eax, dword ptr [g_101d49a0]
    test eax, eax
    je L2
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076a830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101d49a0], eax
    jne L3
    push esi
    mov esi, 0x101d4988
    lea ecx, [ecx]
    cmp dword ptr [esi], 0
    je L4
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    mov dword ptr [esi], 0
    jne L5
    add esi, 0xc
    cmp esi, 0x101d49a0
    jne L6
    mov eax, dword ptr [g_101d49c0]
    test eax, eax
    pop esi
    je L7
    push eax
    call dword ptr [fp_101d49f4]
    add esp, 4
    mov dword ptr [g_101d49c0], 0
    mov dword ptr [g_101d49c4], 0
    ret
FUN_10011e60 ENDP
END