; FUN_100b9e11 @ 0x100b9e11 — auto-synthesized
.CODE
FUN_100b9e11 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ecx + 0x14]
    inc eax
    push esi
    lea edx, [edx + eax*4]
    mov esi, dword ptr [edx]
    mov dword ptr [ebp - 4], esi
    mov esi, dword ptr [ecx + 8]
    cmp eax, esi
    mov dword ptr [ebp - 8], esi
    jae L0
    mov ecx, dword ptr [ecx + 0x10]
    push edi
    mov edi, edx
    push ebx
    mov edx, dword ptr [edi]
    mov esi, dword ptr [edx + 4]
    mov esi, dword ptr [ecx + esi*4]
    mov ebx, dword ptr [esi + 4]
    test bl, 0x10
    je L1
    test bh, 2
    je L2
    test bl, 0x20
    je L3
    mov esi, dword ptr [ebp - 4]
    mov esi, dword ptr [esi + 0x68]
    mov edx, dword ptr [edx + 0x68]
    mov ebx, dword ptr [esi + 0x24]
    cmp ebx, dword ptr [edx + 0x24]
    jne L3
    mov esi, dword ptr [esi + 0x20]
    cmp esi, dword ptr [edx + 0x20]
    jne L3
    inc eax
    add edi, 4
    cmp eax, dword ptr [ebp - 8]
    jb L4
    pop ebx
    pop edi
    mov ecx, dword ptr [ebp + 8]
    dec eax
    mov dword ptr [ecx], eax
    xor eax, eax
    pop esi
    leave
    ret 4
FUN_100b9e11 ENDP
END