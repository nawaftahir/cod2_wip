; FUN_1006508a @ 0x1006508a — auto-synthesized
.CODE
FUN_1006508a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    push edi
    xor eax, eax
    xor edi, edi
    xor edx, edx
    test ecx, ecx
    je L0
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp + 0xc], ecx
    mov ecx, dword ptr [ebp + 0x10]
    cmp byte ptr [esi], 0x22
    jne L1
    test ecx, ecx
    je L2
    mov byte ptr [eax + ecx], 0x5c
    inc eax
    test edi, edi
    jne L1
    xor ebx, ebx
    test edx, edx
    sete bl
    mov edx, ebx
    xor edi, edi
    test edx, edx
    je L3
    cmp byte ptr [esi], 0x5c
    jne L3
    test ecx, ecx
    je L4
    mov byte ptr [eax + ecx], 0x5c
    xor edi, edi
    inc eax
    inc edi
    test ecx, ecx
    je L5
    mov bl, byte ptr [esi]
    mov byte ptr [eax + ecx], bl
    inc eax
    inc esi
    dec dword ptr [ebp + 0xc]
    jne L6
    pop esi
    pop ebx
    pop edi
    pop ebp
    ret 0xc
FUN_1006508a ENDP
END