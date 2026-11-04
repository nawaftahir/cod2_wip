.686
.MODEL FLAT, C
EXTRN sub_10059111:PROC
.CODE
FUN_100597d0 PROC
    push ecx
    fld dword ptr [edi]
    push esi
    fchs
    mov esi, eax
    fstp dword ptr [esi + 4]
    mov eax, dword ptr [edi + 4]
    mov dword ptr [esi + 8], eax
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [esi], ecx
    fld dword ptr [edi]
    fmul dword ptr [esi]
    fld dword ptr [edi + 8]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [esi + 4]
    fmul dword ptr [edi + 4]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fchs
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [edi]
    fadd dword ptr [esi]
    fstp dword ptr [esi]
    fld dword ptr [esp + 4]
    fmul dword ptr [edi + 4]
    fadd dword ptr [esi + 4]
    fstp dword ptr [esi + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [edi + 8]
    fadd dword ptr [esi + 8]
    fstp dword ptr [esi + 8]
    call sub_10059111
    fstp st(0)
    fld dword ptr [esi + 4]
    fmul dword ptr [edi + 8]
    fld dword ptr [esi + 8]
    fmul dword ptr [edi + 4]
    fsubp st(1)
    fstp dword ptr [ebx]
    fld dword ptr [esi + 8]
    fmul dword ptr [edi]
    fld dword ptr [edi + 8]
    fmul dword ptr [esi]
    fsubp st(1)
    fstp dword ptr [ebx + 4]
    fld dword ptr [edi + 4]
    fmul dword ptr [esi]
    fld dword ptr [esi + 4]
    pop esi
    fmul dword ptr [edi]
    fsubp st(1)
    fstp dword ptr [ebx + 8]
    pop ecx
    ret
FUN_100597d0 ENDP
END
