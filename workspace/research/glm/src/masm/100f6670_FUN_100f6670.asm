.686
.MODEL FLAT, C
EXTRN sub_100FB81F:PROC
EXTRN sub_100FBB17:PROC
EXTRN sub_100FBB48:PROC
EXTRN g_1017C3F0:DWORD
EXTRN g_1017C400:DWORD
EXTRN g_1017C410:DWORD
EXTRN g_1017C420:DWORD
EXTRN g_1017C430:DWORD
EXTRN g_1076ADB0:DWORD
.CODE
FUN_100f6670 PROC
    cmp dword ptr [g_1076ADB0], 0
    je sub_100FBB17
    sub esp, 8
    stmxcsr dword ptr [esp + 4]
    mov eax, dword ptr [esp + 4]
    and eax, 000001F80h
    cmp eax, 000001F80h
    jne L0
    fnstcw word ptr [esp]
    mov ax, word ptr [esp]
    and ax, 127
    cmp ax, 127
L0:
    lea esp, [esp + 8]
    jne sub_100FBB48
    jmp L1
L1:
    movq xmm0, qword ptr [esp + 4]
    movapd xmm2, xmmword ptr [g_1017C400]
    movapd xmm1, xmm0
    movapd xmm7, xmm0
    psrlq xmm0, 52
    movd eax, xmm0
    andpd xmm0, xmmword ptr [g_1017C430]
    psubd xmm2, xmm0
    psrlq xmm1, xmm2
    test eax, 000000800h
    jne L4
    cmp eax, 0000003FFh
    jl L5
    psllq xmm1, xmm2
    cmp eax, 000000432h
    jg L2
    movq qword ptr [esp + 4], xmm1
    fld qword ptr [esp + 4]
    ret
L2:
    ucomisd xmm7, xmm7
    jnp L3
    mov edx, 0000003EDh
    sub esp, 16
    mov dword ptr [esp + 12], edx
    mov edx, esp
    add edx, 20
    mov dword ptr [esp + 8], edx
    mov dword ptr [esp + 4], edx
    mov dword ptr [esp], edx
    call sub_100FB81F
    add esp, 16
L3:
    fld qword ptr [esp + 4]
    ret
L4:
    movq xmm0, qword ptr [esp + 4]
    psllq xmm1, xmm2
    movapd xmm3, xmm0
    cmpltpd xmm0, xmm1
    cmp eax, 000000BFFh
    jl L6
    cmp eax, 000000C32h
    jg L2
    andpd xmm0, xmmword ptr [g_1017C3F0]
    subsd xmm1, xmm0
    movq qword ptr [esp + 4], xmm1
    fld qword ptr [esp + 4]
    ret
L5:
    fldz
    ret
L6:
    cmpltpd xmm3, xmmword ptr [g_1017C420]
    orpd xmm3, xmmword ptr [g_1017C420]
    andpd xmm3, xmmword ptr [g_1017C410]
    movq qword ptr [esp + 4], xmm3
    fld qword ptr [esp + 4]
    ret
FUN_100f6670 ENDP
END
