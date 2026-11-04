; FUN_10058ea0 @ 0x10058ea0 — auto-synthesized
    sub_1010a94f PROTO C
.CODE
FUN_10058ea0 PROC
    sub esp, 8
    fld dword ptr [eax]
    fsub dword ptr [ecx]
    fstp dword ptr [esp]
    fld dword ptr [eax + 4]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fmul dword ptr [esp]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    call sub_1010a94f
    fstp dword ptr [esp]
    fld dword ptr [esp]
    add esp, 8
    ret
FUN_10058ea0 ENDP
END