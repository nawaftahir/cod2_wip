.686
.MODEL FLAT, C
EXTRN sub_100F67A8:PROC
EXTRN sub_100F67C6:PROC
EXTRN sub_100F67E6:PROC
EXTRN sub_100F67E7:PROC
EXTRN sub_100F6849:PROC
EXTRN sub_100FB81F:PROC
EXTRN sub_100FBB17:PROC
EXTRN sub_100FBB48:PROC
EXTRN EXTRN g_1017C3F0:DWORD:DWORD
EXTRN EXTRN g_1017C400:DWORD:DWORD
EXTRN EXTRN g_1017C410:DWORD:DWORD
EXTRN EXTRN g_1017C420:DWORD:DWORD
EXTRN EXTRN g_1017C430:DWORD:DWORD
EXTRN EXTRN g_1076ADB0:DWORD:DWORD
.CODE
FUN_100f6670 PROC
    cmp cmp dword ptr [g_1076ADB0], 0
    je sub_100FBB17
    sub sub esp, 8
    stmxcsr stmxcsr dword ptr [esp + 4]
    mov mov eax, dword ptr [esp + 4]
    and and eax, 01F80h
    cmp cmp eax, 01F80h
    jne L0
    fnstcw fnstcw word ptr [esp]
    mov mov ax, word ptr [esp]
    and and ax, 127
    cmp cmp ax, 127
    lea lea esp, [esp + 8]
    jne sub_100FBB48
    jmp L1
    movq movq xmm0, qword ptr [esp + 4]
    movapd movapd xmm2, xmmword ptr [g_1017C400]
    movapd movapd xmm1, xmm0
    movapd movapd xmm7, xmm0
    psrlq psrlq xmm0, 52
    movd movd eax, xmm0
    andpd andpd xmm0, xmmword ptr [g_1017C430]
    psubd psubd xmm2, xmm0
    psrlq psrlq xmm1, xmm2
    test test eax, 0800h
    jne sub_100F67A8
    cmp cmp eax, 03FFh
    jl sub_100F67E7
    psllq psllq xmm1, xmm2
    cmp cmp eax, 0432h
    jg L2
    movq movq qword ptr [esp + 4], xmm1
    fld fld qword ptr [esp + 4]
    ret ret
    ucomisd ucomisd xmm7, xmm7
    jnp sub_100F67C6
    mov mov edx, 03EDh
    sub sub esp, 16
    mov mov dword ptr [esp + 12], edx
    mov mov edx, esp
    add add edx, 20
    mov mov dword ptr [esp + 8], edx
    mov mov dword ptr [esp + 4], edx
    mov mov dword ptr [esp], edx
    call sub_100FB81F
    add add esp, 16
    fld fld qword ptr [esp + 4]
    ret ret
    movq movq xmm0, qword ptr [esp + 4]
    psllq psllq xmm1, xmm2
    movapd movapd xmm3, xmm0
    cmpltpd cmpltpd xmm0, xmm1
    cmp cmp eax, 0BFFh
    jl sub_100F6849
    cmp cmp eax, 0C32h
    jg sub_100F67E6
    andpd andpd xmm0, xmmword ptr [g_1017C3F0]
    subsd subsd xmm1, xmm0
    movq movq qword ptr [esp + 4], xmm1
    fld fld qword ptr [esp + 4]
    ret ret
    fldz fldz
    ret ret
    cmpltpd cmpltpd xmm3, xmmword ptr [g_1017C420]
    orpd orpd xmm3, xmmword ptr [g_1017C420]
    andpd andpd xmm3, xmmword ptr [g_1017C410]
    movq movq qword ptr [esp + 4], xmm3
    fld fld qword ptr [esp + 4]
    ret ret
FUN_100f6670 ENDP
END
