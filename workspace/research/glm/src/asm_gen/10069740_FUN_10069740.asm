; FUN_10069740 @ 0x10069740 — auto-synthesized
    sub_10067cc2 PROTO C
.CODE
FUN_10069740 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, dword ptr [eax + 8]
    push edi
    xor edi, edi
    cmp esi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 8], edi
    mov eax, esi
    je L0
    cmp byte ptr [esi], 0
    je L0
    mov dword ptr [ebp - 4], 0x10
    mov dl, byte ptr [eax]
    test dl, dl
    je L1
    movsx edx, dl
    cmp edx, 0x77
    jg L2
    je L3
    sub edx, 0x61
    je L3
    dec edx
    je L4
    sub edx, 5
    je L5
    sub edx, 0xb
    jne L6
    xor edi, edi
    inc eax
    mov ecx, dword ptr [ebp - 4]
    add dword ptr [ebp - 4], 2
    mov edx, edi
    shl edx, cl
    or dword ptr [ebp - 8], edx
    cmp dword ptr [ebp - 4], 0x18
    jb L7
    cmp byte ptr [eax], 0
    je L8
    push esi
    push 0x1010ed10
    push 0x7d4
    push dword ptr [ebp + 8]
    push dword ptr [ebx]
    call sub_10067cc2
    add esp, 0x14
    mov dword ptr [ebx + 0x4c], 1
    xor eax, eax
    jmp L9
    push 3
    pop edi
    jmp L10
    sub edx, 0x78
    je L11
    dec edx
    je L5
    dec edx
    jne L6
    push 2
    jmp L12
    xor edi, edi
    inc edi
    jmp L10
    mov eax, dword ptr [ebp - 8]
    jmp L9
    mov eax, 0xe40000
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_10069740 ENDP
END