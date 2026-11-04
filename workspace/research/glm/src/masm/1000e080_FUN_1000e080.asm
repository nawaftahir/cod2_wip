.686
.MODEL FLAT, C
EXTRN sub_1000E35A:PROC
.CODE
FUN_1000e080 PROC
    push ecx
    mov ecx, dword ptr [esp + 16]
    push ebx
    mov ebx, dword ptr [esp + 24]
    push ebp
    push esi
    mov esi, dword ptr [esp + 24]
    mov eax, ecx
    sub eax, esi
    sar eax, 2
    cdq
    push edi
    sub eax, edx
    sar eax, 1
    add ecx, -4
    push ebx
    lea edi, [esi + eax*4]
    push ecx
    call sub_1000E35A
    add esp, 8
    cmp esi, edi
    lea ebp, [edi + 4]
    jae L1
L0:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [edi - 4]
    push eax
    push ecx
    call ebx
    add esp, 8
    test eax, eax
    jne L1
    mov edx, dword ptr [edi - 4]
    mov eax, dword ptr [edi]
    push edx
    push eax
    call ebx
    add esp, 8
    test eax, eax
    jne L1
    add edi, -4
    cmp esi, edi
    jb L0
L1:
    mov esi, dword ptr [esp + 32]
    cmp ebp, esi
    jae L3
L2:
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [ebp]
    push ecx
    push edx
    call ebx
    add esp, 8
    test eax, eax
    jne L3
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    call ebx
    add esp, 8
    test eax, eax
    jne L3
    add ebp, 4
    cmp ebp, esi
    jb L2
L3:
    mov ebx, ebp
    mov esi, edi
    mov edi, edi
L4:
    cmp ebx, dword ptr [esp + 32]
    jae L7
L5:
    mov edx, dword ptr [ebx]
    mov eax, dword ptr [edi]
    push edx
    push eax
    call dword ptr [esp + 0x2c]
    add esp, 8
    test eax, eax
    jne L6
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [ebx]
    push ecx
    push edx
    call dword ptr [esp + 0x2c]
    add esp, 8
    test eax, eax
    jne L7
    mov edx, dword ptr [ebx]
    mov eax, ebp
    mov ecx, dword ptr [eax]
    mov dword ptr [eax], edx
    add ebp, 4
    mov dword ptr [ebx], ecx
L6:
    mov eax, dword ptr [esp + 32]
    add ebx, 4
    cmp ebx, eax
    jb L5
L7:
    cmp esi, dword ptr [esp + 28]
    jbe L11
L8:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [esi - 4]
    push eax
    push ecx
    call dword ptr [esp + 0x2c]
    add esp, 8
    test eax, eax
    jne L9
    mov edx, dword ptr [esi - 4]
    mov eax, dword ptr [edi]
    push edx
    push eax
    call dword ptr [esp + 0x2c]
    add esp, 8
    test eax, eax
    jne L10
    mov ecx, dword ptr [esi - 4]
    mov eax, dword ptr [edi - 4]
    sub edi, 4
    mov dword ptr [edi], ecx
    mov dword ptr [esi - 4], eax
L9:
    mov eax, dword ptr [esp + 28]
    add esi, -4
    cmp eax, esi
    jb L8
L10:
    cmp esi, dword ptr [esp + 28]
L11:
    mov eax, dword ptr [esp + 32]
    jne L13
    cmp ebx, eax
    je L16
    cmp ebp, ebx
    je L12
    mov edx, dword ptr [ebp]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [ebp], eax
L12:
    mov ecx, edi
    mov edx, dword ptr [ecx]
    mov eax, ebx
    mov dword ptr [esp + 16], edx
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov ecx, dword ptr [esp + 16]
    add ebp, 4
    add edi, 4
    add ebx, 4
    mov dword ptr [eax], ecx
    jmp L4
L13:
    sub esi, 4
    cmp ebx, eax
    jne L15
    sub edi, 4
    cmp esi, edi
    je L14
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esi]
    mov dword ptr [esi], edx
    mov dword ptr [edi], eax
L14:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi]
    sub ebp, 4
    mov dword ptr [edi], ecx
    mov dword ptr [ebp], eax
    jmp L4
L15:
    mov eax, dword ptr [ebx]
    mov edx, dword ptr [esi]
    mov dword ptr [ebx], edx
    mov dword ptr [esi], eax
    add ebx, 4
    jmp L4
L16:
    mov eax, dword ptr [esp + 24]
    mov dword ptr [eax], edi
    pop edi
    pop esi
    mov dword ptr [eax + 4], ebp
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_1000e080 ENDP
END
