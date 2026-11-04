.686
.MODEL FLAT, C
EXTRN sub_1000F34C:PROC
EXTRN sub_10058FC4:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BCD8:DWORD
EXTRN g_1019BD70:DWORD
EXTRN g_1019BE7C:DWORD
EXTRN g_1019BEC4:DWORD
EXTRN g_1019BEC8:DWORD
.CODE
FUN_100104a0 PROC
    sub esp, 36
    mov eax, dword ptr [esp + 40]
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [eax]
    mov dword ptr [esp], ecx
    fld dword ptr [esp]
    mov dword ptr [esp + 4], eax
    fmul dword ptr [g_1019BEC8]
    mov dword ptr [esp + 40], edx
    lea eax, [esp + 8]
    fstp dword ptr [esp]
    fld dword ptr [esp + 4]
    fmul dword ptr [g_1019BE7C]
    fld dword ptr [esp + 40]
    fmul dword ptr [g_1019BC84]
    faddp st(1)
    fadd dword ptr [esp]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [g_1019BEC4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 40]
    fmul dword ptr [g_1019BCD8]
    fadd dword ptr [esp + 4]
    fadd dword ptr [esp]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 40]
    fmul dword ptr [g_1019BCD8]
    fsubr dword ptr [esp + 4]
    fadd dword ptr [esp]
    fstp dword ptr [esp + 16]
    call sub_10058FC4
    mov ecx, dword ptr [esp + eax*4 + 8]
    mov dword ptr [esp + 40], ecx
    fld dword ptr [esp + 40]
    mov eax, dword ptr [esp + 44]
    test eax, eax
    fabs
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 40]
    fdivr dword ptr [g_1019BC78]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 8]
    fadd dword ptr [g_1019BC78]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 40]
    fadd st(0), st(0)
    fsubr dword ptr [g_1019BD70]
    fmul dword ptr [esp + 40]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fadd dword ptr [g_1019BC78]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 40]
    fadd st(0), st(0)
    fsubr dword ptr [g_1019BD70]
    fmul dword ptr [esp + 40]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 16]
    jne L0
    fmul dword ptr [g_1019BCB0]
    fsubr dword ptr [g_1019BCB0]
    jmp L1
L0:
    fadd dword ptr [g_1019BC78]
    fmul dword ptr [g_1019BCB0]
L1:
    fstp dword ptr [esp + 40]
    push esi
    fld dword ptr [esp + 44]
    mov esi, dword ptr [esp + 52]
    fadd st(0), st(0)
    lea edx, [esp + 12]
    fsubr dword ptr [g_1019BD70]
    fmul dword ptr [esp + 44]
    fmul dword ptr [esp + 44]
    fstp dword ptr [esp + 36]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esp + 32]
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esp + 28]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 44]
    fmul dword ptr [esp + 36]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 36]
    fmul dword ptr [esp + 28]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 36]
    fmul dword ptr [esp + 32]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 32]
    fmul dword ptr [esp + 28]
    fstp dword ptr [esp + 24]
    call sub_1000F34C
    pop esi
    add esp, 36
    ret
FUN_100104a0 ENDP
END
