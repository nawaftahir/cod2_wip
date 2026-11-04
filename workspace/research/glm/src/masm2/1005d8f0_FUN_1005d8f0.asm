.686
.MODEL FLAT, C
EXTRN sub_10059131:PROC
EXTRN sub_1005DA17:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1005d8f0 PROC
    sub sub esp, 24
    fld fld dword ptr [ecx]
    push push esi
    fsub fsub dword ptr [edi]
    mov mov esi, edx
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [ecx + 4]
    fsub fsub dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [ecx + 8]
    fsub fsub dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [eax]
    fsub fsub dword ptr [edi]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [eax + 4]
    fsub fsub dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [eax + 8]
    fsub fsub dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 20]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 16]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 8]
    call sub_10059131
    fld fld dword ptr [g_1019BC84]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1005DA17
    xor xor eax, eax
    pop pop esi
    add add esp, 24
    ret ret
    fld fld dword ptr [esi]
    mov mov eax, 1
    fmul fmul dword ptr [edi]
    fld fld dword ptr [edi + 4]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edi + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [esi + 12]
    pop pop esi
    add add esp, 24
    ret ret
FUN_1005d8f0 ENDP
END
