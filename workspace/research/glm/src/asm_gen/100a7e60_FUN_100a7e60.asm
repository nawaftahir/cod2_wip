; FUN_100a7e60 @ 0x100a7e60 — auto-synthesized
.CODE
FUN_100a7e60 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    xor edx, edx
    cmp dword ptr [eax], edx
    push esi
    jne L0
    cmp dword ptr [eax + 4], edx
    jne L0
    cmp dword ptr [eax + 8], edx
    jne L0
    mov ecx, dword ptr [eax + 0xc]
    cmp ecx, -1
    je L1
    cmp ecx, edx
    je L1
    mov ecx, dword ptr [ebp + 0xc]
    and ecx, 0xffff
    cmp ecx, 0x104
    jne L2
    cmp dword ptr [eax + edx*4], -1
    jne L3
    inc edx
    cmp edx, 4
    jb L4
    cmp edx, 4
    mov esi, edx
    jae L1
    mov ecx, dword ptr [eax + esi*4]
    cmp ecx, -1
    je L5
    cmp dword ptr [eax + edx*4], ecx
    ja L2
    inc esi
    cmp esi, 4
    jb L6
    xor eax, eax
    inc eax
    jmp L7
    xor eax, eax
    pop esi
    pop ebp
    ret 8
FUN_100a7e60 ENDP
END