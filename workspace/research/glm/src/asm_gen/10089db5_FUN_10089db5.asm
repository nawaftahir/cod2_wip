; FUN_10089db5 @ 0x10089db5 — auto-synthesized
.CODE
FUN_10089db5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ecx + 0x14]
    shl edx, 2
    shl eax, 2
    push edi
    mov edi, dword ptr [edx + esi]
    mov esi, dword ptr [esi + eax]
    mov esi, dword ptr [esi + 4]
    cmp esi, dword ptr [edi + 4]
    jne L0
    mov esi, dword ptr [ecx + 0x14]
    mov edi, dword ptr [esi + edx]
    mov esi, dword ptr [esi + eax]
    mov esi, dword ptr [esi + 8]
    cmp esi, dword ptr [edi + 8]
    jne L0
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ecx + eax]
    mov edx, dword ptr [ecx + edx]
    mov eax, dword ptr [eax + 0xc]
    cmp eax, dword ptr [edx + 0xc]
    jne L0
    xor eax, eax
    inc eax
    jmp L1
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_10089db5 ENDP
END