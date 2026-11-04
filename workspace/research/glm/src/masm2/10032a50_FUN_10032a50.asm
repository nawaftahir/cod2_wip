.686
.MODEL FLAT, C
EXTRN sub_1000BD11:PROC
EXTRN sub_10032A03:PROC
EXTRN sub_10032C8B:PROC
EXTRN sub_1003E322:PROC
EXTRN EXTRN fp_101D4AEC:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_10032a50 PROC
    sub sub esp, 56
    push push ebx
    mov mov ebx, eax
    mov mov eax, dword ptr [esp + 68]
    mov mov ecx, dword ptr [eax + 12]
    push push ebp
    mov mov ebp, dword ptr [esp + 76]
    push push edi
    mov mov edi, dword ptr [g_1072DDC8]
    mov mov dword ptr [esp + 16], ecx
    call sub_1003E322
    fld fld dword ptr [esi]
    fmul fmul dword ptr [g_1019BCB0]
    mov mov edx, dword ptr [esp + 72]
    cmp cmp byte ptr [edx], 0
    fsubr fsubr dword ptr [ebx]
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr dword ptr [ebx + 4]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr dword ptr [ebx + 8]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr st(2)
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [ebp + 4]
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr st(1)
    fstp fstp dword ptr [esp + 24]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [ebp + 8]
    fmul fmul dword ptr [g_1019BCB0]
    fsubr fsubr dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 28]
    je sub_10032C8B
    lea lea eax, [esp + 72]
    push push 0
    push push eax
    call dword ptr [fp_101D4AEC]
    mov mov ecx, dword ptr [esp + 84]
    push push ecx
    mov mov edi, eax
    call sub_1000BD11
    mov mov edi, eax
    movsx movsx edx, byte ptr [edi + 2]
    movsx movsx eax, byte ptr [edi + 3]
    mov mov dword ptr [esp + 92], edx
    movzx movzx ecx, byte ptr [edi + 5]
    fild fild dword ptr [esp + 92]
    mov mov dword ptr [esp + 92], eax
    movzx movzx edx, byte ptr [edi + 6]
    fld fld st(0)
    fmul fmul dword ptr [esi]
    mov mov eax, dword ptr [esp + 96]
    add add esp, 12
    fadd fadd dword ptr [esp + 20]
    push push eax
    fld fld st(1)
    mov mov eax, dword ptr [esp + 20]
    fmul fmul dword ptr [esi + 4]
    push push edi
    lea lea ebx, [esp + 40]
    fadd fadd dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 44]
    fxch fxch st(1)
    fmul fmul dword ptr [esi + 8]
    fadd fadd dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 48]
    fild fild dword ptr [esp + 88]
    fst fst dword ptr [esp + 88]
    fmul fmul dword ptr [ebp]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 40]
    fstp fstp st(0)
    fld fld dword ptr [esp + 88]
    fmul fmul dword ptr [ebp + 4]
    fadd fadd dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 88]
    mov mov dword ptr [esp + 88], ecx
    fmul fmul dword ptr [ebp + 8]
    lea lea ecx, [esp + 52]
    push push ecx
    fadd fadd dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 52]
    fild fild dword ptr [esp + 92]
    mov mov dword ptr [esp + 92], edx
    lea lea edx, [esp + 68]
    push push edx
    fld fld st(0)
    fmul fmul dword ptr [esi]
    fstp fstp dword ptr [esp + 72]
    fld fld st(0)
    fmul fmul dword ptr [esi + 4]
    fstp fstp dword ptr [esp + 76]
    fmul fmul dword ptr [esi + 8]
    fstp fstp dword ptr [esp + 80]
    fild fild dword ptr [esp + 96]
    fld fld st(0)
    fmul fmul dword ptr [ebp]
    fstp fstp dword ptr [esp + 60]
    fld fld st(0)
    fmul fmul dword ptr [ebp + 4]
    fstp fstp dword ptr [esp + 64]
    fmul fmul dword ptr [ebp + 8]
    fstp fstp dword ptr [esp + 68]
    call sub_10032A03
    movzx movzx eax, byte ptr [edi + 4]
    mov mov dword ptr [esp + 96], eax
    add add esp, 16
    fild fild dword ptr [esp + 80]
    fld fld st(0)
    fmul fmul dword ptr [esi]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 20]
    fld fld st(0)
    fmul fmul dword ptr [esi + 4]
    mov mov ecx, dword ptr [esp + 72]
    cmp cmp byte ptr [ecx], 0
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 24]
    fmul fmul dword ptr [esi + 8]
    fadd fadd dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 28]
    jne sub_10032C8B
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 56
    ret ret
FUN_10032a50 ENDP
END
