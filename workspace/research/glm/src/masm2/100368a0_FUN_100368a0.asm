.686
.MODEL FLAT, C
EXTRN sub_100373CC:PROC
EXTRN sub_10037412:PROC
EXTRN sub_10037436:PROC
EXTRN sub_1003749E:PROC
EXTRN sub_100374C4:PROC
EXTRN sub_1003753E:PROC
EXTRN sub_10037564:PROC
EXTRN sub_100375B8:PROC
EXTRN sub_100375DE:PROC
EXTRN sub_10037604:PROC
EXTRN sub_1003767E:PROC
EXTRN sub_100376A4:PROC
EXTRN sub_1003771E:PROC
EXTRN sub_10037744:PROC
EXTRN sub_100377BE:PROC
EXTRN sub_100377E4:PROC
EXTRN sub_1003785E:PROC
EXTRN sub_10037884:PROC
EXTRN sub_10037D47:PROC
EXTRN sub_10037E6A:PROC
EXTRN sub_10059388:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD50:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
EXTRN EXTRN g_1019BDAC:DWORD:DWORD
EXTRN EXTRN g_1019BDE8:DWORD:DWORD
EXTRN EXTRN g_1019BE6C:DWORD:DWORD
EXTRN EXTRN g_1019BE70:DWORD:DWORD
EXTRN EXTRN g_1019BE74:DWORD:DWORD
EXTRN EXTRN g_1019BE78:DWORD:DWORD
EXTRN EXTRN g_1019BE7C:DWORD:DWORD
EXTRN EXTRN g_1019BE80:DWORD:DWORD
EXTRN EXTRN g_1019BE84:DWORD:DWORD
EXTRN EXTRN g_1019BE88:DWORD:DWORD
EXTRN EXTRN g_1019BE8C:DWORD:DWORD
EXTRN EXTRN g_1019BE90:DWORD:DWORD
EXTRN EXTRN g_1019BE94:DWORD:DWORD
.CODE
FUN_100368a0 PROC
    sub sub esp, 76
    fld fld dword ptr [edi + 8]
    push push ebx
    fmul fmul dword ptr [g_1019BE94]
    mov mov ebx, eax
    fld fld dword ptr [edi]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld dword ptr [edi + 4]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld st(0)
    fabs fabs
    fld fld dword ptr [g_1019BC84]
    fmul fmul st(1)
    fst fst dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BDA0]
    fld fld st(1)
    fmul fmul st(2)
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [edi + 20]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 16]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 12]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fst fst dword ptr [esp + 8]
    fabs fabs
    fld fld dword ptr [g_1019BE88]
    fmul fmul st(1)
    fadd fadd dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BC84]
    fmul fmul st(1)
    fadd fadd dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE84]
    fadd fadd st(1)
    fstp fstp st(2)
    fstp fstp st(0)
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    fadd fadd dword ptr [esp + 12]
    fld fld dword ptr [edi + 32]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 28]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 24]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fabs fabs
    fld fld dword ptr [g_1019BE80]
    fmul fmul st(1)
    fsubr fsubr dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BE7C]
    fmul fmul st(1)
    fadd fadd dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE84]
    fadd fadd st(3)
    fstp fstp dword ptr [esp + 52]
    fld fld st(0)
    fmul fmul st(1)
    fadd fadd st(2)
    fstp fstp st(3)
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [edi + 44]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 40]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 36]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fabs fabs
    fld fld dword ptr [g_1019BE80]
    fmul fmul st(1)
    fadd fadd dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BE7C]
    fmul fmul st(1)
    fadd fadd dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE84]
    fadd fadd dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 52]
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 56]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 52]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 48]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fabs fabs
    fld fld dword ptr [g_1019BE80]
    fmul fmul st(1)
    fsubr fsubr dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BE7C]
    fmul fmul st(1)
    fsubr fsubr dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE84]
    fsubr fsubr dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 52]
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 68]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 64]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 60]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fabs fabs
    fld fld dword ptr [g_1019BE80]
    fmul fmul st(1)
    fadd fadd dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BE7C]
    fmul fmul st(1)
    fsubr fsubr dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE84]
    fsubr fsubr dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 52]
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 80]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 76]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 72]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fabs fabs
    fld fld dword ptr [g_1019BE88]
    fmul fmul st(1)
    fsubr fsubr dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BC84]
    fmul fmul st(1)
    fadd fadd dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE84]
    fsubr fsubr dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 52]
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 92]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 88]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 84]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fabs fabs
    fld fld dword ptr [g_1019BC84]
    fmul fmul st(1)
    fld fld dword ptr [esp + 44]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 44]
    fadd fadd dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    fadd fadd dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 52]
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fxch fxch st(1)
    fst fst dword ptr [esp + 12]
    fstp fstp st(1)
    fcomp fcomp dword ptr [g_1019BE78]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_100375B8
    push push esi
    lea lea esi, [esp + 48]
    mov mov dword ptr [esp + 20], 0
    call sub_10059388
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC84]
    mov mov dword ptr [esp + 64], 0
    fld fld dword ptr [esp + 52]
    mov mov dword ptr [esp + 68], 0
    fmul fmul dword ptr [g_1019BC84]
    pop pop esi
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [g_1019BC78]
    fsubr fsubr dword ptr [esp + 20]
    fadd fadd dword ptr [esp + 8]
    fst fst dword ptr [esp + 24]
    fst fst dword ptr [esp + 4]
    fcomp fcomp dword ptr [g_1019BDE8]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L0
    fstp fstp st(0)
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [edi]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 4]
    jmp L1
    fld fld dword ptr [esp + 16]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [g_1019BE84]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [g_1019BE88]
    fadd fadd st(1)
    fadd fadd dword ptr [esp + 8]
    fcom fcom dword ptr [g_1019BDE8]
    fst fst dword ptr [esp + 28]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L2
    fld fld st(0)
    fmul fmul dword ptr [edi + 12]
    faddp faddp st(4)
    fld fld st(0)
    fmul fmul dword ptr [edi + 16]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [edi + 20]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    faddp faddp st(2)
    jmp L3
    fstp fstp st(0)
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE7C]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [g_1019BE74]
    fst fst dword ptr [esp + 4]
    fadd fadd st(1)
    fcom fcom dword ptr [g_1019BDE8]
    fst fst dword ptr [esp + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L4
    fld fld st(0)
    fmul fmul dword ptr [edi + 24]
    faddp faddp st(4)
    fld fld st(0)
    fmul fmul dword ptr [edi + 28]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [edi + 32]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    faddp faddp st(2)
    jmp L5
    fstp fstp st(0)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [g_1019BE80]
    fst fst dword ptr [esp + 16]
    faddp faddp st(1)
    fcom fcom dword ptr [g_1019BDE8]
    fst fst dword ptr [esp + 36]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L6
    fld fld st(0)
    fmul fmul dword ptr [edi + 36]
    faddp faddp st(3)
    fld fld st(0)
    fmul fmul dword ptr [edi + 40]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [edi + 44]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    faddp faddp st(1)
    jmp L7
    fstp fstp st(0)
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [g_1019BE70]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE7C]
    fsubr fsubr st(1)
    fld fld dword ptr [esp + 4]
    fadd fadd st(1)
    fcom fcom dword ptr [g_1019BDE8]
    fst fst dword ptr [esp + 4]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L8
    fld fld st(0)
    fmul fmul dword ptr [edi + 48]
    faddp faddp st(5)
    fld fld st(0)
    fmul fmul dword ptr [edi + 52]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [edi + 56]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    faddp faddp st(3)
    jmp L9
    fstp fstp st(0)
    fadd fadd dword ptr [esp + 16]
    fcom fcom dword ptr [g_1019BDE8]
    fst fst dword ptr [esp + 16]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L10
    fld fld st(0)
    fmul fmul dword ptr [edi + 60]
    faddp faddp st(4)
    fld fld st(0)
    fmul fmul dword ptr [edi + 64]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [edi + 68]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    faddp faddp st(2)
    jmp L11
    fstp fstp st(0)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [g_1019BE88]
    fsubp fsubp st(1)
    fadd fadd dword ptr [esp + 8]
    fcom fcom dword ptr [g_1019BDE8]
    fst fst dword ptr [esp + 40]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L12
    fld fld st(0)
    fmul fmul dword ptr [edi + 72]
    faddp faddp st(3)
    fld fld st(0)
    fmul fmul dword ptr [edi + 76]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [edi + 80]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    faddp faddp st(1)
    jmp L13
    fstp fstp st(0)
    fld fld dword ptr [esp + 20]
    fadd fadd dword ptr [esp + 8]
    fadd fadd dword ptr [esp + 52]
    fcom fcom dword ptr [g_1019BDE8]
    fst fst dword ptr [esp + 20]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L14
    fld fld st(0)
    fmul fmul dword ptr [edi + 84]
    faddp faddp st(3)
    fld fld st(0)
    fmul fmul dword ptr [edi + 88]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [edi + 92]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    faddp faddp st(1)
    jmp L15
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC84]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L16
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld st(0)
    fmulp fmulp st(2)
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    jmp sub_100373CC
    fstp fstp st(0)
    fld fld dword ptr [esp + 24]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10037412
    fchs fchs
    fld fld st(0)
    fmul fmul st(2)
    fadd fadd dword ptr [edi]
    fstp fstp dword ptr [edi]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 4]
    fstp fstp dword ptr [edi + 4]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 8]
    fstp fstp dword ptr [edi + 8]
    jmp sub_10037436
    fstp fstp st(0)
    fld fld dword ptr [edi]
    mov mov eax, dword ptr [edi + 4]
    fld fld dword ptr [esp + 28]
    mov mov ecx, dword ptr [edi + 8]
    fcom fcom dword ptr [g_1019BC84]
    mov mov dword ptr [esp + 72], eax
    mov mov dword ptr [esp + 76], ecx
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1003749E
    fchs fchs
    fld fld st(0)
    fmul fmul st(3)
    fadd fadd dword ptr [edi + 12]
    fstp fstp dword ptr [edi + 12]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 16]
    fstp fstp dword ptr [edi + 16]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 20]
    fstp fstp dword ptr [edi + 20]
    jmp sub_100374C4
    fstp fstp st(0)
    fadd fadd dword ptr [edi + 12]
    fld fld dword ptr [esp + 72]
    fadd fadd dword ptr [edi + 16]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [edi + 20]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [esp + 32]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1003753E
    fchs fchs
    fld fld st(0)
    fmul fmul st(3)
    fadd fadd dword ptr [edi + 24]
    fstp fstp dword ptr [edi + 24]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 28]
    fstp fstp dword ptr [edi + 28]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 32]
    fstp fstp dword ptr [edi + 32]
    jmp sub_10037564
    fstp fstp st(0)
    fadd fadd dword ptr [edi + 24]
    fld fld dword ptr [esp + 72]
    fadd fadd dword ptr [edi + 28]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [edi + 32]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [esp + 36]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100375DE
    fchs fchs
    fld fld st(0)
    fmul fmul st(3)
    fadd fadd dword ptr [edi + 36]
    fstp fstp dword ptr [edi + 36]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 40]
    fstp fstp dword ptr [edi + 40]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 44]
    fstp fstp dword ptr [edi + 44]
    jmp sub_10037604
    fstp fstp st(0)
    fadd fadd dword ptr [edi + 36]
    fld fld dword ptr [esp + 72]
    fadd fadd dword ptr [edi + 40]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [edi + 44]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [esp + 4]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1003767E
    fchs fchs
    fld fld st(0)
    fmul fmul st(3)
    fadd fadd dword ptr [edi + 48]
    fstp fstp dword ptr [edi + 48]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 52]
    fstp fstp dword ptr [edi + 52]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 56]
    fstp fstp dword ptr [edi + 56]
    jmp sub_100376A4
    fstp fstp st(0)
    fadd fadd dword ptr [edi + 48]
    fld fld dword ptr [esp + 72]
    fadd fadd dword ptr [edi + 52]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [edi + 56]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [esp + 16]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1003771E
    fchs fchs
    fld fld st(0)
    fmul fmul st(3)
L2:
    fadd fadd dword ptr [edi + 60]
    fstp fstp dword ptr [edi + 60]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 64]
    fstp fstp dword ptr [edi + 64]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 68]
    fstp fstp dword ptr [edi + 68]
    jmp sub_10037744
    fstp fstp st(0)
    fadd fadd dword ptr [edi + 60]
    fld fld dword ptr [esp + 72]
L3:
    fadd fadd dword ptr [edi + 64]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [edi + 68]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [esp + 40]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100377BE
    fchs fchs
    fld fld st(0)
    fmul fmul st(3)
    fadd fadd dword ptr [edi + 72]
    fstp fstp dword ptr [edi + 72]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 76]
    fstp fstp dword ptr [edi + 76]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 80]
    fstp fstp dword ptr [edi + 80]
    jmp sub_100377E4
    fstp fstp st(0)
    fadd fadd dword ptr [edi + 72]
    fld fld dword ptr [esp + 72]
    fadd fadd dword ptr [edi + 76]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [edi + 80]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [esp + 20]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1003785E
    fchs fchs
    fld fld st(0)
    fmul fmul st(3)
    fadd fadd dword ptr [edi + 84]
    fstp fstp dword ptr [edi + 84]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fadd fadd dword ptr [edi + 88]
    fstp fstp dword ptr [edi + 88]
    fmul fmul dword ptr [esp + 64]
    fadd fadd dword ptr [edi + 92]
    fstp fstp dword ptr [edi + 92]
    jmp sub_10037884
    fstp fstp st(0)
    fadd fadd dword ptr [edi + 84]
    fld fld dword ptr [esp + 72]
    fadd fadd dword ptr [edi + 88]
    fld fld dword ptr [esp + 76]
    fadd fadd dword ptr [edi + 92]
    fstp fstp dword ptr [esp + 76]
    fxch fxch st(1)
    fmul fmul dword ptr [g_1019BDAC]
    fstp fstp dword ptr [esp + 68]
    fmul fmul dword ptr [g_1019BDAC]
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [g_1019BDAC]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [edi]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi]
    fld fld dword ptr [edi + 4]
    fsub fsub st(1)
    fstp fstp dword ptr [edi + 4]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 8]
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld dword ptr [edi + 4]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld st(0)
    fmulp fmulp st(1)
    fld fld dword ptr [edi + 12]
    fsub fsub dword ptr [esp + 68]
L6:
    fstp fstp dword ptr [edi + 12]
    fld fld dword ptr [edi + 16]
    fsub fsub st(2)
    fstp fstp dword ptr [edi + 16]
    fld fld dword ptr [edi + 20]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 20]
    fld fld dword ptr [edi + 20]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 16]
    fmul fmul dword ptr [g_1019BE8C]
L7:
    faddp faddp st(1)
    fld fld dword ptr [edi + 12]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 24]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 24]
    fld fld dword ptr [edi + 28]
    fsub fsub st(2)
    fstp fstp dword ptr [edi + 28]
    fld fld dword ptr [edi + 32]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 32]
    fld fld dword ptr [edi + 32]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 28]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 24]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 36]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 36]
    fld fld dword ptr [edi + 40]
    fsub fsub st(2)
    fstp fstp dword ptr [edi + 40]
    fld fld dword ptr [edi + 44]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 44]
    fld fld dword ptr [edi + 44]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 40]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 36]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 48]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 48]
    fld fld dword ptr [edi + 52]
L9:
    fsub fsub st(2)
    fstp fstp dword ptr [edi + 52]
    fld fld dword ptr [edi + 56]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 56]
    fld fld dword ptr [edi + 56]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 52]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 48]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 60]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 60]
    fld fld dword ptr [edi + 64]
    fsub fsub st(2)
    fstp fstp dword ptr [edi + 64]
    fld fld dword ptr [edi + 68]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 68]
    fld fld dword ptr [edi + 68]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 64]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 60]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 72]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 72]
    fld fld dword ptr [edi + 76]
    fsub fsub st(2)
    fstp fstp dword ptr [edi + 76]
    fld fld dword ptr [edi + 80]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 80]
    fld fld dword ptr [edi + 80]
    fmul fmul dword ptr [g_1019BE94]
    fld fld dword ptr [edi + 76]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 72]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [edi + 84]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 84]
    fld fld dword ptr [edi + 88]
    fsub fsub st(2)
    fstp fstp dword ptr [edi + 88]
    fld fld dword ptr [edi + 92]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [edi + 92]
    fld fld dword ptr [edi + 92]
    fmul fmul dword ptr [g_1019BE94]
L12:
    fld fld dword ptr [edi + 88]
    fmul fmul dword ptr [g_1019BE8C]
    faddp faddp st(1)
    fld fld dword ptr [edi + 84]
    fmul fmul dword ptr [g_1019BE90]
    faddp faddp st(1)
    fld fld st(0)
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    fld fld dword ptr [esp + 12]
    fsub fsub st(1)
    fcomp fcomp dword ptr [g_1019BE6C]
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 5
    jp sub_10037D47
    fstp fstp st(0)
    fstp fstp st(0)
    xor xor al, al
    pop pop ebx
    add add esp, 76
    ret ret
    fld fld dword ptr [esp + 68]
    mov mov edx, dword ptr [esp + 84]
    imul imul ebx, ebx, 104
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ebx + edx + 36]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ebx + edx + 40]
    lea lea ecx, [ebx + edx]
    fld fld dword ptr [esp + 76]
    mov mov dword ptr [ecx], 3
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ecx + 44]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ecx + 4]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ecx + 8]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ecx + 12]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 52]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 48]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 44]
    faddp faddp st(1)
    fcomp fcomp dword ptr [g_1019BD50]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10037E6A
    xor xor eax, eax
    mov mov dword ptr [ecx + 64], eax
    mov mov dword ptr [ecx + 68], eax
    mov mov dword ptr [ecx + 72], 03F800000h
    mov mov al, 1
    pop pop ebx
    add add esp, 76
    ret ret
    fld fld dword ptr [esp + 44]
    mov mov al, 1
    fchs fchs
    pop pop ebx
    fstp fstp dword ptr [ecx + 64]
    fld fld dword ptr [esp + 44]
    fchs fchs
    fstp fstp dword ptr [ecx + 68]
    fld fld dword ptr [esp + 48]
    fchs fchs
    fstp fstp dword ptr [ecx + 72]
    add add esp, 76
    ret ret
FUN_100368a0 ENDP
END
