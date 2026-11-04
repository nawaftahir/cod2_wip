; FUN_1006e26a @ 0x1006e26a — auto-synthesized
    sub_1006c477 PROTO C
    sub_1006db5d PROTO C
.CODE
FUN_1006e26a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 8]
    cmp ebx, dword ptr [eax + 8]
    mov esi, ebx
    jae L0
    mov eax, dword ptr [eax + 0x14]
    mov ecx, dword ptr [eax + esi*4]
    test ecx, ecx
    je L1
    push 1
    call sub_1006db5d
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 0x14]
    and dword ptr [eax + esi*4], 0
    mov eax, dword ptr [edi + 8]
    inc esi
    cmp esi, dword ptr [eax + 8]
    jb L2
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax + 8], ebx
    mov ebx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [edi + 8]
    cmp ebx, dword ptr [eax + 0xc]
    mov esi, ebx
    jae L3
    mov eax, dword ptr [eax + 0x18]
    mov ecx, dword ptr [eax + esi*4]
    test ecx, ecx
    je L4
    push 1
    call sub_1006c477
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 0x18]
    and dword ptr [eax + esi*4], 0
    mov eax, dword ptr [edi + 8]
    inc esi
    cmp esi, dword ptr [eax + 0xc]
    jb L5
    mov eax, dword ptr [edi + 8]
    mov esi, dword ptr [ebp + 0x10]
    mov dword ptr [eax + 0xc], ebx
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [eax + 0x18]
    mov edi, dword ptr [edi + 0x18]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    pop ebp
    ret 0xc
FUN_1006e26a ENDP
END