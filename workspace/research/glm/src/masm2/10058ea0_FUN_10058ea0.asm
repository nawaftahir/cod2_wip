.686
.MODEL FLAT, C
EXTRN sub_1010A94F:PROC
.CODE
FUN_10058ea0 PROC
    sub sub esp, 8
    fld fld dword ptr [eax]
    fsub fsub dword ptr [ecx]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [eax + 4]
    fsub fsub dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esp]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    call sub_1010A94F
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    add add esp, 8
    ret ret
FUN_10058ea0 ENDP
END
