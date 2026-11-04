; FUN_10083cb4 @ 0x10083cb4 — auto-synthesized
    sub_1006507e PROTO C
    sub_10083237 PROTO C
.CODE
FUN_10083cb4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push 0x50
    mov ebx, ecx
    call sub_1006507e
    test eax, eax
    je L0
    mov ecx, eax
    call sub_10083237
    mov dword ptr [ebp - 4], eax
    jmp L1
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 4]
    test eax, eax
    je L2
    mov ecx, dword ptr [ebx + 0x14]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [ebx + 0x18]
    push esi
    mov dword ptr [eax + 0x18], ecx
    mov ecx, dword ptr [ebx + 0x1c]
    push edi
    mov dword ptr [eax + 0x1c], ecx
    mov ecx, dword ptr [ebx + 0x28]
    mov dword ptr [eax + 0x28], ecx
    push 8
    lea esi, [ebx + 0x30]
    lea edi, [eax + 0x30]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    xor esi, esi
    cmp dword ptr [ebx + 0x10], esi
    je L3
    mov ecx, dword ptr [ebx + 0x10]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x10], eax
    je L4
    mov eax, ecx
    cmp dword ptr [ebx + 0x20], esi
    je L5
    mov ecx, dword ptr [ebx + 0x20]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x20], eax
    je L4
    mov eax, ecx
    cmp dword ptr [ebx + 0x24], esi
    je L6
    mov ebx, dword ptr [ebx + 0x24]
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    cmp eax, esi
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0x24], eax
    jne L7
    xor eax, eax
    jmp L6
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10083cb4 ENDP
END