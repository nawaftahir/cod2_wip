; FUN_10048ef0 @ 0x10048ef0 — auto-synthesized
    sub_10048d48 PROTO C
.CODE
FUN_10048ef0 PROC
    push ecx
    mov ecx, dword ptr [esp + 8]
    mov edx, dword ptr [ecx + 0x24]
    mov eax, dword ptr [esp + 0x14]
    push ebx
    mov ebx, dword ptr [ecx + 0xe4]
    test ebx, ebx
    mov dword ptr [esp + 4], edx
    jle L0
    mov edx, dword ptr [esp + 0x14]
    push ebp
    push esi
    sub edx, eax
    push edi
    mov ecx, dword ptr [esp + 0x10]
    mov esi, dword ptr [edx + eax]
    mov edi, dword ptr [eax]
    mov ebp, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebp
    and ecx, 3
    add eax, 4
    dec ebx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    jne L1
    mov ecx, dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x24]
    pop edi
    pop esi
    pop ebp
    mov edx, dword ptr [esp + 0x10]
    mov edx, dword ptr [edx + 0x1c]
    shl edx, 3
    pop ebx
    add esp, 4
    mov dword ptr [esp + 0x10], edx
    mov edx, dword ptr [ecx + 0x24]
    mov dword ptr [esp + 0xc], edx
    mov ecx, dword ptr [ecx + 0xe4]
    mov dword ptr [esp + 8], ecx
    mov dword ptr [esp + 4], eax
    jmp sub_10048d48
FUN_10048ef0 ENDP
END