.686
.MODEL FLAT, C
EXTRN sub_1256F0AC:PROC
.CODE
_memmove PROC
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
    jb L5
L0:
    test edi, 3
    jne L1
    shr ecx, 2
    and edx, 3
    cmp ecx, 8
    jb L3
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp dword ptr [edx*4 + 0x100f68ec]
L1:
    mov eax, edi
    mov edx, 3
    sub ecx, 4
    jb L2
    and eax, 3
    add ecx, eax
    jmp dword ptr [eax*4 + 0x100f6800]
L2:
    jmp dword ptr [ecx*4 + 0x100f68fc]
    nop
L3:
    jmp dword ptr [ecx*4 + 0x100f6880]
    nop
    adc byte ptr [eax + 15], ch
    adc byte ptr [eax + ebp*2], bh
    movups xmm4, xmmword ptr [eax + 104]
    movups xmm4, xmmword ptr [ebx]
    ror dword ptr [edx - 075F877FAh], 1
    inc esi
    add dword ptr [eax + 0468A0147h], ecx
    add al, cl
    jmp sub_1256F0AC
    add esi, 3
    add edi, 3
    cmp ecx, 8
    jb L3
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp dword ptr [edx*4 + 0x100f68ec]
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
    jmp dword ptr [edx*4 + 0x100f68ec]
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
    jmp dword ptr [edx*4 + 0x100f68ec]
    lea ecx, [ecx]
    jecxz L4
    movups xmm2, xmm0
    push 068C8100Fh
    movups xmm0, xmm0
    push 068B8100Fh
    movups xmm6, xmmword ptr [eax - 057EFF098h]
    push 068A0100Fh
    movups xmm1, xmmword ptr [ebx - 0761B71BCh]
    inc esp
_memmove ENDP
END
