; FUN_1003bce0 @ 0x1003bce0 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_101d1b9c:DWORD
    sub_1003ac65 PROTO C
    sub_1003bc8c PROTO C
.CODE
FUN_1003bce0 PROC
    mov ecx, dword ptr [g_101d1b9c]
    mov eax, dword ptr [ecx + 0x168]
    sub esp, 8
    test eax, eax
    je L0
    fld dword ptr [edx + 0x1c]
    fcomp dword ptr [ecx + 0x174]
    fnstsw ax
    test ah, 0x41
    jnp L0
    fld dword ptr [edx + 0x1c]
    fcomp dword ptr [ecx + 0x17c]
    fnstsw ax
    test ah, 1
    jne L1
    fld dword ptr [g_1019bc78]
    jmp L2
    fld dword ptr [edx + 0x1c]
    fsub dword ptr [ecx + 0x174]
    fld dword ptr [ecx + 0x17c]
    fsub dword ptr [ecx + 0x174]
    fdivp st(1)
    mov eax, dword ptr [esp + 0xc]
    fld st(0)
    fmul dword ptr [ecx + 0x180]
    push eax
    mov eax, dword ptr [ecx + 0x188]
    push eax
    mov eax, dword ptr [edx + 0x18]
    fstp dword ptr [esp + 0xc]
    fmul dword ptr [ecx + 0x178]
    fadd dword ptr [ecx + 0x170]
    mov ecx, dword ptr [ecx + 0x184]
    push ecx
    mov ecx, dword ptr [edx]
    push eax
    fstp dword ptr [esp + 0x10]
    push ecx
    call sub_1003ac65
    fst dword ptr [edx]
    mov edx, dword ptr [esp + 0x14]
    fmul dword ptr [esp + 0x18]
    add esp, 0x14
    push edx
    push ecx
    fstp dword ptr [esp]
    call sub_1003bc8c
    add esp, 8
    add esp, 8
    ret
FUN_1003bce0 ENDP
END