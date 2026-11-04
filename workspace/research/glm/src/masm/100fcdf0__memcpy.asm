.686
.MODEL FLAT, C
EXTRN sub_125756FC:PROC
.CODE
_memcpy PROC
    push ebp
    mov ebp, esp
    push edi
    push esi
    mov esi, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 16]
    mov edi, dword ptr [ebp + 8]
    mov eax, ecx
    mov edx, ecx
    add eax, esi
    cmp edi, esi
    jbe L0
    cmp edi, eax
    jb L4
L0:
    test edi, 3
    jne L1
    shr ecx, 2
    and edx, 3
    cmp ecx, 8
    jb L3
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp dword ptr [edx*4 + 0x100fcf3c]
L1:
    mov eax, edi
    mov edx, 3
    sub ecx, 4
    jb L2
    and eax, 3
    add ecx, eax
    jmp dword ptr [eax*4 + 0x100fce50]
L2:
    jmp dword ptr [ecx*4 + 0x100fcf4c]
    nop
L3:
    jmp dword ptr [ecx*4 + 0x100fced0]
    nop
    pushal
    into
    movups xmm1, xmmword ptr [esi + ecx*8 - 0314FEFF1h]
    movups xmm4, xmmword ptr [ebx]
    ror dword ptr [edx - 075F877FAh], 1
    inc esi
    add dword ptr [eax + 0468A0147h], ecx
    add al, cl
    jmp sub_125756FC
    add esi, 3
    add edi, 3
    cmp ecx, 8
    jb L3
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp dword ptr [edx*4 + 0x100fcf3c]
    lea ecx, [ecx]
    and edx, ecx
    mov al, byte ptr [esi]
    mov byte ptr [edi], al
    mov al, byte ptr [esi + 1]
    shr ecx, 2
    mov byte ptr [edi + 1], al
    add esi, 2
    add edi, 2
    cmp ecx, 8
    jb L3
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp dword ptr [edx*4 + 0x100fcf3c]
    nop
    and edx, ecx
    mov al, byte ptr [esi]
    mov byte ptr [edi], al
    add esi, 1
    shr ecx, 2
    add edi, 1
    cmp ecx, 8
    jb L3
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp dword ptr [edx*4 + 0x100fcf3c]
    lea ecx, [ecx]
    xor ecx, edi
    movups xmm4, xmmword ptr [eax]
    iretd
    movups xmm3, xmmword ptr [eax]
    iretd
    movups xmm2, xmmword ptr [eax]
    iretd
    movups xmm1, xmmword ptr [eax]
    iretd
    movups xmm0, xmmword ptr [eax]
    iretd
    movups xmm7, xmm0
    into
    movups xmm6, xmm0
    into
    movups xmm1, xmmword ptr [ebx - 0761B71BCh]
    inc esp
_memcpy ENDP
END
