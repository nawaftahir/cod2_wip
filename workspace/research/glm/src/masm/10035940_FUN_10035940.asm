.686
.MODEL FLAT, C
EXTRN sub_100055FE:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_106D3194:DWORD
.CODE
FUN_10035940 PROC
    sub esp, 24
    fld dword ptr [eax]
    push esi
    fsub dword ptr [g_1019BCB0]
    mov esi, dword ptr [g_106D3194]
    push 0101913E8h
    add esi, 000249D18h
    fstp dword ptr [esp + 20]
    lea edx, [esp + 8]
    fld dword ptr [eax + 4]
    fsub dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 24]
    fld dword ptr [eax + 8]
    fsub dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 28]
    fld dword ptr [eax]
    fadd dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 8]
    fld dword ptr [eax + 4]
    fadd dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 12]
    fld dword ptr [eax + 8]
    lea eax, [esp + 20]
    fadd dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 16]
    call sub_100055FE
    add esp, 4
    pop esi
    add esp, 24
    ret
FUN_10035940 ENDP
END
