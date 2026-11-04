; FUN_1000e280 @ 0x1000e280 — auto-synthesized
    sub_1000e81e PROTO C
.CODE
FUN_1000e280 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L0
    push esi
    lea esi, [edi + 4]
    cmp esi, eax
    je L1
    push ebx
    push ebp
    lea ebp, [esi + 4]
    jmp L2
    mov edi, dword ptr [esp + 0x14]
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [esi]
    mov ebx, dword ptr [esp + 0x1c]
    push eax
    push ecx
    call ebx
    add esp, 8
    test eax, eax
    je L3
    cmp edi, esi
    je L4
    cmp esi, ebp
    je L4
    push edi
    jmp L5
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    lea edi, [ebp - 8]
    push edx
    push eax
    call ebx
    add esp, 8
    test eax, eax
    je L4
    mov ecx, dword ptr [edi - 4]
    mov edx, dword ptr [esi]
    mov ebx, edi
    sub edi, 4
    push ecx
    push edx
    call dword ptr [esp + 0x24]
    add esp, 8
    test eax, eax
    jne L6
    cmp ebx, esi
    je L4
    cmp esi, ebp
    je L4
    push ebx
    mov eax, esi
    mov ebx, ebp
    call sub_1000e81e
    add esp, 4
    mov eax, dword ptr [esp + 0x18]
    add esi, 4
    add ebp, 4
    cmp esi, eax
    jne L7
    pop ebp
    pop ebx
    pop esi
    pop edi
    ret
FUN_1000e280 ENDP
END