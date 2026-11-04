.686
.MODEL FLAT, C
EXTRN sub_10058EA4:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_10058db0 PROC
    sub sub esp, 28
    fld fld dword ptr [esi]
    push push edi
    fsub fsub dword ptr [edx]
    mov mov edi, dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esi + 4]
    fsub fsub dword ptr [edx + 4]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esi + 8]
    fsub fsub dword ptr [edx + 8]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [ecx + 8]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [ecx + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fsub fsub dword ptr [esp + 36]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    je L0
    mov mov edi, dword ptr [esp + 4]
    fld fld dword ptr [g_1019BC84]
    fsub fsub dword ptr [esp + 4]
    mov mov dword ptr [esp + 4], 0
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    je sub_10058EA4
    mov mov dword ptr [esp + 4], edi
    fld fld dword ptr [esp + 4]
    pop pop edi
    fmul fmul dword ptr [ecx]
    fadd fadd dword ptr [edx]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [ecx + 4]
    fadd fadd dword ptr [edx + 4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [ecx + 8]
    fadd fadd dword ptr [edx + 8]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 16]
    fsub fsub dword ptr [esi]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 20]
    fsub fsub dword ptr [esi + 4]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 24]
    fsub fsub dword ptr [esi + 8]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 12]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 32]
    add add esp, 28
    ret ret
FUN_10058db0 ENDP
END
