.686
.MODEL FLAT, C
EXTRN sub_100FBF95:PROC
EXTRN sub_10103C6E:PROC
EXTRN sub_10103C75:PROC
EXTRN sub_10103C82:PROC
EXTRN sub_10103C9B:PROC
EXTRN sub_10103CD0:PROC
EXTRN sub_10103CE0:PROC
EXTRN sub_10103CE8:PROC
EXTRN sub_10103D12:PROC
EXTRN sub_10103D20:PROC
EXTRN sub_10103D50:PROC
EXTRN sub_10103D7D:PROC
EXTRN sub_10103E4F:PROC
EXTRN sub_10103EA5:PROC
EXTRN sub_10103EC0:PROC
EXTRN sub_10103EC1:PROC
EXTRN sub_10103EDD:PROC
EXTRN sub_10103F59:PROC
EXTRN sub_10103F75:PROC
EXTRN sub_10103F9C:PROC
EXTRN sub_10103FA0:PROC
EXTRN sub_10103FA7:PROC
EXTRN sub_10103FB3:PROC
EXTRN sub_10103FCC:PROC
EXTRN sub_10103FE0:PROC
EXTRN sub_10104022:PROC
EXTRN sub_1010407C:PROC
EXTRN sub_10104094:PROC
EXTRN sub_101040A5:PROC
EXTRN sub_101040BA:PROC
EXTRN sub_101040C1:PROC
EXTRN sub_1010417B:PROC
EXTRN sub_101041C9:PROC
EXTRN sub_101042D9:PROC
EXTRN sub_101042E7:PROC
EXTRN sub_10104323:PROC
EXTRN sub_10104331:PROC
EXTRN sub_10104365:PROC
EXTRN sub_1010437C:PROC
EXTRN sub_10104389:PROC
EXTRN sub_101043A5:PROC
EXTRN sub_101043AA:PROC
EXTRN sub_101044B9:PROC
EXTRN sub_10104602:PROC
EXTRN sub_10104662:PROC
EXTRN sub_1010468A:PROC
EXTRN sub_101046B1:PROC
EXTRN EXTRN g_101813B0:DWORD:DWORD
EXTRN EXTRN g_101813C0:DWORD:DWORD
EXTRN EXTRN g_10181BD0:DWORD:DWORD
EXTRN EXTRN g_10181BE0:DWORD:DWORD
EXTRN EXTRN g_10181BF0:DWORD:DWORD
EXTRN EXTRN g_10181C00:DWORD:DWORD
EXTRN EXTRN g_10181C10:DWORD:DWORD
EXTRN EXTRN g_10181C20:DWORD:DWORD
EXTRN EXTRN g_10181C30:DWORD:DWORD
EXTRN EXTRN g_10181C38:DWORD:DWORD
EXTRN EXTRN g_10181C40:DWORD:DWORD
EXTRN EXTRN g_10181C48:DWORD:DWORD
EXTRN EXTRN g_10181C50:DWORD:DWORD
EXTRN EXTRN g_10181C58:DWORD:DWORD
EXTRN EXTRN g_10181C60:DWORD:DWORD
EXTRN EXTRN g_10181C68:DWORD:DWORD
EXTRN EXTRN g_10181C70:DWORD:DWORD
.CODE
FUN_101030d9 PROC
    movlpd movlpd xmm0, qword ptr [esp + 4]
    movlpd movlpd xmm7, qword ptr [g_10181BE0]
    movlpd movlpd xmm2, qword ptr [g_10181BF0]
    andpd andpd xmm7, xmm0
    movsd movsd xmm4, xmm0
    psrlq psrlq xmm0, 44
    pextrw pextrw eax, xmm0, 0
    orpd orpd xmm7, xmm2
    pextrw pextrw ecx, xmm4, 3
    and and eax, 0FFh
    add add eax, 1
    and and eax, 01FEh
    mulsd mulsd xmm7, qword ptr [eax*4 + 01017E350h]
    movlpd movlpd xmm5, qword ptr [eax*4 + 01017E350h]
    add add eax, eax
    movapd movapd xmm6, xmmword ptr [eax*4 + 01017E760h]
    mov mov edx, 07FEFh
    sub sub edx, ecx
    sub sub ecx, 16
    or or ecx, edx
    cmp cmp ecx, 080000000h
    jae L0
    mov mov ecx, 0
    mov mov edx, 03FE7Fh
    movd movd xmm1, edx
    psubq psubq xmm0, xmm1
    psrlq psrlq xmm0, 8
    cvtdq2pd cvtdq2pd xmm0, xmm0
    movlpd movlpd xmm1, qword ptr [g_10181C38]
    movsd movsd xmm3, xmm7
    psrlq psrlq xmm7, 38
    pextrw pextrw eax, xmm7, 0
    andpd andpd xmm4, xmmword ptr [g_10181BE0]
    and and eax, 0FFh
    add add eax, 1
    and and eax, 01FEh
    mulsd mulsd xmm3, qword ptr [eax*4 + 01017EF70h]
    mulsd mulsd xmm5, qword ptr [eax*4 + 01017EF70h]
    add add eax, eax
    addpd addpd xmm6, xmmword ptr [eax*4 + 01017F380h]
    orpd orpd xmm4, xmmword ptr [g_10181BF0]
    addsd addsd xmm6, xmm0
    andpd andpd xmm1, xmm4
    movsd movsd xmm2, xmm3
    psrlq psrlq xmm3, 31
    pextrw pextrw eax, xmm3, 0
    movlpd movlpd xmm0, qword ptr [g_10181C38]
    subsd subsd xmm4, xmm1
    movlpd movlpd xmm7, qword ptr [g_10181C40]
    and and eax, 01FFh
    add add eax, 1
    and and eax, 03FEh
    mulsd mulsd xmm5, qword ptr [eax*4 + 01017FB90h]
    mulsd mulsd xmm2, qword ptr [eax*4 + 01017FB90h]
    addpd addpd xmm6, xmmword ptr [eax*8 + 0101803A0h]
    andpd andpd xmm0, xmm5
    subsd subsd xmm5, xmm0
    addsd addsd xmm7, xmm2
    movsd movsd xmm3, xmm0
    mulsd mulsd xmm0, xmm1
    mulsd mulsd xmm1, xmm5
    mulsd mulsd xmm3, xmm4
    subsd subsd xmm2, xmm0
    mulsd mulsd xmm4, xmm5
    movsd movsd xmm0, xmm6
    subsd subsd xmm2, xmm1
    addsd addsd xmm6, xmm7
    movlpd movlpd xmm1, qword ptr [esp + 12]
    pextrw pextrw eax, xmm1, 3
    subsd subsd xmm2, xmm3
    subsd subsd xmm0, xmm6
    movlpd movlpd xmm3, qword ptr [g_10181C38]
    pextrw pextrw edx, xmm6, 3
    subsd subsd xmm2, xmm4
    movsd movsd xmm4, xmm6
    addsd addsd xmm0, xmm7
    subsd subsd xmm7, xmm2
    subsd subsd xmm6, xmm2
    unpcklpd unpcklpd xmm7, xmm7
    and and eax, 07FF0h
    cmp cmp eax, 07FF0h
    jae L5
    and and edx, 07FF0h
    sub sub eax, 03FF0h
    add add eax, edx
    mov mov edx, 040A0h
    sub sub edx, eax
    sub sub eax, 03C70h
    or or edx, eax
    cmp cmp edx, 080000000h
    jae sub_10103D50
    subsd subsd xmm4, xmm6
    subsd subsd xmm2, xmm4
    movlpd movlpd xmm4, qword ptr [g_10181C38]
    andpd andpd xmm3, xmm1
    andpd andpd xmm4, xmm6
    subsd subsd xmm0, xmm2
    xorpd xorpd xmm2, xmm2
    mov mov edx, 04060h
    pinsrw pinsrw xmm2, edx, 3
    movsd movsd xmm5, xmm3
    mulsd mulsd xmm3, xmm4
    subsd subsd xmm6, xmm4
    subsd subsd xmm1, xmm5
    mulsd mulsd xmm3, xmm2
    mulsd mulsd xmm5, xmm6
    movapd movapd xmm2, xmmword ptr [g_101813B0]
    mulsd mulsd xmm4, xmm1
    cvtsd2si cvtsd2si eax, xmm3
    mulsd mulsd xmm6, xmm1
    movapd movapd xmm1, xmmword ptr [g_101813C0]
    addsd addsd xmm5, xmm4
    pshufd pshufd xmm4, xmm6, 0EEh
    addsd addsd xmm5, xmm6
    mov mov edx, 01FF7Fh
    sub sub edx, eax
    add add eax, 01E1FFh
    or or edx, eax
    sub sub eax, 01E1FFh
    cmp cmp edx, 0
    jle L11
    add add ecx, eax
    and and eax, 127
    and and ecx, -128
    add add ecx, 01FF80h
    addsd addsd xmm4, xmm0
    movsd movsd xmm0, xmm3
    addsd addsd xmm3, qword ptr [g_10181BD0]
    mulpd mulpd xmm2, xmm7
    subsd subsd xmm3, qword ptr [g_10181BD0]
    mulpd mulpd xmm7, xmm7
    subsd subsd xmm0, xmm3
    add add eax, eax
    add add eax, eax
    add add eax, eax
    add add eax, eax
    movapd movapd xmm3, xmmword ptr [eax + 0101813D0h]
    movapd movapd xmm6, xmmword ptr [g_10181C10]
    mulpd mulpd xmm1, xmm7
    addpd addpd xmm2, xmm1
    pshufd pshufd xmm1, xmm2, 0EEh
    mulsd mulsd xmm2, xmm7
    xorpd xorpd xmm7, xmm7
    mov mov edx, 03F80h
    addsd addsd xmm2, xmm1
    pinsrw pinsrw xmm7, edx, 3
    addsd addsd xmm2, xmm4
    movlpd movlpd xmm4, qword ptr [g_10181C30]
    movd movd xmm1, ecx
    mulsd mulsd xmm2, qword ptr [esp + 12]
    mulsd mulsd xmm0, xmm7
    psllq psllq xmm1, 45
    pshufd pshufd xmm1, xmm1, 68
    movapd movapd xmm7, xmmword ptr [g_10181C20]
    addsd addsd xmm5, xmm2
    mulpd mulpd xmm3, xmm1
    addsd addsd xmm0, xmm5
    unpcklpd unpcklpd xmm0, xmm0
    mulpd mulpd xmm6, xmm0
    mulsd mulsd xmm4, xmm0
    mulpd mulpd xmm0, xmm0
    addpd addpd xmm7, xmm6
    mulpd mulpd xmm7, xmm0
    mulsd mulsd xmm0, xmm3
    pshufd pshufd xmm6, xmm7, 0EEh
    mulsd mulsd xmm0, xmm7
    pshufd pshufd xmm5, xmm3, 0EEh
    mulsd mulsd xmm6, xmm3
    mulsd mulsd xmm4, xmm3
    addsd addsd xmm0, xmm5
    sub sub esp, 16
    addsd addsd xmm0, xmm6
    addsd addsd xmm0, xmm4
    addsd addsd xmm0, xmm3
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    movlpd movlpd xmm1, qword ptr [esp + 12]
    movlpd movlpd xmm3, qword ptr [g_10181C00]
    movd movd eax, xmm1
    movsd movsd xmm2, xmm1
    andpd andpd xmm1, xmm3
    psrlq psrlq xmm1, 32
    movd movd ecx, xmm1
    cmp cmp ecx, 07FF00000h
    jae L3
    or or eax, ecx
    cmp cmp eax, 0
    je L15
    cmp cmp edx, 0
    jge L4
    neg neg edx
    add add edx, 07FEFh
    psllq psllq xmm3, 52
    orpd orpd xmm2, xmm3
    mov mov ecx, 03F3h
    movd movd xmm3, ecx
    psrlq psrlq xmm1, 20
    psubd psubd xmm1, xmm3
    pxor pxor xmm3, xmm3
    pmaxsw pmaxsw xmm1, xmm3
    psllq psllq xmm2, xmm1
    pcmpeqd pcmpeqd xmm2, xmm3
    pmovmskb pmovmskb eax, xmm2
    mov mov ecx, edx
    and and edx, 07FFFh
    cmp cmp edx, 07FF0h
    jae L7
    and and eax, 0FFh
    cmp cmp eax, 0FFh
    jne L10
    movlpd movlpd xmm1, qword ptr [esp + 12]
    movlpd movlpd xmm2, qword ptr [esp + 12]
    mov mov ecx, 03F4h
    movd movd xmm3, ecx
    andpd andpd xmm1, xmmword ptr [g_10181C00]
    psrlq psrlq xmm1, 52
    psubd psubd xmm1, xmm3
    movlpd movlpd xmm3, qword ptr [g_10181C60]
    psllq psllq xmm2, xmm1
    pcmpeqd pcmpeqd xmm2, xmm3
    pmovmskb pmovmskb eax, xmm2
    and and eax, 0FFh
    mov mov ecx, 03FF01h
    add add ecx, eax
    and and ecx, 040000h
    cmp cmp edx, 16
    jb L6
    mov mov edx, 0BFE7Fh
    movlpd movlpd xmm3, qword ptr [g_10181BE0]
    movlpd movlpd xmm2, qword ptr [g_10181BF0]
    jmp L1
    movlpd movlpd xmm7, qword ptr [esp + 4]
    movlpd movlpd xmm4, qword ptr [esp + 4]
    movd movd edx, xmm7
    psrlq psrlq xmm7, 32
    movd movd eax, xmm7
    mov mov ecx, eax
    and and eax, 07FFFFFFFh
    cmp cmp eax, 07FF00000h
    jb sub_10103C6E
    ja L13
    cmp cmp edx, 0
    ja L14
    jmp sub_10103C82
    mov mov ecx, 0
    xorpd xorpd xmm0, xmm0
    mov mov eax, 043F0h
    pinsrw pinsrw xmm0, eax, 3
    movlpd movlpd xmm7, qword ptr [g_10181BE0]
    movlpd movlpd xmm2, qword ptr [g_10181BF0]
    mulsd mulsd xmm0, xmm4
    movd movd edx, xmm4
    psrlq psrlq xmm4, 32
    movd movd eax, xmm4
    cmp cmp edx, 0
    je L8
    andpd andpd xmm7, xmm0
    movsd movsd xmm4, xmm0
    andpd andpd xmm0, xmmword ptr [g_10181C00]
    psrlq psrlq xmm0, 44
    pextrw pextrw eax, xmm0, 0
    orpd orpd xmm7, xmm2
    and and eax, 0FFh
    add add eax, 1
    and and eax, 01FEh
    mulsd mulsd xmm7, qword ptr [eax*4 + 01017E350h]
    movlpd movlpd xmm5, qword ptr [eax*4 + 01017E350h]
    add add eax, eax
    movapd movapd xmm6, xmmword ptr [eax*4 + 01017E760h]
    mov mov edx, 043E7Fh
    jmp L2
    mov mov edx, eax
    and and edx, 07FFFFFFFh
    cmp cmp edx, 0
    jne L9
    mov mov edx, dword ptr [esp + 16]
    and and edx, 080000000h
    cmp cmp edx, 0
    je L12
    shl shl ecx, 13
    and and eax, ecx
    mov mov edx, 07FF00000h
    or or edx, eax
    movd movd xmm0, edx
    psllq psllq xmm0, 32
    movlpd movlpd xmm1, qword ptr [g_10181BF0]
    movlpd movlpd xmm2, qword ptr [esp + 4]
    divsd divsd xmm1, xmm2
    mov mov edx, 27
    jmp sub_10103E4F
    shl shl ecx, 13
    and and eax, ecx
    cmp cmp eax, 0
    jne sub_10103C75
    fldz fldz
    ret ret
    movlpd movlpd xmm3, qword ptr [g_10181BE0]
    xorpd xorpd xmm1, xmm1
    andpd andpd xmm3, xmm4
    pcmpeqd pcmpeqd xmm1, xmm3
    pmovmskb pmovmskb ecx, xmm1
    and and ecx, 0FFh
    cmp cmp ecx, 0FFh
    jne sub_10103CE8
    pextrw pextrw ecx, xmm4, 3
    and and ecx, 08000h
    cmp cmp ecx, 0
    je sub_10103CE0
    and and eax, 0FFh
    cmp cmp eax, 0FFh
    jne sub_10103CD0
    movlpd movlpd xmm1, qword ptr [esp + 12]
    movlpd movlpd xmm2, qword ptr [esp + 12]
    mov mov ecx, 03F4h
    movd movd xmm3, ecx
    andpd andpd xmm1, xmmword ptr [g_10181C00]
    psrlq psrlq xmm1, 52
    psubd psubd xmm1, xmm3
    pxor pxor xmm3, xmm3
    psllq psllq xmm2, xmm1
    pcmpeqd pcmpeqd xmm2, xmm3
    pmovmskb pmovmskb eax, xmm2
    and and eax, 0FFh
    cmp cmp eax, 0FFh
    je sub_10103D12
    movlpd movlpd xmm1, qword ptr [esp + 12]
    pextrw pextrw eax, xmm1, 3
    and and eax, 08000h
    cmp cmp eax, 0
    je sub_10103D20
    fld fld qword ptr [g_10181C60]
    ret ret
    fld fld qword ptr [g_10181C58]
    ret ret
    movlpd movlpd xmm1, qword ptr [esp + 12]
    pextrw pextrw eax, xmm1, 3
    and and eax, 08000h
    cmp cmp eax, 0
    je sub_10103EA5
    fldz fldz
    ret ret
    movlpd movlpd xmm1, qword ptr [esp + 12]
    pextrw pextrw eax, xmm1, 3
    and and eax, 08000h
    cmp cmp eax, 0
    je sub_10103EC1
    fldz fldz
    ret ret
    addsd addsd xmm4, xmm4
    movsd movsd xmm0, xmm4
    mov mov edx, 03EEh
    jmp sub_10103F59
    movlpd movlpd xmm2, qword ptr [esp + 4]
    movd movd eax, xmm2
    psrlq psrlq xmm2, 32
    movd movd edx, xmm2
    and and edx, 07FFFFFFFh
    or or eax, edx
    mov mov ecx, 0
    cmp cmp eax, 0
    je sub_10103C9B
    movlpd movlpd xmm1, qword ptr [g_10181C48]
    movlpd movlpd xmm0, qword ptr [g_10181C70]
    mulsd mulsd xmm1, xmm1
    mov mov edx, 28
    jmp sub_10103FA0
    movlpd movlpd xmm4, qword ptr [esp + 4]
    movlpd movlpd xmm2, qword ptr [esp + 12]
    movd movd eax, xmm4
    cmp cmp eax, 0
    jne sub_10103EC0
    psrlq psrlq xmm4, 32
    movd movd edx, xmm4
    cmp cmp edx, 03FF00000h
    je sub_10103FB3
    cmp cmp edx, 0BFF00000h
    jne sub_10103EDD
    movlpd movlpd xmm3, qword ptr [g_10181BE0]
    xorpd xorpd xmm1, xmm1
    andpd andpd xmm3, xmm2
    pcmpeqd pcmpeqd xmm1, xmm3
    pmovmskb pmovmskb eax, xmm1
    cmp cmp eax, 0FFh
    jne sub_10103F75
    fld1 fld1
    ret ret
    movlpd movlpd xmm3, qword ptr [g_10181BE0]
    xorpd xorpd xmm1, xmm1
    andpd andpd xmm3, xmm2
    pcmpeqd pcmpeqd xmm1, xmm3
    pmovmskb pmovmskb eax, xmm1
    and and eax, 0FFh
    cmp cmp eax, 0FFh
    jne sub_10103F9C
    pextrw pextrw eax, xmm2, 3
    movlpd movlpd xmm4, qword ptr [esp + 4]
    and and eax, 08000h
    xor xor ecx, 0BFF00000h
    or or edx, ecx
    cmp cmp edx, 0
    je sub_10104022
    cmp cmp eax, 0
    je sub_10103FA7
    pextrw pextrw eax, xmm4, 3
    and and eax, 07FF0h
    cmp cmp eax, 03FF0h
    jb sub_10103FCC
    fldz fldz
    ret ret
    pextrw pextrw eax, xmm4, 3
    and and eax, 07FF0h
    cmp cmp eax, 03FF0h
    jae sub_10103FE0
    fldz fldz
    ret ret
    fld fld qword ptr [g_10181C50]
    ret ret
    addsd addsd xmm2, xmm2
    movsd movsd xmm0, xmm2
    mov mov edx, 03EEh
    jmp sub_1010407C
    movd movd eax, xmm4
    psrlq psrlq xmm4, 32
    movd movd edx, xmm4
    and and edx, 07FFFFFFFh
    mov mov ecx, eax
    or or eax, edx
    movlpd movlpd xmm0, qword ptr [g_10181BF0]
    mov mov edx, 26
    cmp cmp eax, 0
    je sub_101040A5
    movd movd eax, xmm4
    mov mov edx, 29
    and and eax, 07FFFFFFFh
    cmp cmp eax, 07FF00000h
    ja sub_101040BA
    jb sub_10104094
    cmp cmp ecx, 0
    ja sub_101040C1
    sub sub esp, 16
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    movlpd movlpd xmm1, qword ptr [g_10181C70]
    movlpd movlpd xmm0, qword ptr [esp + 12]
    addsd addsd xmm0, xmm1
    mov mov edx, 28
    sub sub esp, 28
    movlpd movlpd qword ptr [esp + 16], xmm0
    mov mov dword ptr [esp + 12], edx
    mov mov edx, esp
    add add edx, 16
    mov mov dword ptr [esp + 8], edx
    add add edx, 24
    mov mov dword ptr [esp + 4], edx
    sub sub edx, 8
    mov mov dword ptr [esp], edx
    call sub_100FBF95
    fld fld qword ptr [esp + 16]
    add add esp, 28
    ret ret
    cmp cmp eax, 0
    jle sub_1010417B
    cmp cmp eax, 040000h
    jae sub_101043A5
    push push esi
    mov mov edx, eax
    and and eax, 127
    add add ecx, 03FF00h
    sub sub edx, 080h
    and and edx, -128
    push push edi
    mov mov edi, 03FF0h
    jmp sub_101041C9
    cmp cmp eax, 0FFFC0200h
    jle sub_101043AA
    push push esi
    mov mov edx, eax
    and and eax, 127
    add add ecx, 080h
    and and edx, -128
    add add edx, 03FE80h
    push push edi
    mov mov edi, 0
    addsd addsd xmm4, xmm0
    movsd movsd xmm0, xmm3
    addsd addsd xmm3, qword ptr [g_10181BD0]
    mov mov esi, edx
    sub sub esi, 01FF80h
    mulpd mulpd xmm2, xmm7
    subsd subsd xmm3, qword ptr [g_10181BD0]
    mulpd mulpd xmm7, xmm7
    subsd subsd xmm0, xmm3
    add add eax, eax
    add add eax, eax
    add add eax, eax
    add add eax, eax
    movapd movapd xmm3, xmmword ptr [eax + 0101813D0h]
    movapd movapd xmm6, xmmword ptr [g_10181C10]
    mulpd mulpd xmm1, xmm7
    addpd addpd xmm2, xmm1
    pshufd pshufd xmm1, xmm2, 0EEh
    mulsd mulsd xmm2, xmm7
    addsd addsd xmm2, xmm1
    addsd addsd xmm2, xmm4
    movlpd movlpd xmm4, qword ptr [g_10181C30]
    movd movd xmm1, edx
    sub sub edx, 01FF80h
    neg neg edx
    sar sar edx, 7
    add add edx, 2
    mov mov eax, edx
    and and eax, 32
    add add edx, eax
    xorpd xorpd xmm7, xmm7
    mov mov eax, 03F80h
    pinsrw pinsrw xmm7, eax, 3
    mulsd mulsd xmm2, qword ptr [esp + 20]
    mulsd mulsd xmm0, xmm7
    psllq psllq xmm1, 45
    pshufd pshufd xmm1, xmm1, 68
    movapd movapd xmm7, xmmword ptr [g_10181C20]
    addsd addsd xmm5, xmm2
    mulpd mulpd xmm3, xmm1
    addsd addsd xmm0, xmm5
    unpcklpd unpcklpd xmm0, xmm0
    mulpd mulpd xmm6, xmm0
    mulsd mulsd xmm4, xmm0
    mulpd mulpd xmm0, xmm0
    addpd addpd xmm7, xmm6
    mulpd mulpd xmm7, xmm0
    mulsd mulsd xmm0, xmm3
L7:
    pshufd pshufd xmm6, xmm7, 0EEh
    mulsd mulsd xmm0, xmm7
    pshufd pshufd xmm5, xmm3, 0EEh
    mulsd mulsd xmm6, xmm3
    mulsd mulsd xmm4, xmm3
    movd movd xmm7, ecx
    psllq psllq xmm7, 45
    movd movd xmm2, edx
    pcmpeqd pcmpeqd xmm1, xmm1
    psllq psllq xmm1, xmm2
    addsd addsd xmm0, xmm5
    addsd addsd xmm0, xmm6
    andpd andpd xmm1, xmm3
    addsd addsd xmm0, xmm4
    xorpd xorpd xmm6, xmm6
    pcmpeqd pcmpeqd xmm4, xmm4
    psllq psllq xmm4, xmm2
    subsd subsd xmm3, xmm1
    movsd movsd xmm2, xmm1
    addsd addsd xmm1, xmm0
    andpd andpd xmm1, xmm4
    pinsrw pinsrw xmm6, edi, 3
    pop pop edi
    subsd subsd xmm2, xmm1
    addsd addsd xmm0, xmm2
    addsd addsd xmm0, xmm3
    cmp cmp esi, 0
    jg sub_101044B9
    pop pop esi
    mulsd mulsd xmm0, xmm7
    mulsd mulsd xmm1, xmm7
    addsd addsd xmm0, xmm1
    mulsd mulsd xmm6, xmm0
    addsd addsd xmm0, xmm6
    pextrw pextrw eax, xmm0, 3
    and and eax, 07FF0h
    mov mov edx, 24
    cmp cmp eax, 07FF0h
    je sub_101042D9
    mov mov edx, 25
L9:
    cmp cmp eax, 0
    je sub_101042E7
    sub sub esp, 16
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    pop pop esi
    addsd addsd xmm0, xmm1
    mulsd mulsd xmm0, xmm7
    mulsd mulsd xmm6, xmm0
    addsd addsd xmm0, xmm6
    pextrw pextrw eax, xmm0, 3
    and and eax, 07FF0h
    mov mov edx, 24
    cmp cmp eax, 07FF0h
    je sub_10104323
    mov mov edx, 25
    cmp cmp eax, 0
    je sub_10104331
    sub sub esp, 16
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    movlpd movlpd xmm0, qword ptr [g_10181C68]
    movd movd xmm1, ecx
    mulsd mulsd xmm0, xmm0
    psllq psllq xmm1, 45
    orpd orpd xmm0, xmm1
    mov mov edx, 25
    jmp sub_10104365
    mov mov edx, 24
    cmp cmp ecx, 0
    je sub_10104602
L11:
    movlpd movlpd xmm0, qword ptr [g_10181C58]
    jmp sub_1010437C
    movlpd movlpd xmm0, qword ptr [g_10181C50]
    jmp sub_10104389
    pshufd pshufd xmm4, xmm1, 68
    mulpd mulpd xmm4, xmm6
    pextrw pextrw eax, xmm4, 3
    and and eax, 07FF0h
    mov mov edx, 040A0h
    sub sub edx, eax
    sub sub eax, 03C70h
    or or edx, eax
    cmp cmp edx, 080000000h
    jb sub_10103D7D
    cmp cmp eax, 080000000h
    jb sub_101046B1
    or or ecx, 01FF80h
    movd movd xmm0, ecx
    psllq psllq xmm0, 45
    sub sub esp, 16
L13:
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    movlpd movlpd xmm4, qword ptr [esp + 4]
    pextrw pextrw edx, xmm4, 3
    and and edx, 07FF0h
    sub sub edx, 03FF0h
    pextrw pextrw eax, xmm1, 3
    xor xor eax, edx
    and and eax, 08000h
    cmp cmp eax, 0
    jne sub_10104662
    jmp sub_1010468A
FUN_101030d9 ENDP
END
