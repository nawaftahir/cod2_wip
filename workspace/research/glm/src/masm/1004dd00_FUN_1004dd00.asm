.686
.MODEL FLAT, C
.CODE
FUN_1004dd00 PROC
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esi + 32]
    mov ebx, dword ptr [ebp + 4]
    test ebx, ebx
    push edi
    mov edi, dword ptr [ebp]
    mov dword ptr [esp + 16], ebp
    mov byte ptr [esi + 0000000D0h], al
    mov byte ptr [esi + 0000000D1h], cl
    jne L0
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L0:
    xor edx, edx
    mov dh, byte ptr [edi]
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esp + 12], edx
    jne L1
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L1:
    movzx eax, byte ptr [edi]
    mov edx, dword ptr [esp + 12]
    add edx, eax
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esp + 12], edx
    jne L2
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L2:
    movzx ecx, byte ptr [edi]
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esi + 0000000C8h], ecx
    jne L3
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L3:
    xor edx, edx
    mov dh, byte ptr [edi]
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esi + 40], edx
    jne L4
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L4:
    movzx eax, byte ptr [edi]
    mov edx, dword ptr [esi + 40]
    add edx, eax
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esi + 40], edx
    jne L5
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L5:
    xor ecx, ecx
    mov ch, byte ptr [edi]
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esi + 36], ecx
    jne L6
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L6:
    movzx edx, byte ptr [edi]
    mov eax, dword ptr [esi + 36]
    add eax, edx
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [esi + 36], eax
    jne L7
    push esi
    call dword ptr [ebp + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebp]
    mov ebx, dword ptr [ebp + 4]
L7:
    movzx eax, byte ptr [edi]
    mov ecx, dword ptr [esi + 000000184h]
    mov edx, dword ptr [esp + 12]
    mov dword ptr [esi + 44], eax
    mov eax, dword ptr [esi]
    add eax, 24
    mov dword ptr [eax], ecx
    sub edx, 8
    mov dword ptr [esp + 12], edx
    mov edx, dword ptr [esi + 36]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [esi + 40]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [esi + 44]
    mov dword ptr [eax + 12], edx
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 100
    mov ecx, dword ptr [esi]
    push 1
    dec ebx
    push esi
    inc edi
    call dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 00000019Ch]
    mov al, byte ptr [edx + 13]
    add esp, 8
    test al, al
    je L8
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 58
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L8:
    mov eax, dword ptr [esi + 40]
    test eax, eax
    jbe L9
    mov eax, dword ptr [esi + 36]
    test eax, eax
    jbe L9
    mov eax, dword ptr [esi + 44]
    test eax, eax
    jg L10
L9:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 32
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L10:
    mov eax, dword ptr [esi + 44]
    lea ecx, [eax + eax*2]
    cmp dword ptr [esp + 12], ecx
    je L11
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 11
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L11:
    mov eax, dword ptr [esi + 0000000CCh]
    test eax, eax
    jne L12
    mov edx, dword ptr [esi + 44]
    mov ecx, dword ptr [esi + 4]
    imul edx, edx, 84
    push edx
    push 1
    push esi
    call dword ptr [ecx]
    add esp, 12
    mov dword ptr [esi + 0000000CCh], eax
L12:
    mov eax, dword ptr [esi + 44]
    test eax, eax
    mov ebp, dword ptr [esi + 0000000CCh]
    mov dword ptr [esp + 12], 0
    jle L17
    lea esp, [esp]
L13:
    test ebx, ebx
    mov eax, dword ptr [esp + 12]
    mov dword ptr [ebp + 4], eax
    jne L14
    mov ebx, dword ptr [esp + 16]
    push esi
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebx]
    mov ebx, dword ptr [ebx + 4]
L14:
    movzx ecx, byte ptr [edi]
    dec ebx
    inc edi
    test ebx, ebx
    mov dword ptr [ebp], ecx
    jne L15
    mov ebx, dword ptr [esp + 16]
    push esi
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebx]
    mov ebx, dword ptr [ebx + 4]
L15:
    movzx eax, byte ptr [edi]
    mov edx, eax
    sar edx, 4
    dec ebx
    and edx, 15
    and eax, 15
    inc edi
    test ebx, ebx
    mov dword ptr [ebp + 8], edx
    mov dword ptr [ebp + 12], eax
    jne L16
    mov ebx, dword ptr [esp + 16]
    push esi
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L18
    mov edi, dword ptr [ebx]
    mov ebx, dword ptr [ebx + 4]
L16:
    movzx eax, byte ptr [edi]
    mov ecx, dword ptr [ebp]
    mov dword ptr [ebp + 16], eax
    mov eax, dword ptr [esi]
    add eax, 24
    mov dword ptr [eax], ecx
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [ebp + 16]
    mov dword ptr [eax + 12], edx
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 101
    mov ecx, dword ptr [esi]
    push 1
    dec ebx
    push esi
    inc edi
    call dword ptr [ecx + 4]
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esi + 44]
    add esp, 8
    inc eax
    add ebp, 84
    cmp eax, ecx
    mov dword ptr [esp + 12], eax
    jl L13
L17:
    mov edx, dword ptr [esi + 00000019Ch]
    mov eax, dword ptr [esp + 16]
    mov byte ptr [edx + 13], 1
    mov dword ptr [eax], edi
    pop edi
    mov dword ptr [eax + 4], ebx
    pop ebp
    mov al, 1
    pop ebx
    add esp, 8
    ret
L18:
    pop edi
    pop ebp
    xor al, al
    pop ebx
    add esp, 8
    ret
FUN_1004dd00 ENDP
END
