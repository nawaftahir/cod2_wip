; FUN_1005c3f0 @ 0x1005c3f0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_1019bcb0:DWORD
.CODE
FUN_1005c3f0 PROC
    sub esp, 0x10
    fld dword ptr [ecx]
    fsub dword ptr [edx]
    fstp dword ptr [esp + 4]
    fld dword ptr [ecx + 4]
    fsub dword ptr [edx + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [ecx + 8]
    fsub dword ptr [edx + 8]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 4]
    fsub dword ptr [esp + 8]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 1
    mov eax, dword ptr [esp + 4]
    je L0
    mov eax, dword ptr [esp + 8]
    mov dword ptr [esp], eax
    fld dword ptr [esp]
    fcomp dword ptr [esp + 0xc]
    fnstsw ax
    test ah, 0x41
    jne L1
    fld dword ptr [esp]
    fsub dword ptr [esp + 0xc]
    fmul dword ptr [g_1019bcb0]
    fstp dword ptr [esp]
    fld dword ptr [edx + 8]
    fsub dword ptr [esp]
    fstp dword ptr [edx + 8]
    fld dword ptr [esp]
    fadd dword ptr [ecx + 8]
    fstp dword ptr [ecx + 8]
    add esp, 0x10
    ret
FUN_1005c3f0 ENDP
END