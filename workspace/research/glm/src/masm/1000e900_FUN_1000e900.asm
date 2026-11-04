.686
.MODEL FLAT, C
.CODE
FUN_1000e900 PROC
    cmp eax, 51
    mov ecx, dword ptr [esp + 4]
    push ebx
    push ebp
    mov ebx, edx
    jg L1
    je L0
    add eax, -21
    cmp eax, 29
    ja L9
    movzx eax, byte ptr [eax + 01000E9F4h]
    jmp dword ptr [eax*4 + 0x1000e9e4]
    shl ebx, 2
    mov ebp, 1
    jmp L5
L0:
    add ebx, ebx
    mov ebp, 1
    jmp L5
L1:
    cmp eax, 031545844h
    je L3
    cmp eax, 033545844h
    je L2
    cmp eax, 035545844h
    jne L9
L2:
    add ebx, 3
    sar ebx, 2
    shl ebx, 4
    jmp L4
L3:
    add ebx, 3
    sar ebx, 2
    shl ebx, 3
L4:
    mov ebp, 4
L5:
    cmp dword ptr [esp + 20], ebx
    push esi
    push edi
    jne L6
    lea eax, [ecx - 1]
    cdq
    idiv ebp
    mov esi, dword ptr [esp + 24]
    mov edi, dword ptr [esp + 32]
    mov ecx, eax
    inc ecx
    imul ecx, ebx
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
L6:
    xor eax, eax
    test ecx, ecx
    jle L8
L7:
    mov esi, dword ptr [esp + 24]
    mov edi, dword ptr [esp + 32]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [esp + 28]
    mov edi, dword ptr [esp + 32]
    mov esi, dword ptr [esp + 24]
    add edi, ecx
    mov ecx, dword ptr [esp + 20]
    add esi, ebx
    add eax, ebp
    cmp eax, ecx
    mov dword ptr [esp + 32], edi
    mov dword ptr [esp + 24], esi
    jl L7
L8:
    pop edi
    pop esi
L9:
    pop ebp
    pop ebx
    ret
FUN_1000e900 ENDP
END
