.686
.MODEL FLAT, C
EXTRN sub_100058BA:PROC
EXTRN sub_1002C25B:PROC
EXTRN sub_10035F7B:PROC
EXTRN sub_10035F90:PROC
EXTRN sub_10036066:PROC
EXTRN sub_10036067:PROC
EXTRN sub_10036075:PROC
EXTRN sub_10036085:PROC
EXTRN sub_10036088:PROC
EXTRN sub_10036090:PROC
EXTRN sub_10036099:PROC
EXTRN sub_1003609D:PROC
EXTRN sub_100360A1:PROC
EXTRN sub_100360AE:PROC
EXTRN sub_100360B0:PROC
EXTRN sub_100360C8:PROC
EXTRN sub_100360F0:PROC
EXTRN sub_100360FF:PROC
EXTRN sub_10036110:PROC
EXTRN EXTRN g_1019BD68:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BDE0:DWORD:DWORD
EXTRN EXTRN g_101CE7CC:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_10764578:DWORD:DWORD
.CODE
FUN_10035cd0 PROC
    mov mov ecx, dword ptr [g_10764578]
    sub sub esp, 76
    test test ecx, ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    je sub_10035F7B
    mov mov ecx, dword ptr [g_101CE7CC]
    mov mov ecx, dword ptr [ecx + 8]
    test test ecx, ecx
    mov mov dword ptr [esp + 60], ecx
    jle sub_10035F90
    fld fld dword ptr [eax]
    fsub fsub dword ptr [g_1019BDE0]
    fstp fstp dword ptr [esp + 44]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 64]
    fld fld dword ptr [esp + 44]
    fadd fadd qword ptr [esp + 64]
    fistp fistp dword ptr [esp + 40]
    fld fld dword ptr [eax + 4]
    mov mov edx, dword ptr [esp + 40]
    fsub fsub dword ptr [g_1019BDE0]
    sar sar edx, 5
    mov mov dword ptr [esp + 56], edx
    fstp fstp dword ptr [esp + 44]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 64]
    fld fld dword ptr [esp + 44]
    fadd fadd qword ptr [esp + 64]
    fistp fistp dword ptr [esp + 40]
    fld fld dword ptr [eax + 8]
    mov mov ebx, dword ptr [esp + 40]
    fsub fsub dword ptr [g_1019BDE0]
    sar sar ebx, 5
    mov mov dword ptr [esp + 52], ebx
    fstp fstp dword ptr [esp + 44]
    fld fld qword ptr [g_1019BD68]
    fstp fstp qword ptr [esp + 64]
    fld fld dword ptr [esp + 44]
    fsub fsub qword ptr [esp + 64]
    fistp fistp dword ptr [esp + 40]
    mov mov edi, dword ptr [esp + 40]
    lea lea eax, [edx - 01000h]
    shl shl eax, 5
    mov mov dword ptr [esp + 44], eax
    fild fild dword ptr [esp + 44]
    lea lea eax, [ebx - 01000h]
    shl shl eax, 5
    fstp fstp dword ptr [esp + 76]
    sar sar edi, 6
    mov mov dword ptr [esp + 44], eax
    fild fild dword ptr [esp + 44]
    lea lea eax, [edi - 0800h]
    shl shl eax, 6
    fstp fstp dword ptr [esp + 80]
    mov mov dword ptr [esp + 44], eax
    fild fild dword ptr [esp + 44]
    or or ebp, -1
    mov mov dword ptr [esp + 64], edi
    mov mov dword ptr [esp + 28], ebp
    fstp fstp dword ptr [esp + 84]
    lea lea esp, [esp]
    lea lea eax, [edi + ebp]
    test test eax, eax
    mov mov dword ptr [esp + 32], eax
    jl sub_10036067
    shl shl eax, 6
    cmp cmp eax, 080000h
    jg sub_10036075
    mov mov esi, ecx
    neg neg esi
    cmp cmp esi, ecx
    mov mov dword ptr [esp + 36], esi
    jg sub_10036085
    mov mov eax, ecx
    sub sub eax, esi
    lea lea edi, [esi + ebx]
    inc inc eax
    mov mov dword ptr [esp + 24], edi
    mov mov dword ptr [esp + 44], eax
    lea lea ecx, [ecx]
    test test edi, edi
    jl sub_10036088
    mov mov ebp, edi
    shl shl ebp, 5
    cmp cmp ebp, 080000h
    jg sub_10036099
    cmp cmp esi, ecx
    jg sub_100360A1
    lea lea ebp, [esi + edx]
    lea lea eax, [ebp - 01000h]
    shl shl eax, 5
    mov mov dword ptr [esp + 20], eax
    mov mov eax, ecx
    sub sub eax, esi
    inc inc eax
    mov mov dword ptr [esp + 40], eax
    lea lea ebx, [ebx]
    test test ebp, ebp
    jl sub_1003609D
    mov mov ecx, ebp
    shl shl ecx, 5
    cmp cmp ecx, 080000h
    jg sub_100360AE
    mov mov edx, dword ptr [esp + 32]
    push push 0
    push push edx
    push push edi
    mov mov ebx, ebp
    call L0
    add add esp, 12
    test test eax, eax
    jge sub_100360C8
    fild fild dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 32]
    mov mov esi, dword ptr [esp + 100]
    mov mov ecx, dword ptr [esp + 96]
    add add edi, 0FFFFF000h
    fstp fstp dword ptr [esp + 76]
    shl shl edi, 5
    mov mov dword ptr [esp + 48], edi
    fild fild dword ptr [esp + 48]
    add add eax, 0FFFFF800h
    shl shl eax, 6
    mov mov dword ptr [esp + 48], eax
    fstp fstp dword ptr [esp + 80]
    push push 0
    fild fild dword ptr [esp + 52]
    lea lea edi, [esp + 80]
    fstp fstp dword ptr [esp + 88]
    call sub_1002C25B
    add add esp, 4
    cmp cmp eax, 2
    je sub_10036110
    mov mov eax, dword ptr [esp + 28]
    test test eax, eax
    je sub_100360F0
    cmp cmp eax, 1
    mov mov ebx, 010191408h
    jne sub_100360FF
    mov mov ebx, 0101913C8h
    mov mov edi, dword ptr [g_106D3194]
    push push 010195640h
    lea lea ecx, [esp + 80]
    push push 03F800000h
    push push ecx
    add add edi, 0249D18h
    call sub_100058BA
    add add esp, 12
    mov mov edi, dword ptr [esp + 24]
    mov mov esi, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 40]
    add add edx, 32
    inc inc ebp
    dec dec eax
    mov mov dword ptr [esp + 20], edx
    mov mov dword ptr [esp + 40], eax
    jne sub_100360B0
    mov mov ebx, dword ptr [esp + 52]
    mov mov edx, dword ptr [esp + 56]
    mov mov ecx, dword ptr [esp + 60]
    mov mov eax, dword ptr [esp + 44]
    inc inc edi
    dec dec eax
    mov mov dword ptr [esp + 24], edi
    mov mov dword ptr [esp + 44], eax
    jne sub_10036090
    mov mov edi, dword ptr [esp + 64]
    mov mov ebp, dword ptr [esp + 28]
    inc inc ebp
    cmp cmp ebp, 1
    mov mov dword ptr [esp + 28], ebp
    jle sub_10036066
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 76
    ret ret
FUN_10035cd0 ENDP
END
