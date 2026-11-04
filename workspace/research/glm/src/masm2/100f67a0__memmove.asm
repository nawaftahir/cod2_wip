.686
.MODEL FLAT, C
EXTRN sub_1256F0AC:PROC
.CODE
_memmove PROC
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
    jmp jmp dword ptr [edx*4 + 0100F68ECh]
    mov mov eax, edi
    mov mov edx, 3
    sub sub ecx, 4
    jb L3
    and and eax, 3
    add add ecx, eax
    jmp jmp dword ptr [eax*4 + 0100F6800h]
    jmp jmp dword ptr [ecx*4 + 0100F68FCh]
    nop nop
    jmp jmp dword ptr [ecx*4 + 0100F6880h]
    nop nop
L1:
    adc adc byte ptr [eax + 15], ch
    adc adc byte ptr [eax + ebp*2], bh
    movups movups xmm4, xmmword ptr [eax + 104]
    movups movups xmm4, xmmword ptr [ebx]
    ror ror dword ptr [edx - 075F877FAh], 1
    inc inc esi
    add add dword ptr [eax + 0468A0147h], ecx
    add add al, cl
    jmp sub_1256F0AC
    add add esi, 3
    add add edi, 3
    cmp cmp ecx, 8
    jb L4
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp jmp dword ptr [edx*4 + 0100F68ECh]
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
    jmp jmp dword ptr [edx*4 + 0100F68ECh]
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
    jmp jmp dword ptr [edx*4 + 0100F68ECh]
    lea lea ecx, [ecx]
    jecxz L8
    movups movups xmm2, xmm0
    push push 068C8100Fh
    movups movups xmm0, xmm0
    push push 068B8100Fh
    movups movups xmm6, xmmword ptr [eax - 057EFF098h]
    push push 068A0100Fh
    movups movups xmm1, xmmword ptr [ebx - 0761B71BCh]
    inc inc esp
_memmove ENDP
END
