; FUN_1004a5d0 @ 0x1004a5d0 — auto-synthesized
.CODE
FUN_1004a5d0 PROC
    push ecx
    cmp dword ptr [esi + 0x14], 0xcd
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x14
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 0x14]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov ecx, dword ptr [esi + 0x80]
    cmp ecx, dword ptr [esi + 0x68]
    jb L1
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 0x7b
    mov edx, dword ptr [esi]
    push -1
    push esi
    call dword ptr [edx + 4]
    add esp, 8
    xor eax, eax
    pop ecx
    ret
    mov eax, dword ptr [esi + 8]
    test eax, eax
    je L2
    mov dword ptr [eax + 4], ecx
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [esi + 0x68]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [esi + 8]
    push esi
    call dword ptr [edx]
    add esp, 4
    mov ecx, dword ptr [esp + 0xc]
    mov eax, dword ptr [esi + 0x18c]
    push ecx
    mov ecx, dword ptr [esp + 0xc]
    lea edx, [esp + 4]
    push edx
    push ecx
    push esi
    mov dword ptr [esp + 0x10], 0
    call dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 0x80]
    mov eax, dword ptr [esp + 0x10]
    add esp, 0x10
    add ecx, eax
    mov dword ptr [esi + 0x80], ecx
    pop ecx
    ret
FUN_1004a5d0 ENDP
END