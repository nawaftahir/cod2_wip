.686
.MODEL FLAT, C
.CODE
FUN_10058ee0 PROC
    sub esp, 8
    fld dword ptr [eax]
    fsub dword ptr [ecx]
    fstp dword ptr [esp]
    fld dword ptr [eax + 4]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    faddp st(1)
    add esp, 8
    ret
FUN_10058ee0 ENDP
END
