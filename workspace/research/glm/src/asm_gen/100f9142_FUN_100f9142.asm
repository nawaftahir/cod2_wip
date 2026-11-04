; FUN_100f9142 @ 0x100f9142 — auto-synthesized
    EXTRN g_101a4830:DWORD
.CODE
FUN_100f9142 PROC
    fld st(0)
    frndint
    fcomp st(1)
    mov cl, 0
    wait
    fnstsw ax
    sahf
    jne L0
    fmul qword ptr [g_101a4830]
    inc cl
    fld st(0)
    frndint
    fcompp
    wait
    fnstsw ax
    sahf
    jne L1
    inc cl
    ret
    fstp st(0)
    ret
FUN_100f9142 ENDP
END