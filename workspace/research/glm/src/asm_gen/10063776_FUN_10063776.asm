; FUN_10063776 @ 0x10063776 — auto-synthesized
.CODE
FUN_10063776 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    xor edx, edx
    cmp dword ptr [ebp + 8], edx
    jne L0
    mov eax, 0x8876086c
    jmp L1
    push 0x2c
    pop eax
    push ebx
    push esi
    mov dword ptr [ebp - 4], eax
    push edi
    mov edi, dword ptr [ebp + 8]
    add eax, edx
    shr eax, 1
    lea ecx, [eax + eax*2]
    mov esi, dword ptr [ecx*4 + 0x1010c220]
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [edi]
    jne L2
    test cl, cl
    je L3
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [edi + 1]
    jne L2
    inc esi
    inc esi
    inc edi
    inc edi
    test cl, cl
    jne L4
    xor ecx, ecx
    jmp L5
    sbb ecx, ecx
    sbb ecx, -1
    test ecx, ecx
    je L6
    jge L7
    lea edx, [eax + 1]
    jmp L8
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp - 4]
    cmp edx, eax
    jb L9
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    lea eax, [eax + eax*2]
    shl eax, 2
    mov ecx, dword ptr [eax + 0x1010c228]
    and ecx, dword ptr [ebp + 0xc]
    cmp ecx, dword ptr [ebp + 0xc]
    jne L10
    mov edi, dword ptr [ebp + 0x10]
    test edi, edi
    je L11
    lea esi, [eax + 0x1010c220]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    xor eax, eax
    jmp L12
FUN_10063776 ENDP
END