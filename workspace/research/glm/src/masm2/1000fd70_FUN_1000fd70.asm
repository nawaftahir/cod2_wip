.686
.MODEL FLAT, C
EXTRN sub_1000FE9F:PROC
EXTRN sub_1000FF0C:PROC
EXTRN sub_1000FF2F:PROC
EXTRN sub_1000FF3A:PROC
EXTRN sub_1000FF46:PROC
EXTRN sub_100F8EBE:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB4:DWORD:DWORD
EXTRN EXTRN g_1019BD70:DWORD:DWORD
EXTRN EXTRN g_1019BE4C:DWORD:DWORD
EXTRN EXTRN g_1019BE50:DWORD:DWORD
EXTRN EXTRN g_1019BE54:DWORD:DWORD
.CODE
FUN_1000fd70 PROC
    fld fld dword ptr [ecx + 4]
    fld fld dword ptr [ecx]
    fpatan fpatan
    fmul fmul dword ptr [g_1019BE54]
    fsub fsub dword ptr [g_1019BE50]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jp L0
    fadd fadd dword ptr [g_1019BD70]
    jmp L1
    fcom fcom dword ptr [g_1019BD70]
    fnstsw fnstsw ax
    test test ah, 65
    jne L2
    fsub fsub dword ptr [g_1019BD70]
    fcom fcom dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 5
    jp L3
L0:
    fld fld dword ptr [g_1019BC78]
    mov mov dword ptr [esi + 12], 0
    fsub fsub st(1)
    fstp fstp dword ptr [esi + 4]
    fstp fstp dword ptr [esi + 8]
    jmp L5
    fcom fcom dword ptr [g_1019BCB4]
    fnstsw fnstsw ax
    test test ah, 5
    jp L4
    fsub fsub dword ptr [g_1019BC78]
    mov mov dword ptr [esi + 4], 0
    fld fld dword ptr [g_1019BC78]
    fsub fsub st(1)
    fstp fstp dword ptr [esi + 8]
    fstp fstp dword ptr [esi + 12]
    jmp sub_1000FE9F
    fsub fsub dword ptr [g_1019BCB4]
    mov mov dword ptr [esi + 8], 0
    fst fst dword ptr [esi + 4]
    fld fld dword ptr [g_1019BC78]
    fsub fsub st(1)
    fstp fstp dword ptr [esi + 12]
    fstp fstp st(0)
    fld fld dword ptr [ecx + 8]
    call sub_100F8EBE
    fmul fmul dword ptr [g_1019BE4C]
    fsubr fsubr dword ptr [g_1019BC78]
    fcom fcom dword ptr [g_1019BC84]
    fst fst dword ptr [esi]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1000FF0C
    fstp fstp st(0)
    mov mov dword ptr [esi], 0
    jmp sub_1000FF2F
    fcom fcom dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1000FF3A
    fstp fstp st(0)
    mov mov dword ptr [esi], 03F800000h
    jmp sub_1000FF46
    fstp fstp dword ptr [esi]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esi]
    fmul fmul dword ptr [esi + 4]
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esi]
    fmul fmul dword ptr [esi + 8]
L5:
    fstp fstp dword ptr [esi + 8]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esi]
    fmul fmul dword ptr [esi + 12]
    fstp fstp dword ptr [esi + 12]
    ret ret
FUN_1000fd70 ENDP
END
