; FUN_10020590 @ 0x10020590 — auto-synthesized
    EXTRN fp_101d4b2c:DWORD
    EXTRN g_1019bc78:DWORD
    EXTRN g_101da988:DWORD
    EXTRN g_101da994:DWORD
.CODE
FUN_10020590 PROC
    sub esp, 0x44
    mov eax, dword ptr [esp + 0x48]
    fld dword ptr [g_101da994]
    mov ecx, dword ptr [esp + 0x4c]
    fadd dword ptr [g_1019bc78]
    mov dword ptr [esp + 0x18], ecx
    mov edx, eax
    mov dword ptr [esp + 0x14], eax
    fst dword ptr [esp]
    fld dword ptr [g_101da988]
    mov eax, ecx
    fsub dword ptr [g_1019bc78]
    xor ecx, ecx
    mov dword ptr [esp + 0x20], ecx
    mov dword ptr [esp + 0x24], ecx
    mov dword ptr [esp + 0x28], ecx
    fst dword ptr [esp + 4]
    mov dword ptr [esp + 0x2c], ecx
    fxch st(1)
    mov dword ptr [esp + 0x30], ecx
    fstp dword ptr [esp + 0x1c]
    mov dword ptr [esp + 0x34], ecx
    push 0x2001
    fstp dword ptr [esp + 0x14]
    mov dword ptr [esp + 0x3c], ecx
    mov dword ptr [esp + 0x40], ecx
    push ecx
    push 0x10191348
    mov dword ptr [esp + 0x14], edx
    push 0x10191348
    lea edx, [esp + 0x18]
    mov dword ptr [esp + 0x1c], eax
    push edx
    lea eax, [esp + 0x28]
    mov dword ptr [esp + 0x54], ecx
    push eax
    lea ecx, [esp + 0x38]
    push ecx
    mov dword ptr [esp + 0x3c], 0x3f800000
    call dword ptr [fp_101d4b2c]
    fld dword ptr [esp + 0x20]
    fsub dword ptr [esp + 0x1c]
    fmul dword ptr [esp + 0x3c]
    fadd dword ptr [esp + 0x1c]
    add esp, 0x60
    ret
FUN_10020590 ENDP
END