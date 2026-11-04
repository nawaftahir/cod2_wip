; FUN_100a7f23 @ 0x100a7f23 — auto-synthesized
.CODE
FUN_100a7f23 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x14
    and dword ptr [ebp - 4], 0
    push ebx
    xor eax, eax
    push esi
    push edi
    lea edi, [ebp - 0x14]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 0xc]
    xor ebx, ebx
    xor edi, edi
    inc ebx
    test edx, edx
    jbe L0
    mov esi, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + 0x10]
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [esi + ecx*4]
    mov ecx, dword ptr [ecx + 0x10]
    cmp ecx, 3
    ja L1
    inc edi
    add eax, 4
    cmp edi, edx
    mov dword ptr [ebp + ecx*4 - 0x14], ebx
    jb L2
    xor ecx, ecx
    mov edx, ebx
    xor eax, eax
    cmp dword ptr [ebp + eax*4 - 0x14], 0
    je L3
    xor edx, edx
    jmp L4
    xor eax, eax
    jmp L5
    mov ecx, ebx
    inc eax
    cmp eax, 3
    jb L6
    test ecx, ecx
    je L7
    test edx, edx
    jne L7
    mov dword ptr [ebp - 4], ebx
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_100a7f23 ENDP
END