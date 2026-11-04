.686
.MODEL FLAT, C
EXTRN sub_10059111:PROC
.CODE
FUN_100597d0 PROC
    push push ecx
    fld fld dword ptr [edi]
    push push esi
    fchs fchs
    mov mov esi, eax
    fstp fstp dword ptr [esi + 4]
    mov mov eax, dword ptr [edi + 4]
    mov mov dword ptr [esi + 8], eax
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [esi], ecx
    fld fld dword ptr [edi]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edi + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fchs fchs
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [edi]
    fadd fadd dword ptr [esi]
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [edi + 4]
    fadd fadd dword ptr [esi + 4]
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [edi + 8]
    fadd fadd dword ptr [esi + 8]
    fstp fstp dword ptr [esi + 8]
    call sub_10059111
    fstp fstp st(0)
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edi + 8]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edi + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edi]
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [esi]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx + 4]
    fld fld dword ptr [edi + 4]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [esi + 4]
    pop pop esi
    fmul fmul dword ptr [edi]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx + 8]
    pop pop ecx
    ret ret
FUN_100597d0 ENDP
END
