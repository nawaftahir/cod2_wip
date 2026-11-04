.686
.MODEL FLAT, C
EXTRN sub_1005C2BE:PROC
EXTRN sub_1005C352:PROC
EXTRN sub_1010AA28:PROC
.CODE
FUN_1005c1a0 PROC
    sub sub esp, 28
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [esp + 8], eax
    fld fld dword ptr [esp + 8]
    mov mov eax, dword ptr [ecx]
    fabs fabs
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    mov mov dword ptr [esp + 12], eax
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp + 12]
    fabs fabs
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [esp + 4]
    fnstsw fnstsw ax
    test test ah, 65
    mov mov eax, dword ptr [esp]
    je L0
    mov mov eax, dword ptr [esp + 4]
    mov mov dword ptr [esp + 16], eax
    mov mov eax, dword ptr [edx + 4]
    mov mov dword ptr [esp + 8], eax
    fld fld dword ptr [esp + 8]
    mov mov eax, dword ptr [ecx + 4]
    fabs fabs
    mov mov dword ptr [esp + 12], eax
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp + 12]
    fabs fabs
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [esp + 4]
    fnstsw fnstsw ax
    test test ah, 65
    mov mov eax, dword ptr [esp]
    je sub_1005C2BE
    mov mov eax, dword ptr [esp + 4]
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [esp + 8], edx
    fld fld dword ptr [esp + 8]
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [ecx + 8]
    fabs fabs
    fstp fstp dword ptr [esp + 8]
    mov mov dword ptr [esp + 12], eax
    fld fld dword ptr [esp + 8]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp + 12]
    fabs fabs
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [esp + 4]
    fnstsw fnstsw ax
    test test ah, 65
    mov mov eax, dword ptr [esp]
    je sub_1005C352
    mov mov eax, dword ptr [esp + 4]
    mov mov dword ptr [esp + 24], eax
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 20]
    faddp faddp st(1)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    call sub_1010AA28
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    add add esp, 28
    ret ret
FUN_1005c1a0 ENDP
END
