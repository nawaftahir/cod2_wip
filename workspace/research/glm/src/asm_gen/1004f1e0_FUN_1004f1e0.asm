; FUN_1004f1e0 @ 0x1004f1e0 — auto-synthesized
.CODE
FUN_1004f1e0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    mov esi, dword ptr [ebp + 0x20]
    mov ebx, dword ptr [esi]
    push edi
    mov edi, dword ptr [esi + 4]
    test edi, edi
    jne L0
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L1
    mov ebx, dword ptr [esi]
    mov edi, dword ptr [esi + 4]
    movzx ecx, byte ptr [ebx]
    dec edi
    inc ebx
    test edi, edi
    mov dword ptr [esp + 0x14], ecx
    jne L2
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    jne L3
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    mov ebx, dword ptr [esi]
    mov edi, dword ptr [esi + 4]
    mov ecx, dword ptr [esp + 0x14]
    movzx eax, byte ptr [ebx]
    dec edi
    inc ebx
    cmp ecx, 0xff
    mov dword ptr [esp + 0x14], eax
    jne L4
    cmp eax, 0xd8
    je L5
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 0x14], 0x35
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 0x18], ecx
    mov ecx, dword ptr [ebp]
    mov dword ptr [ecx + 0x1c], eax
    mov edx, dword ptr [ebp]
    push ebp
    call dword ptr [edx]
    mov eax, dword ptr [esp + 0x18]
    add esp, 4
    mov dword ptr [ebp + 0x184], eax
    mov dword ptr [esi + 4], edi
    pop edi
    mov dword ptr [esi], ebx
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1004f1e0 ENDP
END