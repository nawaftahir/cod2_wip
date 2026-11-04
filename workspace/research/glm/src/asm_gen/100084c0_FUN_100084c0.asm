; FUN_100084c0 @ 0x100084c0 — auto-synthesized
    EXTRN fp_101d4b90:DWORD
    EXTRN fp_101d4be4:DWORD
    EXTRN g_101d7e10:DWORD
    EXTRN g_10678510:DWORD
.CODE
FUN_100084c0 PROC
    mov edx, dword ptr [g_10678510]
    sub esp, 0x18
    push esi
    mov esi, eax
    imul eax, eax, 0x34
    imul esi, esi, 0x74
    mov ecx, dword ptr [esi + edx]
    add esi, edx
    add eax, 0x10678ac4
    test ecx, ecx
    mov eax, dword ptr [eax + 4]
    je L0
    push ebp
    mov ebp, dword ptr [g_101d7e10]
    push eax
    push ebp
    call dword ptr [fp_101d4be4]
    add esp, 8
    mov eax, ebp
    pop ebp
    lea ecx, [esp + 0x10]
    push ecx
    lea edx, [esp + 8]
    push edx
    push eax
    call dword ptr [fp_101d4b90]
    fld dword ptr [esi + 0x38]
    fld dword ptr [esp + 0x10]
    add esp, 0xc
    fmul st(1)
    fadd dword ptr [esi + 0x3c]
    fstp dword ptr [ebx]
    fld dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [esi + 0x40]
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 0xc]
    fmul st(1)
    fadd dword ptr [esi + 0x44]
    fstp dword ptr [ebx + 8]
    fstp st(0)
    fld dword ptr [esi + 0x38]
    fld dword ptr [esp + 0x10]
    fmul st(1)
    fadd dword ptr [esi + 0x3c]
    fstp dword ptr [edi]
    fld dword ptr [esp + 0x14]
    fmul st(1)
    fadd dword ptr [esi + 0x40]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 0x18]
    fmul st(1)
    fadd dword ptr [esi + 0x44]
    pop esi
    fstp dword ptr [edi + 8]
    fstp st(0)
    add esp, 0x18
    ret
FUN_100084c0 ENDP
END