.686
.MODEL FLAT, C
EXTRN sub_10100D2A:PROC
EXTRN g_101A50D0:DWORD
.CODE
__security_check_cookie PROC
    cmp ecx, dword ptr [g_101A50D0]
    jne L0
    ret
L0:
    jmp sub_10100D2A
__security_check_cookie ENDP
END
