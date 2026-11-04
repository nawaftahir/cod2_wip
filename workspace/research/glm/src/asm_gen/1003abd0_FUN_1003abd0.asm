; FUN_1003abd0 @ 0x1003abd0 — auto-synthesized
.CODE
FUN_1003abd0 PROC
    fld dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 5
    jp L0
    mov eax, dword ptr [esp + 0xc]
    test eax, eax
    jle L1
    fild dword ptr [esp + 0x14]
    fidiv dword ptr [esp + 0xc]
    fadd dword ptr [esp + 4]
    fst dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 0x41
    jne L2
    fld dword ptr [esp + 8]
    ret
    fld dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 0x41
    jne L2
    mov eax, dword ptr [esp + 0x10]
    test eax, eax
    jle L1
    fild dword ptr [esp + 0x14]
    fidiv dword ptr [esp + 0x10]
    fsubr dword ptr [esp + 4]
    fst dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 5
    jnp L1
    fld dword ptr [esp + 4]
    ret
FUN_1003abd0 ENDP
END