.686
.MODEL FLAT, C
EXTRN sub_10059131:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_1005d8f0 PROC
    sub esp, 24
    fld dword ptr [ecx]
    push esi
    fsub dword ptr [edi]
    mov esi, edx
    fstp dword ptr [esp + 16]
    fld dword ptr [ecx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 20]
    fld dword ptr [ecx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 24]
    fld dword ptr [eax]
    fsub dword ptr [edi]
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [eax + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 20]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 4]
    fsubp st(1)
    fstp dword ptr [esi + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 16]
    fsubp st(1)
    fstp dword ptr [esi + 8]
    call sub_10059131
    fld dword ptr [g_1019BC84]
    fucompp
    fnstsw ax
    test ah, 68
    jp L0
    xor eax, eax
    pop esi
    add esp, 24
    ret
L0:
    fld dword ptr [esi]
    mov eax, 1
    fmul dword ptr [edi]
    fld dword ptr [edi + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [esi + 8]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fstp dword ptr [esi + 12]
    pop esi
    add esp, 24
    ret
FUN_1005d8f0 ENDP
END
