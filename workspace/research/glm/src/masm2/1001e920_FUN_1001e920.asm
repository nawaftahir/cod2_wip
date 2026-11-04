.686
.MODEL FLAT, C
EXTRN sub_1001E2A2:PROC
EXTRN sub_1001EA90:PROC
EXTRN sub_1001EA94:PROC
EXTRN sub_1001EAAD:PROC
EXTRN sub_1001EAD9:PROC
EXTRN sub_1001EB71:PROC
EXTRN EXTRN g_1019BDB0:DWORD:DWORD
EXTRN EXTRN g_1019BDB4:DWORD:DWORD
.CODE
FUN_1001e920 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -16
    sub sub esp, 84
    push push ebx
    mov mov ebx, dword ptr [eax + 12]
    movsx movsx eax, word ptr [eax + 2]
    test test eax, eax
    push push esi
    push push edi
    mov mov dword ptr [esp + 24], ecx
    jle sub_1001EA90
    mov mov dword ptr [esp + 28], eax
    movsx movsx eax, word ptr [ebx + 62]
    mov mov edi, dword ptr [ebp + 8]
    lea lea edx, [ebx + 32]
    push push edx
    lea lea ecx, [ebx + 48]
    add add eax, edi
    push push ecx
    lea lea esi, [ebx + 16]
    lea lea ecx, [esp + 40]
    mov mov edi, ebx
    call sub_1001E2A2
    mov mov ecx, dword ptr [ebx + 44]
    mov mov edx, dword ptr [ebx + 12]
    mov mov eax, dword ptr [ebx + 28]
    mov mov dword ptr [esp + 76], ecx
    movzx movzx ecx, byte ptr [ebx + 60]
    add add esp, 8
    test test ecx, ecx
    mov mov dword ptr [esp + 60], edx
    mov mov dword ptr [esp + 64], eax
    je sub_1001EAAD
    movzx movzx edx, byte ptr [ebx + 61]
    mov mov dword ptr [esp + 20], edx
    add add ebx, 64
    fild fild dword ptr [esp + 20]
    fmul fmul dword ptr [g_1019BDB4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 20]
    jmp L0
    lea lea esp, [esp]
    movzx movzx edx, word ptr [ebx + 14]
    movsx movsx eax, word ptr [ebx + 12]
    add add eax, dword ptr [ebp + 8]
    mov mov dword ptr [esp + 20], edx
    dec dec ecx
    add add ebx, 16
    test test ecx, ecx
    fild fild dword ptr [esp + 20]
    fmul fmul dword ptr [g_1019BDB0]
    fld fld dword ptr [eax + 32]
    fmul fmul dword ptr [ebx - 8]
    fld fld dword ptr [eax + 16]
    fmul fmul dword ptr [ebx - 12]
    faddp faddp st(1)
    fld fld dword ptr [ebx - 16]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 48]
    fmul fmul st(1)
    faddp faddp st(4)
    fld fld dword ptr [eax + 36]
    fmul fmul dword ptr [ebx - 8]
    fld fld dword ptr [eax + 20]
    fmul fmul dword ptr [ebx - 12]
    faddp faddp st(1)
    fld fld dword ptr [eax + 4]
    fmul fmul dword ptr [ebx - 16]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 52]
    fmul fmul st(1)
    faddp faddp st(3)
    fld fld dword ptr [eax + 40]
    fmul fmul dword ptr [ebx - 8]
    fld fld dword ptr [eax + 24]
    fmul fmul dword ptr [ebx - 12]
    faddp faddp st(1)
    fld fld dword ptr [eax + 8]
    fmul fmul dword ptr [ebx - 16]
    faddp faddp st(1)
    fadd fadd dword ptr [eax + 56]
    fmul fmul st(1)
    faddp faddp st(2)
    fstp fstp st(0)
    jne sub_1001EAD9
    fstp fstp dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 32]
    jmp sub_1001EB71
    add add ebx, 64
    mov mov eax, dword ptr [esp + 24]
    mov mov edi, eax
    add add eax, 64
    mov mov dword ptr [esp + 24], eax
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, 16
    lea lea esi, [esp + 32]
    dec dec eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [esp + 28], eax
    jne sub_1001EA94
FUN_1001e920 ENDP
END
