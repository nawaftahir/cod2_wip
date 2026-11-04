; FUN_1003b4b0 @ 0x1003b4b0 — auto-synthesized
    EXTRN fp_101d4b30:DWORD
    EXTRN g_1019bc84:DWORD
    EXTRN g_1019bdbc:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_1072ddc8:DWORD
    sub_1003b31c PROTO C
.CODE
FUN_1003b4b0 PROC
    sub esp, 0xc
    push 0x10
    push 0x10
    call sub_1003b31c
    fst dword ptr [esi + 0x18]
    fld dword ptr [g_1019bc84]
    add esp, 8
    fxch st(1)
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L0
    mov ecx, dword ptr [g_101d1b9c]
    fld dword ptr [ecx + 0x1b4]
    mov eax, dword ptr [g_1072ddc8]
    fmul dword ptr [g_1019bdbc]
    mov edx, dword ptr [esi + 0x20]
    push 0x2003
    push 0
    fadd dword ptr [eax]
    push 0x10191348
    push 0x10191348
    fstp dword ptr [esp + 0x10]
    fld dword ptr [ecx + 0x1b8]
    fmul dword ptr [g_1019bdbc]
    fadd dword ptr [eax + 4]
    fstp dword ptr [esp + 0x14]
    fld dword ptr [ecx + 0x1bc]
    lea ecx, [esp + 0x10]
    fmul dword ptr [g_1019bdbc]
    push ecx
    push eax
    push edx
    fadd dword ptr [eax + 8]
    fstp dword ptr [esp + 0x24]
    call dword ptr [fp_101d4b30]
    add esp, 0x1c
    test eax, eax
    mov dword ptr [esi + 0x20], eax
    je L0
    mov dword ptr [esi + 0x18], 0
    add esp, 0xc
    ret
FUN_1003b4b0 ENDP
END