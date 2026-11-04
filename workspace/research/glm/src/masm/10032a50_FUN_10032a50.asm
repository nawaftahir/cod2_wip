.686
.MODEL FLAT, C
EXTRN sub_1000BD11:PROC
EXTRN sub_10032A03:PROC
EXTRN sub_1003E322:PROC
EXTRN fp_101D4AEC:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_10032a50 PROC
    sub esp, 56
    push ebx
    mov ebx, eax
    mov eax, dword ptr [esp + 68]
    mov ecx, dword ptr [eax + 12]
    push ebp
    mov ebp, dword ptr [esp + 76]
    push edi
    mov edi, dword ptr [g_1072DDC8]
    mov dword ptr [esp + 16], ecx
    call sub_1003E322
    fld dword ptr [esi]
    fmul dword ptr [g_1019BCB0]
    mov edx, dword ptr [esp + 72]
    cmp byte ptr [edx], 0
    fsubr dword ptr [ebx]
    fld dword ptr [esi + 4]
    fmul dword ptr [g_1019BCB0]
    fsubr dword ptr [ebx + 4]
    fld dword ptr [esi + 8]
    fmul dword ptr [g_1019BCB0]
    fsubr dword ptr [ebx + 8]
    fstp dword ptr [esp + 28]
    fld dword ptr [ebp]
    fmul dword ptr [g_1019BCB0]
    fsubr st(2)
    fstp dword ptr [esp + 20]
    fld dword ptr [ebp + 4]
    fmul dword ptr [g_1019BCB0]
    fsubr st(1)
    fstp dword ptr [esp + 24]
    fstp st(0)
    fstp st(0)
    fld dword ptr [ebp + 8]
    fmul dword ptr [g_1019BCB0]
    fsubr dword ptr [esp + 28]
    fstp dword ptr [esp + 28]
    je L1
L0:
    lea eax, [esp + 72]
    push 0
    push eax
    call dword ptr [fp_101D4AEC]
    mov ecx, dword ptr [esp + 84]
    push ecx
    mov edi, eax
    call sub_1000BD11
    mov edi, eax
    movsx edx, byte ptr [edi + 2]
    movsx eax, byte ptr [edi + 3]
    mov dword ptr [esp + 92], edx
    movzx ecx, byte ptr [edi + 5]
    fild dword ptr [esp + 92]
    mov dword ptr [esp + 92], eax
    movzx edx, byte ptr [edi + 6]
    fld st(0)
    fmul dword ptr [esi]
    mov eax, dword ptr [esp + 96]
    add esp, 12
    fadd dword ptr [esp + 20]
    push eax
    fld st(1)
    mov eax, dword ptr [esp + 20]
    fmul dword ptr [esi + 4]
    push edi
    lea ebx, [esp + 40]
    fadd dword ptr [esp + 32]
    fstp dword ptr [esp + 44]
    fxch st(1)
    fmul dword ptr [esi + 8]
    fadd dword ptr [esp + 36]
    fstp dword ptr [esp + 48]
    fild dword ptr [esp + 88]
    fst dword ptr [esp + 88]
    fmul dword ptr [ebp]
    fadd st(1)
    fstp dword ptr [esp + 40]
    fstp st(0)
    fld dword ptr [esp + 88]
    fmul dword ptr [ebp + 4]
    fadd dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 88]
    mov dword ptr [esp + 88], ecx
    fmul dword ptr [ebp + 8]
    lea ecx, [esp + 52]
    push ecx
    fadd dword ptr [esp + 52]
    fstp dword ptr [esp + 52]
    fild dword ptr [esp + 92]
    mov dword ptr [esp + 92], edx
    lea edx, [esp + 68]
    push edx
    fld st(0)
    fmul dword ptr [esi]
    fstp dword ptr [esp + 72]
    fld st(0)
    fmul dword ptr [esi + 4]
    fstp dword ptr [esp + 76]
    fmul dword ptr [esi + 8]
    fstp dword ptr [esp + 80]
    fild dword ptr [esp + 96]
    fld st(0)
    fmul dword ptr [ebp]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [ebp + 4]
    fstp dword ptr [esp + 64]
    fmul dword ptr [ebp + 8]
    fstp dword ptr [esp + 68]
    call sub_10032A03
    movzx eax, byte ptr [edi + 4]
    mov dword ptr [esp + 96], eax
    add esp, 16
    fild dword ptr [esp + 80]
    fld st(0)
    fmul dword ptr [esi]
    fadd dword ptr [esp + 20]
    fstp dword ptr [esp + 20]
    fld st(0)
    fmul dword ptr [esi + 4]
    mov ecx, dword ptr [esp + 72]
    cmp byte ptr [ecx], 0
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 24]
    fmul dword ptr [esi + 8]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 28]
    jne L0
L1:
    pop edi
    pop ebp
    pop ebx
    add esp, 56
    ret
FUN_10032a50 ENDP
END
