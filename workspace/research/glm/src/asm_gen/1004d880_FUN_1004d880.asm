; FUN_1004d880 @ 0x1004d880 — auto-synthesized
.CODE
FUN_1004d880 PROC
    push ecx
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 0x14]
    mov eax, dword ptr [esi + 0x18c]
    mov ebx, dword ptr [esi + 0xcc]
    mov dword ptr [esp + 0xc], eax
    mov eax, dword ptr [esi + 0x2c]
    xor ebp, ebp
    test eax, eax
    jle L0
    push edi
    add ebx, 0xc
    jmp L1
    mov esi, dword ptr [esp + 0x18]
    jmp L1
    lea ecx, [ecx]
    mov ecx, dword ptr [ebx + 0x18]
    imul ecx, dword ptr [ebx]
    mov eax, ecx
    cdq
    idiv dword ptr [esi + 0x120]
    xor edx, edx
    mov edi, eax
    mov eax, dword ptr [ebx + 0x20]
    div ecx
    mov esi, edx
    test esi, esi
    jne L2
    mov esi, ecx
    test ebp, ebp
    jne L3
    lea eax, [esi - 1]
    cdq
    idiv edi
    mov ecx, eax
    mov eax, dword ptr [esp + 0x10]
    inc ecx
    mov dword ptr [eax + 0x48], ecx
    jmp L4
    mov eax, dword ptr [esp + 0x10]
    mov edx, dword ptr [eax + 0x40]
    mov eax, dword ptr [eax + edx*4 + 0x38]
    mov eax, dword ptr [eax + ebp*4]
    lea edx, [edi + edi]
    test edx, edx
    jle L5
    lea ecx, [eax + esi*4]
    mov eax, ecx
    mov esi, dword ptr [ecx - 4]
    mov dword ptr [eax], esi
    add eax, 4
    dec edx
    jne L6
    mov ecx, dword ptr [esp + 0x18]
    mov eax, dword ptr [ecx + 0x2c]
    inc ebp
    add ebx, 0x54
    cmp ebp, eax
    jl L7
    pop edi
    pop esi
    pop ebp
FUN_1004d880 ENDP
END