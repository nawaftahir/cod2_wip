; FUN_10069851 @ 0x10069851 — auto-synthesized
    sub_100f78b4 PROTO C
    sub_100f78e0 PROTO C
.CODE
FUN_10069851 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 0x5c]
    mov ecx, dword ptr [ebp + 8]
    lea edx, [ecx + eax]
    mov eax, dword ptr [ebx + 0x60]
    cmp edx, eax
    push edi
    jbe L0
    test eax, eax
    mov dword ptr [ebp + 8], eax
    jne L1
    mov dword ptr [ebp + 8], 0x100
    cmp edx, dword ptr [ebp + 8]
    jbe L2
    mov eax, dword ptr [ebx + 0x5c]
    add eax, ecx
    mov ecx, dword ptr [ebp + 8]
    add ecx, ecx
    cmp eax, ecx
    mov dword ptr [ebp + 8], ecx
    ja L3
    mov eax, dword ptr [ebp + 8]
    shl eax, 2
    push eax
    call sub_100f78b4
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L4
    mov eax, 0x8007000e
    jmp L5
    mov ecx, dword ptr [ebx + 0x5c]
    shl ecx, 2
    mov eax, ecx
    push esi
    mov esi, dword ptr [ebx + 0x58]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 0x58]
    call sub_100f78e0
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx + 0x58], eax
    mov eax, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [ebx + 0x60], eax
    pop esi
    xor eax, eax
    pop edi
    pop ebx
    leave
    ret 4
FUN_10069851 ENDP
END