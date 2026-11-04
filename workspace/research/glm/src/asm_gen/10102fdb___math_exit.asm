; __math_exit @ 0x10102fdb — auto-synthesized
    sub_10102f0a PROTO C
.CODE
__math_exit PROC
    mov ax, word ptr [esp]
    cmp ax, 0x27f
    je L0
    and ax, 0x20
    je L1
    wait
    fnstsw ax
    and ax, 0x20
    je L1
    mov eax, 8
    call sub_10102f0a
    pop edx
    ret
    fldcw word ptr [esp]
    pop edx
    ret
__math_exit ENDP
END