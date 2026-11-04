; FUN_1006796f @ 0x1006796f — auto-synthesized
    sub_10082712 PROTO C
    sub_100f855c PROTO C
    sub_100f8714 PROTO C
.CODE
FUN_1006796f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    cmp ebx, dword ptr [esi + 4]
    push edi
    jae L0
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100f855c
    test eax, eax
    pop ecx
    jne L1
    cmp byte ptr [ebx], 0x5f
    jne L0
    lea edi, [ebx + 1]
    jmp L2
    movsx eax, byte ptr [edi]
    push eax
    call sub_100f8714
    test eax, eax
    pop ecx
    jne L3
    cmp byte ptr [edi], 0x5f
    jne L4
    inc edi
    cmp edi, dword ptr [esi + 4]
    jb L5
    mov ecx, dword ptr [esi + 0x2c]
    sub edi, ebx
    mov ebx, edi
    push 1
    lea eax, [ebx + 1]
    push eax
    call sub_10082712
    test eax, eax
    je L0
    mov esi, dword ptr [ebp + 8]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp + 0xc]
    mov byte ptr [eax + ebx], 0
    mov dword ptr [ecx], eax
    mov eax, ebx
    jmp L6
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_1006796f ENDP
END