.686
.MODEL FLAT, C
.CODE
FUN_1000e330 PROC
    push ecx
    push ebx
    mov ebx, dword ptr [esp + 12]
    mov eax, ebx
    sub eax, esi
    sar eax, 2
    cmp eax, 40
    push ebp
    jle L11
    inc eax
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    lea ebp, [eax*8]
    lea ebx, [eax*4]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [ebx + esi]
    push eax
    push ecx
    mov dword ptr [esp + 16], ebp
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L0
    mov edx, dword ptr [esi]
    mov eax, dword ptr [ebx + esi]
    mov dword ptr [ebx + esi], edx
    mov dword ptr [esi], eax
L0:
    mov eax, dword ptr [ebx + esi]
    mov ecx, dword ptr [esi + ebp]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L1
    mov edx, dword ptr [ebx + esi]
    mov eax, dword ptr [esi + ebp]
    mov dword ptr [esi + ebp], edx
    mov dword ptr [ebx + esi], eax
L1:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [ebx + esi]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L2
    mov edx, dword ptr [esi]
    mov eax, dword ptr [ebx + esi]
    mov dword ptr [ebx + esi], edx
    mov dword ptr [esi], eax
L2:
    mov ecx, dword ptr [edi]
    mov ebp, edi
    sub ebp, ebx
    mov eax, dword ptr [ebp]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L3
    mov edx, dword ptr [ebp]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [ebp], eax
L3:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [ebx + edi]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L4
    mov edx, dword ptr [edi]
    mov eax, dword ptr [ebx + edi]
    mov dword ptr [ebx + edi], edx
    mov dword ptr [edi], eax
L4:
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L5
    mov edx, dword ptr [ebp]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [ebp], eax
L5:
    mov edx, dword ptr [esp + 8]
    mov eax, dword ptr [esp + 16]
    mov ebp, dword ptr [esp + 16]
    sub eax, edx
    mov dword ptr [esp + 8], eax
    mov eax, dword ptr [eax]
    sub ebp, ebx
    mov ecx, dword ptr [ebp]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L6
    mov ecx, dword ptr [esp + 8]
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ebp]
    mov dword ptr [ebp], edx
    mov dword ptr [ecx], eax
L6:
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [ecx]
    push eax
    push edx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L7
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [ebp]
    mov eax, dword ptr [ecx]
    mov dword ptr [ecx], edx
    mov dword ptr [ebp], eax
L7:
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [ebp]
    push ecx
    push edx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L8
    mov ecx, dword ptr [esp + 8]
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ebp]
    mov dword ptr [ebp], edx
    mov dword ptr [ecx], eax
L8:
    mov eax, dword ptr [ebx + esi]
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L9
    mov edx, dword ptr [ebx + esi]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [ebx + esi], eax
L9:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [ebp]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L10
    mov edx, dword ptr [edi]
    mov eax, dword ptr [ebp]
    mov dword ptr [ebp], edx
    mov dword ptr [edi], eax
L10:
    mov eax, dword ptr [ebx + esi]
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    call dword ptr [esp + 0x1c]
    add esp, 8
    test eax, eax
    je L14
    mov edx, dword ptr [ebx + esi]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    pop ebp
    mov dword ptr [ebx + esi], eax
    pop ebx
    pop ecx
    ret
L11:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [edi]
    mov ebp, dword ptr [esp + 20]
    push eax
    push ecx
    call ebp
    add esp, 8
    test eax, eax
    je L12
    mov edx, dword ptr [esi]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [esi], eax
L12:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [ebx]
    push eax
    push ecx
    call ebp
    add esp, 8
    test eax, eax
    je L13
    mov edx, dword ptr [edi]
    mov eax, dword ptr [ebx]
    mov dword ptr [ebx], edx
    mov dword ptr [edi], eax
L13:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    call ebp
    add esp, 8
    test eax, eax
    je L14
    mov edx, dword ptr [esi]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [esi], eax
L14:
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_1000e330 ENDP
END
