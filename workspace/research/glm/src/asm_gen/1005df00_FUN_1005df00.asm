; FUN_1005df00 @ 0x1005df00 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bc84:DWORD
.CODE
FUN_1005df00 PROC
    sub esp, 8
    mov eax, dword ptr [ecx]
    fld dword ptr [ecx + 4]
    mov dword ptr [esp], eax
    fcomp dword ptr [esp]
    fnstsw ax
    test ah, 0x41
    jne L0
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esp], eax
    fld dword ptr [ecx + 8]
    fcomp dword ptr [esp]
    fnstsw ax
    test ah, 0x41
    jne L1
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esp], eax
    fld dword ptr [g_1019bc84]
    fld dword ptr [esp]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L2
    fld dword ptr [g_1019bc84]
    mov eax, 0x3f800000
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx], eax
    add esp, 8
    ret
    fld dword ptr [g_1019bc78]
    fdiv dword ptr [esp]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx]
    fstp dword ptr [edx]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 8]
    fstp dword ptr [edx + 8]
    fld dword ptr [esp]
    add esp, 8
    ret
FUN_1005df00 ENDP
END