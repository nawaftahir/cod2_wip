.686
.MODEL FLAT, C
.CODE
FUN_10045e30 PROC
    mov eax, dword ptr [esi + 40]
    test eax, eax
    jbe L0
    mov eax, dword ptr [esi + 36]
    test eax, eax
    jbe L0
    mov eax, dword ptr [esi + 68]
    test eax, eax
    jle L0
    mov eax, dword ptr [esi + 44]
    test eax, eax
    jg L1
L0:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 32
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L1:
    mov ecx, dword ptr [esi + 40]
    mov eax, 00000FFDCh
    cmp ecx, eax
    jg L2
    cmp dword ptr [esi + 36], eax
    jle L3
L2:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 41
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], eax
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L3:
    cmp dword ptr [esi + 64], 8
    je L4
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 15
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 64]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L4:
    mov ecx, dword ptr [esi + 68]
    mov eax, 10
    cmp ecx, eax
    jle L5
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 26
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esi + 68]
    mov dword ptr [edx + 24], ecx
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 28], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L5:
    mov ecx, dword ptr [esi + 68]
    push ebx
    mov eax, 1
    push ebp
    xor ebx, ebx
    test ecx, ecx
    mov dword ptr [esi + 0000000E0h], eax
    mov dword ptr [esi + 0000000E4h], eax
    mov eax, dword ptr [esi + 76]
    push edi
    jle L11
    lea edi, [eax + 12]
    mov ebp, 18
L6:
    mov eax, dword ptr [edi - 4]
    test eax, eax
    jle L7
    cmp eax, 4
    jg L7
    mov eax, dword ptr [edi]
    test eax, eax
    jle L7
    cmp eax, 4
    jle L8
L7:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], ebp
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L8:
    mov eax, dword ptr [esi + 0000000E0h]
    mov ecx, dword ptr [edi - 4]
    cmp eax, ecx
    jg L9
    mov eax, ecx
L9:
    mov dword ptr [esi + 0000000E0h], eax
    mov eax, dword ptr [esi + 0000000E4h]
    mov ecx, dword ptr [edi]
    cmp eax, ecx
    jg L10
    mov eax, ecx
L10:
    mov dword ptr [esi + 0000000E4h], eax
    mov eax, dword ptr [esi + 68]
    inc ebx
    add edi, 84
    cmp ebx, eax
    jl L6
L11:
    mov eax, dword ptr [esi + 68]
    mov ecx, dword ptr [esi + 76]
    xor ebp, ebp
    test eax, eax
    jle L13
    add ecx, 36
L12:
    mov ebx, dword ptr [ecx - 28]
    mov dword ptr [ecx - 32], ebp
    mov dword ptr [ecx], 8
    mov eax, dword ptr [esi + 36]
    mov edi, dword ptr [esi + 0000000E0h]
    imul eax, ebx
    shl edi, 3
    lea eax, [eax + edi - 1]
    cdq
    idiv edi
    add ecx, 84
    mov dword ptr [ecx - 92], eax
    mov edx, dword ptr [esi + 40]
    mov eax, dword ptr [ecx - 108]
    mov edi, dword ptr [esi + 0000000E4h]
    imul edx, eax
    shl edi, 3
    lea eax, [edx + edi - 1]
    cdq
    idiv edi
    mov dword ptr [ecx - 88], eax
    mov eax, dword ptr [esi + 36]
    mov edi, dword ptr [esi + 0000000E0h]
    imul eax, ebx
    lea eax, [eax + edi - 1]
    cdq
    idiv edi
    mov dword ptr [ecx - 80], eax
    mov edx, dword ptr [esi + 40]
    imul edx, dword ptr [ecx - 108]
    mov edi, dword ptr [esi + 0000000E4h]
    lea eax, [edx + edi - 1]
    cdq
    idiv edi
    mov byte ptr [ecx - 72], 1
    inc ebp
    mov dword ptr [ecx - 76], eax
    cmp ebp, dword ptr [esi + 68]
    jl L12
L13:
    mov ecx, dword ptr [esi + 0000000E4h]
    mov eax, dword ptr [esi + 40]
    shl ecx, 3
    lea eax, [ecx + eax - 1]
    cdq
    idiv ecx
    pop edi
    pop ebp
    pop ebx
    mov dword ptr [esi + 0000000E8h], eax
    ret
FUN_10045e30 ENDP
END
