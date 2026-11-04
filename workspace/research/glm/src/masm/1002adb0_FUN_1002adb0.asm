.686
.MODEL FLAT, C
EXTRN sub_1005ED99:PROC
EXTRN sub_100F00BE:PROC
EXTRN sub_100F6F27:PROC
EXTRN sub_100F6FE0:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_1019BC7C:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D49B4:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1002adb0 PROC
    sub esp, 56
    mov edx, dword ptr [esp + 64]
    push ebx
    mov ebx, dword ptr [esp + 72]
    push ebp
    mov ebp, dword ptr [esp + 80]
    push esi
    mov esi, dword ptr [esp + 72]
    push edi
    mov edi, dword ptr [g_101D1B9C]
    mov edi, dword ptr [edi + 0000000F8h]
    lea ecx, [ecx + ecx*2]
    shl ecx, 5
    fld dword ptr [edi + ecx + 84]
    lea ecx, [edi + ecx + 84]
    fmul dword ptr [g_1019BC7C]
    fstp dword ptr [esp + 56]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 64]
    fld dword ptr [esp + 56]
    fadd qword ptr [esp + 64]
    fistp dword ptr [esp + 60]
    fld dword ptr [ecx + 4]
    fmul dword ptr [g_1019BC7C]
    fstp dword ptr [esp + 56]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 48]
    fld dword ptr [esp + 56]
    fadd qword ptr [esp + 48]
    fistp dword ptr [esp + 64]
    test ebx, ebx
    jle L1
    mov edi, dword ptr [esp + 92]
    lea edx, [edi + 20]
    lea ecx, [ebp + 52]
    sub edi, ebp
L0:
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 24]
    fld dword ptr [esi]
    fmul dword ptr [ecx - 4]
    faddp st(1)
    fld dword ptr [esi + 12]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [esi + 36]
    fstp dword ptr [edx - 20]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 28]
    fld dword ptr [ecx - 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [esi + 16]
    faddp st(1)
    fadd dword ptr [esi + 40]
    fstp dword ptr [edx - 16]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 32]
    fld dword ptr [ecx - 4]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [esi + 20]
    faddp st(1)
    fadd dword ptr [esi + 44]
    fstp dword ptr [edx - 12]
    mov ebp, dword ptr [ecx - 44]
    mov dword ptr [esp + 24], ebp
    mov ebp, dword ptr [ecx - 48]
    mov dword ptr [esp + 20], ebp
    mov ebp, dword ptr [ecx - 52]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 12]
    mov dword ptr [esp + 28], ebp
    fld dword ptr [esp + 24]
    fmul dword ptr [eax + 24]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx - 8]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 16]
    fld dword ptr [esp + 24]
    fmul dword ptr [eax + 28]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fstp dword ptr [edx - 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 20]
    fld dword ptr [esp + 24]
    fmul dword ptr [eax + 32]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fstp dword ptr [edx]
    mov ebp, dword ptr [ecx - 40]
    mov dword ptr [edx + 4], ebp
    mov ebp, dword ptr [ecx - 24]
    mov dword ptr [edx + 8], ebp
    mov ebp, dword ptr [ecx - 8]
    mov dword ptr [edx + 12], ebp
    mov bp, word ptr [esp + 60]
    mov word ptr [edx + 16], bp
    mov bp, word ptr [esp + 64]
    mov word ptr [edx + 18], bp
    mov ebp, dword ptr [ecx - 28]
    mov dword ptr [esp + 32], ebp
    mov ebp, dword ptr [ecx - 32]
    mov dword ptr [esp + 40], ebp
    mov ebp, dword ptr [ecx - 36]
    fld dword ptr [esp + 40]
    fmul dword ptr [eax + 12]
    mov dword ptr [esp + 36], ebp
    fld dword ptr [esp + 32]
    add ecx, 64
    fmul dword ptr [eax + 24]
    add edx, 64
    dec ebx
    faddp st(1)
    fld dword ptr [esp + 36]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx - 44]
    fld dword ptr [esp + 32]
    fmul dword ptr [eax + 28]
    fld dword ptr [esp + 36]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 40]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fstp dword ptr [edx - 40]
    fld dword ptr [esp + 32]
    fmul dword ptr [eax + 32]
    fld dword ptr [esp + 36]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [esp + 40]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [edx - 36]
    mov ebp, dword ptr [ecx - 76]
    mov dword ptr [esp + 44], ebp
    mov ebp, dword ptr [ecx - 80]
    mov dword ptr [esp + 56], ebp
    fld dword ptr [esp + 56]
    fmul dword ptr [eax + 12]
    mov ebp, dword ptr [ecx - 84]
    fld dword ptr [esp + 44]
    mov dword ptr [esp + 48], ebp
    fmul dword ptr [eax + 24]
    faddp st(1)
    fld dword ptr [esp + 48]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edi + ecx - 64]
    fld dword ptr [esp + 44]
    fmul dword ptr [eax + 28]
    fld dword ptr [esp + 48]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fstp dword ptr [edx - 28]
    fld dword ptr [esp + 44]
    fmul dword ptr [eax + 32]
    fld dword ptr [esp + 48]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [eax + 20]
    faddp st(1)
    fstp dword ptr [edx - 24]
    jne L0
    mov ebx, dword ptr [esp + 84]
    mov edx, dword ptr [esp + 80]
L1:
    mov eax, dword ptr [g_101D49B4]
    mov ecx, dword ptr [eax]
    push 000001000h
    lea esi, [esp + 20]
    push esi
    shl ebx, 6
    push ebx
    shl edx, 6
    push edx
    push eax
    call dword ptr [ecx + 0x2c]
    mov esi, eax
    test esi, esi
    jge L2
    push 010194030h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    push esi
    call sub_100F00BE
    push eax
    push 010194008h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    call dword ptr [fp_101D4A1C]
L2:
    mov edx, dword ptr [esp + 92]
    mov eax, dword ptr [esp + 16]
    push ebx
    push edx
    push eax
    call sub_1005ED99
    add esp, 12
    lea esp, [esp]
L3:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L4
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L4
    push 0101974F0h
    push 010193358h
    push eax
    call sub_100F6FE0
    mov edx, dword ptr [g_10764584]
    add esp, 12
    push edx
    call sub_100F6F27
    add esp, 4
L4:
    mov eax, dword ptr [g_101D49B4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x30]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L3
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 56
    ret
FUN_1002adb0 ENDP
END
