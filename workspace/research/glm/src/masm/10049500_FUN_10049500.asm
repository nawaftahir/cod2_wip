.686
.MODEL FLAT, C
.CODE
FUN_10049500 PROC
    sub esp, 12
    mov eax, dword ptr [esi + 4]
    push ebx
    push 52
    push 1
    push esi
    mov byte ptr [esp + 19], 1
    call dword ptr [eax]
    mov ebx, eax
    mov dword ptr [esi + 00000015Ch], ebx
    mov dword ptr [ebx], 010048CC0h
    mov dword ptr [ebx + 4], 010048D30h
    mov byte ptr [ebx + 8], 0
    mov al, byte ptr [esi + 0000000BBh]
    add esp, 12
    test al, al
    mov dword ptr [esp + 8], ebx
    je L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 25
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L0:
    mov ecx, dword ptr [esi + 68]
    test ecx, ecx
    mov eax, dword ptr [esi + 76]
    mov dword ptr [esp + 12], 0
    jle L9
    push ebp
    push edi
    lea ebp, [eax + 12]
    lea edi, [ebx + 12]
    lea esp, [esp]
L1:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 0000000E0h]
    cmp ecx, eax
    jne L3
    mov edx, dword ptr [ebp]
    cmp edx, dword ptr [esi + 0000000E4h]
    jne L3
    mov eax, dword ptr [esi + 0000000BCh]
    test eax, eax
    je L2
    mov dword ptr [edi], 010049380h
    mov byte ptr [ebx + 8], 1
    jmp L8
L2:
    mov dword ptr [edi], 010048EF0h
    jmp L8
L3:
    lea edx, [ecx + ecx]
    cmp edx, eax
    jne L6
    mov ebx, dword ptr [ebp]
    cmp ebx, dword ptr [esi + 0000000E4h]
    mov ebx, dword ptr [esp + 16]
    jne L4
    mov byte ptr [esp + 15], 0
    mov dword ptr [edi], 010048F70h
    jmp L8
L4:
    cmp edx, eax
    jne L6
    mov edx, dword ptr [ebp]
    shl edx, 1
    cmp edx, dword ptr [esi + 0000000E4h]
    jne L6
    mov eax, dword ptr [esi + 0000000BCh]
    test eax, eax
    je L5
    mov dword ptr [edi], 0100490F0h
    mov byte ptr [ebx + 8], 1
    jmp L8
L5:
    mov dword ptr [edi], 010049010h
    jmp L8
L6:
    cdq
    idiv ecx
    test edx, edx
    jne L7
    mov eax, dword ptr [esi + 0000000E4h]
    cdq
    idiv dword ptr [ebp]
    test edx, edx
    jne L7
    mov byte ptr [esp + 15], dl
    mov dword ptr [edi], 010048DC0h
    jmp L8
L7:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 38
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L8:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esi + 68]
    inc eax
    add edi, 4
    add ebp, 84
    cmp eax, ecx
    mov dword ptr [esp + 20], eax
    jl L1
    pop edi
    pop ebp
L9:
    mov eax, dword ptr [esi + 0000000BCh]
    test eax, eax
    pop ebx
    je L10
    mov al, byte ptr [esp + 3]
    test al, al
    jne L10
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 99
    mov eax, dword ptr [esi]
    push 0
    push esi
    call dword ptr [eax + 4]
    add esp, 8
L10:
    add esp, 12
    ret
FUN_10049500 ENDP
END
