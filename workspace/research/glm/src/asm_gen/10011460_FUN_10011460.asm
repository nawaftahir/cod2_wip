; FUN_10011460 @ 0x10011460 — auto-synthesized
    EXTRN g_101d1bf4:DWORD
    EXTRN g_101d4814:DWORD
    EXTRN g_101d4818:DWORD
.CODE
FUN_10011460 PROC
    push ecx
    push esi
    mov esi, dword ptr [edi + 0x20]
    cmp esi, 1
    jle L0
    lea ebx, [ebx]
    mov eax, dword ptr [g_101d1bf4]
    lea edx, [esp + 4]
    push edx
    xor edx, edx
    mov dword ptr [g_101d4814], esi
    cmp byte ptr [edi + 8], dl
    mov ecx, dword ptr [eax]
    sete dl
    push esi
    push edx
    push 0x15
    push 1
    push 0
    push eax
    call dword ptr [ecx + 0x2c]
    test eax, eax
    jge L1
    dec esi
    cmp esi, 1
    jg L2
    mov dword ptr [g_101d4814], 0
    mov dword ptr [g_101d4818], 0
    pop esi
    pop ecx
    ret
    mov eax, dword ptr [esp + 4]
    dec eax
    mov dword ptr [g_101d4818], eax
    pop esi
    pop ecx
    ret
FUN_10011460 ENDP
END