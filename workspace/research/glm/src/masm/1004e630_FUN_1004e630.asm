.686
.MODEL FLAT, C
.CODE
FUN_1004e630 PROC
    sub esp, 24
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [edi + 32]
    mov ebx, dword ptr [esi + 4]
    test ebx, ebx
    mov ebp, dword ptr [esi]
    mov dword ptr [esp + 16], esi
    jne L0
    push edi
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L17
    mov ebp, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
L0:
    xor eax, eax
    mov ah, byte ptr [ebp]
    dec ebx
    inc ebp
    test ebx, ebx
    mov dword ptr [esp + 12], eax
    jne L1
    push edi
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L17
    mov ebp, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
    mov eax, dword ptr [esp + 12]
L1:
    movzx ecx, byte ptr [ebp]
    add eax, ecx
    dec ebx
    sub eax, 2
    inc ebp
    test eax, eax
    mov dword ptr [esp + 12], eax
    jle L15
L2:
    test ebx, ebx
    jne L3
    push edi
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L17
    mov ebp, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
L3:
    movzx esi, byte ptr [ebp]
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 20], 81
    mov ecx, dword ptr [edi]
    mov eax, esi
    sar eax, 4
    and esi, 15
    mov dword ptr [ecx + 24], esi
    mov edx, dword ptr [edi]
    mov dword ptr [esp + 28], eax
    mov dword ptr [edx + 28], eax
    mov eax, dword ptr [edi]
    push 1
    dec ebx
    push edi
    inc ebp
    call dword ptr [eax + 4]
    add esp, 8
    cmp esi, 4
    jl L4
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 31
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 24], esi
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L4:
    mov eax, dword ptr [edi + esi*4 + 000000098h]
    test eax, eax
    jne L5
    mov ecx, dword ptr [edi + 4]
    push 000000082h
    push 0
    push edi
    call dword ptr [ecx]
    mov byte ptr [eax + 000000080h], 0
    add esp, 12
    mov dword ptr [edi + esi*4 + 000000098h], eax
L5:
    mov edx, dword ptr [edi + esi*4 + 000000098h]
    mov esi, 010191200h
    mov dword ptr [esp + 32], edx
    mov dword ptr [esp + 24], esi
L6:
    mov eax, dword ptr [esp + 28]
    test eax, eax
    je L9
    test ebx, ebx
    mov esi, dword ptr [esp + 16]
    jne L7
    push edi
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L17
    mov ebp, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
L7:
    xor eax, eax
    mov ah, byte ptr [ebp]
    dec ebx
    inc ebp
    test ebx, ebx
    mov dword ptr [esp + 20], eax
    jne L8
    push edi
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L17
    mov ebp, dword ptr [esi]
    mov ebx, dword ptr [esi + 4]
L8:
    movzx ecx, byte ptr [ebp]
    mov edx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 24]
    add edx, ecx
    jmp L11
L9:
    test ebx, ebx
    jne L10
    mov ebx, dword ptr [esp + 16]
    push edi
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L17
    mov ebp, dword ptr [ebx]
    mov ebx, dword ptr [ebx + 4]
L10:
    movzx edx, byte ptr [ebp]
L11:
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esp + 32]
    dec ebx
    add esi, 4
    inc ebp
    cmp esi, 010191300h
    mov dword ptr [esp + 20], edx
    mov word ptr [eax + ecx*2], dx
    mov dword ptr [esp + 24], esi
    jl L6
    mov ecx, dword ptr [edi]
    cmp dword ptr [ecx + 104], 2
    jl L13
    lea esi, [eax + 4]
    mov dword ptr [esp + 24], 8
L12:
    mov eax, dword ptr [edi]
    movzx edx, word ptr [esi - 4]
    add eax, 24
    mov dword ptr [eax], edx
    movzx ecx, word ptr [esi - 2]
    mov dword ptr [eax + 4], ecx
    movzx edx, word ptr [esi]
    mov dword ptr [eax + 8], edx
    movzx ecx, word ptr [esi + 2]
    mov dword ptr [eax + 12], ecx
    movzx edx, word ptr [esi + 4]
    mov dword ptr [eax + 16], edx
    movzx ecx, word ptr [esi + 6]
    mov dword ptr [eax + 20], ecx
    movzx edx, word ptr [esi + 8]
    mov dword ptr [eax + 24], edx
    movzx ecx, word ptr [esi + 10]
    mov dword ptr [eax + 28], ecx
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 20], 93
    mov eax, dword ptr [edi]
    push 2
    push edi
    call dword ptr [eax + 4]
    mov eax, dword ptr [esp + 32]
    add esp, 8
    add esi, 16
    dec eax
    mov dword ptr [esp + 24], eax
    jne L12
L13:
    mov ecx, dword ptr [esp + 12]
    mov eax, dword ptr [esp + 28]
    sub ecx, 65
    test eax, eax
    mov dword ptr [esp + 12], ecx
    je L14
    mov eax, ecx
    sub eax, 64
    mov dword ptr [esp + 12], eax
L14:
    mov eax, dword ptr [esp + 12]
    test eax, eax
    mov esi, dword ptr [esp + 16]
    jg L2
    test eax, eax
L15:
    je L16
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 11
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
L16:
    mov dword ptr [esi], ebp
    mov dword ptr [esi + 4], ebx
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 24
    ret
L17:
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 24
    ret
FUN_1004e630 ENDP
END
