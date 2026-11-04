.686
.MODEL FLAT, C
.CODE
FUN_1004e010 PROC
    sub esp, 24
    mov eax, dword ptr [esi + 00000019Ch]
    mov cl, byte ptr [eax + 13]
    test cl, cl
    push ebx
    push ebp
    push edi
    mov edi, dword ptr [esi + 32]
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
    mov dword ptr [esp + 32], edi
    jne L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 62
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L0:
    test ebp, ebp
    jne L1
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L15
    mov eax, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], eax
    mov ebp, eax
L1:
    xor ecx, ecx
    mov ch, byte ptr [ebx]
    dec ebp
    inc ebx
    test ebp, ebp
    mov dword ptr [esp + 16], ecx
    jne L2
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L15
    mov edx, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], edx
    mov ebp, edx
L2:
    movzx eax, byte ptr [ebx]
    mov edx, dword ptr [esp + 16]
    add edx, eax
    dec ebp
    inc ebx
    test ebp, ebp
    mov dword ptr [esp + 16], edx
    jne L3
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L15
    mov ecx, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], ecx
    mov ebp, ecx
L3:
    movzx eax, byte ptr [ebx]
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 103
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], eax
    mov edx, dword ptr [esi]
    push 1
    dec ebp
    push esi
    mov dword ptr [esp + 32], eax
    inc ebx
    call dword ptr [edx + 4]
    mov eax, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 24]
    lea ecx, [eax + eax + 6]
    add esp, 8
    cmp edx, ecx
    jne L4
    cmp eax, 1
    jl L4
    cmp eax, 4
    jle L5
L4:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 11
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    mov eax, dword ptr [esp + 28]
    add esp, 4
L5:
    test eax, eax
    mov dword ptr [esi + 00000012Ch], eax
    mov dword ptr [esp + 28], 0
    jle L12
    lea ecx, [esi + 000000130h]
    mov dword ptr [esp + 20], ecx
L6:
    test ebp, ebp
    jne L7
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L15
    mov edx, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], edx
    mov ebp, edx
L7:
    movzx eax, byte ptr [ebx]
    dec ebp
    inc ebx
    test ebp, ebp
    mov dword ptr [esp + 16], eax
    jne L8
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L15
    mov ecx, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], ecx
    mov ebp, ecx
L8:
    mov ecx, dword ptr [esi + 44]
    mov edi, dword ptr [esi + 0000000CCh]
    dec ebp
    mov dword ptr [esp + 12], ebp
    movzx ebp, byte ptr [ebx]
    inc ebx
    xor eax, eax
    test ecx, ecx
    jle L10
L9:
    mov edx, dword ptr [esp + 16]
    cmp edx, dword ptr [edi]
    je L11
    mov ecx, dword ptr [esi + 44]
    inc eax
    add edi, 84
    cmp eax, ecx
    jl L9
L10:
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esp + 16]
    mov dword ptr [eax + 20], 5
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L11:
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [ecx], edi
    mov ecx, dword ptr [esp + 16]
    mov edx, ebp
    sar edx, 4
    and edx, 15
    mov dword ptr [edi + 20], edx
    and ebp, 15
    mov dword ptr [edi + 24], ebp
    mov eax, dword ptr [esi]
    add eax, 24
    mov dword ptr [eax], ecx
    mov edx, dword ptr [edi + 20]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [edi + 24]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 104
    mov eax, dword ptr [esi]
    push 1
    push esi
    call dword ptr [eax + 4]
    mov eax, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 32]
    mov edi, dword ptr [esp + 40]
    mov ebp, dword ptr [esp + 20]
    add esp, 8
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 20], edx
    jl L6
L12:
    test ebp, ebp
    jne L13
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L15
    mov ecx, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], ecx
    mov ebp, ecx
L13:
    movzx eax, byte ptr [ebx]
    dec ebp
    inc ebx
    test ebp, ebp
    mov dword ptr [esi + 000000174h], eax
    jne L14
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L15
    mov edx, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], edx
    mov ebp, edx
L14:
    movzx eax, byte ptr [ebx]
    dec ebp
    inc ebx
    test ebp, ebp
    mov dword ptr [esi + 000000178h], eax
    jne L17
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    jne L16
L15:
    pop edi
    pop ebp
    xor al, al
    pop ebx
    add esp, 24
    ret
L16:
    mov eax, dword ptr [edi + 4]
    mov ebx, dword ptr [edi]
    mov dword ptr [esp + 12], eax
    mov ebp, eax
L17:
    movzx eax, byte ptr [ebx]
    mov edx, dword ptr [esi + 000000174h]
    mov ecx, eax
    and eax, 15
    mov dword ptr [esi + 000000180h], eax
    mov eax, dword ptr [esi]
    sar ecx, 4
    add eax, 24
    and ecx, 15
    mov dword ptr [esi + 00000017Ch], ecx
    mov dword ptr [eax], edx
    mov ecx, dword ptr [esi + 000000178h]
    mov dword ptr [eax + 4], ecx
    mov edx, dword ptr [esi + 00000017Ch]
    mov dword ptr [eax + 8], edx
    mov ecx, dword ptr [esi + 000000180h]
    mov dword ptr [eax + 12], ecx
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 105
    mov eax, dword ptr [esi]
    push 1
    push esi
    call dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 00000019Ch]
    add esp, 8
    mov dword ptr [ecx + 16], 0
    mov eax, dword ptr [esi + 000000084h]
    inc eax
    inc ebx
    mov dword ptr [esi + 000000084h], eax
    dec ebp
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 4], ebp
    pop edi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 24
    ret
FUN_1004e010 ENDP
END
