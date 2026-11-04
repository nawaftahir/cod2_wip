; FUN_1001cf30 @ 0x1001cf30 — auto-synthesized
    sub_1001d397 PROTO C
.CODE
FUN_1001cf30 PROC
    sub esp, 0xc
    push ebx
    mov ebx, eax
    push ebp
    push esi
    mov esi, ecx
    sub esi, ebx
    mov eax, 0x2aaaaaab
    imul esi
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    cmp eax, 1
    push edi
    jle L0
    lea eax, [ebx + esi - 0xc]
    mov edi, eax
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [edi + 4]
    mov edi, dword ptr [edi + 8]
    mov dword ptr [esp + 0x18], edi
    mov edi, ebx
    mov ebp, dword ptr [edi]
    mov dword ptr [eax], ebp
    mov ebp, dword ptr [edi + 4]
    mov dword ptr [eax + 4], ebp
    mov edi, dword ptr [edi + 8]
    mov dword ptr [eax + 8], edi
    mov eax, dword ptr [esp + 0x20]
    push eax
    sub esp, 0xc
    mov eax, esp
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 0x28]
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 8], ecx
    lea ecx, [esi - 0xc]
    mov eax, 0x2aaaaaab
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    push eax
    xor eax, eax
    call sub_1001d397
    sub esi, 0xc
    mov eax, 0x2aaaaaab
    imul esi
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    add esp, 0x14
    cmp eax, 1
    jg L1
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0xc
    ret
FUN_1001cf30 ENDP
END