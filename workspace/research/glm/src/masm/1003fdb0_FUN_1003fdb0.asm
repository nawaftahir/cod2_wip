.686
.MODEL FLAT, C
EXTRN sub_1002E02B:PROC
EXTRN sub_10059110:PROC
EXTRN sub_100591C2:PROC
EXTRN sub_100598F3:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BDA8:DWORD
EXTRN g_1019BE9C:DWORD
EXTRN g_1019BED0:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072DDCC:DWORD
EXTRN g_1072DDD0:DWORD
EXTRN g_1072DDD4:DWORD
EXTRN g_1072DDD8:DWORD
EXTRN g_1072DDDC:DWORD
.CODE
FUN_1003fdb0 PROC
    sub esp, 72
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 84]
    fld dword ptr [ebp + 60]
    push esi
    fadd dword ptr [ebp + 72]
    push edi
    lea esi, [esp + 76]
    fmul dword ptr [g_1019BCB0]
    fld dword ptr [ebp + 64]
    fadd dword ptr [ebp + 76]
    fmul dword ptr [g_1019BCB0]
    fld dword ptr [ebp + 68]
    fadd dword ptr [ebp + 80]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 84]
    fxch st(1)
    fsub dword ptr [g_1072DDCC]
    fstp dword ptr [esp + 76]
    fsub dword ptr [g_1072DDD0]
    fstp dword ptr [esp + 80]
    fld dword ptr [esp + 84]
    fsub dword ptr [g_1072DDD4]
    fstp dword ptr [esp + 84]
    call sub_10059110
    fmul dword ptr [g_1072DDD8]
    fadd dword ptr [g_1072DDDC]
    fmul dword ptr [g_1019BED0]
    fsubr dword ptr [g_1019BC78]
    fmul dword ptr [g_1019BE9C]
    fstp dword ptr [esp + 28]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 48]
    fld dword ptr [esp + 28]
    fadd qword ptr [esp + 48]
    fistp dword ptr [esp + 24]
    mov eax, dword ptr [esp + 24]
    cmp eax, 8
    mov dword ptr [esp + 20], eax
    jge L0
    mov eax, 8
    jmp L1
L0:
    cmp eax, 32
    jle L2
    mov eax, 32
L1:
    mov dword ptr [esp + 20], eax
L2:
    mov edx, dword ptr [g_1072D9D4]
    lea ecx, [eax + eax]
    mov dword ptr [esp + 28], ecx
    lea ecx, [ecx + edx + 2]
    cmp ecx, 00000154Ah
    jg L3
    lea edx, [eax + eax*2]
    mov eax, dword ptr [g_1072D9D0]
    lea ecx, [eax + edx*2]
    cmp ecx, 000100000h
    jle L4
L3:
    call sub_1002E02B
L4:
    fld dword ptr [ebp + 60]
    lea esi, [esp + 48]
    fsub dword ptr [ebp + 72]
    fstp dword ptr [esp + 48]
    fld dword ptr [ebp + 64]
    fsub dword ptr [ebp + 76]
    fstp dword ptr [esp + 52]
    fld dword ptr [ebp + 68]
    fsub dword ptr [ebp + 80]
    fstp dword ptr [esp + 56]
    call sub_100591C2
    lea ebx, [esp + 76]
    fstp st(0)
    lea eax, [esp + 64]
    mov edi, esi
    call sub_100598F3
    fild dword ptr [esp + 20]
    mov esi, dword ptr [g_1072D9D4]
    mov dl, byte ptr [ebp + 88]
    fdivr dword ptr [g_1019BC78]
    mov al, byte ptr [ebp + 89]
    mov cl, byte ptr [ebp + 90]
    shl esi, 6
    mov byte ptr [esp + 26], dl
    mov dl, byte ptr [ebp + 91]
    mov byte ptr [esp + 25], al
    mov byte ptr [esp + 24], cl
    add esi, 0106D3200h
    lea eax, [esp + 92]
    lea ecx, [esp + 16]
    mov dword ptr [esp + 48], esi
    mov byte ptr [esp + 27], dl
    mov dword ptr [esp + 40], 0
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 20], ecx
    fst dword ptr [esp + 44]
    fmul dword ptr [g_1019BDA8]
    fstp dword ptr [esp + 36]
    push eax
    push ecx
    fld dword ptr [esp + 44]
    fsincos
    mov ecx, dword ptr [esp + 40]
    mov eax, dword ptr [esp + 28]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    mov ebx, dword ptr [esp + 28]
    fld dword ptr [g_1019BC78]
    mov edx, dword ptr [esp + 24]
    xor ecx, ecx
    test ebx, ebx
    mov dword ptr [esp + 20], 0
    mov edi, 03F800000h
    jle L6
    fld dword ptr [esp + 40]
    lea eax, [esi + 72]
L5:
    fld dword ptr [esp + 20]
    fmul dword ptr [ebp + 104]
    fld dword ptr [esp + 64]
    fmul st(1)
    fadd dword ptr [ebp + 60]
    fstp dword ptr [eax - 72]
    fld dword ptr [esp + 68]
    fmul st(1)
    fadd dword ptr [ebp + 64]
    fstp dword ptr [eax - 68]
    fld dword ptr [esp + 72]
    fmul st(1)
    fadd dword ptr [ebp + 68]
    fstp dword ptr [eax - 64]
    fstp st(0)
    fld st(1)
    fmul dword ptr [ebp + 104]
    fld dword ptr [esp + 76]
    fmul st(1)
    fadd dword ptr [eax - 72]
    fstp dword ptr [eax - 72]
    fld dword ptr [esp + 80]
    fmul st(1)
    fadd dword ptr [eax - 68]
    fstp dword ptr [eax - 68]
    fld dword ptr [esp + 84]
    fmul st(1)
    fadd dword ptr [eax - 64]
    fstp dword ptr [eax - 64]
    mov dword ptr [eax - 60], edi
    mov dword ptr [eax - 36], edi
    fstp st(0)
    mov dword ptr [eax - 44], edx
    fst dword ptr [eax - 40]
    fld dword ptr [esp + 20]
    fmul dword ptr [ebp + 100]
    fld dword ptr [esp + 64]
    fmul st(1)
    fadd dword ptr [ebp + 72]
    fstp dword ptr [eax - 8]
    fld dword ptr [esp + 68]
    fmul st(1)
    fadd dword ptr [ebp + 76]
    fstp dword ptr [eax - 4]
    fld dword ptr [esp + 72]
    fmul st(1)
    fadd dword ptr [ebp + 80]
    fstp dword ptr [eax]
    fstp st(0)
    fld st(1)
    fmul dword ptr [ebp + 100]
    fld dword ptr [esp + 76]
    fmul st(1)
    fadd dword ptr [eax - 8]
    fstp dword ptr [eax - 8]
    fld dword ptr [esp + 80]
    fmul st(1)
    fadd dword ptr [eax - 4]
    fstp dword ptr [eax - 4]
    fld dword ptr [esp + 84]
    fmul st(1)
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    mov dword ptr [eax + 4], edi
    mov dword ptr [eax + 28], 0
    fstp st(0)
    mov dword ptr [eax + 20], edx
    fst dword ptr [eax + 24]
    fadd dword ptr [esp + 44]
    fld st(1)
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 92]
    faddp st(1)
    fxch st(2)
    fmul dword ptr [esp + 92]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 16]
    fsubp st(1)
    fxch st(2)
    fstp dword ptr [esp + 20]
    mov esi, dword ptr [g_1072D9D4]
    mov ebx, dword ptr [g_1072D9D0]
    mov edi, dword ptr [g_1072D9B0]
    add esi, ecx
    mov word ptr [edi + ebx*2], si
    mov esi, dword ptr [g_1072D9D4]
    mov ebx, dword ptr [g_1072D9D0]
    mov edi, dword ptr [g_1072D9B0]
    lea esi, [ecx + esi + 1]
    mov word ptr [edi + ebx*2 + 2], si
    mov esi, dword ptr [g_1072D9D4]
    mov edi, dword ptr [g_1072D9D0]
    mov ebx, dword ptr [g_1072D9B0]
    lea esi, [ecx + esi + 3]
    mov word ptr [ebx + edi*2 + 4], si
    mov esi, dword ptr [g_1072D9D0]
    mov edi, dword ptr [g_1072D9D4]
    mov ebx, dword ptr [g_1072D9B0]
    add esi, 3
    mov dword ptr [g_1072D9D0], esi
    lea edi, [ecx + edi + 3]
    mov word ptr [ebx + esi*2], di
    mov esi, dword ptr [g_1072D9D4]
    mov ebx, dword ptr [g_1072D9D0]
    mov edi, dword ptr [g_1072D9B0]
    lea esi, [ecx + esi + 2]
    mov word ptr [edi + ebx*2 + 2], si
    mov esi, dword ptr [g_1072D9D4]
    mov edi, dword ptr [g_1072D9D0]
    mov ebx, dword ptr [g_1072D9B0]
    add esi, ecx
    mov word ptr [ebx + edi*2 + 4], si
    mov esi, dword ptr [g_1072D9D0]
    mov ebx, dword ptr [esp + 28]
    add esi, 3
    add ecx, 2
    add eax, 000000080h
    cmp ecx, ebx
    mov dword ptr [g_1072D9D0], esi
    mov edi, 03F800000h
    jl L5
    mov esi, dword ptr [esp + 48]
    fstp st(0)
L6:
    shl ecx, 6
    fstp st(0)
    lea eax, [ecx + esi]
    mov ecx, dword ptr [esi]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [esi + 12]
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 32], edi
    mov dword ptr [eax + 36], edi
    mov dword ptr [eax + 28], edx
    mov ecx, dword ptr [esi + 64]
    mov dword ptr [eax + 64], ecx
    mov ecx, dword ptr [esi + 68]
    mov dword ptr [eax + 68], ecx
    mov ecx, dword ptr [esi + 72]
    mov dword ptr [eax + 72], ecx
    mov ecx, dword ptr [esi + 76]
    mov dword ptr [eax + 76], ecx
    mov dword ptr [eax + 96], edi
    pop edi
    mov dword ptr [eax + 100], 0
    mov dword ptr [eax + 92], edx
    mov edx, dword ptr [g_1072D9D4]
    pop esi
    lea eax, [edx + ebx + 2]
    pop ebp
    mov dword ptr [g_1072D9D4], eax
    pop ebx
    add esp, 72
    ret
FUN_1003fdb0 ENDP
END
