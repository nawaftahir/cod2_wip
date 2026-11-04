; FUN_10084323 @ 0x10084323 — auto-synthesized
.CODE
FUN_10084323 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x10]
    test edi, edi
    jne L0
    lea edi, [ebp + 8]
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 4]
    cmp eax, 9
    jne L1
    mov ecx, dword ptr [esi + 0x10]
    xor eax, eax
    inc eax
    cmp ecx, eax
    je L2
    test ecx, ecx
    je L2
    cmp ecx, 2
    jne L3
    mov eax, dword ptr [esi + 0x1c]
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 0x18]
    jmp L4
    cmp ecx, 3
    jne L5
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov dword ptr [edi], eax
    jmp L6
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 0x1c]
    jmp L4
    cmp eax, 8
    jne L7
    push edi
    mov edi, dword ptr [ebp + 0xc]
    push edi
    push dword ptr [esi + 0x10]
    call L8
    test eax, eax
    jl L9
    mov eax, dword ptr [esi + 0x14]
    imul eax, dword ptr [edi]
    jmp L4
    cmp eax, 1
    jne L5
    mov ebx, dword ptr [ebp + 0xc]
    and dword ptr [ebx], 0
    and dword ptr [edi], 0
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 0x18]
    lea ecx, [ebp + 0xc]
    push ecx
    lea ecx, [ebp + 0x10]
    push ecx
    push dword ptr [eax + 0x20]
    call L8
    test eax, eax
    jl L9
    mov eax, dword ptr [ebp + 0x10]
    add dword ptr [ebx], eax
    mov eax, dword ptr [edi]
    cmp dword ptr [ebp + 0xc], eax
    jbe L10
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edi], eax
    mov esi, dword ptr [esi + 0xc]
    test esi, esi
    jne L11
    xor eax, eax
    jmp L9
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_10084323 ENDP
END