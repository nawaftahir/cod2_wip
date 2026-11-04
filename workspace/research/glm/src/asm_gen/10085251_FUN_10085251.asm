; FUN_10085251 @ 0x10085251 — auto-synthesized
    sub_1006507f PROTO C
    sub_1008515e PROTO C
.CODE
FUN_10085251 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push 0x60
    mov ebx, ecx
    call sub_1006507f
    test eax, eax
    je L0
    mov ecx, eax
    call sub_1008515e
    mov dword ptr [ebp - 4], eax
    jmp L1
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 4]
    test eax, eax
    je L2
    push esi
    push edi
    push 8
    lea esi, [ebx + 0x10]
    lea edi, [eax + 0x10]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [ebx + 0x30]
    mov dword ptr [eax + 0x30], ecx
    mov ecx, dword ptr [ebx + 0x34]
    mov dword ptr [eax + 0x34], ecx
    mov ecx, dword ptr [ebx + 0x38]
    mov dword ptr [eax + 0x38], ecx
    mov ecx, dword ptr [ebx + 0x54]
    mov dword ptr [eax + 0x54], ecx
    mov ecx, dword ptr [ebx + 0x58]
    xor esi, esi
    mov dword ptr [eax + 0x58], ecx
    cmp dword ptr [ebx + 0x3c], esi
    je L3
    mov ecx, dword ptr [ebx + 0x3c]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x3c], eax
    je L4
    mov eax, ecx
    cmp dword ptr [ebx + 0x40], esi
    je L5
    mov ecx, dword ptr [ebx + 0x40]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x40], eax
    je L4
    mov eax, ecx
    mov edi, eax
    mov dword ptr [ebp - 8], esi
    lea esi, [ebx + 0x44]
    sub edi, ebx
    cmp dword ptr [esi], 0
    je L6
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [edi + esi], eax
    je L4
    mov eax, dword ptr [ebp - 4]
    inc dword ptr [ebp - 8]
    add esi, 4
    cmp dword ptr [ebp - 8], 4
    jb L7
    jmp L8
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10085251 ENDP
END