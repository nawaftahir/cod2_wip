.686
.MODEL FLAT, C
EXTRN sub_100FBF95:PROC
EXTRN g_101813B0:DWORD
EXTRN g_101813C0:DWORD
EXTRN g_10181BD0:DWORD
EXTRN g_10181BE0:DWORD
EXTRN g_10181BF0:DWORD
EXTRN g_10181C00:DWORD
EXTRN g_10181C10:DWORD
EXTRN g_10181C20:DWORD
EXTRN g_10181C30:DWORD
EXTRN g_10181C38:DWORD
EXTRN g_10181C40:DWORD
EXTRN g_10181C48:DWORD
EXTRN g_10181C50:DWORD
EXTRN g_10181C58:DWORD
EXTRN g_10181C60:DWORD
EXTRN g_10181C68:DWORD
EXTRN g_10181C70:DWORD
.CODE
FUN_101030d9 PROC
    movlpd xmm0, qword ptr [esp + 4]
    movlpd xmm7, qword ptr [g_10181BE0]
    movlpd xmm2, qword ptr [g_10181BF0]
    andpd xmm7, xmm0
    movsd xmm4, xmm0
    psrlq xmm0, 44
    pextrw eax, xmm0, 0
    orpd xmm7, xmm2
    pextrw ecx, xmm4, 3
    and eax, 0000000FFh
    add eax, 1
    and eax, 0000001FEh
    mulsd xmm7, qword ptr [eax*4 + 01017E350h]
    movlpd xmm5, qword ptr [eax*4 + 01017E350h]
    add eax, eax
    movapd xmm6, xmmword ptr [eax*4 + 01017E760h]
    mov edx, 000007FEFh
    sub edx, ecx
    sub ecx, 16
    or ecx, edx
    cmp ecx, 080000000h
    jae L2
    mov ecx, 0
    mov edx, 00003FE7Fh
L0:
    movd xmm1, edx
    psubq xmm0, xmm1
    psrlq xmm0, 8
    cvtdq2pd xmm0, xmm0
    movlpd xmm1, qword ptr [g_10181C38]
    movsd xmm3, xmm7
    psrlq xmm7, 38
    pextrw eax, xmm7, 0
    andpd xmm4, xmmword ptr [g_10181BE0]
    and eax, 0000000FFh
    add eax, 1
    and eax, 0000001FEh
    mulsd xmm3, qword ptr [eax*4 + 01017EF70h]
    mulsd xmm5, qword ptr [eax*4 + 01017EF70h]
    add eax, eax
    addpd xmm6, xmmword ptr [eax*4 + 01017F380h]
    orpd xmm4, xmmword ptr [g_10181BF0]
    addsd xmm6, xmm0
    andpd xmm1, xmm4
    movsd xmm2, xmm3
    psrlq xmm3, 31
    pextrw eax, xmm3, 0
    movlpd xmm0, qword ptr [g_10181C38]
    subsd xmm4, xmm1
    movlpd xmm7, qword ptr [g_10181C40]
    and eax, 0000001FFh
    add eax, 1
    and eax, 0000003FEh
    mulsd xmm5, qword ptr [eax*4 + 01017FB90h]
    mulsd xmm2, qword ptr [eax*4 + 01017FB90h]
    addpd xmm6, xmmword ptr [eax*8 + 0101803A0h]
    andpd xmm0, xmm5
    subsd xmm5, xmm0
    addsd xmm7, xmm2
    movsd xmm3, xmm0
    mulsd xmm0, xmm1
    mulsd xmm1, xmm5
    mulsd xmm3, xmm4
    subsd xmm2, xmm0
    mulsd xmm4, xmm5
    movsd xmm0, xmm6
    subsd xmm2, xmm1
    addsd xmm6, xmm7
    movlpd xmm1, qword ptr [esp + 12]
    pextrw eax, xmm1, 3
    subsd xmm2, xmm3
    subsd xmm0, xmm6
    movlpd xmm3, qword ptr [g_10181C38]
    pextrw edx, xmm6, 3
    subsd xmm2, xmm4
    movsd xmm4, xmm6
    addsd xmm0, xmm7
    subsd xmm7, xmm2
    subsd xmm6, xmm2
    unpcklpd xmm7, xmm7
    and eax, 000007FF0h
    cmp eax, 000007FF0h
    jae L16
    and edx, 000007FF0h
    sub eax, 000003FF0h
    add eax, edx
    mov edx, 0000040A0h
    sub edx, eax
    sub eax, 000003C70h
    or edx, eax
    cmp edx, 080000000h
    jae L32
L1:
    subsd xmm4, xmm6
    subsd xmm2, xmm4
    movlpd xmm4, qword ptr [g_10181C38]
    andpd xmm3, xmm1
    andpd xmm4, xmm6
    subsd xmm0, xmm2
    xorpd xmm2, xmm2
    mov edx, 000004060h
    pinsrw xmm2, edx, 3
    movsd xmm5, xmm3
    mulsd xmm3, xmm4
    subsd xmm6, xmm4
    subsd xmm1, xmm5
    mulsd xmm3, xmm2
    mulsd xmm5, xmm6
    movapd xmm2, xmmword ptr [g_101813B0]
    mulsd xmm4, xmm1
    cvtsd2si eax, xmm3
    mulsd xmm6, xmm1
    movapd xmm1, xmmword ptr [g_101813C0]
    addsd xmm5, xmm4
    pshufd xmm4, xmm6, 0000000EEh
    addsd xmm5, xmm6
    mov edx, 00001FF7Fh
    sub edx, eax
    add eax, 00001E1FFh
    or edx, eax
    sub eax, 00001E1FFh
    cmp edx, 0
    jle L25
    add ecx, eax
    and eax, 127
    and ecx, 0FFFFFF80h
    add ecx, 00001FF80h
    addsd xmm4, xmm0
    movsd xmm0, xmm3
    addsd xmm3, qword ptr [g_10181BD0]
    mulpd xmm2, xmm7
    subsd xmm3, qword ptr [g_10181BD0]
    mulpd xmm7, xmm7
    subsd xmm0, xmm3
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    movapd xmm3, xmmword ptr [eax + 0101813D0h]
    movapd xmm6, xmmword ptr [g_10181C10]
    mulpd xmm1, xmm7
    addpd xmm2, xmm1
    pshufd xmm1, xmm2, 0000000EEh
    mulsd xmm2, xmm7
    xorpd xmm7, xmm7
    mov edx, 000003F80h
    addsd xmm2, xmm1
    pinsrw xmm7, edx, 3
    addsd xmm2, xmm4
    movlpd xmm4, qword ptr [g_10181C30]
    movd xmm1, ecx
    mulsd xmm2, qword ptr [esp + 12]
    mulsd xmm0, xmm7
    psllq xmm1, 45
    pshufd xmm1, xmm1, 68
    movapd xmm7, xmmword ptr [g_10181C20]
    addsd xmm5, xmm2
    mulpd xmm3, xmm1
    addsd xmm0, xmm5
    unpcklpd xmm0, xmm0
    mulpd xmm6, xmm0
    mulsd xmm4, xmm0
    mulpd xmm0, xmm0
    addpd xmm7, xmm6
    mulpd xmm7, xmm0
    mulsd xmm0, xmm3
    pshufd xmm6, xmm7, 0000000EEh
    mulsd xmm0, xmm7
    pshufd xmm5, xmm3, 0000000EEh
    mulsd xmm6, xmm3
    mulsd xmm4, xmm3
    addsd xmm0, xmm5
    sub esp, 16
    addsd xmm0, xmm6
    addsd xmm0, xmm4
    addsd xmm0, xmm3
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
L2:
    movlpd xmm1, qword ptr [esp + 12]
    movlpd xmm3, qword ptr [g_10181C00]
    movd eax, xmm1
    movsd xmm2, xmm1
    andpd xmm1, xmm3
    psrlq xmm1, 32
    movd ecx, xmm1
    cmp ecx, 07FF00000h
    jae L3
    or eax, ecx
    cmp eax, 0
    je L21
    cmp edx, 0
    jge L4
    neg edx
    add edx, 000007FEFh
    psllq xmm3, 52
    orpd xmm2, xmm3
    mov ecx, 0000003F3h
    movd xmm3, ecx
    psrlq xmm1, 20
    psubd xmm1, xmm3
    pxor xmm3, xmm3
    pmaxsw xmm1, xmm3
    psllq xmm2, xmm1
    pcmpeqd xmm2, xmm3
    pmovmskb eax, xmm2
    mov ecx, edx
    and edx, 000007FFFh
    cmp edx, 000007FF0h
    jae L9
    and eax, 0000000FFh
    cmp eax, 0000000FFh
    jne L15
    movlpd xmm1, qword ptr [esp + 12]
    movlpd xmm2, qword ptr [esp + 12]
    mov ecx, 0000003F4h
    movd xmm3, ecx
    andpd xmm1, xmmword ptr [g_10181C00]
    psrlq xmm1, 52
    psubd xmm1, xmm3
    movlpd xmm3, qword ptr [g_10181C60]
    psllq xmm2, xmm1
    pcmpeqd xmm2, xmm3
    pmovmskb eax, xmm2
    and eax, 0000000FFh
    mov ecx, 00003FF01h
    add ecx, eax
    and ecx, 000040000h
    cmp edx, 16
    jb L5
    mov edx, 0000BFE7Fh
    movlpd xmm3, qword ptr [g_10181BE0]
    movlpd xmm2, qword ptr [g_10181BF0]
    jmp L0
L3:
    movlpd xmm7, qword ptr [esp + 4]
    movlpd xmm4, qword ptr [esp + 4]
    movd edx, xmm7
    psrlq xmm7, 32
    movd eax, xmm7
    mov ecx, eax
    and eax, 07FFFFFFFh
    cmp eax, 07FF00000h
    jb L17
    ja L14
    cmp edx, 0
    ja L14
    jmp L17
L4:
    mov ecx, 0
L5:
    xorpd xmm0, xmm0
    mov eax, 0000043F0h
    pinsrw xmm0, eax, 3
    movlpd xmm7, qword ptr [g_10181BE0]
    movlpd xmm2, qword ptr [g_10181BF0]
    mulsd xmm0, xmm4
    movd edx, xmm4
    psrlq xmm4, 32
    movd eax, xmm4
    cmp edx, 0
    je L7
L6:
    andpd xmm7, xmm0
    movsd xmm4, xmm0
    andpd xmm0, xmmword ptr [g_10181C00]
    psrlq xmm0, 44
    pextrw eax, xmm0, 0
    orpd xmm7, xmm2
    and eax, 0000000FFh
    add eax, 1
    and eax, 0000001FEh
    mulsd xmm7, qword ptr [eax*4 + 01017E350h]
    movlpd xmm5, qword ptr [eax*4 + 01017E350h]
    add eax, eax
    movapd xmm6, xmmword ptr [eax*4 + 01017E760h]
    mov edx, 000043E7Fh
    jmp L0
L7:
    mov edx, eax
    and edx, 07FFFFFFFh
    cmp edx, 0
    jne L6
    mov edx, dword ptr [esp + 16]
    and edx, 080000000h
    cmp edx, 0
    je L8
    shl ecx, 13
    and eax, ecx
    mov edx, 07FF00000h
    or edx, eax
    movd xmm0, edx
    psllq xmm0, 32
    movlpd xmm1, qword ptr [g_10181BF0]
    movlpd xmm2, qword ptr [esp + 4]
    divsd xmm1, xmm2
    mov edx, 27
    jmp L24
L8:
    shl ecx, 13
    and eax, ecx
    cmp eax, 0
    jne L10
    fldz
    ret
L9:
    movlpd xmm3, qword ptr [g_10181BE0]
    xorpd xmm1, xmm1
    andpd xmm3, xmm4
    pcmpeqd xmm1, xmm3
    pmovmskb ecx, xmm1
    and ecx, 0000000FFh
    cmp ecx, 0000000FFh
    jne L14
    pextrw ecx, xmm4, 3
    and ecx, 000008000h
    cmp ecx, 0
    je L13
    and eax, 0000000FFh
    cmp eax, 0000000FFh
    jne L12
    movlpd xmm1, qword ptr [esp + 12]
    movlpd xmm2, qword ptr [esp + 12]
    mov ecx, 0000003F4h
    movd xmm3, ecx
    andpd xmm1, xmmword ptr [g_10181C00]
    psrlq xmm1, 52
    psubd xmm1, xmm3
    pxor xmm3, xmm3
    psllq xmm2, xmm1
    pcmpeqd xmm2, xmm3
    pmovmskb eax, xmm2
    and eax, 0000000FFh
    cmp eax, 0000000FFh
    je L12
    movlpd xmm1, qword ptr [esp + 12]
    pextrw eax, xmm1, 3
    and eax, 000008000h
    cmp eax, 0
    je L11
L10:
    fld qword ptr [g_10181C60]
    ret
L11:
    fld qword ptr [g_10181C58]
    ret
L12:
    movlpd xmm1, qword ptr [esp + 12]
    pextrw eax, xmm1, 3
    and eax, 000008000h
    cmp eax, 0
    je L19
    fldz
    ret
L13:
    movlpd xmm1, qword ptr [esp + 12]
    pextrw eax, xmm1, 3
    and eax, 000008000h
    cmp eax, 0
    je L19
    fldz
    ret
L14:
    addsd xmm4, xmm4
    movsd xmm0, xmm4
    mov edx, 0000003EEh
    jmp L24
L15:
    movlpd xmm2, qword ptr [esp + 4]
    movd eax, xmm2
    psrlq xmm2, 32
    movd edx, xmm2
    and edx, 07FFFFFFFh
    or eax, edx
    mov ecx, 0
    cmp eax, 0
    je L7
    movlpd xmm1, qword ptr [g_10181C48]
    movlpd xmm0, qword ptr [g_10181C70]
    mulsd xmm1, xmm1
    mov edx, 28
    jmp L24
L16:
    movlpd xmm4, qword ptr [esp + 4]
    movlpd xmm2, qword ptr [esp + 12]
    movd eax, xmm4
    cmp eax, 0
    jne L17
    psrlq xmm4, 32
    movd edx, xmm4
    cmp edx, 03FF00000h
    je L23
    cmp edx, 0BFF00000h
    jne L17
    movlpd xmm3, qword ptr [g_10181BE0]
    xorpd xmm1, xmm1
    andpd xmm3, xmm2
    pcmpeqd xmm1, xmm3
    pmovmskb eax, xmm1
    cmp eax, 0000000FFh
    jne L20
    fld1
    ret
L17:
    movlpd xmm3, qword ptr [g_10181BE0]
    xorpd xmm1, xmm1
    andpd xmm3, xmm2
    pcmpeqd xmm1, xmm3
    pmovmskb eax, xmm1
    and eax, 0000000FFh
    cmp eax, 0000000FFh
    jne L20
    pextrw eax, xmm2, 3
    movlpd xmm4, qword ptr [esp + 4]
    and eax, 000008000h
    xor ecx, 0BFF00000h
    or edx, ecx
    cmp edx, 0
    je L23
    cmp eax, 0
    je L18
    pextrw eax, xmm4, 3
    and eax, 000007FF0h
    cmp eax, 000003FF0h
    jb L19
    fldz
    ret
L18:
    pextrw eax, xmm4, 3
    and eax, 000007FF0h
    cmp eax, 000003FF0h
    jae L19
    fldz
    ret
L19:
    fld qword ptr [g_10181C50]
    ret
L20:
    addsd xmm2, xmm2
    movsd xmm0, xmm2
    mov edx, 0000003EEh
    jmp L24
L21:
    movd eax, xmm4
    psrlq xmm4, 32
    movd edx, xmm4
    and edx, 07FFFFFFFh
    mov ecx, eax
    or eax, edx
    movlpd xmm0, qword ptr [g_10181BF0]
    mov edx, 26
    cmp eax, 0
    je L24
    movd eax, xmm4
    mov edx, 29
    and eax, 07FFFFFFFh
    cmp eax, 07FF00000h
    ja L24
    jb L22
    cmp ecx, 0
    ja L24
L22:
    sub esp, 16
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
L23:
    movlpd xmm1, qword ptr [g_10181C70]
    movlpd xmm0, qword ptr [esp + 12]
    addsd xmm0, xmm1
    mov edx, 28
L24:
    sub esp, 28
    movlpd qword ptr [esp + 16], xmm0
    mov dword ptr [esp + 12], edx
    mov edx, esp
    add edx, 16
    mov dword ptr [esp + 8], edx
    add edx, 24
    mov dword ptr [esp + 4], edx
    sub edx, 8
    mov dword ptr [esp], edx
    call sub_100FBF95
    fld qword ptr [esp + 16]
    add esp, 28
    ret
L25:
    cmp eax, 0
    jle L26
    cmp eax, 000040000h
    jae L30
    push esi
    mov edx, eax
    and eax, 127
    add ecx, 00003FF00h
    sub edx, 000000080h
    and edx, 0FFFFFF80h
    push edi
    mov edi, 000003FF0h
    jmp L27
L26:
    cmp eax, 0FFFC0200h
    jle L29
    push esi
    mov edx, eax
    and eax, 127
    add ecx, 000000080h
    and edx, 0FFFFFF80h
    add edx, 00003FE80h
    push edi
    mov edi, 0
L27:
    addsd xmm4, xmm0
    movsd xmm0, xmm3
    addsd xmm3, qword ptr [g_10181BD0]
    mov esi, edx
    sub esi, 00001FF80h
    mulpd xmm2, xmm7
    subsd xmm3, qword ptr [g_10181BD0]
    mulpd xmm7, xmm7
    subsd xmm0, xmm3
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, eax
    movapd xmm3, xmmword ptr [eax + 0101813D0h]
    movapd xmm6, xmmword ptr [g_10181C10]
    mulpd xmm1, xmm7
    addpd xmm2, xmm1
    pshufd xmm1, xmm2, 0000000EEh
    mulsd xmm2, xmm7
    addsd xmm2, xmm1
    addsd xmm2, xmm4
    movlpd xmm4, qword ptr [g_10181C30]
    movd xmm1, edx
    sub edx, 00001FF80h
    neg edx
    sar edx, 7
    add edx, 2
    mov eax, edx
    and eax, 32
    add edx, eax
    xorpd xmm7, xmm7
    mov eax, 000003F80h
    pinsrw xmm7, eax, 3
    mulsd xmm2, qword ptr [esp + 20]
    mulsd xmm0, xmm7
    psllq xmm1, 45
    pshufd xmm1, xmm1, 68
    movapd xmm7, xmmword ptr [g_10181C20]
    addsd xmm5, xmm2
    mulpd xmm3, xmm1
    addsd xmm0, xmm5
    unpcklpd xmm0, xmm0
    mulpd xmm6, xmm0
    mulsd xmm4, xmm0
    mulpd xmm0, xmm0
    addpd xmm7, xmm6
    mulpd xmm7, xmm0
    mulsd xmm0, xmm3
    pshufd xmm6, xmm7, 0000000EEh
    mulsd xmm0, xmm7
    pshufd xmm5, xmm3, 0000000EEh
    mulsd xmm6, xmm3
    mulsd xmm4, xmm3
    movd xmm7, ecx
    psllq xmm7, 45
    movd xmm2, edx
    pcmpeqd xmm1, xmm1
    psllq xmm1, xmm2
    addsd xmm0, xmm5
    addsd xmm0, xmm6
    andpd xmm1, xmm3
    addsd xmm0, xmm4
    xorpd xmm6, xmm6
    pcmpeqd xmm4, xmm4
    psllq xmm4, xmm2
    subsd xmm3, xmm1
    movsd xmm2, xmm1
    addsd xmm1, xmm0
    andpd xmm1, xmm4
    pinsrw xmm6, edi, 3
    pop edi
    subsd xmm2, xmm1
    addsd xmm0, xmm2
    addsd xmm0, xmm3
    cmp esi, 0
    jg L28
    pop esi
    mulsd xmm0, xmm7
    mulsd xmm1, xmm7
    addsd xmm0, xmm1
    mulsd xmm6, xmm0
    addsd xmm0, xmm6
    pextrw eax, xmm0, 3
    and eax, 000007FF0h
    mov edx, 24
    cmp eax, 000007FF0h
    je L24
    mov edx, 25
    cmp eax, 0
    je L24
    sub esp, 16
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
L28:
    pop esi
    addsd xmm0, xmm1
    mulsd xmm0, xmm7
    mulsd xmm6, xmm0
    addsd xmm0, xmm6
    pextrw eax, xmm0, 3
    and eax, 000007FF0h
    mov edx, 24
    cmp eax, 000007FF0h
    je L24
    mov edx, 25
    cmp eax, 0
    je L24
    sub esp, 16
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
L29:
    movlpd xmm0, qword ptr [g_10181C68]
    movd xmm1, ecx
    mulsd xmm0, xmm0
    psllq xmm1, 45
    orpd xmm0, xmm1
    mov edx, 25
    jmp L24
L30:
    mov edx, 24
    cmp ecx, 0
    je L31
    movlpd xmm0, qword ptr [g_10181C58]
    jmp L24
L31:
    movlpd xmm0, qword ptr [g_10181C50]
    jmp L24
L32:
    pshufd xmm4, xmm1, 68
    mulpd xmm4, xmm6
    pextrw eax, xmm4, 3
    and eax, 000007FF0h
    mov edx, 0000040A0h
    sub edx, eax
    sub eax, 000003C70h
    or edx, eax
    cmp edx, 080000000h
    jb L1
    cmp eax, 080000000h
    jb L33
    or ecx, 00001FF80h
    movd xmm0, ecx
    psllq xmm0, 45
    sub esp, 16
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
L33:
    movlpd xmm4, qword ptr [esp + 4]
    pextrw edx, xmm4, 3
    and edx, 000007FF0h
    sub edx, 000003FF0h
    pextrw eax, xmm1, 3
    xor eax, edx
    and eax, 000008000h
    cmp eax, 0
    jne L29
    jmp L30
FUN_101030d9 ENDP
END
