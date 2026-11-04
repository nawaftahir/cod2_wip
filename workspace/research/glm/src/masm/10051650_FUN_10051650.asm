.686
.MODEL FLAT, C
.CODE
FUN_10051650 PROC
    mov eax, dword ptr [esi + 4]
    push edi
    push 28
    push 1
    push esi
    call dword ptr [eax]
    mov edi, eax
    xor eax, eax
    mov dword ptr [esi + 000000194h], edi
    mov dword ptr [edi], 010051390h
    mov dword ptr [edi + 8], eax
    mov dword ptr [edi + 12], eax
    mov cl, byte ptr [esi + 82]
    add esp, 12
    cmp cl, al
    je L1
    cmp byte ptr [esp + 8], al
    mov ecx, dword ptr [esi + 00000011Ch]
    mov dword ptr [edi + 16], ecx
    je L0
    mov edx, dword ptr [esi + 104]
    push ebx
    push ebp
    lea ebp, [edx + ecx - 1]
    mov eax, ebp
    cdq
    idiv ecx
    mov eax, dword ptr [esi + 108]
    imul eax, dword ptr [esi + 100]
    mov ebx, dword ptr [esi + 4]
    push ecx
    sub ebp, edx
    push ebp
    push eax
    push 0
    push 1
    push esi
    call dword ptr [ebx + 0x10]
    add esp, 24
    pop ebp
    pop ebx
    mov dword ptr [edi + 8], eax
    pop edi
    ret
L0:
    mov eax, dword ptr [esi + 108]
    imul eax, dword ptr [esi + 100]
    mov edx, dword ptr [esi + 4]
    push ecx
    push eax
    push 1
    push esi
    call dword ptr [edx + 8]
    add esp, 16
    mov dword ptr [edi + 12], eax
L1:
    pop edi
    ret
FUN_10051650 ENDP
END
