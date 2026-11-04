.686
.MODEL FLAT, C
EXTRN sub_10005616:PROC
EXTRN EXTRN g_1019BE98:DWORD:DWORD
EXTRN EXTRN g_1019BE9C:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
.CODE
FUN_100359c0 PROC
    sub sub esp, 40
    add add eax, 0FFFFF000h
    shl shl eax, 5
    mov mov dword ptr [esp], eax
    fild fild dword ptr [esp]
    add add ecx, 0FFFFF000h
    shl shl ecx, 5
    add add edx, 0FFFFF800h
    mov mov dword ptr [esp], ecx
    fild fild dword ptr [esp]
    shl shl edx, 6
    mov mov dword ptr [esp], edx
    fild fild dword ptr [esp]
    push push esi
    mov mov esi, dword ptr [g_106D3194]
    push push 010191488h
    fst fst dword ptr [esp + 44]
    add add esi, 0249D18h
    fld fld st(2)
    lea lea edx, [esp + 12]
    fstp fstp dword ptr [esp + 24]
    lea lea eax, [esp + 24]
    fld fld st(1)
    fstp fstp dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 32]
    fxch fxch st(1)
    fadd fadd dword ptr [g_1019BE9C]
    fstp fstp dword ptr [esp + 12]
    fadd fadd dword ptr [g_1019BE9C]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [g_1019BE98]
    fstp fstp dword ptr [esp + 20]
    call sub_10005616
    add add esp, 4
    pop pop esi
    add add esp, 40
    ret ret
FUN_100359c0 ENDP
END
