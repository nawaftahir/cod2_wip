; FUN_10067789 @ 0x10067789 — auto-synthesized
.CODE
FUN_10067789 PROC
    mov edi, edi
    push ebx
    push esi
    mov esi, dword ptr [ecx + 4]
    cmp dword ptr [ecx], esi
    jae L0
    mov eax, dword ptr [ecx]
    mov bl, byte ptr [eax]
    cmp bl, 0xa
    je L1
    cmp bl, 0x5c
    jne L2
    lea edx, [eax + 1]
    cmp edx, esi
    jae L3
    cmp byte ptr [edx], 0xa
    jne L3
    add eax, 2
    jmp L4
    cmp bl, 0x5c
    jne L2
    lea edx, [eax + 2]
    cmp edx, esi
    jae L2
    cmp byte ptr [eax + 1], 0xd
    jne L2
    cmp byte ptr [edx], 0xa
    jne L2
    add eax, 3
    inc dword ptr [ecx + 0x1c]
    jmp L5
    inc eax
    mov dword ptr [ecx], eax
    cmp eax, dword ptr [ecx + 4]
    jb L6
    xor eax, eax
    pop esi
    pop ebx
    ret
    xor eax, eax
    inc eax
    jmp L7
FUN_10067789 ENDP
END