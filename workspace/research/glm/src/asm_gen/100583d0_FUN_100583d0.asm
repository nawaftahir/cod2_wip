; FUN_100583d0 @ 0x100583d0 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bc7c:DWORD
    EXTRN g_1019be68:DWORD
    sub_100f619f PROTO C
    sub_100f61c6 PROTO C
    sub_1010a9bc PROTO C
    sub_1010ac2e PROTO C
.CODE
FUN_100583d0 PROC
    sub esp, 0x10
    call sub_100f619f
    mov dword ptr [esp + 8], eax
    fild dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fdiv dword ptr [g_1019bc7c]
    fadd st(0), st(0)
    fsub dword ptr [g_1019bc78]
    fstp dword ptr [esp + 4]
    call sub_100f61c6
    mov dword ptr [esp + 8], eax
    fild dword ptr [esp + 8]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fdiv dword ptr [g_1019bc7c]
    fadd st(0), st(0)
    fsub dword ptr [g_1019bc78]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fcomp dword ptr [g_1019bc78]
    fnstsw ax
    test ah, 0x41
    je L0
    fld dword ptr [esp]
    call sub_1010ac2e
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [g_1019be68]
    fdiv dword ptr [esp]
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    call sub_1010a9bc
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0xc]
    mov eax, dword ptr [esp + 0x14]
    mov ecx, dword ptr [esp + 0x18]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fmul dword ptr [esp + 4]
    fstp dword ptr [eax]
    fld dword ptr [esp]
    fmul dword ptr [esp + 8]
    fstp dword ptr [ecx]
    add esp, 0x10
    ret
FUN_100583d0 ENDP
END