.686
.MODEL FLAT, C
EXTRN sub_1000E9FA:PROC
EXTRN sub_1000EA13:PROC
EXTRN sub_1000EA34:PROC
EXTRN sub_1000EA80:PROC
.CODE
FUN_1000e900 PROC
    cmp cmp eax, 51
    mov mov ecx, dword ptr [esp + 4]
    push push ebx
    push push ebp
    mov mov ebx, edx
    jg L1
    je L0
    add add eax, -21
    cmp cmp eax, 29
    ja sub_1000E9FA
    movzx movzx eax, byte ptr [eax + 01000E9F4h]
    jmp jmp dword ptr [eax*4 + 01000E9E4h]
    shl shl ebx, 2
    mov mov ebp, 1
    jmp L3
    add add ebx, ebx
    mov mov ebp, 1
    jmp L5
    cmp cmp eax, 031545844h
    je L4
    cmp cmp eax, 033545844h
    je L2
    cmp cmp eax, 035545844h
    jne sub_1000EA34
    add add ebx, 3
    sar sar ebx, 2
    shl shl ebx, 4
    jmp L6
    add add ebx, 3
    sar sar ebx, 2
    shl shl ebx, 3
    mov mov ebp, 4
    cmp cmp dword ptr [esp + 20], ebx
    push push esi
    push push edi
    jne sub_1000EA13
    lea lea eax, [ecx - 1]
    cdq cdq
    idiv idiv ebp
    mov mov esi, dword ptr [esp + 24]
    mov mov edi, dword ptr [esp + 32]
    mov mov ecx, eax
    inc inc ecx
    imul imul ecx, ebx
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
    xor xor eax, eax
L2:
    test test ecx, ecx
L3:
    jle sub_1000EA80
L4:
    mov mov esi, dword ptr [esp + 24]
    mov mov edi, dword ptr [esp + 32]
    mov mov ecx, ebx
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [esp + 28]
    mov mov edi, dword ptr [esp + 32]
    mov mov esi, dword ptr [esp + 24]
    add add edi, ecx
L6:
    mov mov ecx, dword ptr [esp + 20]
    add add esi, ebx
    add add eax, ebp
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 32], edi
    mov mov dword ptr [esp + 24], esi
    jl sub_1000EA80
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1000e900 ENDP
END
