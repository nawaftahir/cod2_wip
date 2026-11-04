.686
.MODEL FLAT, C
EXTRN sub_100055FE:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
.CODE
FUN_10035940 PROC
    sub sub esp, 24
    fld fld dword ptr [eax]
    push push esi
    fsub fsub dword ptr [g_1019BCB0]
    mov mov esi, dword ptr [g_106D3194]
    push push 0101913E8h
    add add esi, 0249D18h
    fstp fstp dword ptr [esp + 20]
    lea lea edx, [esp + 8]
    fld fld dword ptr [eax + 4]
    fsub fsub dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [eax + 8]
    fsub fsub dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [eax]
    fadd fadd dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [eax + 4]
    fadd fadd dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [eax + 8]
    lea lea eax, [esp + 20]
    fadd fadd dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 16]
    call sub_100055FE
    add add esp, 4
    pop pop esi
    add add esp, 24
    ret ret
FUN_10035940 ENDP
END
