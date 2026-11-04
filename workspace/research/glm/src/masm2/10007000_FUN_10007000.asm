.686
.MODEL FLAT, C
EXTRN sub_100060D5:PROC
EXTRN sub_100074A0:PROC
EXTRN sub_100074AD:PROC
EXTRN sub_100074B7:PROC
EXTRN sub_1000756D:PROC
EXTRN sub_1000758D:PROC
EXTRN sub_1000758E:PROC
EXTRN sub_100075AB:PROC
EXTRN sub_100075F7:PROC
EXTRN sub_10007709:PROC
EXTRN sub_10007726:PROC
EXTRN sub_1000779A:PROC
EXTRN sub_1000779B:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_101CE5BC:DWORD:DWORD
EXTRN EXTRN g_101CE6A0:DWORD:DWORD
EXTRN EXTRN g_101CE6E0:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_10007000 PROC
    sub sub esp, 080h
    mov mov eax, dword ptr [g_101CE5BC]
    fld fld dword ptr [edx]
    fld fld dword ptr [ecx + 4]
    push push ebx
    fld fld st(0)
    push push ebp
    fmul fmul dword ptr [eax + 16]
    push push esi
    fld fld st(2)
    push push edi
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 48]
    fstp fstp dword ptr [esp + 20]
    fld fld st(0)
    fmul fmul dword ptr [eax + 20]
    fld fld st(2)
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 52]
    fstp fstp dword ptr [esp + 24]
    fld fld st(0)
    fmul fmul dword ptr [eax + 24]
    fld fld st(2)
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 56]
    fstp fstp dword ptr [esp + 28]
    fmul fmul dword ptr [eax + 28]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 60]
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld dword ptr [esp + 20]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 84]
    fld fld dword ptr [esp + 24]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 88]
    fmul fmul dword ptr [esp + 28]
    fst fst dword ptr [esp + 92]
    fld fld dword ptr [edx]
    fld fld dword ptr [edx + 4]
    fld fld st(0)
    fmul fmul dword ptr [eax + 16]
    fld fld st(2)
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 48]
    fstp fstp dword ptr [esp + 20]
    fld fld st(0)
    fmul fmul dword ptr [eax + 20]
    fld fld st(2)
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 52]
    fstp fstp dword ptr [esp + 24]
    fld fld st(0)
    fmul fmul dword ptr [eax + 24]
    fld fld st(2)
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 56]
    fstp fstp dword ptr [esp + 28]
    fmul fmul dword ptr [eax + 28]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 60]
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld dword ptr [esp + 20]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 96]
    fld fld dword ptr [esp + 24]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 104]
    fld fld dword ptr [ecx]
    fld fld dword ptr [edx + 4]
    fld fld st(0)
    lea lea edx, [esp + 36]
    fmul fmul dword ptr [eax + 16]
    push push edx
    fld fld st(2)
    push push 4
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 48]
    fstp fstp dword ptr [esp + 28]
    fld fld st(0)
    fmul fmul dword ptr [eax + 20]
    fld fld st(2)
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 52]
    fstp fstp dword ptr [esp + 32]
    fld fld st(0)
    fmul fmul dword ptr [eax + 24]
    fld fld st(2)
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 56]
    fstp fstp dword ptr [esp + 36]
    fmul fmul dword ptr [eax + 28]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 60]
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld dword ptr [esp + 28]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 116]
    fld fld dword ptr [esp + 32]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 120]
    fmul fmul dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 124]
    fld fld dword ptr [ecx]
    fld fld dword ptr [ecx + 4]
    mov mov ecx, dword ptr [esp + 96]
    fld fld st(0)
    mov mov dword ptr [esp + 090h], ecx
    fmul fmul dword ptr [eax + 16]
    fld fld st(2)
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 48]
    fstp fstp dword ptr [esp + 28]
    fld fld st(0)
    fmul fmul dword ptr [eax + 20]
    fld fld st(2)
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 52]
    fstp fstp dword ptr [esp + 32]
    fld fld st(0)
    fmul fmul dword ptr [eax + 24]
    fld fld st(2)
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 56]
    fstp fstp dword ptr [esp + 36]
    fmul fmul dword ptr [eax + 28]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 60]
    mov mov eax, dword ptr [esp + 92]
    mov mov dword ptr [esp + 08Ch], eax
    lea lea eax, [esp + 92]
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld dword ptr [esp + 28]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 080h]
    fld fld dword ptr [esp + 32]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 084h]
    fmul fmul dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 088h]
    fstp fstp dword ptr [esp + 094h]
    call sub_100060D5
    mov mov esi, dword ptr [esp + 09Ch]
    xor xor edx, edx
    add add esp, 8
    add add esi, 4
    mov mov dword ptr [esp + 16], edx
    xor xor edi, edi
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [esp + edi + 36]
    mov mov ecx, dword ptr [esp + edi + 40]
    mov mov dword ptr [esi - 4], eax
    mov mov eax, dword ptr [esp + edi + 44]
    mov mov dword ptr [esi + 4], eax
    cmp cmp dword ptr [esp + 0A0h], edx
    mov mov dword ptr [esi], ecx
    jne sub_100074A0
    mov mov ebp, dword ptr [esp + 098h]
    xor xor ebx, ebx
    cmp cmp ebp, edx
    jle sub_100074AD
    mov mov ecx, dword ptr [esp + 09Ch]
    add add ecx, 4
    fld fld dword ptr [ecx - 4]
    mov mov eax, dword ptr [g_101CE6A0]
    fmul fmul dword ptr [esi - 4]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fcomp fcomp dword ptr [eax + 8]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_100075F7
    inc inc ebx
    add add ecx, 12
    cmp cmp ebx, ebp
    jl sub_100074B7
    mov mov eax, dword ptr [g_101CE6E0]
    cmp cmp dword ptr [eax + 8], edx
    je sub_1000758E
    mov mov ebx, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [ebx + 0249D4Ch]
    mov mov eax, dword ptr [ebx + 0249D50h]
    lea lea ebp, [ebx + 0249D4Ch]
    inc inc ecx
    cmp cmp ecx, eax
    jg sub_100075AB
    mov mov ecx, dword ptr [ebx + 0249D48h]
    add add ebx, 0249D48h
    cmp cmp ecx, edx
    jne sub_1000756D
    imul imul eax, eax, 44
    push push eax
    call dword ptr [fp_101D49DC]
    add add esp, 4
    mov mov dword ptr [ebx], eax
    xor xor edx, edx
    mov mov eax, dword ptr [ebp]
    mov mov ecx, dword ptr [ebx]
    imul imul eax, eax, 44
    add add eax, ecx
    mov mov ecx, dword ptr [esp + edi + 84]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + edi + 88]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esp + edi + 92]
    mov mov dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [esp + edi + 96]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [esp + edi + 100]
    mov mov dword ptr [eax + 16], ecx
    mov mov ecx, dword ptr [esp + edi + 104]
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], edx
    mov mov ecx, 03F400000h
    mov mov dword ptr [eax + 28], ecx
    mov mov dword ptr [eax + 32], ecx
    mov mov dword ptr [eax + 36], 03F800000h
    mov mov dword ptr [eax + 40], edx
    inc inc dword ptr [ebp]
    mov mov ebp, dword ptr [esi - 4]
    fld fld dword ptr [esp + edi + 92]
    fmul fmul dword ptr [esi + 4]
    mov mov ebx, dword ptr [esi + 4]
    fld fld dword ptr [esp + edi + 84]
    cmp cmp ebp, edx
    fmul fmul dword ptr [esi - 4]
    mov mov ebp, dword ptr [esi]
    setle setle al
    dec dec al
    faddp faddp st(1)
    fld fld dword ptr [esp + edi + 88]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    and and eax, 12
    cmp cmp ebp, edx
    fsubr fsubr dword ptr [g_1019BDE4]
    setle setle cl
    dec dec cl
    and and cl, 12
    add add cl, 4
    fstp fstp dword ptr [esi + 8]
    mov mov byte ptr [esi + 12], al
    cmp cmp ebx, edx
    setle setle al
    dec dec al
    mov mov byte ptr [esi + 13], cl
    mov mov ecx, dword ptr [esp + 16]
    and and al, 12
    add add al, 8
    mov mov byte ptr [esi + 14], al
    inc inc ecx
    mov mov byte ptr [esi + 15], 0FFh
    mov mov dword ptr [esp + 16], ecx
    add add esi, 20
    add add edi, 12
    cmp cmp edi, 48
    jl sub_1000758D
    mov mov eax, dword ptr [esp + 16]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 080h
    ret ret
    mov mov ecx, dword ptr [g_101CE6E0]
    test test byte ptr [ecx + 8], 2
    je sub_10007709
    mov mov ebx, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [ebx + 0249D4Ch]
    mov mov eax, dword ptr [ebx + 0249D50h]
    lea lea ebp, [ebx + 0249D4Ch]
    inc inc ecx
    cmp cmp ecx, eax
    jg sub_10007726
    mov mov ecx, dword ptr [ebx + 0249D48h]
    add add ebx, 0249D48h
    cmp cmp ecx, edx
    jne sub_1000779B
    imul imul eax, eax, 44
    push push eax
    call dword ptr [fp_101D49DC]
    add add esp, 4
    mov mov dword ptr [ebx], eax
    xor xor edx, edx
    mov mov eax, dword ptr [ebp]
    mov mov ecx, dword ptr [ebx]
    imul imul eax, eax, 44
    add add eax, ecx
    mov mov ecx, dword ptr [esp + edi + 84]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + edi + 88]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esp + edi + 92]
    mov mov dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [esp + edi + 96]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [esp + edi + 100]
    mov mov dword ptr [eax + 16], ecx
    mov mov ecx, dword ptr [esp + edi + 104]
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], edx
    mov mov ecx, 03F000000h
    mov mov dword ptr [eax + 28], ecx
    mov mov dword ptr [eax + 32], ecx
    mov mov dword ptr [eax + 36], 03F800000h
    mov mov dword ptr [eax + 40], edx
    inc inc dword ptr [ebp]
    jmp sub_1000779A
FUN_10007000 ENDP
END
