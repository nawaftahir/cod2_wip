.686
.MODEL FLAT, C
EXTRN sub_1001E2A2:PROC
EXTRN sub_1001EA90:PROC
EXTRN g_1019BDB0:DWORD
EXTRN g_1019BDB4:DWORD
.CODE
FUN_1001e920 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF0h
    sub esp, 84
    push ebx
    mov ebx, dword ptr [eax + 12]
    movsx eax, word ptr [eax + 2]
    test eax, eax
    push esi
    push edi
    mov dword ptr [esp + 24], ecx
    jle sub_1001EA90
    mov dword ptr [esp + 28], eax
L0:
    movsx eax, word ptr [ebx + 62]
    mov edi, dword ptr [ebp + 8]
    lea edx, [ebx + 32]
    push edx
    lea ecx, [ebx + 48]
    add eax, edi
    push ecx
    lea esi, [ebx + 16]
    lea ecx, [esp + 40]
    mov edi, ebx
    call sub_1001E2A2
    mov ecx, dword ptr [ebx + 44]
    mov edx, dword ptr [ebx + 12]
    mov eax, dword ptr [ebx + 28]
    mov dword ptr [esp + 76], ecx
    movzx ecx, byte ptr [ebx + 60]
    add esp, 8
    test ecx, ecx
    mov dword ptr [esp + 60], edx
    mov dword ptr [esp + 64], eax
    je L2
    movzx edx, byte ptr [ebx + 61]
    mov dword ptr [esp + 20], edx
    add ebx, 64
    fild dword ptr [esp + 20]
    fmul dword ptr [g_1019BDB4]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 20]
    jmp L1
    lea esp, [esp]
L1:
    movzx edx, word ptr [ebx + 14]
    movsx eax, word ptr [ebx + 12]
    add eax, dword ptr [ebp + 8]
    mov dword ptr [esp + 20], edx
    dec ecx
    add ebx, 16
    test ecx, ecx
    fild dword ptr [esp + 20]
    fmul dword ptr [g_1019BDB0]
    fld dword ptr [eax + 32]
    fmul dword ptr [ebx - 8]
    fld dword ptr [eax + 16]
    fmul dword ptr [ebx - 12]
    faddp st(1)
    fld dword ptr [ebx - 16]
    fmul dword ptr [eax]
    faddp st(1)
    fadd dword ptr [eax + 48]
    fmul st(1)
    faddp st(4)
    fld dword ptr [eax + 36]
    fmul dword ptr [ebx - 8]
    fld dword ptr [eax + 20]
    fmul dword ptr [ebx - 12]
    faddp st(1)
    fld dword ptr [eax + 4]
    fmul dword ptr [ebx - 16]
    faddp st(1)
    fadd dword ptr [eax + 52]
    fmul st(1)
    faddp st(3)
    fld dword ptr [eax + 40]
    fmul dword ptr [ebx - 8]
    fld dword ptr [eax + 24]
    fmul dword ptr [ebx - 12]
    faddp st(1)
    fld dword ptr [eax + 8]
    fmul dword ptr [ebx - 16]
    faddp st(1)
    fadd dword ptr [eax + 56]
    fmul st(1)
    faddp st(2)
    fstp st(0)
    jne L1
    fstp dword ptr [esp + 40]
    fstp dword ptr [esp + 36]
    fstp dword ptr [esp + 32]
    jmp L3
L2:
    add ebx, 64
L3:
    mov eax, dword ptr [esp + 24]
    mov edi, eax
    add eax, 64
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [esp + 28]
    mov ecx, 16
    lea esi, [esp + 32]
    dec eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [esp + 28], eax
    jne L0
FUN_1001e920 ENDP
END
