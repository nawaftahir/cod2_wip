; FUN_100c40ff @ 0x100c40ff — auto-synthesized
    sub_100f78bc PROTO C
    sub_100f78f1 PROTO C
.CODE
FUN_100c40ff PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 0x114]
    test ecx, ecx
    push edi
    mov dword ptr [ebp - 4], ecx
    jne L0
    mov dword ptr [ebp - 4], 0x400
    mov edx, dword ptr [ebx + 0x110]
    mov eax, dword ptr [ebp + 8]
    add edx, eax
    cmp edx, dword ptr [ebp - 4]
    jbe L1
    mov edx, dword ptr [ebx + 0x110]
    add eax, edx
    mov edx, dword ptr [ebp - 4]
    add edx, edx
    cmp eax, edx
    mov dword ptr [ebp - 4], edx
    ja L2
    mov eax, dword ptr [ebp - 4]
    cmp eax, ecx
    je L3
    shl eax, 2
    push eax
    call sub_100f78bc
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp + 8], edi
    jne L4
    mov eax, 0x8007000e
    jmp L5
    mov ecx, dword ptr [ebx + 0x110]
    shl ecx, 2
    mov eax, ecx
    push esi
    mov esi, dword ptr [ebx + 0x10c]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 0x10c]
    call sub_100f78f1
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebx + 0x10c], eax
    mov eax, dword ptr [ebp - 4]
    pop ecx
    mov dword ptr [ebx + 0x114], eax
    pop esi
    xor eax, eax
    pop edi
    pop ebx
    leave
    ret 4
FUN_100c40ff ENDP
END