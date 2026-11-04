; FUN_10041a00 @ 0x10041a00 — auto-synthesized
.CODE
FUN_10041a00 PROC
    push ebx
    mov ebx, eax
    mov eax, dword ptr [esi + 0xd8]
    test eax, eax
    push ebp
    mov ebp, dword ptr [esp + 0x10]
    push edi
    jne L0
    mov eax, dword ptr [esi + 0x14]
    cmp eax, 0x65
    je L1
    cmp eax, 0x66
    je L1
    cmp eax, 0x67
    je L1
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x14
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 0x14]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov edx, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esi + 0x154]
    push ebp
    push edx
    push esi
    call dword ptr [ecx + 0x14]
    mov eax, dword ptr [esi + 0x154]
    mov edi, dword ptr [eax + 0x18]
    add esp, 0xc
    test ebp, ebp
    je L2
    mov edi, edi
    movzx ecx, byte ptr [ebx]
    push ecx
    push esi
    call edi
    add esp, 8
    inc ebx
    dec ebp
    jne L3
    pop edi
    pop ebp
    pop ebx
    ret
FUN_10041a00 ENDP
END