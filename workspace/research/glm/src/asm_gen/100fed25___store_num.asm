; __store_num @ 0x100fed25 — auto-synthesized
.CODE
__store_num PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, edx
    xor edx, edx
    cmp dword ptr [ebp + 8], edx
    mov dword ptr [ebp - 4], edx
    je L0
    cmp dword ptr [ecx], 1
    mov esi, dword ptr [edi]
    jbe L1
    push 0xa
    cdq
    pop ebx
    idiv ebx
    add dl, 0x30
    mov byte ptr [esi], dl
    inc esi
    dec dword ptr [ecx]
    test eax, eax
    mov edx, dword ptr [ecx]
    jle L1
    cmp edx, 1
    ja L2
    mov eax, dword ptr [edi]
    mov dword ptr [edi], esi
    dec esi
    mov dl, byte ptr [eax]
    mov cl, byte ptr [esi]
    mov byte ptr [esi], dl
    dec esi
    mov byte ptr [eax], cl
    inc eax
    cmp eax, esi
    jb L3
    jmp L4
    cmp esi, dword ptr [ecx]
    jae L5
    dec esi
    lea edx, [esi + 1]
    test edx, edx
    je L6
    push 0xa
    cdq
    pop ebx
    idiv ebx
    mov ebx, dword ptr [edi]
    add dl, 0x30
    inc dword ptr [ebp - 4]
    mov byte ptr [esi + ebx], dl
    dec esi
    cmp esi, -1
    jne L7
    mov eax, dword ptr [ebp - 4]
    add dword ptr [edi], eax
    sub dword ptr [ecx], eax
    jmp L4
    mov dword ptr [ecx], edx
    pop esi
    pop ebx
    leave
    ret
__store_num ENDP
END