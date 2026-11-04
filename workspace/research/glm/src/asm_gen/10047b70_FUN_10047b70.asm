; FUN_10047b70 @ 0x10047b70 — auto-synthesized
    sub_10047a0a PROTO C
    sub_10047a1c PROTO C
    sub_10047a45 PROTO C
.CODE
FUN_10047b70 PROC
    push esi
    mov esi, eax
    mov eax, dword ptr [esi + 0x38]
    test eax, eax
    jbe L0
    push ebp
    push edi
    sar eax, 1
    xor edi, edi
    test eax, eax
    je L1
    sar eax, 1
    inc edi
    test eax, eax
    jne L2
    cmp edi, 0xe
    jle L1
    mov eax, dword ptr [esi + 0x20]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 0x14], 0x28
    mov eax, dword ptr [esi + 0x20]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
    mov dl, byte ptr [esi + 0xc]
    mov eax, dword ptr [esi + 0x34]
    mov ecx, edi
    shl ecx, 4
    test dl, dl
    je L3
    mov eax, dword ptr [esi + eax*4 + 0x5c]
    lea eax, [eax + ecx*4]
    inc dword ptr [eax]
    jmp L4
    mov edx, dword ptr [esi + eax*4 + 0x4c]
    movsx eax, byte ptr [edx + ecx + 0x400]
    mov ecx, dword ptr [edx + ecx*4]
    push ecx
    call sub_10047a0a
    add esp, 4
    test edi, edi
    je L5
    mov edx, dword ptr [esi + 0x38]
    push edx
    mov eax, edi
    call sub_10047a1c
    add esp, 4
    mov al, byte ptr [esi + 0xc]
    test al, al
    mov ebp, dword ptr [esi + 0x3c]
    mov edi, dword ptr [esi + 0x40]
    mov dword ptr [esi + 0x38], 0
    jne L6
    test ebp, ebp
    jbe L6
    movsx eax, byte ptr [edi]
    push eax
    mov eax, 1
    call sub_10047a45
    add esp, 4
    inc edi
    dec ebp
    jne L7
    pop edi
    mov dword ptr [esi + 0x3c], 0
    pop ebp
    pop esi
    ret
FUN_10047b70 ENDP
END