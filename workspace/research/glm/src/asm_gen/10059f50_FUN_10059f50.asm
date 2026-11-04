; FUN_10059f50 @ 0x10059f50 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    sub_10059150 PROTO C
.CODE
FUN_10059f50 PROC
    sub esp, 0x10
    mov edx, dword ptr [ecx + 4]
    push esi
    mov esi, eax
    mov eax, dword ptr [ecx]
    mov dword ptr [esp + 4], eax
    fld dword ptr [esp + 4]
    mov eax, dword ptr [ecx + 8]
    fmul dword ptr [esp + 4]
    mov dword ptr [esp + 4], edx
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    mov dword ptr [esp + 4], eax
    fstp dword ptr [esp + 0xc]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fstp dword ptr [esp + 0x10]
    fld dword ptr [esp + 0xc]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 5
    jp L0
    mov edx, 1
    jmp L1
    xor edx, edx
    fld dword ptr [esp + 0x10]
    fcomp dword ptr [esp + edx*4 + 8]
    fnstsw ax
    test ah, 5
    jp L2
    mov edx, 2
    fld dword ptr [ecx + edx*4]
    fchs
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx]
    fstp dword ptr [esi]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [esi + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [ecx + 8]
    fstp dword ptr [esi + 8]
    fld dword ptr [esi + edx*4]
    fadd dword ptr [g_1019bc78]
    fstp dword ptr [esi + edx*4]
    call sub_10059150
    fstp st(0)
    pop esi
    add esp, 0x10
    ret
FUN_10059f50 ENDP
END