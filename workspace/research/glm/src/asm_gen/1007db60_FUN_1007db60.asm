; FUN_1007db60 @ 0x1007db60 — auto-synthesized
.CODE
FUN_1007db60 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0xc]
    test esi, esi
    jne L0
    mov eax, 0x8876086c
    jmp L1
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 0xc]
    cmp eax, 0x1c
    jb L2
    mov ecx, dword ptr [edx + 8]
    cmp dword ptr [ecx], 0x1c
    jb L2
    cmp dword ptr [ecx + 4], eax
    jb L3
    mov eax, 0x88760b59
    jmp L1
    push edi
    xor eax, eax
    mov edi, esi
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov edi, dword ptr [ecx + 4]
    test edi, edi
    je L4
    mov eax, dword ptr [edx + 8]
    add eax, edi
    jmp L5
    xor eax, eax
    mov dword ptr [esi], eax
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [ecx + 0xc]
    mov dword ptr [esi + 8], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_1007db60 ENDP
END