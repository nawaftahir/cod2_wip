; FUN_10102fce @ 0x10102fce — auto-synthesized
.CODE
FUN_10102fce PROC
    cmp word ptr [esp], 0x27f
    je L0
    fldcw word ptr [esp]
    pop edx
    ret
FUN_10102fce ENDP
END