; FUN_100ab1d9 @ 0x100ab1d9 — auto-synthesized
.CODE
FUN_100ab1d9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    mov eax, ecx
    cmp dword ptr [eax + 0x2c0], 0
    push esi
    jbe L0
    push ebx
    push edi
    mov ecx, dword ptr [eax + 0x2b4]
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 0x18]
    shl edx, 2
    mov esi, dword ptr [edx + ecx]
    mov ecx, dword ptr [esi + 4]
    mov edi, dword ptr [edi + edx]
    mov esi, dword ptr [esi + 8]
    mov edi, dword ptr [edi + 8]
    shl ecx, 2
    mov ebx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [eax + 0x2b4]
    mov esi, dword ptr [edx + ecx]
    mov edi, dword ptr [eax + 0x18]
    mov ecx, dword ptr [esi + 0xc]
    mov edx, dword ptr [edi + edx]
    mov edi, dword ptr [edx + 0x10]
    mov esi, dword ptr [esi + 0x10]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    inc dword ptr [ebp - 4]
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [eax + 0x2c0]
    jb L1
    pop edi
    pop ebx
    xor ecx, ecx
    cmp dword ptr [eax + 0x2bc], ecx
    jbe L2
    mov edx, dword ptr [eax + 0x2b8]
    mov edx, dword ptr [edx + ecx*4]
    mov esi, dword ptr [eax + 0x14]
    mov esi, dword ptr [esi + ecx*4]
    mov edx, dword ptr [edx + 0x38]
    inc ecx
    mov dword ptr [esi + 0x38], edx
    cmp ecx, dword ptr [eax + 0x2bc]
    jb L3
    xor eax, eax
    pop esi
    leave
    ret
FUN_100ab1d9 ENDP
END