; FUN_1005c2c0 @ 0x1005c2c0 — auto-synthesized
    sub_1010a9d4 PROTO C
.CODE
FUN_1005c2c0 PROC
    sub esp, 0x18
    mov eax, dword ptr [edx]
    mov dword ptr [esp + 8], eax
    fld dword ptr [esp + 8]
    mov eax, dword ptr [ecx]
    fabs
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    mov dword ptr [esp + 0xc], eax
    fstp dword ptr [esp]
    fld dword ptr [esp + 0xc]
    fabs
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 0x41
    mov eax, dword ptr [esp]
    je L0
    mov eax, dword ptr [esp + 4]
    mov edx, dword ptr [edx + 4]
    mov dword ptr [esp + 8], edx
    fld dword ptr [esp + 8]
    mov dword ptr [esp + 0x10], eax
    mov eax, dword ptr [ecx + 4]
    fabs
    fstp dword ptr [esp + 8]
    mov dword ptr [esp + 0xc], eax
    fld dword ptr [esp + 8]
    fstp dword ptr [esp]
    fld dword ptr [esp + 0xc]
    fabs
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp]
    fcomp dword ptr [esp + 4]
    fnstsw ax
    test ah, 0x41
    mov eax, dword ptr [esp]
    je L1
    mov eax, dword ptr [esp + 4]
    mov dword ptr [esp + 0x14], eax
    fld dword ptr [esp + 0x14]
    fmul dword ptr [esp + 0x14]
    fld dword ptr [esp + 0x10]
    fmul dword ptr [esp + 0x10]
    faddp st(1)
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    call sub_1010a9d4
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    add esp, 0x18
    ret
FUN_1005c2c0 ENDP
END