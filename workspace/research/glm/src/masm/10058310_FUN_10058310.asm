.686
.MODEL FLAT, C
EXTRN sub_1001D66D:PROC
.CODE
FUN_10058310 PROC
    sub esp, 36
    lea ecx, [esp]
    mov eax, edi
    call sub_1001D66D
    fld dword ptr [esp]
    fmul dword ptr [esi]
    fld dword ptr [esp + 24]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fadd dword ptr [edi + 16]
    fstp dword ptr [ebx]
    fld dword ptr [esp + 4]
    fmul dword ptr [esi]
    fld dword ptr [esp + 28]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fadd dword ptr [edi + 20]
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 8]
    fmul dword ptr [esi]
    fld dword ptr [esp + 32]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fadd dword ptr [edi + 24]
    fstp dword ptr [ebx + 8]
    add esp, 36
    ret
FUN_10058310 ENDP
END
