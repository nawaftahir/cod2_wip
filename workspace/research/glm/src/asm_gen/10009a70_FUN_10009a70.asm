; FUN_10009a70 @ 0x10009a70 — auto-synthesized
    EXTRN g_101ce5b4:DWORD
    sub_10007f11 PROTO C
    sub_10007f43 PROTO C
    sub_10007f7d PROTO C
.CODE
FUN_10009a70 PROC
    push ecx
    movzx ecx, byte ptr [eax + 0x24]
    mov eax, dword ptr [eax + 0x20]
    push ebp
    mov ebp, dword ptr [esp + 0x14]
    push esi
    lea edx, [esp + 8]
    push edx
    push eax
    mov eax, dword ptr [esp + 0x18]
    mov dword ptr [esp + 0x10], ecx
    call sub_10007f11
    mov ecx, dword ptr [esp + 0x10]
    add esp, 0xc
    test ecx, ecx
    je L0
    mov edx, dword ptr [g_101ce5b4]
    test edx, edx
    je L1
    xor ecx, ecx
    cmp eax, esi
    sete cl
    lea ecx, [ecx + ecx*2]
    shl ecx, 9
    add ecx, esi
    push ecx
    lea ecx, [esp + 8]
    push ecx
    push eax
    mov eax, edx
    call sub_10007f43
    mov ecx, dword ptr [esp + 0x10]
    add esp, 0xc
    test ecx, ecx
    jne L1
    xor eax, eax
    pop ebp
    pop ecx
    ret
    push ebx
    xor ebx, ebx
    test ebp, ebp
    push edi
    jle L2
    mov edi, dword ptr [esp + 0x18]
    nop
    xor ecx, ecx
    cmp eax, esi
    sete cl
    lea edx, [ecx + ecx*2]
    shl edx, 9
    add edx, esi
    push edx
    lea ecx, [esp + 0x10]
    push ecx
    push eax
    mov eax, edi
    call sub_10007f7d
    mov ecx, dword ptr [esp + 0x18]
    add esp, 0xc
    test ecx, ecx
    je L3
    inc ebx
    add edi, 0x14
    cmp ebx, ebp
    jl L4
    mov edx, dword ptr [esp + 0x20]
    test edx, edx
    je L5
    mov dword ptr [edx], eax
    pop edi
    pop ebx
    mov eax, ecx
    pop ebp
    pop ecx
    ret
    pop edi
    pop ebx
    xor eax, eax
    pop ebp
    pop ecx
    ret
FUN_10009a70 ENDP
END