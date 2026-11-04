.686
.MODEL FLAT, C
.CODE
FUN_1004d1b0 PROC
    mov eax, dword ptr [esi + 00000012Ch]
    sub esp, 8
    push ebx
    mov ebx, 1
    cmp eax, ebx
    push edi
    jne L1
    mov ecx, dword ptr [esi + 000000130h]
    mov eax, dword ptr [ecx + 28]
    mov dword ptr [esi + 000000140h], eax
    mov edx, dword ptr [ecx + 32]
    mov dword ptr [esi + 000000144h], edx
    mov eax, dword ptr [ecx + 36]
    mov edi, dword ptr [ecx + 12]
    mov dword ptr [ecx + 64], eax
    mov eax, dword ptr [ecx + 32]
    xor edx, edx
    div edi
    mov dword ptr [ecx + 52], ebx
    mov dword ptr [ecx + 56], ebx
    mov dword ptr [ecx + 60], ebx
    mov dword ptr [ecx + 68], ebx
    test edx, edx
    jne L0
    mov edx, edi
L0:
    mov dword ptr [ecx + 72], edx
    pop edi
    mov dword ptr [esi + 000000148h], ebx
    mov dword ptr [esi + 00000014Ch], 0
    pop ebx
    add esp, 8
    ret
L1:
    xor edi, edi
    cmp eax, edi
    jle L2
    cmp eax, 4
    jle L3
L2:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 26
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 00000012Ch]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 28], 4
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L3:
    mov ecx, dword ptr [esi + 000000118h]
    mov eax, dword ptr [esi + 36]
    shl ecx, 3
    lea eax, [eax + ecx - 1]
    cdq
    idiv ecx
    mov ecx, dword ptr [esi + 00000011Ch]
    mov edx, dword ptr [esi + 40]
    shl ecx, 3
    mov dword ptr [esi + 000000148h], edi
    mov dword ptr [esp + 8], edi
    mov dword ptr [esi + 000000140h], eax
    lea eax, [edx + ecx - 1]
    cdq
    idiv ecx
    mov dword ptr [esi + 000000144h], eax
    cmp dword ptr [esi + 00000012Ch], edi
    jle L10
    lea eax, [esi + 000000130h]
    mov dword ptr [esp + 12], eax
    push ebp
    lea ebx, [ebx]
L4:
    mov ecx, dword ptr [esp + 16]
    mov ecx, dword ptr [ecx]
    mov edi, dword ptr [ecx + 8]
    mov edx, dword ptr [ecx + 36]
    mov eax, dword ptr [ecx + 28]
    imul edx, edi
    mov ebp, dword ptr [ecx + 12]
    mov dword ptr [ecx + 64], edx
    xor edx, edx
    div edi
    mov ebx, ebp
    imul ebx, edi
    mov dword ptr [ecx + 52], edi
    mov dword ptr [ecx + 56], ebp
    mov dword ptr [ecx + 60], ebx
    test edx, edx
    jne L5
    mov edx, edi
L5:
    mov eax, dword ptr [ecx + 32]
    mov dword ptr [ecx + 68], edx
    xor edx, edx
    div ebp
    test edx, edx
    jne L6
    mov edx, ebp
L6:
    mov dword ptr [ecx + 72], edx
    mov eax, dword ptr [esi + 000000148h]
    add eax, ebx
    cmp eax, 10
    jle L7
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 13
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L7:
    test ebx, ebx
    jle L9
L8:
    mov eax, dword ptr [esi + 000000148h]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [esi + eax*4 + 00000014Ch], ecx
    mov ecx, dword ptr [esi + 000000148h]
    inc ecx
    dec ebx
    mov dword ptr [esi + 000000148h], ecx
    jne L8
L9:
    mov eax, dword ptr [esp + 12]
    mov edx, dword ptr [esp + 16]
    mov ecx, dword ptr [esi + 00000012Ch]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 16], edx
    jl L4
    pop ebp
L10:
    pop edi
    pop ebx
    add esp, 8
    ret
FUN_1004d1b0 ENDP
END
