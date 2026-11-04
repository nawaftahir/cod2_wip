; FUN_100997e2 @ 0x100997e2 — auto-synthesized
.CODE
FUN_100997e2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    push ebx
    push esi
    push edi
    mov edi, dword ptr [eax + 0x1c]
    test edi, edi
    je L0
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [edi + 0x10]
    mov esi, edx
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [eax]
    jne L1
    test cl, cl
    je L2
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [eax + 1]
    jne L1
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L3
    xor eax, eax
    jmp L4
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    je L5
    jge L6
    mov edi, dword ptr [edi + 8]
    jmp L7
    mov edi, dword ptr [edi + 0xc]
    test edi, edi
    jne L8
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    mov eax, dword ptr [edi + 0x14]
    jmp L9
FUN_100997e2 ENDP
END