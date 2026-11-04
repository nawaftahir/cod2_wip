; FUN_10102f30 @ 0x10102f30 — auto-synthesized
.CODE
FUN_10102f30 PROC
    fld st(0)
    frndint
    fsubr st(1), st(0)
    fxch st(1)
    fchs
    f2xm1
    fld1
    faddp st(1)
    fscale
    fstp st(1)
    ret
FUN_10102f30 ENDP
END