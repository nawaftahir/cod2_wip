; FUN_1006d594 @ 0x1006d594 — auto-synthesized
.CODE
FUN_1006d594 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    xor edx, edx
    cmp dword ptr [ebp + 0xc], edx
    push esi
    push edi
    jbe L0
    mov ecx, dword ptr [ecx + 8]
    mov esi, dword ptr [ecx + 8]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, esi
    jae L1
    mov edi, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edi + eax*4]
    jmp L2
    xor eax, eax
    test eax, eax
    je L3
    cmp dword ptr [eax + 0x68], 0
    je L3
    inc edx
    cmp edx, dword ptr [ebp + 0xc]
    jb L4
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebp
    ret 8
    xor eax, eax
    jmp L5
FUN_1006d594 ENDP
END