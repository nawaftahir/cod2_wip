.686
.MODEL FLAT, C
EXTRN sub_10005616:PROC
EXTRN g_1019BE98:DWORD
EXTRN g_1019BE9C:DWORD
EXTRN g_106D3194:DWORD
.CODE
FUN_100359c0 PROC
    sub esp, 40
    add eax, 0FFFFF000h
    shl eax, 5
    mov dword ptr [esp], eax
    fild dword ptr [esp]
    add ecx, 0FFFFF000h
    shl ecx, 5
    add edx, 0FFFFF800h
    mov dword ptr [esp], ecx
    fild dword ptr [esp]
    shl edx, 6
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    push esi
    mov esi, dword ptr [g_106D3194]
    push 010191488h
    fst dword ptr [esp + 44]
    add esi, 000249D18h
    fld st(2)
    lea edx, [esp + 12]
    fstp dword ptr [esp + 24]
    lea eax, [esp + 24]
    fld st(1)
    fstp dword ptr [esp + 28]
    fstp dword ptr [esp + 32]
    fxch st(1)
    fadd dword ptr [g_1019BE9C]
    fstp dword ptr [esp + 12]
    fadd dword ptr [g_1019BE9C]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 44]
    fadd dword ptr [g_1019BE98]
    fstp dword ptr [esp + 20]
    call sub_10005616
    add esp, 4
    pop esi
    add esp, 40
    ret
FUN_100359c0 ENDP
END
