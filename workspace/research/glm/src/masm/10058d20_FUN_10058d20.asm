.686
.MODEL FLAT, C
EXTRN sub_1010A966:PROC
.CODE
FUN_10058d20 PROC
    sub esp, 16
    fld dword ptr [eax]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 4]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [eax + 8]
    fsub dword ptr [ecx + 8]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 12]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010A966
    fstp dword ptr [esp]
    fld dword ptr [esp]
    add esp, 16
    ret
FUN_10058d20 ENDP
END
