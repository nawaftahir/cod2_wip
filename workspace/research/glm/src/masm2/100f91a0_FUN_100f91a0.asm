.686
.MODEL FLAT, C
EXTRN sub_100F92D8:PROC
EXTRN sub_100F92F6:PROC
EXTRN sub_100F9316:PROC
EXTRN sub_100F9317:PROC
EXTRN sub_100F937D:PROC
EXTRN sub_100FB81F:PROC
EXTRN sub_10103FF4:PROC
EXTRN sub_10104025:PROC
EXTRN EXTRN g_1017C6B0:DWORD:DWORD
EXTRN EXTRN g_1017C6C0:DWORD:DWORD
EXTRN EXTRN g_1017C6D0:DWORD:DWORD
EXTRN EXTRN g_1017C6E0:DWORD:DWORD
EXTRN EXTRN g_1017C6F0:DWORD:DWORD
EXTRN EXTRN g_1076ADB0:DWORD:DWORD
.CODE
FUN_100f91a0 PROC
    cmp cmp dword ptr [g_1076ADB0], 0
    je sub_10103FF4
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
    jne sub_10104025
    jmp L1
    movq movq xmm0, qword ptr [esp + 4]
    movapd movapd xmm2, xmmword ptr [g_1017C6C0]
    movapd movapd xmm1, xmm0
    movapd movapd xmm7, xmm0
    psrlq psrlq xmm0, 52
    movd movd eax, xmm0
    andpd andpd xmm0, xmmword ptr [g_1017C6E0]
    psubd psubd xmm2, xmm0
    psrlq psrlq xmm1, xmm2
    test test eax, 0800h
    je sub_100F92D8
    cmp cmp eax, 0BFFh
    jl sub_100F9317
    psllq psllq xmm1, xmm2
    cmp cmp eax, 0C32h
    jg L2
    movq movq qword ptr [esp + 4], xmm1
    fld fld qword ptr [esp + 4]
    ret ret
    ucomisd ucomisd xmm7, xmm7
    jnp sub_100F92F6
    mov mov edx, 03ECh
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
    cmpnlepd cmpnlepd xmm0, xmm1
    cmp cmp eax, 03FFh
    jl sub_100F937D
    cmp cmp eax, 0432h
    jg sub_100F9316
    andpd andpd xmm0, xmmword ptr [g_1017C6B0]
    addsd addsd xmm1, xmm0
    movq movq qword ptr [esp + 4], xmm1
    fld fld qword ptr [esp + 4]
    ret ret
    fld fld qword ptr [g_1017C6F0]
    ret ret
    cmpnlepd cmpnlepd xmm3, xmmword ptr [g_1017C6D0]
    andpd andpd xmm3, xmmword ptr [g_1017C6B0]
    movq movq qword ptr [esp + 4], xmm3
    fld fld qword ptr [esp + 4]
    ret ret
FUN_100f91a0 ENDP
END
