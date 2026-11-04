; FUN_10085b72 @ 0x10085b72 — auto-synthesized
.CODE
FUN_10085b72 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ecx]
    mov eax, edx
    and eax, 0xfff00000
    je L0
    cmp eax, 0x50000000
    je L1
    cmp eax, 0x50200000
    je L2
    cmp eax, 0x70800000
    je L1
    mov eax, edx
    and eax, 0xf0000000
    cmp eax, 0x60000000
    jne L3
    push 4
    pop eax
    jmp L4
    and edx, 0xfffff
    mov eax, edx
    jmp L4
    xor eax, eax
    inc eax
    jmp L4
    mov eax, dword ptr [ecx + 0xc]
    jmp L4
    xor eax, eax
    mov edx, eax
    imul edx, dword ptr [ebp + 8]
    push esi
    lea esi, [edx + eax]
    cmp esi, dword ptr [ecx + 0xc]
    jbe L5
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L6
    and dword ptr [eax], 0
    xor eax, eax
    jmp L7
    mov esi, dword ptr [ebp + 0xc]
    test esi, esi
    je L7
    mov ecx, dword ptr [ecx + 0x10]
    lea ecx, [ecx + edx*4]
    mov dword ptr [esi], ecx
    pop esi
    pop ebp
    ret 8
FUN_10085b72 ENDP
END