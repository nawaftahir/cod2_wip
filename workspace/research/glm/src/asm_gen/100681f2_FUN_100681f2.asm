; FUN_100681f2 @ 0x100681f2 — auto-synthesized
    sub_10067ccf PROTO C
    sub_100f8613 PROTO C
    sub_100f862e PROTO C
.CODE
FUN_100681f2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push edi
    mov edi, ecx
    cmp ebx, dword ptr [edi + 4]
    jae L0
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100f8613
    test eax, eax
    pop ecx
    je L0
    push esi
    xor esi, esi
    mov eax, ebx
    cmp eax, dword ptr [edi + 4]
    mov dword ptr [ebp - 4], esi
    jae L1
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100f862e
    test eax, eax
    pop ecx
    je L1
    cmp esi, 0x19999999
    jbe L2
    mov dword ptr [ebp - 4], 1
    movsx ecx, byte ptr [ebx]
    lea eax, [esi + esi*4]
    shl eax, 1
    lea esi, [ecx + eax - 0x30]
    cmp esi, eax
    jae L3
    mov dword ptr [ebp - 4], 1
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L4
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L5
    mov dword ptr [eax], esi
    cmp dword ptr [ebp - 4], 0
    pop esi
    je L6
    push 0x1010cb58
    push 0x3ec
    lea eax, [edi + 8]
    push eax
    push dword ptr [edi + 0x30]
    call sub_10067ccf
    add esp, 0x10
    mov eax, ebx
    sub eax, dword ptr [ebp + 8]
    jmp L7
    xor eax, eax
    pop edi
    pop ebx
    leave
    ret 8
FUN_100681f2 ENDP
END