.686
.MODEL FLAT, C
EXTRN sub_10059156:PROC
EXTRN EXTRN g_1019BEC0:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_100271b0 PROC
    sub sub esp, 8
    mov mov eax, dword ptr [g_101D1B9C]
    fld fld dword ptr [eax + 0B8h]
    add add eax, 0B8h
    fchs fchs
    fstp fstp dword ptr [edi]
    mov mov ecx, dword ptr [edi]
    fld fld dword ptr [eax + 4]
    mov mov dword ptr [esp], ecx
    fchs fchs
    fstp fstp dword ptr [edi + 4]
    fld fld dword ptr [eax + 8]
    mov mov eax, dword ptr [edi + 4]
    fchs fchs
    mov mov dword ptr [esp + 4], eax
    fstp fstp dword ptr [edi + 8]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fcomp fcomp dword ptr [g_1019BEC0]
    fnstsw fnstsw ax
    test test ah, 5
    jp L0
    xor xor eax, eax
    mov mov dword ptr [edi + 24], 03F800000h
    mov mov dword ptr [edi + 32], eax
    jmp L1
    xor xor eax, eax
    mov mov dword ptr [edi + 24], eax
    mov mov dword ptr [edi + 32], 03F800000h
    mov mov dword ptr [edi + 28], eax
    fld fld dword ptr [edi + 28]
    fmul fmul dword ptr [edi + 8]
    push push esi
    fld fld dword ptr [edi + 4]
    lea lea esi, [edi + 12]
    fmul fmul dword ptr [edi + 32]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi]
    fld fld dword ptr [edi]
    fmul fmul dword ptr [edi + 32]
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [edi + 24]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [edi + 24]
    fmul fmul dword ptr [edi + 4]
    fld fld dword ptr [edi + 28]
    fmul fmul dword ptr [edi]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 8]
    call sub_10059156
    fstp fstp st(0)
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edi + 4]
L0:
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [esi + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [edi + 24]
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edi]
    fsubp fsubp st(1)
    fstp fstp dword ptr [edi + 28]
L1:
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edi]
    fld fld dword ptr [edi + 4]
    fmul fmul dword ptr [esi]
    pop pop esi
    fsubp fsubp st(1)
    fstp fstp dword ptr [edi + 32]
    add add esp, 8
    ret ret
FUN_100271b0 ENDP
END
