.686
.MODEL FLAT, C
EXTRN sub_1001E3D6:PROC
EXTRN sub_1001ED80:PROC
EXTRN sub_1001ED84:PROC
EXTRN sub_1001ED8D:PROC
EXTRN sub_1001EDB8:PROC
EXTRN sub_1001EE4F:PROC
EXTRN EXTRN g_1019BDB0:DWORD:DWORD
EXTRN EXTRN g_1019BDB4:DWORD:DWORD
.CODE
FUN_1001ec20 PROC
    sub sub esp, 48
    push push ebx
    mov mov ebx, dword ptr [eax + 12]
    movsx movsx eax, word ptr [eax + 2]
    test test eax, eax
    push push ebp
    mov mov ebp, dword ptr [esp + 60]
    mov mov dword ptr [esp + 12], ecx
    jle sub_1001ED80
    push push esi
    mov mov dword ptr [esp + 20], eax
    push push edi
    movsx movsx eax, word ptr [ebx + 62]
    add add eax, ebp
    lea lea edx, [ebx + 48]
    lea lea esi, [esp + 28]
    mov mov ecx, ebx
    call sub_1001E3D6
    mov mov ecx, dword ptr [ebx + 44]
    mov mov edx, dword ptr [ebx + 12]
    mov mov eax, dword ptr [ebx + 28]
    mov mov dword ptr [esp + 60], ecx
    movzx movzx ecx, byte ptr [ebx + 60]
    test test ecx, ecx
    mov mov dword ptr [esp + 52], edx
    mov mov dword ptr [esp + 56], eax
    je sub_1001ED8D
    movzx movzx edx, byte ptr [ebx + 61]
    mov mov dword ptr [esp + 16], edx
    add add ebx, 64
    fild fild dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BDB4]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 16]
    jmp L0
    lea lea ebx, [ebx]
    movzx movzx edx, word ptr [ebx + 14]
    movsx movsx eax, word ptr [ebx + 12]
    add add eax, ebp
    mov mov dword ptr [esp + 16], edx
    dec dec ecx
    add add ebx, 16
    test test ecx, ecx
    fild fild dword ptr [esp + 16]
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
    jne sub_1001EDB8
    fstp fstp dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 28]
    jmp sub_1001EE4F
    add add ebx, 64
    mov mov edi, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, 9
    lea lea esi, [esp + 28]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [esp + 20]
    add add ecx, 36
    dec dec eax
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 24], eax
    jne sub_1001ED84
    pop pop edi
    pop pop esi
FUN_1001ec20 ENDP
END
