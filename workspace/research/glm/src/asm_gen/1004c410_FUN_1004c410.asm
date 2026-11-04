; FUN_1004c410 @ 0x1004c410 — auto-synthesized
.CODE
FUN_1004c410 PROC
    push ecx
    mov eax, dword ptr [esi + 4]
    push ebx
    push 0x54
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0x1a4], eax
    mov dword ptr [eax], 0x1004c0e0
    mov edx, dword ptr [esi + 0x2c]
    mov ecx, dword ptr [esi + 0xcc]
    add esp, 0xc
    xor ebx, ebx
    test edx, edx
    jle L0
    push ebp
    add ecx, 0x50
    push edi
    mov dword ptr [esp + 0xc], ecx
    lea ebp, [eax + 0x2c]
    mov ecx, dword ptr [esi + 4]
    push 0x100
    push 1
    push esi
    call dword ptr [ecx]
    mov edx, dword ptr [esp + 0x18]
    mov edi, eax
    xor eax, eax
    mov dword ptr [edx], edi
    mov ecx, 0x40
    rep stosd dword ptr es:[edi], eax
    add esp, 0xc
    mov dword ptr [ebp], 0xffffffff
    mov eax, dword ptr [esi + 0x2c]
    inc ebx
    add edx, 0x54
    add ebp, 4
    cmp ebx, eax
    mov dword ptr [esp + 0xc], edx
    jl L1
    pop edi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_1004c410 ENDP
END