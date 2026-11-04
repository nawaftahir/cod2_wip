.686
.MODEL FLAT, C
.CODE
FUN_100423a0 PROC
    sub esp, 44
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 56]
    mov eax, dword ptr [ebp + 0000000ECh]
    push esi
    push edi
    mov edi, dword ptr [ebp + 000000150h]
    xor esi, esi
    test eax, eax
    mov dword ptr [esp + 32], edi
    jle L1
    lea eax, [ebp + 0000000F0h]
    mov dword ptr [esp + 16], eax
    jmp L0
    lea ecx, [ecx]
L0:
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [ecx]
    mov ecx, dword ptr [eax + 12]
    mov ebx, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 4]
    imul ebx, ecx
    mov edx, dword ptr [ebp + 4]
    push 0
    push ecx
    mov ecx, dword ptr [edi + eax*4 + 64]
    push ebx
    push ecx
    push ebp
    call dword ptr [edx + 0x20]
    mov ecx, dword ptr [esp + 36]
    add esp, 20
    mov dword ptr [esp + esi*4 + 44], eax
    mov eax, dword ptr [ebp + 0000000ECh]
    inc esi
    add ecx, 4
    cmp esi, eax
    mov dword ptr [esp + 16], ecx
    jl L0
L1:
    mov esi, dword ptr [edi + 16]
    cmp esi, dword ptr [edi + 20]
    mov dword ptr [esp + 36], esi
    jge L11
    nop
L2:
    mov eax, dword ptr [edi + 12]
    cmp eax, dword ptr [ebp + 000000100h]
    mov dword ptr [esp + 16], eax
    jae L10
L3:
    mov eax, dword ptr [ebp + 0000000ECh]
    xor edx, edx
    xor ebx, ebx
    test eax, eax
    mov dword ptr [esp + 28], edx
    jle L9
    lea eax, [ebp + 0000000F0h]
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
    nop
L5:
    mov edx, dword ptr [esp + 40]
    mov eax, dword ptr [ebp]
    add eax, edx
    xor edx, edx
    test ecx, ecx
    jle L7
    mov ecx, dword ptr [esp + 32]
    lea esi, [ecx + ebx*4 + 24]
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
    mov eax, dword ptr [ebp + 0000000ECh]
    inc edx
    add ecx, 4
    cmp edx, eax
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 20], ecx
    jl L4
    mov edi, dword ptr [esp + 32]
L9:
    mov edx, dword ptr [ebp + 000000164h]
    lea eax, [edi + 24]
    push eax
    push ebp
    call dword ptr [edx + 4]
    add esp, 8
    test al, al
    mov eax, dword ptr [esp + 16]
    je L12
    mov ecx, dword ptr [ebp + 000000100h]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jb L3
L10:
    mov dword ptr [edi + 12], 0
    mov eax, dword ptr [edi + 20]
    inc esi
    cmp esi, eax
    mov dword ptr [esp + 36], esi
    jl L2
L11:
    inc dword ptr [edi + 8]
    mov edx, dword ptr [ebp + 0000000ECh]
    mov ecx, dword ptr [ebp + 000000150h]
    mov eax, 1
    cmp edx, eax
    jle L13
    pop edi
    pop esi
    xor edx, edx
    pop ebp
    mov dword ptr [ecx + 20], eax
    mov dword ptr [ecx + 12], edx
    mov dword ptr [ecx + 16], edx
    pop ebx
    add esp, 44
    ret
L12:
    mov dword ptr [edi + 16], esi
    mov dword ptr [edi + 12], eax
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 44
    ret
L13:
    mov edx, dword ptr [ebp + 0000000E8h]
    mov esi, dword ptr [ecx + 8]
    dec edx
    cmp esi, edx
    mov edx, dword ptr [ebp + 0000000F0h]
    jae L14
    mov edx, dword ptr [edx + 12]
    pop edi
    pop esi
    mov dword ptr [ecx + 20], edx
    xor edx, edx
    pop ebp
    mov dword ptr [ecx + 12], edx
    mov dword ptr [ecx + 16], edx
    pop ebx
    add esp, 44
    ret
L14:
    mov edx, dword ptr [edx + 72]
    pop edi
    pop esi
    mov dword ptr [ecx + 20], edx
    xor edx, edx
    pop ebp
    mov dword ptr [ecx + 12], edx
    mov dword ptr [ecx + 16], edx
    pop ebx
FUN_100423a0 ENDP
END
