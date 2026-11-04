; FUN_10019700 @ 0x10019700 — auto-synthesized
.CODE
FUN_10019700 PROC
    mov eax, dword ptr [edx]
    push ebx
    push ebp
    push esi
    xor ebp, ebp
    test eax, eax
    push edi
    je L0
    mov eax, edx
    mov edi, edx
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    jne L1
    mov ecx, dword ptr [eax + 0xc]
    test ecx, ecx
    jne L1
    mov esi, dword ptr [eax]
    mov eax, dword ptr [esp + 0x14]
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L2
    test cl, cl
    je L3
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L2
    add eax, 2
    add esi, 2
    test cl, cl
    jne L4
    xor eax, eax
    jmp L5
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    je L6
    mov ecx, dword ptr [edi + 0x14]
    add edi, 0x14
    inc ebp
    test ecx, ecx
    mov eax, edi
    jne L7
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    pop edi
    lea eax, [ebp + ebp*4]
    mov ecx, dword ptr [edx + eax*4 + 4]
    mov edx, dword ptr [esp + 0x14]
    pop esi
    pop ebp
    mov dword ptr [edx + 4], ecx
    mov al, 1
    pop ebx
    ret
FUN_10019700 ENDP
END