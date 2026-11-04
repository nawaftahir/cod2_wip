; FUN_10059870 @ 0x10059870 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_1019bc98:DWORD
    EXTRN g_1019bc9c:DWORD
    EXTRN g_1019bd98:DWORD
    sub_1010aaf6 PROTO C
.CODE
FUN_10059870 PROC
    fld dword ptr [g_1019bc84]
    sub esp, 8
    fld dword ptr [ecx + 4]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L0
    fld dword ptr [g_1019bc84]
    fld dword ptr [ecx]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L0
    mov dword ptr [esp], 0
    fld dword ptr [esp]
    add esp, 8
    ret
    mov eax, dword ptr [ecx]
    mov ecx, dword ptr [ecx + 4]
    mov dword ptr [esp], ecx
    fld dword ptr [esp]
    mov dword ptr [esp + 4], eax
    fld dword ptr [esp + 4]
    call sub_1010aaf6
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [g_1019bc98]
    fdiv dword ptr [g_1019bd98]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 5
    jp L1
    fld dword ptr [esp]
    fadd dword ptr [g_1019bc9c]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    add esp, 8
    ret
FUN_10059870 ENDP
END