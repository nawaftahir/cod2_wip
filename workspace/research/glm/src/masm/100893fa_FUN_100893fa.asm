.686
.MODEL FLAT, C
.CODE
FUN_100893fa PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    mov eax, dword ptr [ecx + 24]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    shl esi, 2
    add eax, esi
    mov edx, dword ptr [eax]
    mov ebx, dword ptr [edx + 44]
    test bl, 1
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 16], edx
    jne L0
    xor eax, eax
    jmp L14
L0:
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    jbe L2
    add eax, -4
    mov dword ptr [ebp - 4], eax
L1:
    mov eax, dword ptr [eax]
    cmp ebx, dword ptr [eax + 44]
    jae L2
    mov eax, dword ptr [ebp - 4]
    dec edi
    sub eax, 4
    test edi, edi
    mov dword ptr [ebp - 4], eax
    ja L1
L2:
    mov eax, dword ptr [ebp + 8]
    sub eax, edi
    shr eax, 1
    je L4
    mov edx, edi
    shl edx, 2
    mov dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 12], eax
L3:
    mov eax, dword ptr [ecx + 24]
    add edx, eax
    mov eax, dword ptr [esi + eax - 4]
    mov ebx, dword ptr [edx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 24]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [esi + eax - 4], ebx
    add edx, 4
    sub esi, 4
    dec dword ptr [ebp - 12]
    mov dword ptr [ebp - 4], edx
    jne L3
    mov edx, dword ptr [ebp - 16]
    mov esi, dword ptr [ebp - 8]
L4:
    test edi, edi
    mov eax, edi
    mov dword ptr [ebp - 16], eax
    jbe L7
    mov ebx, dword ptr [ecx + 24]
    mov edx, dword ptr [edx + 44]
    lea ebx, [ebx + edi*4 - 4]
    mov dword ptr [ebp - 12], ebx
    mov ebx, dword ptr [ebx]
    cmp edx, dword ptr [ebx + 44]
    jbe L5
    lea eax, [edi - 1]
    jmp L9
L5:
    mov ebx, dword ptr [ebp - 12]
    mov dword ptr [ebp - 4], ebx
L6:
    mov ebx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebx]
    cmp edx, dword ptr [ebx + 44]
    jne L7
    sub dword ptr [ebp - 4], 4
    dec eax
    test eax, eax
    mov dword ptr [ebp - 16], eax
    ja L6
L7:
    mov edx, edi
    sub edx, eax
    shr edx, 1
    je L9
    mov esi, eax
    shl esi, 2
    mov eax, edi
    mov dword ptr [ebp - 12], esi
    shl eax, 2
    mov dword ptr [ebp - 4], edx
L8:
    mov edx, dword ptr [ecx + 24]
    add esi, edx
    mov edx, dword ptr [eax + edx - 4]
    mov ebx, dword ptr [esi]
    mov dword ptr [esi], edx
    mov edx, dword ptr [ecx + 24]
    mov esi, dword ptr [ebp - 12]
    mov dword ptr [eax + edx - 4], ebx
    add esi, 4
    sub eax, 4
    dec dword ptr [ebp - 4]
    mov dword ptr [ebp - 12], esi
    jne L8
    mov eax, dword ptr [ebp - 16]
    mov esi, dword ptr [ebp - 8]
L9:
    cmp eax, edi
    jne L10
    xor eax, eax
    jmp L13
L10:
    mov edx, dword ptr [ebp + 8]
    sub edx, eax
    shr edx, 1
    je L12
    mov edi, eax
    shl edi, 2
    mov dword ptr [ebp + 8], edx
L11:
    mov eax, dword ptr [ecx + 24]
    lea edx, [edi + eax]
    mov eax, dword ptr [esi + eax - 4]
    mov ebx, dword ptr [edx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 24]
    mov dword ptr [esi + eax - 4], ebx
    add edi, 4
    sub esi, 4
    dec dword ptr [ebp + 8]
    jne L11
    mov esi, dword ptr [ebp - 8]
L12:
    mov eax, dword ptr [ecx + 24]
    add eax, esi
    mov edi, dword ptr [eax]
    mov edx, dword ptr [eax - 4]
    mov dword ptr [eax - 4], edi
    mov eax, dword ptr [ecx + 24]
    mov dword ptr [esi + eax], edx
    xor eax, eax
    inc eax
L13:
    pop edi
L14:
    pop esi
    pop ebx
    leave
    ret 4
FUN_100893fa ENDP
END
