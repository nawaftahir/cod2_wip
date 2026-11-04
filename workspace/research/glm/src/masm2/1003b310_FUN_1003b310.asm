.686
.MODEL FLAT, C
EXTRN sub_1003B4C9:PROC
EXTRN sub_1003B4D1:PROC
EXTRN sub_1003B5B0:PROC
EXTRN sub_1003B5BC:PROC
EXTRN sub_1003B5C8:PROC
EXTRN sub_1003B5D4:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003b310 PROC
    mov mov ecx, dword ptr [g_1072DDC8]
    mov mov edx, dword ptr [g_101D1B9C]
    fld fld dword ptr [ecx + 0F4h]
    fmul fmul dword ptr [edx + 01BCh]
    sub sub esp, 44
    fld fld dword ptr [ecx + 0E4h]
    push push ebx
    fmul fmul dword ptr [edx + 01B8h]
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 64]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 0D4h]
    fmul fmul dword ptr [edx + 01B4h]
    faddp faddp st(1)
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp L0
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC84]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 44
    ret ret
    fld fld dword ptr [ecx + 0E8h]
    mov mov ebx, dword ptr [g_101D4C6C]
    fmul fmul dword ptr [edx + 01BCh]
    mov mov ebp, dword ptr [g_101D4C70]
    fld fld dword ptr [ecx + 0D8h]
    mov mov dword ptr [esp + 20], ebx
    fmul fmul dword ptr [edx + 01B8h]
    mov mov dword ptr [esp + 28], ebp
    faddp faddp st(1)
    fld fld dword ptr [edx + 01B4h]
    fmul fmul dword ptr [ecx + 0C8h]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 0ECh]
    fmul fmul dword ptr [edx + 01BCh]
    fld fld dword ptr [ecx + 0DCh]
    fmul fmul dword ptr [edx + 01B8h]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 0CCh]
    fmul fmul dword ptr [edx + 01B4h]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv st(2)
    fst fst dword ptr [esp + 16]
    fmul fmul st(1)
    fadd fadd dword ptr [g_1019BC78]
    fimul fimul dword ptr [esp + 20]
    fisub fisub dword ptr [esp + 64]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 20]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 32]
    fld fld dword ptr [esp + 20]
    fadd fadd qword ptr [esp + 32]
    fistp fistp dword ptr [esp + 24]
    fld fld dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 44]
    fadd fadd dword ptr [g_1019BC78]
    fimul fimul dword ptr [esp + 28]
    fisub fisub dword ptr [esp + 68]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 28]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 32]
    fld fld dword ptr [esp + 28]
    fadd fadd qword ptr [esp + 32]
    fistp fistp dword ptr [esp + 24]
    mov mov esi, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 68]
    add add eax, esi
    test test ecx, ecx
    lea lea edx, [ecx + edi]
    jge sub_1003B5B0
    xor xor ecx, ecx
    cmp cmp edx, ebx
    jle sub_1003B5BC
    mov mov edx, ebx
    test test esi, esi
    jge sub_1003B5C8
    xor xor esi, esi
    cmp cmp eax, ebp
    jle sub_1003B5D4
    mov mov eax, ebp
    cmp cmp edx, ecx
    jle sub_1003B4C9
    cmp cmp eax, esi
    jle sub_1003B4D1
    sub sub eax, esi
    sub sub edx, ecx
    imul imul eax, edx
    imul imul edi, dword ptr [esp + 68]
    mov mov dword ptr [esp + 28], eax
    fild fild dword ptr [esp + 28]
    mov mov dword ptr [esp + 28], edi
    pop pop edi
    pop pop esi
    fidiv fidiv dword ptr [esp + 20]
    pop pop ebp
    pop pop ebx
    add add esp, 44
    ret ret
FUN_1003b310 ENDP
END
