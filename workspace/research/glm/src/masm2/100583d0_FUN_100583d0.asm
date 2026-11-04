.686
.MODEL FLAT, C
EXTRN sub_100F619F:PROC
EXTRN sub_100F61C6:PROC
EXTRN sub_1010A9BC:PROC
EXTRN sub_1010AC2E:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC7C:DWORD:DWORD
EXTRN EXTRN g_1019BE68:DWORD:DWORD
.CODE
FUN_100583d0 PROC
    sub sub esp, 16
    call sub_100F619F
    mov mov dword ptr [esp + 8], eax
    fild fild dword ptr [esp + 8]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fdiv fdiv dword ptr [g_1019BC7C]
    fadd fadd st(0), st(0)
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 4]
    call sub_100F61C6
    mov mov dword ptr [esp + 8], eax
    fild fild dword ptr [esp + 8]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fdiv fdiv dword ptr [g_1019BC7C]
    fadd fadd st(0), st(0)
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 65
    je L0
    fld fld dword ptr [esp]
L0:
    call sub_1010AC2E
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BE68]
    fdiv fdiv dword ptr [esp]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    call sub_1010A9BC
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 24]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp + 4]
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp + 8]
    fstp fstp dword ptr [ecx]
    add add esp, 16
    ret ret
FUN_100583d0 ENDP
END
