.686
.MODEL FLAT, C
EXTRN sub_100F6689:PROC
EXTRN sub_1010A9DA:PROC
EXTRN sub_1010A9E7:PROC
EXTRN sub_1010A9F5:PROC
EXTRN sub_1010AA07:PROC
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD54:DWORD:DWORD
EXTRN EXTRN g_1019BDA8:DWORD:DWORD
EXTRN EXTRN g_101CE7B4:DWORD:DWORD
EXTRN EXTRN g_101CE81C:DWORD:DWORD
EXTRN EXTRN g_1072DDBC:DWORD:DWORD
.CODE
FUN_100399d0 PROC
    sub sub esp, 36
    mov mov eax, dword ptr [g_1072DDBC]
    mov mov dword ptr [esp], eax
    fld fld dword ptr [esp]
    sub sub esp, 8
    fstp fstp qword ptr [esp]
    call sub_100F6689
    mov mov eax, dword ptr [g_101CE81C]
    movzx movzx ecx, byte ptr [eax + 8]
    movzx movzx edx, byte ptr [eax + 9]
    fsubr fsubr dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], ecx
    fild fild dword ptr [esp + 8]
    movzx movzx ecx, byte ptr [eax + 10]
    mov mov dword ptr [esp + 8], edx
    movzx movzx edx, byte ptr [eax + 11]
    fmul fmul dword ptr [g_1019BD54]
    fild fild dword ptr [esp + 8]
    mov mov eax, dword ptr [g_101CE7B4]
    mov mov dword ptr [esp + 8], ecx
    fmul fmul dword ptr [g_1019BD54]
    movzx movzx ecx, byte ptr [eax + 8]
    fstp fstp dword ptr [esp + 16]
    fild fild dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], edx
    movzx movzx edx, byte ptr [eax + 9]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 20]
    fild fild dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], ecx
    movzx movzx ecx, byte ptr [eax + 10]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 24]
    fild fild dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], edx
    movzx movzx edx, byte ptr [eax + 11]
    fmul fmul dword ptr [g_1019BD54]
    fild fild dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], ecx
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 32]
    fild fild dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], edx
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 36]
    fild fild dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 40]
    fxch fxch st(2)
    fmul fmul dword ptr [g_1019BDA8]
    fsin fsin
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 8]
    fxch fxch st(1)
    fsub fsub st(1)
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 32]
    fsub fsub dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 8]
    fadd fadd dword ptr [esp + 16]
    fld fld dword ptr [esp + 36]
    fsub fsub dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 8]
    fadd fadd dword ptr [esp + 20]
    fld fld dword ptr [esp + 40]
    fsub fsub dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 8]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BCAC]
    call sub_1010A9DA
    mov mov byte ptr [esi], al
    fmul fmul dword ptr [g_1019BCAC]
    call sub_1010A9E7
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [esi + 1], al
    call sub_1010A9F5
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [esi + 2], al
    call sub_1010AA07
    mov mov byte ptr [esi + 3], al
    add add esp, 44
    ret ret
FUN_100399d0 ENDP
END
