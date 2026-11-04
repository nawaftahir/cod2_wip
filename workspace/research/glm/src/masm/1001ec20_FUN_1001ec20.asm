.686
.MODEL FLAT, C
EXTRN sub_1001E3D6:PROC
EXTRN sub_1001ED80:PROC
EXTRN g_1019BDB0:DWORD
EXTRN g_1019BDB4:DWORD
.CODE
FUN_1001ec20 PROC
    sub esp, 48
    push ebx
    mov ebx, dword ptr [eax + 12]
    movsx eax, word ptr [eax + 2]
    test eax, eax
    push ebp
    mov ebp, dword ptr [esp + 60]
    mov dword ptr [esp + 12], ecx
    jle sub_1001ED80
    push esi
    mov dword ptr [esp + 20], eax
    push edi
L0:
    movsx eax, word ptr [ebx + 62]
    add eax, ebp
    lea edx, [ebx + 48]
    lea esi, [esp + 28]
    mov ecx, ebx
    call sub_1001E3D6
    mov ecx, dword ptr [ebx + 44]
    mov edx, dword ptr [ebx + 12]
    mov eax, dword ptr [ebx + 28]
    mov dword ptr [esp + 60], ecx
    movzx ecx, byte ptr [ebx + 60]
    test ecx, ecx
    mov dword ptr [esp + 52], edx
    mov dword ptr [esp + 56], eax
    je L2
    movzx edx, byte ptr [ebx + 61]
    mov dword ptr [esp + 16], edx
    add ebx, 64
    fild dword ptr [esp + 16]
    fmul dword ptr [g_1019BDB4]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 16]
    jmp L1
    lea ebx, [ebx]
L1:
    movzx edx, word ptr [ebx + 14]
    movsx eax, word ptr [ebx + 12]
    add eax, ebp
    mov dword ptr [esp + 16], edx
    dec ecx
    add ebx, 16
    test ecx, ecx
    fild dword ptr [esp + 16]
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
    fstp dword ptr [esp + 36]
    fstp dword ptr [esp + 32]
    fstp dword ptr [esp + 28]
    jmp L3
L2:
    add ebx, 64
L3:
    mov edi, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 24]
    mov ecx, 9
    lea esi, [esp + 28]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 20]
    add ecx, 36
    dec eax
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 24], eax
    jne L0
    pop edi
    pop esi
FUN_1001ec20 ENDP
END
