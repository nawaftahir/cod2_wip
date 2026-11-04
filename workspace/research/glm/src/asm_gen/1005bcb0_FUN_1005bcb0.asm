; FUN_1005bcb0 @ 0x1005bcb0 — auto-synthesized
.CODE
FUN_1005bcb0 PROC
    push ecx
    fld dword ptr [ecx + 0xc]
    push esi
    fchs
    fstp dword ptr [eax]
    fld dword ptr [ecx + 0x10]
    fchs
    fstp dword ptr [eax + 0x10]
    fld dword ptr [ecx + 0x14]
    fchs
    fstp dword ptr [esp + 4]
    mov esi, dword ptr [esp + 4]
    fld dword ptr [eax]
    mov dword ptr [eax + 0x20], esi
    fmul dword ptr [edx]
    fld dword ptr [esp + 4]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 0x10]
    faddp st(1)
    fchs
    fstp dword ptr [eax + 0x30]
    mov esi, dword ptr [ecx + 0x18]
    mov dword ptr [eax + 4], esi
    mov esi, dword ptr [ecx + 0x1c]
    mov dword ptr [eax + 0x14], esi
    fld dword ptr [eax + 0x14]
    mov esi, dword ptr [ecx + 0x20]
    mov dword ptr [eax + 0x24], esi
    fmul dword ptr [edx + 4]
    mov dword ptr [esp + 4], esi
    fld dword ptr [esp + 4]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [eax + 4]
    fmul dword ptr [edx]
    faddp st(1)
    fchs
    fstp dword ptr [eax + 0x34]
    mov esi, dword ptr [ecx]
    mov dword ptr [eax + 8], esi
    mov esi, dword ptr [ecx + 4]
    mov dword ptr [eax + 0x18], esi
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [esp + 4], ecx
    fld dword ptr [esp + 4]
    mov dword ptr [eax + 0x28], ecx
    fmul dword ptr [edx + 8]
    xor ecx, ecx
    fld dword ptr [edx]
    pop esi
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [edx + 4]
    mov dword ptr [eax + 0xc], ecx
    fmul dword ptr [eax + 0x18]
    mov dword ptr [eax + 0x1c], ecx
    mov dword ptr [eax + 0x2c], ecx
    mov dword ptr [eax + 0x3c], 0x3f800000
    faddp st(1)
    fchs
    fstp dword ptr [eax + 0x38]
    pop ecx
    ret
FUN_1005bcb0 ENDP
END