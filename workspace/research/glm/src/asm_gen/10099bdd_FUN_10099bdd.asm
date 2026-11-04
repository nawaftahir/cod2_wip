; FUN_10099bdd @ 0x10099bdd — auto-synthesized
.CODE
FUN_10099bdd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0xc]
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    test edi, edi
    je L0
    mov eax, dword ptr [edi + 4]
    cmp eax, 1
    jne L1
    test esi, esi
    je L2
    cmp dword ptr [esi + 4], eax
    jne L1
    push dword ptr [esi + 8]
    mov ecx, ebx
    push dword ptr [edi + 8]
    call L3
    test eax, eax
    je L2
    mov edi, dword ptr [edi + 0xc]
    mov esi, dword ptr [esi + 0xc]
    jmp L4
    test esi, esi
    je L2
    cmp eax, dword ptr [esi + 4]
    jne L2
    sub eax, 6
    je L5
    dec eax
    dec eax
    je L6
    dec eax
    je L7
    dec eax
    dec eax
    jne L2
    mov esi, dword ptr [esi + 0x20]
    mov edi, dword ptr [edi + 0x20]
    jmp L4
    mov eax, dword ptr [edi + 0x14]
    cmp eax, dword ptr [esi + 0x14]
    jne L2
    mov esi, dword ptr [esi + 0x10]
    mov edi, dword ptr [edi + 0x10]
    jmp L4
    mov esi, dword ptr [esi + 0x18]
    mov edi, dword ptr [edi + 0x18]
    jmp L4
    xor eax, eax
    test esi, esi
    sete al
    jmp L8
    mov eax, dword ptr [edi + 0x10]
    cmp eax, dword ptr [esi + 0x10]
    jne L2
    mov eax, dword ptr [edi + 0x14]
    cmp eax, dword ptr [esi + 0x14]
    jne L2
    mov eax, dword ptr [edi + 0x18]
    cmp eax, dword ptr [esi + 0x18]
    jne L2
    mov eax, dword ptr [edi + 0x1c]
    cmp eax, dword ptr [esi + 0x1c]
    jne L2
    xor eax, eax
    inc eax
    jmp L8
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_10099bdd ENDP
END