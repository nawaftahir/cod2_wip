.686
.MODEL FLAT, C
.CODE
FUN_1004e8a0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov esi, dword ptr [ebp + 32]
    mov ebx, dword ptr [esi + 4]
    test ebx, ebx
    push edi
    mov edi, dword ptr [esi]
    jne L0
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L4
    mov edi, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
L0:
    xor eax, eax
    mov ah, byte ptr [edi]
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esp + 20], eax
    jne L1
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L4
    mov edi, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
    mov eax, dword ptr [esp + 20]
L1:
    movzx ecx, byte ptr [edi]
    dec ebx
    add eax, ecx
    inc edi
    cmp eax, 4
    je L2
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 20], 11
    mov eax, dword ptr [ebp]
    push ebp
    call dword ptr [eax]
    add esp, 4
L2:
    test ebx, ebx
    jne L3
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L4
    mov edi, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
L3:
    xor ecx, ecx
    mov ch, byte ptr [edi]
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esp + 20], ecx
    jne L6
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    jne L5
L4:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L5:
    mov edi, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
L6:
    movzx edx, byte ptr [edi]
    mov ecx, dword ptr [ebp]
    mov eax, dword ptr [esp + 20]
    add eax, edx
    mov dword ptr [ecx + 20], 82
    mov edx, dword ptr [ebp]
    mov dword ptr [esp + 20], eax
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [ebp]
    push 1
    push ebp
    call dword ptr [eax + 4]
    mov ecx, dword ptr [esp + 28]
    add esp, 8
    inc edi
    mov dword ptr [ebp + 000000104h], ecx
    mov dword ptr [esi], edi
    dec ebx
    pop edi
    mov dword ptr [esi + 4], ebx
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1004e8a0 ENDP
END
