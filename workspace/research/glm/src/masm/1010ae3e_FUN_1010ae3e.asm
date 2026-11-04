.686
.MODEL FLAT, C
EXTRN sub_100FB97E:PROC
EXTRN g_1019BF50:DWORD
EXTRN g_1019BF60:DWORD
EXTRN g_1019BF70:DWORD
EXTRN g_1019BF80:DWORD
EXTRN g_1019BFB0:DWORD
EXTRN g_1019BFC0:DWORD
EXTRN g_1019BFD0:DWORD
EXTRN g_1019BFE0:DWORD
EXTRN g_1019BFE8:DWORD
EXTRN g_1019C000:DWORD
EXTRN g_1019C010:DWORD
EXTRN g_1019C020:DWORD
.CODE
FUN_1010ae3e PROC
    mov edx, 0
L0:
    movapd xmm5, xmm0
    unpcklpd xmm0, xmm0
    psrlq xmm5, 52
    pextrw ecx, xmm5, 0
    movapd xmm1, xmmword ptr [g_1019BF50]
    movapd xmm3, xmmword ptr [g_1019BFB0]
    movapd xmm4, xmmword ptr [g_1019BF60]
    movapd xmm6, xmmword ptr [g_1019BF70]
    andpd xmm0, xmm1
    orpd xmm0, xmm3
    addpd xmm4, xmm0
    pextrw eax, xmm4, 0
    and eax, 0000007F0h
    movapd xmm4, xmmword ptr [eax + 01019C030h]
    movapd xmm7, xmmword ptr [eax + 01019C440h]
    andpd xmm6, xmm0
    subpd xmm0, xmm6
    mulpd xmm6, xmm4
    subpd xmm6, xmm3
    addsd xmm7, xmm6
    mulpd xmm0, xmm4
    movapd xmm4, xmm0
    addpd xmm0, xmm6
    and ecx, 000000FFFh
    sub ecx, 1
    cmp ecx, 0000007FDh
    ja L1
    sub ecx, 0000003FEh
    add ecx, edx
    cvtsi2sd xmm6, ecx
    unpcklpd xmm6, xmm6
    shl ecx, 10
    add eax, ecx
    mov ecx, 16
    mov edx, 0
    cmp eax, 0
    cmove edx, ecx
    movapd xmm1, xmmword ptr [g_1019C000]
    movapd xmm3, xmm0
    movapd xmm2, xmmword ptr [g_1019C010]
    mulpd xmm1, xmm0
    mulpd xmm3, xmm3
    addpd xmm1, xmm2
    movapd xmm2, xmmword ptr [g_1019C020]
    mulsd xmm3, xmm3
    movapd xmm5, xmmword ptr [g_1019BF80]
    mulpd xmm6, xmm5
    movapd xmm5, xmmword ptr [edx + 01019BF90h]
    andpd xmm4, xmm5
    addpd xmm7, xmm6
    addpd xmm7, xmm4
    mulpd xmm1, xmm0
    mulsd xmm3, xmm0
    addpd xmm1, xmm2
    movapd xmm6, xmm7
    unpckhpd xmm6, xmm6
    mulpd xmm1, xmm3
    sub esp, 16
    movapd xmm0, xmm1
    unpckhpd xmm1, xmm1
    addsd xmm0, xmm1
    addsd xmm0, xmm6
    addsd xmm0, xmm7
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
L1:
    movlpd xmm0, qword ptr [esp + 4]
    movapd xmm1, xmmword ptr [g_1019BFC0]
    cmpeqsd xmm1, xmm0
    pextrw eax, xmm1, 0
    cmp eax, 0
    ja L3
    cmp ecx, -1
    je L4
    cmp ecx, 0000007FEh
    ja L5
    movlpd xmm0, qword ptr [esp + 4]
    movapd xmm1, xmmword ptr [g_1019BF50]
    movapd xmm2, xmmword ptr [g_1019BFB0]
    andpd xmm0, xmm1
    orpd xmm0, xmm2
    cmpeqsd xmm2, xmm0
    pextrw eax, xmm2, 0
    cmp eax, 0
    je L2
    fld qword ptr [g_1019BFE8]
    ret
L2:
    mov edx, 0000003E8h
    jmp L7
L3:
    movlpd xmm2, qword ptr [g_1019BFB0]
    divsd xmm2, xmm0
    movlpd xmm1, qword ptr [g_1019BFE0]
    mov edx, 2
    jmp L7
L4:
    movlpd xmm1, qword ptr [g_1019BFD0]
    mulsd xmm0, xmm1
    mov edx, 0FFFFFFCCh
    jmp L0
L5:
    add ecx, 1
    and ecx, 0000007FFh
    cmp ecx, 0000007FFh
    jae L8
L6:
    xorpd xmm1, xmm1
    divsd xmm1, xmm1
    mov edx, 3
L7:
    sub esp, 28
    movlpd qword ptr [esp + 16], xmm1
    mov dword ptr [esp + 12], edx
    mov edx, esp
    add edx, 16
    mov dword ptr [esp + 8], edx
    add edx, 16
    mov dword ptr [esp + 4], edx
    mov dword ptr [esp], edx
    call sub_100FB97E
    fld qword ptr [esp + 16]
    add esp, 28
    ret
L8:
    movlpd xmm2, qword ptr [esp + 4]
    movlpd xmm0, qword ptr [esp + 4]
    movd eax, xmm2
    psrlq xmm2, 32
    movd ecx, xmm2
    and ecx, 0000FFFFFh
    or eax, ecx
    cmp eax, 0
    je L6
    mov edx, 0000003E8h
    jmp L7
FUN_1010ae3e ENDP
END
