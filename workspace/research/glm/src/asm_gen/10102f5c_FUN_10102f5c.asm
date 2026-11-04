; FUN_10102f5c @ 0x10102f5c — auto-synthesized
    EXTRN g_1017e300:DWORD
.CODE
FUN_10102f5c PROC
    test eax, 0x80000
    je L0
    mov eax, 7
    ret
    fadd qword ptr [g_1017e300]
    mov eax, 1
    ret
FUN_10102f5c ENDP
END