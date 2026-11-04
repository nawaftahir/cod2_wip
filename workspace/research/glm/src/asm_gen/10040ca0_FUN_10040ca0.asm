; FUN_10040ca0 @ 0x10040ca0 — auto-synthesized
    EXTRN g_1072ddc8:DWORD
.CODE
FUN_10040ca0 PROC
    sub esp, 0x44
    mov ecx, dword ptr [g_1072ddc8]
    push esi
    mov esi, dword ptr [ecx + 0x50]
    mov dword ptr [esp + 0x20], esi
    mov esi, dword ptr [ecx + 0x4c]
    mov dword ptr [esp + 0x14], esi
    mov esi, dword ptr [ecx + 0x48]
    mov dword ptr [esp + 0x24], esi
    mov esi, dword ptr [ecx + 0x60]
    mov dword ptr [esp + 0x1c], esi
    mov esi, dword ptr [ecx + 0x5c]
    mov dword ptr [esp + 0x10], esi
    mov esi, dword ptr [ecx + 0x58]
    mov dword ptr [esp + 8], esi
    mov esi, dword ptr [ecx + 0x70]
    mov dword ptr [esp + 0x18], esi
    mov esi, dword ptr [ecx + 0x6c]
    mov ecx, dword ptr [ecx + 0x68]
    mov dword ptr [esp + 4], ecx
    fld dword ptr [esp + 4]
    mov dword ptr [esp + 0xc], esi
    fmul dword ptr [eax + 8]
    pop esi
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 0x20]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 0xc]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 0x10]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 0x14]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 0x18]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 0x1c]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx + 8]
    add esp, 0x44
    ret
FUN_10040ca0 ENDP
END