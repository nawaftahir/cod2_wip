.686
.MODEL FLAT, C
EXTRN sub_10059156:PROC
EXTRN g_1019BEC0:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_100271b0 PROC
    sub esp, 8
    mov eax, dword ptr [g_101D1B9C]
    fld dword ptr [eax + 0000000B8h]
    add eax, 0000000B8h
    fchs
    fstp dword ptr [edi]
    mov ecx, dword ptr [edi]
    fld dword ptr [eax + 4]
    mov dword ptr [esp], ecx
    fchs
    fstp dword ptr [edi + 4]
    fld dword ptr [eax + 8]
    mov eax, dword ptr [edi + 4]
    fchs
    mov dword ptr [esp + 4], eax
    fstp dword ptr [edi + 8]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fcomp dword ptr [g_1019BEC0]
    fnstsw ax
    test ah, 5
    jp L0
    xor eax, eax
    mov dword ptr [edi + 24], 03F800000h
    mov dword ptr [edi + 32], eax
    jmp L1
L0:
    xor eax, eax
    mov dword ptr [edi + 24], eax
    mov dword ptr [edi + 32], 03F800000h
L1:
    mov dword ptr [edi + 28], eax
    fld dword ptr [edi + 28]
    fmul dword ptr [edi + 8]
    push esi
    fld dword ptr [edi + 4]
    lea esi, [edi + 12]
    fmul dword ptr [edi + 32]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [edi]
    fmul dword ptr [edi + 32]
    fld dword ptr [edi + 8]
    fmul dword ptr [edi + 24]
    fsubp st(1)
    fstp dword ptr [esi + 4]
    fld dword ptr [edi + 24]
    fmul dword ptr [edi + 4]
    fld dword ptr [edi + 28]
    fmul dword ptr [edi]
    fsubp st(1)
    fstp dword ptr [esi + 8]
    call sub_10059156
    fstp st(0)
    fld dword ptr [esi + 8]
    fmul dword ptr [edi + 4]
    fld dword ptr [edi + 8]
    fmul dword ptr [esi + 4]
    fsubp st(1)
    fstp dword ptr [edi + 24]
    fld dword ptr [edi + 8]
    fmul dword ptr [esi]
    fld dword ptr [esi + 8]
    fmul dword ptr [edi]
    fsubp st(1)
    fstp dword ptr [edi + 28]
    fld dword ptr [esi + 4]
    fmul dword ptr [edi]
    fld dword ptr [edi + 4]
    fmul dword ptr [esi]
    pop esi
    fsubp st(1)
    fstp dword ptr [edi + 32]
    add esp, 8
    ret
FUN_100271b0 ENDP
END
