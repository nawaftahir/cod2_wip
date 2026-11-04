; FUN_10058d20 @ 0x10058d20 — auto-synthesized
    sub_1010a966 PROTO C
.CODE
FUN_10058d20 PROC
    sub esp, 0x10
    fld dword ptr [eax]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 4]
    fld dword ptr [eax + 4]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [eax + 8]
    fsub dword ptr [ecx + 8]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [esp + 0xc]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010a966
    fstp dword ptr [esp]
    fld dword ptr [esp]
    add esp, 0x10
    ret
FUN_10058d20 ENDP
END