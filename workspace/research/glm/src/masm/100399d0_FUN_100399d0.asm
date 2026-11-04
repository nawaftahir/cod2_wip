.686
.MODEL FLAT, C
EXTRN sub_100F6689:PROC
EXTRN sub_1010A9DA:PROC
EXTRN sub_1010A9E7:PROC
EXTRN sub_1010A9F5:PROC
EXTRN sub_1010AA07:PROC
EXTRN g_1019BCAC:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD54:DWORD
EXTRN g_1019BDA8:DWORD
EXTRN g_101CE7B4:DWORD
EXTRN g_101CE81C:DWORD
EXTRN g_1072DDBC:DWORD
.CODE
FUN_100399d0 PROC
    sub esp, 36
    mov eax, dword ptr [g_1072DDBC]
    mov dword ptr [esp], eax
    fld dword ptr [esp]
    sub esp, 8
    fstp qword ptr [esp]
    call sub_100F6689
    mov eax, dword ptr [g_101CE81C]
    movzx ecx, byte ptr [eax + 8]
    movzx edx, byte ptr [eax + 9]
    fsubr dword ptr [esp + 8]
    mov dword ptr [esp + 8], ecx
    fild dword ptr [esp + 8]
    movzx ecx, byte ptr [eax + 10]
    mov dword ptr [esp + 8], edx
    movzx edx, byte ptr [eax + 11]
    fmul dword ptr [g_1019BD54]
    fild dword ptr [esp + 8]
    mov eax, dword ptr [g_101CE7B4]
    mov dword ptr [esp + 8], ecx
    fmul dword ptr [g_1019BD54]
    movzx ecx, byte ptr [eax + 8]
    fstp dword ptr [esp + 16]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], edx
    movzx edx, byte ptr [eax + 9]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 20]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], ecx
    movzx ecx, byte ptr [eax + 10]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 24]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], edx
    movzx edx, byte ptr [eax + 11]
    fmul dword ptr [g_1019BD54]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], ecx
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 32]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], edx
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 36]
    fild dword ptr [esp + 8]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 40]
    fxch st(2)
    fmul dword ptr [g_1019BDA8]
    fsin
    fmul dword ptr [g_1019BCB0]
    fsubr dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 8]
    fxch st(1)
    fsub st(1)
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 32]
    fsub dword ptr [esp + 16]
    fmul dword ptr [esp + 8]
    fadd dword ptr [esp + 16]
    fld dword ptr [esp + 36]
    fsub dword ptr [esp + 20]
    fmul dword ptr [esp + 8]
    fadd dword ptr [esp + 20]
    fld dword ptr [esp + 40]
    fsub dword ptr [esp + 24]
    fmul dword ptr [esp + 8]
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 40]
    fmul dword ptr [g_1019BCAC]
    call sub_1010A9DA
    mov byte ptr [esi], al
    fmul dword ptr [g_1019BCAC]
    call sub_1010A9E7
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [esi + 1], al
    call sub_1010A9F5
    fld dword ptr [esp + 40]
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [esi + 2], al
    call sub_1010AA07
    mov byte ptr [esi + 3], al
    add esp, 44
    ret
FUN_100399d0 ENDP
END
