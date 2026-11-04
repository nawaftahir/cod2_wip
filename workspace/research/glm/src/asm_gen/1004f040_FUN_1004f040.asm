; FUN_1004f040 @ 0x1004f040 — auto-synthesized
.CODE
FUN_1004f040 PROC
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 0x10]
    push edi
    mov edi, dword ptr [esi + 0x20]
    mov ebp, dword ptr [edi + 4]
    test ebp, ebp
    mov ebx, dword ptr [edi]
    jne L0
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L1
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
    xor eax, eax
    mov ah, byte ptr [ebx]
    dec ebp
    inc ebx
    test ebp, ebp
    mov dword ptr [esp + 0x14], eax
    jne L2
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    jne L3
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
    movzx ecx, byte ptr [ebx]
    mov edx, dword ptr [esp + 0x14]
    lea eax, [edx + ecx - 2]
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 0x5b
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esi + 0x184]
    mov dword ptr [edx + 0x18], ecx
    mov edx, dword ptr [esi]
    mov dword ptr [esp + 0x14], eax
    mov dword ptr [edx + 0x1c], eax
    mov eax, dword ptr [esi]
    push 1
    push esi
    call dword ptr [eax + 4]
    mov eax, dword ptr [esp + 0x1c]
    add esp, 8
    inc ebx
    dec ebp
    test eax, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 4], ebp
    jle L4
    mov ecx, dword ptr [esi + 0x20]
    push eax
    push esi
    call dword ptr [ecx + 0x10]
    add esp, 8
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1004f040 ENDP
END