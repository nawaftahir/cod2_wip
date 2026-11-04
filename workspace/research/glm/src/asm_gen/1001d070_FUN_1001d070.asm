; FUN_1001d070 @ 0x1001d070 — auto-synthesized
    sub_1001d27e PROTO C
    sub_1001d293 PROTO C
    sub_1001d2a9 PROTO C
    sub_1001d2b9 PROTO C
    sub_1001d2d2 PROTO C
.CODE
FUN_1001d070 PROC
    push ecx
    push esi
    mov esi, dword ptr [esp + 0x10]
    push edi
    mov edi, eax
    mov ecx, esi
    sub ecx, edi
    mov eax, 0x2aaaaaab
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    cmp eax, 0x28
    jle L0
    inc eax
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    push ebx
    lea ebx, [eax + eax*2]
    push ebp
    lea ebp, [eax + eax*2]
    mov eax, dword ptr [esp + 0x20]
    shl ebx, 2
    shl ebp, 3
    lea esi, [ebx + edi]
    push eax
    lea eax, [edi + ebp]
    mov dword ptr [esp + 0x14], esi
    call sub_1001d27e
    mov esi, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [esp + 0x24]
    mov edi, esi
    push ecx
    lea eax, [ebx + esi]
    sub edi, ebx
    call sub_1001d293
    mov eax, dword ptr [esp + 0x24]
    mov esi, eax
    sub esi, ebx
    mov ebx, dword ptr [esp + 0x28]
    mov edi, eax
    push ebx
    sub edi, ebp
    call sub_1001d2a9
    mov edi, dword ptr [esp + 0x1c]
    mov eax, esi
    mov esi, dword ptr [esp + 0x24]
    push ebx
    call sub_1001d2b9
    add esp, 0x10
    pop ebp
    pop ebx
    pop edi
    pop esi
    pop ecx
    ret
    mov edx, dword ptr [esp + 0x18]
    mov eax, esi
    mov esi, dword ptr [esp + 0x10]
    push edx
    call sub_1001d2d2
    add esp, 4
    pop edi
    pop esi
    pop ecx
    ret
FUN_1001d070 ENDP
END