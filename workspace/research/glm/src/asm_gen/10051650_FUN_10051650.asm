; FUN_10051650 @ 0x10051650 — auto-synthesized
.CODE
FUN_10051650 PROC
    mov eax, dword ptr [esi + 4]
    push edi
    push 0x1c
    push 1
    push esi
    call dword ptr [eax]
    mov edi, eax
    xor eax, eax
    mov dword ptr [esi + 0x194], edi
    mov dword ptr [edi], 0x10051390
    mov dword ptr [edi + 8], eax
    mov dword ptr [edi + 0xc], eax
    mov cl, byte ptr [esi + 0x52]
    add esp, 0xc
    cmp cl, al
    je L0
    cmp byte ptr [esp + 8], al
    mov ecx, dword ptr [esi + 0x11c]
    mov dword ptr [edi + 0x10], ecx
    je L1
    mov edx, dword ptr [esi + 0x68]
    push ebx
    push ebp
    lea ebp, [edx + ecx - 1]
    mov eax, ebp
    cdq
    idiv ecx
    mov eax, dword ptr [esi + 0x6c]
    imul eax, dword ptr [esi + 0x64]
    mov ebx, dword ptr [esi + 4]
    push ecx
    sub ebp, edx
    push ebp
    push eax
    push 0
    push 1
    push esi
    call dword ptr [ebx + 0x10]
    add esp, 0x18
    pop ebp
    pop ebx
    mov dword ptr [edi + 8], eax
    pop edi
    ret
    mov eax, dword ptr [esi + 0x6c]
    imul eax, dword ptr [esi + 0x64]
    mov edx, dword ptr [esi + 4]
    push ecx
    push eax
    push 1
    push esi
    call dword ptr [edx + 8]
    add esp, 0x10
    mov dword ptr [edi + 0xc], eax
    pop edi
    ret
FUN_10051650 ENDP
END