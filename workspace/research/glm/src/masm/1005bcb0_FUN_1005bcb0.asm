.686
.MODEL FLAT, C
.CODE
FUN_1005bcb0 PROC
    push ecx
    fld dword ptr [ecx + 12]
    push esi
    fchs
    fstp dword ptr [eax]
    fld dword ptr [ecx + 16]
    fchs
    fstp dword ptr [eax + 16]
    fld dword ptr [ecx + 20]
    fchs
    fstp dword ptr [esp + 4]
    mov esi, dword ptr [esp + 4]
    fld dword ptr [eax]
    mov dword ptr [eax + 32], esi
    fmul dword ptr [edx]
    fld dword ptr [esp + 4]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fchs
    fstp dword ptr [eax + 48]
    mov esi, dword ptr [ecx + 24]
    mov dword ptr [eax + 4], esi
    mov esi, dword ptr [ecx + 28]
    mov dword ptr [eax + 20], esi
    fld dword ptr [eax + 20]
    mov esi, dword ptr [ecx + 32]
    mov dword ptr [eax + 36], esi
    fmul dword ptr [edx + 4]
    mov dword ptr [esp + 4], esi
    fld dword ptr [esp + 4]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [eax + 4]
    fmul dword ptr [edx]
    faddp st(1)
    fchs
    fstp dword ptr [eax + 52]
    mov esi, dword ptr [ecx]
    mov dword ptr [eax + 8], esi
    mov esi, dword ptr [ecx + 4]
    mov dword ptr [eax + 24], esi
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [esp + 4], ecx
    fld dword ptr [esp + 4]
    mov dword ptr [eax + 40], ecx
    fmul dword ptr [edx + 8]
    xor ecx, ecx
    fld dword ptr [edx]
    pop esi
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [edx + 4]
    mov dword ptr [eax + 12], ecx
    fmul dword ptr [eax + 24]
    mov dword ptr [eax + 28], ecx
    mov dword ptr [eax + 44], ecx
    mov dword ptr [eax + 60], 03F800000h
    faddp st(1)
    fchs
    fstp dword ptr [eax + 56]
    pop ecx
    ret
FUN_1005bcb0 ENDP
END
