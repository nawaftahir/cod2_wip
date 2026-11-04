; FUN_1003bf00 @ 0x1003bf00 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_1072ddc8:DWORD
    sub_1003b7a1 PROTO C
    sub_1003b9e6 PROTO C
.CODE
FUN_1003bf00 PROC
    mov ecx, dword ptr [g_101d1b9c]
    mov eax, dword ptr [g_1072ddc8]
    fld dword ptr [ecx + 0x1bc]
    fmul dword ptr [eax + 0x14]
    fld dword ptr [ecx + 0x1b8]
    fmul dword ptr [eax + 0x10]
    faddp st(1)
    fld dword ptr [ecx + 0x1b4]
    fmul dword ptr [eax + 0xc]
    mov eax, dword ptr [esp + 4]
    faddp st(1)
    fld st(0)
    fstp dword ptr [eax + 0x1c]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jnp L0
    mov ecx, dword ptr [g_101ce708]
    cmp dword ptr [ecx + 8], 2
    jne L1
    jmp sub_1003b7a1
    jmp sub_1003b9e6
    ret
FUN_1003bf00 ENDP
END