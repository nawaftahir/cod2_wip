.686
.MODEL FLAT, C
EXTRN sub_1010A9D4:PROC
.CODE
FUN_1005c2c0 PROC
    sub esp, 24
    mov eax, dword ptr [edx]
    mov dword ptr [esp + 8], eax
    fld dword ptr [esp + 8]
    mov eax, dword ptr [ecx]
    fabs
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    mov dword ptr [esp + 12], eax
    fstp dword ptr [esp]
    fld dword ptr [esp + 12]
    fabs
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 65
    mov eax, dword ptr [esp]
    je L0
    mov eax, dword ptr [esp + 4]
L0:
    mov edx, dword ptr [edx + 4]
    mov dword ptr [esp + 8], edx
    fld dword ptr [esp + 8]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [ecx + 4]
    fabs
    fstp dword ptr [esp + 8]
    mov dword ptr [esp + 12], eax
    fld dword ptr [esp + 8]
    fstp dword ptr [esp]
    fld dword ptr [esp + 12]
    fabs
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 65
    mov eax, dword ptr [esp]
    je L1
    mov eax, dword ptr [esp + 4]
L1:
    mov dword ptr [esp + 20], eax
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    call sub_1010A9D4
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    add esp, 24
    ret
FUN_1005c2c0 ENDP
END
