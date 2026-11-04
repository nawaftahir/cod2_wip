; __security_check_cookie @ 0x10100d4d — auto-synthesized
    EXTRN g_101a50d0:DWORD
    sub_10100d2a PROTO C
.CODE
__security_check_cookie PROC
    cmp ecx, dword ptr [g_101a50d0]
    jne L0
    ret
    jmp sub_10100d2a
__security_check_cookie ENDP
END