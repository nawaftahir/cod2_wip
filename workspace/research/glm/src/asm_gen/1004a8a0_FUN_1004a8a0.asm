; FUN_1004a8a0 @ 0x1004a8a0 — auto-synthesized
    sub_100f6c84 PROTO C
    sub_100f7207 PROTO C
.CODE
FUN_1004a8a0 PROC
    push ebx
    push esi
    push edi
    mov edi, dword ptr [esp + 0x10]
    mov ebx, dword ptr [edi + 0x20]
    mov eax, dword ptr [ebx + 4]
    mov esi, 0x1000
    sub esi, eax
    je L0
    mov eax, dword ptr [ebx + 0x14]
    mov ecx, dword ptr [ebx + 0x18]
    push eax
    push esi
    push 1
    push ecx
    call sub_100f7207
    add esp, 0x10
    cmp eax, esi
    je L0
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 0x14], 0x25
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
    mov ecx, dword ptr [ebx + 0x14]
    push ecx
    call sub_100f6c84
    mov edx, dword ptr [ebx + 0x14]
    mov al, byte ptr [edx + 0xc]
    add esp, 4
    test al, 0x20
    je L1
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 0x14], 0x25
    mov ecx, dword ptr [edi]
    push edi
    call dword ptr [ecx]
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
FUN_1004a8a0 ENDP
END