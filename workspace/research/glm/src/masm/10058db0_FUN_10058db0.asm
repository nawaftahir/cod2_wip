.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_10058db0 PROC
    sub esp, 28
    fld dword ptr [esi]
    push edi
    fsub dword ptr [edx]
    mov edi, dword ptr [esp + 36]
    fstp dword ptr [esp + 8]
    fld dword ptr [esi + 4]
    fsub dword ptr [edx + 4]
    fstp dword ptr [esp + 12]
    fld dword ptr [esi + 8]
    fsub dword ptr [edx + 8]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx + 8]
    fld dword ptr [esp + 12]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [ecx]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fsub dword ptr [esp + 36]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    je L0
    mov edi, dword ptr [esp + 4]
L0:
    fld dword ptr [g_1019BC84]
    fsub dword ptr [esp + 4]
    mov dword ptr [esp + 4], 0
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    je L1
    mov dword ptr [esp + 4], edi
L1:
    fld dword ptr [esp + 4]
    pop edi
    fmul dword ptr [ecx]
    fadd dword ptr [edx]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp]
    fmul dword ptr [ecx + 4]
    fadd dword ptr [edx + 4]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp]
    fmul dword ptr [ecx + 8]
    fadd dword ptr [edx + 8]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 16]
    fsub dword ptr [esi]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 20]
    fsub dword ptr [esi + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 24]
    fsub dword ptr [esi + 8]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 12]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    add esp, 28
    ret
FUN_10058db0 ENDP
END
