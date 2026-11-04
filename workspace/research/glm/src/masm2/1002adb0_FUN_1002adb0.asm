.686
.MODEL FLAT, C
EXTRN sub_1002B2B5:PROC
EXTRN sub_1002B35A:PROC
EXTRN sub_1002B361:PROC
EXTRN sub_1002B368:PROC
EXTRN sub_1005ED99:PROC
EXTRN sub_100F00BE:PROC
EXTRN sub_100F6F27:PROC
EXTRN sub_100F6FE0:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_1019BC7C:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D49B4:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1002adb0 PROC
    sub sub esp, 56
    mov mov edx, dword ptr [esp + 64]
    push push ebx
    mov mov ebx, dword ptr [esp + 72]
    push push ebp
    mov mov ebp, dword ptr [esp + 80]
    push push esi
    mov mov esi, dword ptr [esp + 72]
    push push edi
    mov mov edi, dword ptr [g_101D1B9C]
    mov mov edi, dword ptr [edi + 0F8h]
    lea lea ecx, [ecx + ecx*2]
    shl shl ecx, 5
    fld fld dword ptr [edi + ecx + 84]
    lea lea ecx, [edi + ecx + 84]
    fmul fmul dword ptr [g_1019BC7C]
    fstp fstp dword ptr [esp + 56]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 64]
    fld fld dword ptr [esp + 56]
    fadd fadd qword ptr [esp + 64]
    fistp fistp dword ptr [esp + 60]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [g_1019BC7C]
    fstp fstp dword ptr [esp + 56]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 48]
    fld fld dword ptr [esp + 56]
    fadd fadd qword ptr [esp + 48]
    fistp fistp dword ptr [esp + 64]
    test test ebx, ebx
    jle L0
    mov mov edi, dword ptr [esp + 92]
    lea lea edx, [edi + 20]
    lea lea ecx, [ebp + 52]
    sub sub edi, ebp
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 24]
    fld fld dword ptr [esi]
    fmul fmul dword ptr [ecx - 4]
    faddp faddp st(1)
    fld fld dword ptr [esi + 12]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fadd fadd dword ptr [esi + 36]
    fstp fstp dword ptr [edx - 20]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 28]
    fld fld dword ptr [ecx - 4]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [esi + 16]
    faddp faddp st(1)
    fadd fadd dword ptr [esi + 40]
    fstp fstp dword ptr [edx - 16]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 32]
    fld fld dword ptr [ecx - 4]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [esi + 20]
    faddp faddp st(1)
    fadd fadd dword ptr [esi + 44]
    fstp fstp dword ptr [edx - 12]
    mov mov ebp, dword ptr [ecx - 44]
    mov mov dword ptr [esp + 24], ebp
    mov mov ebp, dword ptr [ecx - 48]
    mov mov dword ptr [esp + 20], ebp
    mov mov ebp, dword ptr [ecx - 52]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 12]
    mov mov dword ptr [esp + 28], ebp
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [eax + 24]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [edx - 8]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 16]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [eax + 28]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [edx - 4]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 20]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [eax + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [edx]
    mov mov ebp, dword ptr [ecx - 40]
    mov mov dword ptr [edx + 4], ebp
    mov mov ebp, dword ptr [ecx - 24]
    mov mov dword ptr [edx + 8], ebp
    mov mov ebp, dword ptr [ecx - 8]
    mov mov dword ptr [edx + 12], ebp
    mov mov bp, word ptr [esp + 60]
    mov mov word ptr [edx + 16], bp
    mov mov bp, word ptr [esp + 64]
    mov mov word ptr [edx + 18], bp
    mov mov ebp, dword ptr [ecx - 28]
    mov mov dword ptr [esp + 32], ebp
    mov mov ebp, dword ptr [ecx - 32]
    mov mov dword ptr [esp + 40], ebp
    mov mov ebp, dword ptr [ecx - 36]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [eax + 12]
    mov mov dword ptr [esp + 36], ebp
    fld fld dword ptr [esp + 32]
    add add ecx, 64
    fmul fmul dword ptr [eax + 24]
    add add edx, 64
    dec dec ebx
    faddp faddp st(1)
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [edx - 44]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [eax + 28]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [eax + 16]
    faddp faddp st(1)
    fstp fstp dword ptr [edx - 40]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [eax + 32]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [eax + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [edx - 36]
    mov mov ebp, dword ptr [ecx - 76]
    mov mov dword ptr [esp + 44], ebp
    mov mov ebp, dword ptr [ecx - 80]
    mov mov dword ptr [esp + 56], ebp
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [eax + 12]
    mov mov ebp, dword ptr [ecx - 84]
    fld fld dword ptr [esp + 44]
    mov mov dword ptr [esp + 48], ebp
    fmul fmul dword ptr [eax + 24]
    faddp faddp st(1)
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [edi + ecx - 64]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [eax + 28]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [eax + 16]
    faddp faddp st(1)
    fstp fstp dword ptr [edx - 28]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [eax + 32]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [eax + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [edx - 24]
    jne L1
    mov mov ebx, dword ptr [esp + 84]
    mov mov edx, dword ptr [esp + 80]
    mov mov eax, dword ptr [g_101D49B4]
    mov mov ecx, dword ptr [eax]
    push push 01000h
    lea lea esi, [esp + 20]
    push push esi
    shl shl ebx, 6
    push push ebx
    shl shl edx, 6
    push push edx
    push push eax
    call call dword ptr [ecx + 44]
    mov mov esi, eax
    test test esi, esi
    jge sub_1002B2B5
    push push 010194030h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    push push esi
    call sub_100F00BE
    push push eax
    push push 010194008h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    call dword ptr [fp_101D4A1C]
    mov mov edx, dword ptr [esp + 92]
    mov mov eax, dword ptr [esp + 16]
    push push ebx
    push push edx
    push push eax
    call sub_1005ED99
    add add esp, 12
    lea lea esp, [esp]
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_1002B35A
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
L1:
    je sub_1002B368
    push push 0101974F0h
    push push 010193358h
    push push eax
    call sub_100F6FE0
    mov mov edx, dword ptr [g_10764584]
    add add esp, 12
    push push edx
    call sub_100F6F27
    add add esp, 4
    mov mov eax, dword ptr [g_101D49B4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 48]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1002B361
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 56
    ret ret
FUN_1002adb0 ENDP
END
