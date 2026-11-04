; FUN_100a7ec8 @ 0x100a7ec8 — auto-synthesized
.CODE
FUN_100a7ec8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp + 0x10], 0
    push ebx
    push esi
    push edi
    jbe L0
    mov edi, dword ptr [ebp + 8]
    sub edi, dword ptr [ebp + 0xc]
    mov ecx, 0x101a4020
    mov eax, dword ptr [ebp + 0xc]
    xor esi, esi
    push 4
    inc esi
    pop edx
    mov ebx, dword ptr [edi + eax]
    cmp ebx, dword ptr [ecx]
    je L1
    cmp dword ptr [eax], -1
    je L1
    xor esi, esi
    add ecx, 4
    add eax, 4
    dec edx
    jne L2
    test esi, esi
    jne L3
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 0x10]
    jb L4
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0xc
    xor eax, eax
    inc eax
    jmp L5
FUN_100a7ec8 ENDP
END