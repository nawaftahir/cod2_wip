; FUN_10085abe @ 0x10085abe — auto-synthesized
    sub_1008582f PROTO C
    sub_1008586b PROTO C
.CODE
FUN_10085abe PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    push ebx
    mov ebx, ecx
    jne L0
    mov eax, 0x80004005
    jmp L1
    mov ecx, dword ptr [eax]
    mov dword ptr [ebx], ecx
    mov ecx, dword ptr [eax + 4]
    cmp ecx, dword ptr [ebx + 4]
    jbe L2
    cmp ecx, 8
    ja L3
    lea ecx, [ebx + 0x40]
    mov dword ptr [ebx + 8], ecx
    jmp L2
    push ecx
    call sub_1008582f
    test eax, eax
    mov dword ptr [ebx + 8], eax
    jne L4
    mov eax, 0x8007000e
    jmp L1
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 4]
    push esi
    mov dword ptr [ebx + 4], ecx
    mov esi, dword ptr [eax + 8]
    push edi
    mov edi, dword ptr [ebx + 8]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [eax + 0xc]
    cmp ecx, dword ptr [ebx + 0xc]
    jbe L5
    cmp ecx, 4
    ja L6
    lea ecx, [ebx + 0x60]
    mov dword ptr [ebx + 0x10], ecx
    jmp L5
    push ecx
    call sub_1008586b
    test eax, eax
    mov dword ptr [ebx + 0x10], eax
    jne L7
    mov eax, 0x8007000e
    jmp L8
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 0xc]
    mov edi, dword ptr [ebx + 0x10]
    mov dword ptr [ebx + 0xc], ecx
    mov esi, dword ptr [eax + 0x10]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [eax + 0x24]
    mov dword ptr [ebx + 0x24], ecx
    mov ecx, dword ptr [eax + 0x28]
    mov dword ptr [ebx + 0x28], ecx
    mov ecx, dword ptr [eax + 0x30]
    mov dword ptr [ebx + 0x30], ecx
    mov eax, dword ptr [eax + 0x3c]
    mov dword ptr [ebx + 0x3c], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_10085abe ENDP
END