; FUN_10086b14 @ 0x10086b14 — auto-synthesized
    sub_100f7894 PROTO C
    sub_100f78c4 PROTO C
.CODE
FUN_10086b14 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    xor ebx, ebx
    cmp dword ptr [ebp + 8], ebx
    push esi
    mov dword ptr [ebp - 4], ecx
    je L0
    mov eax, dword ptr [ebp + 8]
    lea edx, [eax + 1]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L1
    sub eax, edx
    lea esi, [eax + 1]
    push esi
    call sub_100f7894
    mov ebx, eax
    test ebx, ebx
    pop ecx
    jne L2
    mov eax, 0x8007000e
    jmp L3
    mov ecx, esi
    mov esi, dword ptr [ebp + 8]
    mov eax, ecx
    push edi
    shr ecx, 2
    mov edi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    mov esi, dword ptr [ebp - 4]
    add esi, 0xd0
    push dword ptr [esi]
    call sub_100f78c4
    pop ecx
    mov dword ptr [esi], ebx
    xor eax, eax
    pop esi
    pop ebx
    leave
    ret 4
FUN_10086b14 ENDP
END