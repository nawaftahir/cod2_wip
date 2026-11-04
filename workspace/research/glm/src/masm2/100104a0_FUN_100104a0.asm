.686
.MODEL FLAT, C
EXTRN sub_1000F34C:PROC
EXTRN sub_10010706:PROC
EXTRN sub_10010720:PROC
EXTRN sub_10058FC4:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BCD8:DWORD:DWORD
EXTRN EXTRN g_1019BD70:DWORD:DWORD
EXTRN EXTRN g_1019BE7C:DWORD:DWORD
EXTRN EXTRN g_1019BEC4:DWORD:DWORD
EXTRN EXTRN g_1019BEC8:DWORD:DWORD
.CODE
FUN_100104a0 PROC
    sub sub esp, 36
    mov mov eax, dword ptr [esp + 40]
    mov mov ecx, dword ptr [eax + 8]
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [esp], ecx
    fld fld dword ptr [esp]
    mov mov dword ptr [esp + 4], eax
    fmul fmul dword ptr [g_1019BEC8]
    mov mov dword ptr [esp + 40], edx
    lea lea eax, [esp + 8]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [g_1019BE7C]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BC84]
    faddp faddp st(1)
    fadd fadd dword ptr [esp]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [g_1019BEC4]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BCD8]
    fadd fadd dword ptr [esp + 4]
    fadd fadd dword ptr [esp]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BCD8]
    fsubr fsubr dword ptr [esp + 4]
    fadd fadd dword ptr [esp]
    fstp fstp dword ptr [esp + 16]
    call sub_10058FC4
    mov mov ecx, dword ptr [esp + eax*4 + 8]
    mov mov dword ptr [esp + 40], ecx
    fld fld dword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 44]
    test test eax, eax
    fabs fabs
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 40]
    fdivr fdivr dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 8]
    fadd fadd dword ptr [g_1019BC78]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 40]
    fadd fadd st(0), st(0)
    fsubr fsubr dword ptr [g_1019BD70]
    fmul fmul dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fadd fadd dword ptr [g_1019BC78]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 40]
    fadd fadd st(0), st(0)
    fsubr fsubr dword ptr [g_1019BD70]
    fmul fmul dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 16]
    jne sub_10010706
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr dword ptr [g_1019BCB0]
    jmp sub_10010720
    fadd fadd dword ptr [g_1019BC78]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 40]
    push push esi
    fld fld dword ptr [esp + 44]
    mov mov esi, dword ptr [esp + 52]
    fadd fadd st(0), st(0)
    lea lea edx, [esp + 12]
    fsubr fsubr dword ptr [g_1019BD70]
    fmul fmul dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 24]
    call sub_1000F34C
    pop pop esi
    add add esp, 36
    ret ret
FUN_100104a0 ENDP
END
