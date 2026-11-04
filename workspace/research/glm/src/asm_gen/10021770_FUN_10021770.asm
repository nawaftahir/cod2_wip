; FUN_10021770 @ 0x10021770 — auto-synthesized
    EXTRN g_101ce638:DWORD
    EXTRN g_1042e778:DWORD
.CODE
FUN_10021770 PROC
    mov edx, dword ptr [g_1042e778]
    push esi
    mov esi, dword ptr [edx + 0x30000]
    mov eax, 0x30000
    sub eax, esi
    cmp eax, 0x4c
    jge L0
    xor eax, eax
    mov dword ptr [edx + 0x30008], eax
    jmp L1
    lea eax, [esi + edx]
    add esi, 0x4c
    mov dword ptr [edx + 0x30000], esi
    add dword ptr [edx + 0x30004], 0x4c
    mov dword ptr [edx + 0x30008], eax
    mov word ptr [eax], 5
    mov word ptr [eax + 2], 0x4c
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 0xc], edx
    mov edx, dword ptr [ecx + 0xc]
    mov dword ptr [eax + 0x10], edx
    mov edx, dword ptr [ecx + 0x10]
    mov dword ptr [eax + 0x14], edx
    fld dword ptr [ecx + 0x1c]
    mov edx, dword ptr [ecx + 0x14]
    fld dword ptr [ecx + 0x18]
    fstp dword ptr [eax + 0x2c]
    mov dword ptr [eax + 0x28], edx
    mov edx, 0x3f800000
    fstp dword ptr [eax + 0x30]
    mov dword ptr [eax + 0x34], edx
    fld dword ptr [ecx + 0x28]
    mov esi, dword ptr [ecx + 0x20]
    fld dword ptr [ecx + 0x24]
    mov dword ptr [eax + 0x24], edx
    mov edx, dword ptr [g_101ce638]
    fstp dword ptr [eax + 0x1c]
    mov dword ptr [eax + 0x18], esi
    fstp dword ptr [eax + 0x20]
    pop esi
    fld dword ptr [edx + 8]
    fld st(0)
    fmul dword ptr [eax + 0x28]
    fstp dword ptr [eax + 0x38]
    fld st(0)
    fmul dword ptr [eax + 0x2c]
    fstp dword ptr [eax + 0x3c]
    fld st(0)
    fmul dword ptr [eax + 0x30]
    fstp dword ptr [eax + 0x40]
    fmul dword ptr [eax + 0x34]
    fstp dword ptr [eax + 0x44]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax + 0x48], ecx
    ret
FUN_10021770 ENDP
END