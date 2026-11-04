.686
.MODEL FLAT, C
.CODE
FUN_1004ada0 PROC
    sub esp, 44
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 56]
    mov eax, dword ptr [ebp + 00000012Ch]
    push esi
    push edi
    mov edi, dword ptr [ebp + 000000190h]
    xor esi, esi
    test eax, eax
    mov dword ptr [esp + 32], edi
    jle L1
    lea eax, [ebp + 000000130h]
    mov dword ptr [esp + 16], eax
    jmp L0
    lea ecx, [ecx]
L0:
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [ecx]
    mov ecx, dword ptr [eax + 12]
    mov ebx, dword ptr [ebp + 000000088h]
    mov eax, dword ptr [eax + 4]
    imul ebx, ecx
    mov edx, dword ptr [ebp + 4]
    push 1
    push ecx
    mov ecx, dword ptr [edi + eax*4 + 72]
    push ebx
    push ecx
    push ebp
    call dword ptr [edx + 0x20]
    mov ecx, dword ptr [esp + 36]
    add esp, 20
    mov dword ptr [esp + esi*4 + 44], eax
    mov eax, dword ptr [ebp + 00000012Ch]
    inc esi
    add ecx, 4
    cmp esi, eax
    mov dword ptr [esp + 16], ecx
    jl L0
L1:
    mov esi, dword ptr [edi + 24]
    cmp esi, dword ptr [edi + 28]
    mov dword ptr [esp + 36], esi
    jge L11
L2:
    mov eax, dword ptr [edi + 20]
    cmp eax, dword ptr [ebp + 000000140h]
    mov dword ptr [esp + 16], eax
    jae L10
L3:
    mov eax, dword ptr [ebp + 00000012Ch]
    xor edx, edx
    xor ebx, ebx
    test eax, eax
    mov dword ptr [esp + 28], edx
    jle L9
    lea eax, [ebp + 000000130h]
    mov dword ptr [esp + 20], eax
L4:
    mov ecx, dword ptr [esp + 20]
    mov edi, dword ptr [ecx]
    mov ecx, dword ptr [edi + 52]
    mov eax, ecx
    imul eax, dword ptr [esp + 16]
    cmp dword ptr [edi + 56], 0
    mov dword ptr [esp + 24], 0
    jle L8
    mov edx, dword ptr [esp + edx*4 + 44]
    shl eax, 7
    mov dword ptr [esp + 40], eax
    lea ebp, [edx + esi*4]
L5:
    mov edx, dword ptr [esp + 40]
    mov eax, dword ptr [ebp]
    add eax, edx
    xor edx, edx
    test ecx, ecx
    jle L7
    mov ecx, dword ptr [esp + 32]
    lea esi, [ecx + ebx*4 + 32]
L6:
    mov dword ptr [esi], eax
    mov ecx, dword ptr [edi + 52]
    inc ebx
    add esi, 4
    add eax, 000000080h
    inc edx
    cmp edx, ecx
    jl L6
L7:
    mov eax, dword ptr [esp + 24]
    mov edx, dword ptr [edi + 56]
    inc eax
    add ebp, 4
    cmp eax, edx
    mov dword ptr [esp + 24], eax
    jl L5
    mov ebp, dword ptr [esp + 64]
    mov edx, dword ptr [esp + 28]
    mov esi, dword ptr [esp + 36]
L8:
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [ebp + 00000012Ch]
    inc edx
    add ecx, 4
    cmp edx, eax
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 20], ecx
    jl L4
    mov edi, dword ptr [esp + 32]
L9:
    mov edx, dword ptr [ebp + 0000001A0h]
    lea eax, [edi + 32]
    push eax
    push ebp
    call dword ptr [edx + 4]
    add esp, 8
    test al, al
    mov eax, dword ptr [esp + 16]
    je L12
    mov ecx, dword ptr [ebp + 000000140h]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jb L3
L10:
    mov dword ptr [edi + 20], 0
    mov eax, dword ptr [edi + 28]
    inc esi
    cmp esi, eax
    mov dword ptr [esp + 36], esi
    jl L2
L11:
    mov ecx, dword ptr [ebp + 000000088h]
    mov edx, dword ptr [ebp + 000000124h]
    inc ecx
    cmp ecx, edx
    mov dword ptr [ebp + 000000088h], ecx
    jae L16
    mov edi, dword ptr [ebp + 00000012Ch]
    mov eax, dword ptr [ebp + 000000190h]
    mov esi, 1
    cmp edi, esi
    jle L13
    pop edi
    mov dword ptr [eax + 28], esi
    pop esi
    xor ecx, ecx
    pop ebp
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov eax, 3
    pop ebx
    add esp, 44
    ret
L12:
    mov dword ptr [edi + 24], esi
    mov dword ptr [edi + 20], eax
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 44
    ret
L13:
    dec edx
    cmp ecx, edx
    mov ecx, dword ptr [ebp + 000000130h]
    jae L14
    mov edx, dword ptr [ecx + 12]
    jmp L15
L14:
    mov edx, dword ptr [ecx + 72]
L15:
    pop edi
    pop esi
    xor ecx, ecx
    pop ebp
    mov dword ptr [eax + 28], edx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov eax, 3
    pop ebx
    add esp, 44
    ret
L16:
    mov eax, dword ptr [ebp + 000000198h]
    push ebp
    call dword ptr [eax + 0xc]
    add esp, 4
    pop edi
    pop esi
    pop ebp
    mov eax, 4
    pop ebx
FUN_1004ada0 ENDP
END
