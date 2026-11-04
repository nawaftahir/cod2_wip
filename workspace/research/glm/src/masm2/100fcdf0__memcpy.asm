.686
.MODEL FLAT, C
EXTRN sub_125756FC:PROC
.CODE
_memcpy PROC
    push push ebp
    mov mov ebp, esp
    push push edi
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, ecx
    mov mov edx, ecx
    add add eax, esi
    cmp cmp edi, esi
    jbe L0
    cmp cmp edi, eax
    jb L7
    test test edi, 3
    jne L1
    shr shr ecx, 2
    and and edx, 3
    cmp cmp ecx, 8
    jb L2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp jmp dword ptr [edx*4 + 0100FCF3Ch]
    mov mov eax, edi
    mov mov edx, 3
    sub sub ecx, 4
    jb L3
    and and eax, 3
    add add ecx, eax
    jmp jmp dword ptr [eax*4 + 0100FCE50h]
    jmp jmp dword ptr [ecx*4 + 0100FCF4Ch]
    nop nop
    jmp jmp dword ptr [ecx*4 + 0100FCED0h]
    nop nop
L1:
    pushal pushal
    into into
    movups movups xmm1, xmmword ptr [esi + ecx*8 - 0314FEFF1h]
    movups movups xmm4, xmmword ptr [ebx]
    ror ror dword ptr [edx - 075F877FAh], 1
    inc inc esi
    add add dword ptr [eax + 0468A0147h], ecx
    add add al, cl
    jmp sub_125756FC
    add add esi, 3
    add add edi, 3
    cmp cmp ecx, 8
    jb L4
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp jmp dword ptr [edx*4 + 0100FCF3Ch]
    lea lea ecx, [ecx]
L3:
    and and edx, ecx
    mov mov al, byte ptr [esi]
    mov mov byte ptr [edi], al
    mov mov al, byte ptr [esi + 1]
    shr shr ecx, 2
    mov mov byte ptr [edi + 1], al
    add add esi, 2
    add add edi, 2
    cmp cmp ecx, 8
    jb L5
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp jmp dword ptr [edx*4 + 0100FCF3Ch]
    nop nop
    and and edx, ecx
    mov mov al, byte ptr [esi]
    mov mov byte ptr [edi], al
    add add esi, 1
    shr shr ecx, 2
    add add edi, 1
    cmp cmp ecx, 8
    jb L6
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp jmp dword ptr [edx*4 + 0100FCF3Ch]
    lea lea ecx, [ecx]
    xor xor ecx, edi
    movups movups xmm4, xmmword ptr [eax]
    iretd iretd
    movups movups xmm3, xmmword ptr [eax]
    iretd iretd
    movups movups xmm2, xmmword ptr [eax]
    iretd iretd
    movups movups xmm1, xmmword ptr [eax]
    iretd iretd
    movups movups xmm0, xmmword ptr [eax]
    iretd iretd
    movups movups xmm7, xmm0
    into into
    movups movups xmm6, xmm0
    into into
    movups movups xmm1, xmmword ptr [ebx - 0761B71BCh]
    inc inc esp
_memcpy ENDP
END
