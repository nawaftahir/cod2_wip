; FUN_10054e90 @ 0x10054e90 — auto-synthesized
.CODE
FUN_10054e90 PROC
    push ebx
    mov ebx, dword ptr [esp + 0x10]
    cmp ebx, 0x3b9ac9f0
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 0x14]
    mov ebp, dword ptr [edi + 4]
    jbe L0
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 0x14], 0x36
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 0x18], 3
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    mov eax, ebx
    and eax, 7
    jbe L1
    mov ecx, 8
    sub ecx, eax
    add ebx, ecx
    mov eax, dword ptr [esp + 0x18]
    test eax, eax
    jl L2
    cmp eax, 2
    jl L3
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 0x14], 0xe
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 0x18], eax
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    lea eax, [ebx + 0x10]
    push eax
    call dword ptr [edi + 0x18]
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L4
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 0x14], 0x36
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 0x18], 4
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
    mov eax, dword ptr [ebp + 0x4c]
    lea ecx, [ebx + 0x10]
    add eax, ecx
    mov dword ptr [ebp + 0x4c], eax
    mov eax, dword ptr [esp + 0x18]
    mov edx, dword ptr [ebp + eax*4 + 0x3c]
    mov dword ptr [esi + 4], ebx
    mov dword ptr [esi], edx
    mov dword ptr [esi + 8], 0
    mov dword ptr [ebp + eax*4 + 0x3c], esi
    pop edi
    lea eax, [esi + 0x10]
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10054e90 ENDP
END