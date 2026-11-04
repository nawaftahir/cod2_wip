; FUN_10081a93 @ 0x10081a93 — auto-synthesized
    sub_100f7882 PROTO C
    sub_100f78ab PROTO C
.CODE
FUN_10081a93 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    mov ebx, ecx
    cmp eax, dword ptr [ebx + 8]
    push edi
    jbe L0
    push eax
    call sub_100f7882
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L1
    mov eax, 0x8007000e
    jmp L2
    mov ecx, dword ptr [ebx + 8]
    mov eax, ecx
    push esi
    mov esi, dword ptr [ebx + 0xc]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 0xc]
    call sub_100f78ab
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx + 0xc], eax
    mov eax, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [ebx + 8], eax
    pop esi
    xor eax, eax
    pop edi
    pop ebx
    leave
    ret 4
FUN_10081a93 ENDP
END