.686
.MODEL FLAT, C
EXTRN sub_1001D66D:PROC
.CODE
FUN_10058310 PROC
    sub sub esp, 36
    lea lea ecx, [esp]
    mov mov eax, edi
    call sub_1001D66D
    fld fld dword ptr [esp]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [edi + 16]
    fstp fstp dword ptr [ebx]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [edi + 20]
    fstp fstp dword ptr [ebx + 4]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [edi + 24]
    fstp fstp dword ptr [ebx + 8]
    add add esp, 36
    ret ret
FUN_10058310 ENDP
END
