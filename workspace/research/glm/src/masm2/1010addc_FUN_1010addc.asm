.686
.MODEL FLAT, C
EXTRN EXTRN g_101A523A:DWORD:DWORD
.CODE
FUN_1010addc PROC
    fstp fstp st(0)
    fld fld xword ptr [g_101A523A]
    ret ret
FUN_1010addc ENDP
END
