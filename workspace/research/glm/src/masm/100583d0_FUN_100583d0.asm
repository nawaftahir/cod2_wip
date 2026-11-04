.686
.MODEL FLAT, C
EXTRN sub_100F619F:PROC
EXTRN sub_100F61C6:PROC
EXTRN sub_1010A9BC:PROC
EXTRN sub_1010AC2E:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC7C:DWORD
EXTRN g_1019BE68:DWORD
.CODE
FUN_100583d0 PROC
    sub esp, 16
L0:
    call sub_100F619F
    mov dword ptr [esp + 8], eax
    fild dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fdiv dword ptr [g_1019BC7C]
    fadd st(0), st(0)
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 4]
    call sub_100F61C6
    mov dword ptr [esp + 8], eax
    fild dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fdiv dword ptr [g_1019BC7C]
    fadd st(0), st(0)
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 65
    je L0
    fld dword ptr [esp]
    call sub_1010AC2E
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    fmul dword ptr [g_1019BE68]
    fdiv dword ptr [esp]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    call sub_1010A9BC
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 24]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fmul dword ptr [esp + 4]
    fstp dword ptr [eax]
    fld dword ptr [esp]
    fmul dword ptr [esp + 8]
    fstp dword ptr [ecx]
    add esp, 16
    ret
FUN_100583d0 ENDP
END
