.686
.MODEL FLAT, C
EXTRN sub_100FB97E:PROC
EXTRN sub_1010B140:PROC
EXTRN sub_1010B160:PROC
EXTRN sub_1010B173:PROC
EXTRN sub_1010B17E:PROC
EXTRN sub_1010B1D7:PROC
EXTRN sub_1010B1F2:PROC
EXTRN sub_1010B246:PROC
EXTRN sub_1010B26C:PROC
EXTRN sub_1010B280:PROC
EXTRN EXTRN g_1019BF50:DWORD:DWORD
EXTRN EXTRN g_1019BF60:DWORD:DWORD
EXTRN EXTRN g_1019BF70:DWORD:DWORD
EXTRN EXTRN g_1019BF80:DWORD:DWORD
EXTRN EXTRN g_1019BFB0:DWORD:DWORD
EXTRN EXTRN g_1019BFC0:DWORD:DWORD
EXTRN EXTRN g_1019BFD0:DWORD:DWORD
EXTRN EXTRN g_1019BFE0:DWORD:DWORD
EXTRN EXTRN g_1019BFE8:DWORD:DWORD
EXTRN EXTRN g_1019C000:DWORD:DWORD
EXTRN EXTRN g_1019C010:DWORD:DWORD
EXTRN EXTRN g_1019C020:DWORD:DWORD
.CODE
FUN_1010ae3e PROC
    mov mov edx, 0
    movapd movapd xmm5, xmm0
    unpcklpd unpcklpd xmm0, xmm0
    psrlq psrlq xmm5, 52
    pextrw pextrw ecx, xmm5, 0
    movapd movapd xmm1, xmmword ptr [g_1019BF50]
    movapd movapd xmm3, xmmword ptr [g_1019BFB0]
    movapd movapd xmm4, xmmword ptr [g_1019BF60]
    movapd movapd xmm6, xmmword ptr [g_1019BF70]
    andpd andpd xmm0, xmm1
    orpd orpd xmm0, xmm3
    addpd addpd xmm4, xmm0
    pextrw pextrw eax, xmm4, 0
    and and eax, 07F0h
    movapd movapd xmm4, xmmword ptr [eax + 01019C030h]
    movapd movapd xmm7, xmmword ptr [eax + 01019C440h]
    andpd andpd xmm6, xmm0
    subpd subpd xmm0, xmm6
    mulpd mulpd xmm6, xmm4
    subpd subpd xmm6, xmm3
    addsd addsd xmm7, xmm6
    mulpd mulpd xmm0, xmm4
    movapd movapd xmm4, xmm0
    addpd addpd xmm0, xmm6
    and and ecx, 0FFFh
    sub sub ecx, 1
    cmp cmp ecx, 07FDh
    ja L0
    sub sub ecx, 03FEh
    add add ecx, edx
    cvtsi2sd cvtsi2sd xmm6, ecx
    unpcklpd unpcklpd xmm6, xmm6
    shl shl ecx, 10
    add add eax, ecx
    mov mov ecx, 16
    mov mov edx, 0
    cmp cmp eax, 0
    cmove cmove edx, ecx
    movapd movapd xmm1, xmmword ptr [g_1019C000]
    movapd movapd xmm3, xmm0
    movapd movapd xmm2, xmmword ptr [g_1019C010]
    mulpd mulpd xmm1, xmm0
    mulpd mulpd xmm3, xmm3
    addpd addpd xmm1, xmm2
    movapd movapd xmm2, xmmword ptr [g_1019C020]
    mulsd mulsd xmm3, xmm3
    movapd movapd xmm5, xmmword ptr [g_1019BF80]
    mulpd mulpd xmm6, xmm5
    movapd movapd xmm5, xmmword ptr [edx + 01019BF90h]
    andpd andpd xmm4, xmm5
    addpd addpd xmm7, xmm6
    addpd addpd xmm7, xmm4
    mulpd mulpd xmm1, xmm0
    mulsd mulsd xmm3, xmm0
    addpd addpd xmm1, xmm2
    movapd movapd xmm6, xmm7
    unpckhpd unpckhpd xmm6, xmm6
    mulpd mulpd xmm1, xmm3
    sub sub esp, 16
    movapd movapd xmm0, xmm1
    unpckhpd unpckhpd xmm1, xmm1
    addsd addsd xmm0, xmm1
    addsd addsd xmm0, xmm6
    addsd addsd xmm0, xmm7
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    movlpd movlpd xmm0, qword ptr [esp + 4]
    movapd movapd xmm1, xmmword ptr [g_1019BFC0]
    cmpeqsd cmpeqsd xmm1, xmm0
    pextrw pextrw eax, xmm1, 0
    cmp cmp eax, 0
    ja sub_1010B140
    cmp cmp ecx, -1
    je sub_1010B160
    cmp cmp ecx, 07FEh
    ja sub_1010B17E
    movlpd movlpd xmm0, qword ptr [esp + 4]
    movapd movapd xmm1, xmmword ptr [g_1019BF50]
    movapd movapd xmm2, xmmword ptr [g_1019BFB0]
    andpd andpd xmm0, xmm1
    orpd orpd xmm0, xmm2
    cmpeqsd cmpeqsd xmm2, xmm0
    pextrw pextrw eax, xmm2, 0
    cmp cmp eax, 0
    je sub_1010B173
    fld fld qword ptr [g_1019BFE8]
    ret ret
    mov mov edx, 03E8h
    jmp sub_1010B1D7
    movlpd movlpd xmm2, qword ptr [g_1019BFB0]
    divsd divsd xmm2, xmm0
    movlpd movlpd xmm1, qword ptr [g_1019BFE0]
    mov mov edx, 2
    jmp sub_1010B1F2
    movlpd movlpd xmm1, qword ptr [g_1019BFD0]
    mulsd mulsd xmm0, xmm1
    mov mov edx, -52
    jmp L1
    add add ecx, 1
    and and ecx, 07FFh
    cmp cmp ecx, 07FFh
    jae sub_1010B246
    xorpd xorpd xmm1, xmm1
    divsd divsd xmm1, xmm1
    mov mov edx, 3
    sub sub esp, 28
    movlpd movlpd qword ptr [esp + 16], xmm1
    mov mov dword ptr [esp + 12], edx
    mov mov edx, esp
    add add edx, 16
    mov mov dword ptr [esp + 8], edx
    add add edx, 16
    mov mov dword ptr [esp + 4], edx
    mov mov dword ptr [esp], edx
    call sub_100FB97E
    fld fld qword ptr [esp + 16]
    add add esp, 28
    ret ret
    movlpd movlpd xmm2, qword ptr [esp + 4]
    movlpd movlpd xmm0, qword ptr [esp + 4]
    movd movd eax, xmm2
    psrlq psrlq xmm2, 32
    movd movd ecx, xmm2
    and and ecx, 0FFFFFh
    or or eax, ecx
    cmp cmp eax, 0
    je sub_1010B26C
    mov mov edx, 03E8h
    jmp sub_1010B280
FUN_1010ae3e ENDP
END
