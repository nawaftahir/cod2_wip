; FUN_100b3f49 @ 0x100b3f49 — auto-synthesized
.CODE
FUN_100b3f49 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    sub edx, dword ptr [ebp + 0xc]
    and dword ptr [ebp + 8], 0
    push ebx
    push esi
    mov ecx, 0x101a4218
    push edi
    mov eax, dword ptr [ebp + 0xc]
    xor edi, edi
    push 4
    inc edi
    pop esi
    mov ebx, dword ptr [edx + eax]
    cmp ebx, dword ptr [ecx]
    je L0
    cmp dword ptr [eax], -1
    je L0
    xor edi, edi
    add ecx, 4
    add eax, 4
    dec esi
    jne L1
    test edi, edi
    jne L2
    add dword ptr [ebp + 8], 0x10
    cmp dword ptr [ebp + 8], 0x80
    jb L3
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    xor eax, eax
    inc eax
    jmp L4
FUN_100b3f49 ENDP
END