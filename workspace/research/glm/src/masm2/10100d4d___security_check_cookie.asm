.686
.MODEL FLAT, C
EXTRN sub_10100D2A:PROC
EXTRN sub_10100D5E:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
__security_check_cookie PROC
    cmp cmp ecx, dword ptr [g_101A50D0]
    jne sub_10100D5E
    ret ret
    jmp sub_10100D2A
__security_check_cookie ENDP
END
