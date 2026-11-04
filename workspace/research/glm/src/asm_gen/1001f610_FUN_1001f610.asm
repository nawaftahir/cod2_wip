; FUN_1001f610 @ 0x1001f610 — auto-synthesized
    sub_1001eee8 PROTO C
    sub_1001f07d PROTO C
    sub_1001f5cf PROTO C
.CODE
FUN_1001f610 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    lea ebp, [ebp + ebp*4]
    shl ebp, 0xd
    push edi
    add ebp, 0x101daa00
    push ebp
    push ebx
    mov dword ptr [esp + 0x10], ebp
    call sub_1001f5cf
    mov cl, byte ptr [ebx + 0x1c]
    mov edi, dword ptr [ebx]
    xor eax, eax
    add esp, 8
    test cl, cl
    mov dword ptr [esp + 0x10], eax
    jbe L0
    push esi
    movzx eax, byte ptr [ebx + eax + 0x1e]
    mov ecx, dword ptr [edi]
    mov esi, dword ptr [ebx + 4]
    shl eax, 6
    add eax, ebp
    cmp ecx, 3
    jne L1
    mov edx, edi
    call sub_1001f07d
    add edi, 0x10
    jmp L2
    cmp ecx, 5
    jne L3
    add edi, 0x10
    jmp L2
    mov ebp, dword ptr [edi + 4]
    mov edx, dword ptr [esi + 0x38]
    movsx ebp, word ptr [ebp + 6]
    push edx
    add ebp, eax
    lea edx, [esi + 0x14]
    lea ecx, [edi + 8]
    add esi, 0x3c
    push ebp
    call sub_1001eee8
    mov ebp, dword ptr [esp + 0x14]
    add esp, 8
    add edi, 0x38
    mov eax, dword ptr [esp + 0x14]
    movzx ecx, byte ptr [ebx + 0x1c]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 0x14], eax
    jl L4
    pop esi
    pop edi
    pop ebp
    pop ecx
    ret
FUN_1001f610 ENDP
END