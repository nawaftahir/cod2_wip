.686
.MODEL FLAT, C
EXTRN sub_1010A966:PROC
.CODE
FUN_10058d20 PROC
    sub sub esp, 16
    fld fld dword ptr [eax]
    fsub fsub dword ptr [ecx]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [eax + 4]
    fsub fsub dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [eax + 8]
    fsub fsub dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 12]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    call sub_1010A966
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    add add esp, 16
    ret ret
FUN_10058d20 ENDP
END
