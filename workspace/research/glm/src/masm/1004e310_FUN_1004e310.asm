.686
.MODEL FLAT, C
.CODE
FUN_1004e310 PROC
    sub esp, 000000128h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 000000134h]
    push esi
    push edi
    mov edi, dword ptr [ebp + 32]
    mov esi, dword ptr [edi + 4]
    test esi, esi
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 48], edi
    jne L0
    push ebp
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L18
    mov eax, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 16], eax
    mov esi, eax
L0:
    xor eax, eax
    mov ah, byte ptr [ebx]
    dec esi
    inc ebx
    test esi, esi
    mov dword ptr [esp + 20], eax
    jne L1
    push ebp
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L18
    mov ecx, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov eax, dword ptr [esp + 20]
    mov dword ptr [esp + 16], ecx
    mov esi, ecx
L1:
    movzx edx, byte ptr [ebx]
    add eax, edx
    dec esi
    sub eax, 2
    inc ebx
    cmp eax, 16
    mov dword ptr [esp + 20], eax
    jle L16
    mov edi, edi
L2:
    test esi, esi
    jne L3
    push ebp
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L18
    mov eax, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 16], eax
    mov esi, eax
L3:
    movzx eax, byte ptr [ebx]
    mov ecx, dword ptr [ebp]
    mov dword ptr [ecx + 20], 80
    mov edx, dword ptr [ebp]
    mov dword ptr [esp + 52], eax
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [ebp]
    push 1
    dec esi
    push ebp
    inc ebx
    call dword ptr [eax + 4]
    add esp, 8
    mov byte ptr [esp + 28], 0
    mov dword ptr [esp + 24], 0
    mov edi, 1
L4:
    test esi, esi
    jne L5
    mov esi, dword ptr [esp + 48]
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L18
    mov ecx, dword ptr [esi + 4]
    mov ebx, dword ptr [esi]
    mov dword ptr [esp + 16], ecx
    mov esi, ecx
L5:
    mov dl, byte ptr [ebx]
    mov byte ptr [esp + edi + 28], dl
    movzx eax, dl
    mov edx, dword ptr [esp + 24]
    dec esi
    add edx, eax
    inc ebx
    inc edi
    cmp edi, 16
    mov dword ptr [esp + 16], esi
    mov dword ptr [esp + 24], edx
    jle L4
    mov eax, dword ptr [ebp]
    mov edx, dword ptr [esp + 20]
    movzx ecx, byte ptr [esp + 29]
    sub edx, 17
    add eax, 24
    mov dword ptr [esp + 20], edx
    movzx edx, byte ptr [esp + 30]
    mov dword ptr [eax], ecx
    movzx ecx, byte ptr [esp + 31]
    mov dword ptr [eax + 4], edx
    movzx edx, byte ptr [esp + 32]
    mov dword ptr [eax + 8], ecx
    movzx ecx, byte ptr [esp + 33]
    mov dword ptr [eax + 12], edx
    movzx edx, byte ptr [esp + 34]
    mov dword ptr [eax + 16], ecx
    movzx ecx, byte ptr [esp + 35]
    mov dword ptr [eax + 20], edx
    movzx edx, byte ptr [esp + 36]
    mov dword ptr [eax + 24], ecx
    mov dword ptr [eax + 28], edx
    mov eax, dword ptr [ebp]
    mov edi, 86
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [ebp]
    push 2
    push ebp
    call dword ptr [ecx + 4]
    mov eax, dword ptr [ebp]
    movzx edx, byte ptr [esp + 45]
    movzx ecx, byte ptr [esp + 46]
    add eax, 24
    mov dword ptr [eax], edx
    movzx edx, byte ptr [esp + 47]
    mov dword ptr [eax + 4], ecx
    movzx ecx, byte ptr [esp + 48]
    mov dword ptr [eax + 8], edx
    movzx edx, byte ptr [esp + 49]
    mov dword ptr [eax + 12], ecx
    movzx ecx, byte ptr [esp + 50]
    mov dword ptr [eax + 16], edx
    movzx edx, byte ptr [esp + 51]
    mov dword ptr [eax + 20], ecx
    movzx ecx, byte ptr [esp + 52]
    mov dword ptr [eax + 24], edx
    mov dword ptr [eax + 28], ecx
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [ebp]
    push 2
    push ebp
    call dword ptr [eax + 4]
    mov eax, dword ptr [esp + 40]
    add esp, 16
    cmp eax, 000000100h
    jg L6
    cmp eax, dword ptr [esp + 20]
    jle L7
L6:
    mov ecx, dword ptr [ebp]
    mov dword ptr [ecx + 20], 8
    mov edx, dword ptr [ebp]
    push ebp
    call dword ptr [edx]
    add esp, 4
L7:
    mov eax, dword ptr [esp + 24]
    xor edi, edi
    test eax, eax
    jle L10
    nop
L8:
    test esi, esi
    jne L9
    mov esi, dword ptr [esp + 48]
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L18
    mov eax, dword ptr [esi + 4]
    mov ebx, dword ptr [esi]
    mov dword ptr [esp + 16], eax
    mov esi, eax
    mov eax, dword ptr [esp + 24]
L9:
    mov cl, byte ptr [ebx]
    dec esi
    inc ebx
    mov byte ptr [esp + edi + 56], cl
    inc edi
    cmp edi, eax
    mov dword ptr [esp + 16], esi
    jl L8
L10:
    mov edx, dword ptr [esp + 20]
    sub edx, eax
    mov eax, dword ptr [esp + 52]
    test al, 16
    mov dword ptr [esp + 20], edx
    je L11
    sub eax, 16
    lea esi, [ebp + eax*4 + 0000000B8h]
    jmp L12
L11:
    lea esi, [ebp + eax*4 + 0000000A8h]
L12:
    test eax, eax
    jl L13
    cmp eax, 4
    jl L14
L13:
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 20], 30
    mov ecx, dword ptr [ebp]
    mov dword ptr [ecx + 24], eax
    mov edx, dword ptr [ebp]
    push ebp
    call dword ptr [edx]
    add esp, 4
L14:
    cmp dword ptr [esi], 0
    jne L15
    mov eax, dword ptr [ebp + 4]
    push 000000112h
    push 0
    push ebp
    call dword ptr [eax]
    mov byte ptr [eax + 000000111h], 0
    add esp, 12
    mov dword ptr [esi], eax
L15:
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 32]
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esp + 36]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 40]
    mov dword ptr [ecx + 8], edx
    mov dl, byte ptr [esp + 44]
    mov dword ptr [ecx + 12], eax
    mov eax, dword ptr [esp + 20]
    mov byte ptr [ecx + 16], dl
    mov edi, dword ptr [esi]
    add edi, 17
    cmp eax, 16
    mov ecx, 64
    lea esi, [esp + 56]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [esp + 48]
    mov esi, dword ptr [esp + 16]
    jg L2
L16:
    test eax, eax
    je L17
    mov eax, dword ptr [ebp]
    mov dword ptr [eax + 20], 11
    mov ecx, dword ptr [ebp]
    push ebp
    call dword ptr [ecx]
    add esp, 4
L17:
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 4], esi
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 000000128h
    ret
L18:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 000000128h
    ret
FUN_1004e310 ENDP
END
