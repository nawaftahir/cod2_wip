; FUN_100298a0 @ 0x100298a0 — auto-synthesized
    EXTRN fp_101d49e4:DWORD
.CODE
FUN_100298a0 PROC
    push ebx
    mov ebx, dword ptr [esp + 8]
    mov eax, dword ptr [ebx + 0x20]
    test eax, eax
    push esi
    push edi
    je L0
    shl eax, 2
    push 4
    push eax
    call dword ptr [fp_101d49e4]
    mov ecx, dword ptr [ebx + 0x20]
    mov esi, dword ptr [ebx + 0x24]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    add esp, 8
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov dword ptr [ebx + 0x24], eax
    mov eax, dword ptr [ebx + 0x28]
    xor esi, esi
    test eax, eax
    jle L1
    xor edi, edi
    mov eax, dword ptr [ebx + 0x2c]
    add eax, edi
    push eax
    call L2
    mov eax, dword ptr [ebx + 0x28]
    add esp, 4
    inc esi
    add edi, 0x30
    cmp esi, eax
    jl L3
    pop edi
    pop esi
    pop ebx
    ret
FUN_100298a0 ENDP
END