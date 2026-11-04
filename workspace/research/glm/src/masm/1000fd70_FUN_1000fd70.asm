.686
.MODEL FLAT, C
EXTRN sub_100F8EBE:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB4:DWORD
EXTRN g_1019BD70:DWORD
EXTRN g_1019BE4C:DWORD
EXTRN g_1019BE50:DWORD
EXTRN g_1019BE54:DWORD
.CODE
FUN_1000fd70 PROC
    fld dword ptr [ecx + 4]
    fld dword ptr [ecx]
    fpatan
    fmul dword ptr [g_1019BE54]
    fsub dword ptr [g_1019BE50]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jp L0
    fadd dword ptr [g_1019BD70]
    jmp L1
L0:
    fcom dword ptr [g_1019BD70]
    fnstsw ax
    test ah, 65
    jne L1
    fsub dword ptr [g_1019BD70]
L1:
    fcom dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 5
    jp L2
    fld dword ptr [g_1019BC78]
    mov dword ptr [esi + 12], 0
    fsub st(1)
    fstp dword ptr [esi + 4]
    fstp dword ptr [esi + 8]
    jmp L4
L2:
    fcom dword ptr [g_1019BCB4]
    fnstsw ax
    test ah, 5
    jp L3
    fsub dword ptr [g_1019BC78]
    mov dword ptr [esi + 4], 0
    fld dword ptr [g_1019BC78]
    fsub st(1)
    fstp dword ptr [esi + 8]
    fstp dword ptr [esi + 12]
    jmp L4
L3:
    fsub dword ptr [g_1019BCB4]
    mov dword ptr [esi + 8], 0
    fst dword ptr [esi + 4]
    fld dword ptr [g_1019BC78]
    fsub st(1)
    fstp dword ptr [esi + 12]
    fstp st(0)
L4:
    fld dword ptr [ecx + 8]
    call sub_100F8EBE
    fmul dword ptr [g_1019BE4C]
    fsubr dword ptr [g_1019BC78]
    fcom dword ptr [g_1019BC84]
    fst dword ptr [esi]
    fnstsw ax
    test ah, 5
    jp L5
    fstp st(0)
    mov dword ptr [esi], 0
    jmp L7
L5:
    fcom dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 65
    jne L6
    fstp st(0)
    mov dword ptr [esi], 03F800000h
    jmp L7
L6:
    fstp dword ptr [esi]
L7:
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esi]
    fmul dword ptr [esi + 4]
    fstp dword ptr [esi + 4]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esi]
    fmul dword ptr [esi + 8]
    fstp dword ptr [esi + 8]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esi]
    fmul dword ptr [esi + 12]
    fstp dword ptr [esi + 12]
    ret
FUN_1000fd70 ENDP
END
