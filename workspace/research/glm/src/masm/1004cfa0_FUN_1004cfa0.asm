.686
.MODEL FLAT, C
.CODE
FUN_1004cfa0 PROC
    push ecx
    mov ecx, dword ptr [esi + 40]
    mov eax, 00000FFDCh
    cmp ecx, eax
    jg L0
    cmp dword ptr [esi + 36], eax
    jle L1
L0:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 41
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L1:
    mov eax, dword ptr [esi + 0000000C8h]
    push ebx
    push ebp
    mov ebp, 8
    cmp eax, ebp
    push edi
    je L2
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 15
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 0000000C8h]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L2:
    mov ecx, dword ptr [esi + 44]
    mov eax, 10
    cmp ecx, eax
    jle L3
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 26
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 44]
    mov dword ptr [ecx + 24], edx
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 28], eax
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L3:
    mov ecx, dword ptr [esi + 44]
    mov eax, 1
    xor ebx, ebx
    test ecx, ecx
    mov dword ptr [esi + 000000118h], eax
    mov dword ptr [esi + 00000011Ch], eax
    mov eax, dword ptr [esi + 0000000CCh]
    jle L9
    lea edi, [eax + 12]
L4:
    mov eax, dword ptr [edi - 4]
    test eax, eax
    jle L5
    cmp eax, 4
    jg L5
    mov eax, dword ptr [edi]
    test eax, eax
    jle L5
    cmp eax, 4
    jle L6
L5:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 18
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L6:
    mov eax, dword ptr [esi + 000000118h]
    mov ecx, dword ptr [edi - 4]
    cmp eax, ecx
    jg L7
    mov eax, ecx
L7:
    mov dword ptr [esi + 000000118h], eax
    mov eax, dword ptr [esi + 00000011Ch]
    mov ecx, dword ptr [edi]
    cmp eax, ecx
    jg L8
    mov eax, ecx
L8:
    mov dword ptr [esi + 00000011Ch], eax
    mov eax, dword ptr [esi + 44]
    inc ebx
    add edi, 84
    cmp ebx, eax
    jl L4
L9:
    mov eax, dword ptr [esi + 44]
    test eax, eax
    mov ecx, dword ptr [esi + 0000000CCh]
    mov dword ptr [esi + 000000120h], ebp
    mov dword ptr [esp + 12], 0
    jle L12
    add ecx, 28
    jmp L11
L10:
    mov ebp, 8
    jmp L11
    lea ebx, [ebx]
L11:
    mov dword ptr [ecx + 8], ebp
    mov edx, dword ptr [esi + 36]
    mov ebp, dword ptr [ecx - 20]
    mov edi, dword ptr [esi + 000000118h]
    imul edx, ebp
    shl edi, 3
    lea eax, [edx + edi - 1]
    cdq
    idiv edi
    mov ebx, dword ptr [ecx - 16]
    add ecx, 84
    mov dword ptr [ecx - 84], eax
    mov eax, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 00000011Ch]
    imul eax, ebx
    shl edi, 3
    lea eax, [eax + edi - 1]
    cdq
    idiv edi
    mov dword ptr [ecx - 80], eax
    mov edx, dword ptr [esi + 36]
    mov edi, dword ptr [esi + 000000118h]
    imul edx, ebp
    lea eax, [edx + edi - 1]
    cdq
    idiv edi
    mov dword ptr [ecx - 72], eax
    mov eax, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 00000011Ch]
    imul eax, ebx
    lea eax, [eax + edi - 1]
    cdq
    idiv edi
    mov byte ptr [ecx - 64], 1
    mov dword ptr [ecx - 36], 0
    mov dword ptr [ecx - 68], eax
    mov eax, dword ptr [esp + 12]
    mov edx, dword ptr [esi + 44]
    inc eax
    cmp eax, edx
    mov dword ptr [esp + 12], eax
    jl L10
L12:
    mov ecx, dword ptr [esi + 00000011Ch]
    mov edx, dword ptr [esi + 40]
    shl ecx, 3
    lea eax, [ecx + edx - 1]
    cdq
    idiv ecx
    mov ecx, dword ptr [esi + 44]
    pop edi
    pop ebp
    pop ebx
    mov dword ptr [esi + 000000124h], eax
    mov eax, dword ptr [esi + 00000012Ch]
    cmp eax, ecx
    jl L13
    mov al, byte ptr [esi + 0000000D0h]
    test al, al
    jne L13
    mov ecx, dword ptr [esi + 000000198h]
    mov byte ptr [ecx + 16], 0
    pop ecx
    ret
L13:
    mov edx, dword ptr [esi + 000000198h]
FUN_1004cfa0 ENDP
END
