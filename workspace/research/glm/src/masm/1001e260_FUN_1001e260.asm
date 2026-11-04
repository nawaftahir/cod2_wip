.686
.MODEL FLAT, C
.CODE
FUN_1001e260 PROC
    fld dword ptr [edi + 4]
    mov edx, dword ptr [esp + 8]
    fmul dword ptr [eax + 16]
    push ebx
    fld dword ptr [eax + 32]
    mov ebx, dword ptr [esp + 8]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fld dword ptr [edi]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [ecx + 16]
    fld dword ptr [eax + 36]
    fmul dword ptr [edi + 8]
    fld dword ptr [edi]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [edi + 4]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [ecx + 20]
    fld dword ptr [eax + 40]
    fmul dword ptr [edi + 8]
    fld dword ptr [edi]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [edi + 4]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fstp dword ptr [ecx + 24]
    fld dword ptr [esi + 4]
    fmul dword ptr [eax + 16]
    fld dword ptr [esi + 8]
    fmul dword ptr [eax + 32]
    faddp st(1)
    fld dword ptr [esi]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [ecx + 40]
    fld dword ptr [esi]
    fmul dword ptr [eax + 4]
    fld dword ptr [esi + 8]
    fmul dword ptr [eax + 36]
    faddp st(1)
    fld dword ptr [esi + 4]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [ecx + 44]
    fld dword ptr [esi]
    fmul dword ptr [eax + 8]
    fld dword ptr [esi + 8]
    fmul dword ptr [eax + 40]
    faddp st(1)
    fld dword ptr [esi + 4]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fstp dword ptr [ecx + 48]
    fld dword ptr [edx]
    fmul dword ptr [eax]
    fld dword ptr [eax + 32]
    fmul dword ptr [edx + 8]
    faddp st(1)
    fld dword ptr [edx + 4]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fstp dword ptr [ecx + 52]
    fld dword ptr [eax + 36]
    fmul dword ptr [edx + 8]
    fld dword ptr [eax + 20]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fld dword ptr [edx]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [ecx + 56]
    fld dword ptr [eax + 40]
    fmul dword ptr [edx + 8]
    fld dword ptr [eax + 24]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fld dword ptr [edx]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fstp dword ptr [ecx + 60]
    fld dword ptr [ebx + 8]
    fmul dword ptr [eax + 32]
    fld dword ptr [ebx + 4]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [ebx]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fstp dword ptr [ecx]
    fld dword ptr [ebx]
    fmul dword ptr [eax + 4]
    fld dword ptr [eax + 36]
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fld dword ptr [eax + 20]
    fmul dword ptr [ebx + 4]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fstp dword ptr [ecx + 4]
    fld dword ptr [ebx]
    fmul dword ptr [eax + 8]
    fld dword ptr [eax + 40]
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fld dword ptr [eax + 24]
    fmul dword ptr [ebx + 4]
    pop ebx
    faddp st(1)
    fadd dword ptr [eax + 56]
    mov dword ptr [ecx + 12], 03F800000h
    fstp dword ptr [ecx + 8]
    ret
FUN_1001e260 ENDP
END
