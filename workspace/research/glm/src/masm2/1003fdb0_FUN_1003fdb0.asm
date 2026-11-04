.686
.MODEL FLAT, C
EXTRN sub_1002E02B:PROC
EXTRN sub_100402F7:PROC
EXTRN sub_100402F8:PROC
EXTRN sub_10059110:PROC
EXTRN sub_100591C2:PROC
EXTRN sub_100598F3:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BDA8:DWORD:DWORD
EXTRN EXTRN g_1019BE9C:DWORD:DWORD
EXTRN EXTRN g_1019BED0:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072DDCC:DWORD:DWORD
EXTRN EXTRN g_1072DDD0:DWORD:DWORD
EXTRN EXTRN g_1072DDD4:DWORD:DWORD
EXTRN EXTRN g_1072DDD8:DWORD:DWORD
EXTRN EXTRN g_1072DDDC:DWORD:DWORD
.CODE
FUN_1003fdb0 PROC
    sub sub esp, 72
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 84]
    fld fld dword ptr [ebp + 60]
    push push esi
    fadd fadd dword ptr [ebp + 72]
    push push edi
    lea lea esi, [esp + 76]
    fmul fmul dword ptr [g_1019BCB0]
    fld fld dword ptr [ebp + 64]
    fadd fadd dword ptr [ebp + 76]
    fmul fmul dword ptr [g_1019BCB0]
    fld fld dword ptr [ebp + 68]
    fadd fadd dword ptr [ebp + 80]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 84]
    fxch fxch st(1)
    fsub fsub dword ptr [g_1072DDCC]
    fstp fstp dword ptr [esp + 76]
    fsub fsub dword ptr [g_1072DDD0]
    fstp fstp dword ptr [esp + 80]
    fld fld dword ptr [esp + 84]
    fsub fsub dword ptr [g_1072DDD4]
    fstp fstp dword ptr [esp + 84]
    call sub_10059110
    fmul fmul dword ptr [g_1072DDD8]
    fadd fadd dword ptr [g_1072DDDC]
    fmul fmul dword ptr [g_1019BED0]
    fsubr fsubr dword ptr [g_1019BC78]
    fmul fmul dword ptr [g_1019BE9C]
    fstp fstp dword ptr [esp + 28]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 48]
    fld fld dword ptr [esp + 28]
    fadd fadd qword ptr [esp + 48]
    fistp fistp dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 24]
    cmp cmp eax, 8
    mov mov dword ptr [esp + 20], eax
    jge L0
    mov mov eax, 8
    jmp L1
    cmp cmp eax, 32
    jle L2
    mov mov eax, 32
    mov mov dword ptr [esp + 20], eax
    mov mov edx, dword ptr [g_1072D9D4]
    lea lea ecx, [eax + eax]
    mov mov dword ptr [esp + 28], ecx
    lea lea ecx, [ecx + edx + 2]
    cmp cmp ecx, 0154Ah
    jg L3
    lea lea edx, [eax + eax*2]
    mov mov eax, dword ptr [g_1072D9D0]
    lea lea ecx, [eax + edx*2]
    cmp cmp ecx, 0100000h
    jle L4
    call sub_1002E02B
    fld fld dword ptr [ebp + 60]
    lea lea esi, [esp + 48]
    fsub fsub dword ptr [ebp + 72]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [ebp + 64]
    fsub fsub dword ptr [ebp + 76]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [ebp + 68]
    fsub fsub dword ptr [ebp + 80]
    fstp fstp dword ptr [esp + 56]
    call sub_100591C2
    lea lea ebx, [esp + 76]
    fstp fstp st(0)
    lea lea eax, [esp + 64]
    mov mov edi, esi
    call sub_100598F3
    fild fild dword ptr [esp + 20]
    mov mov esi, dword ptr [g_1072D9D4]
    mov mov dl, byte ptr [ebp + 88]
    fdivr fdivr dword ptr [g_1019BC78]
    mov mov al, byte ptr [ebp + 89]
    mov mov cl, byte ptr [ebp + 90]
    shl shl esi, 6
    mov mov byte ptr [esp + 26], dl
    mov mov dl, byte ptr [ebp + 91]
    mov mov byte ptr [esp + 25], al
    mov mov byte ptr [esp + 24], cl
    add add esi, 0106D3200h
    lea lea eax, [esp + 92]
    lea lea ecx, [esp + 16]
    mov mov dword ptr [esp + 48], esi
    mov mov byte ptr [esp + 27], dl
    mov mov dword ptr [esp + 40], 0
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 20], ecx
    fst fst dword ptr [esp + 44]
    fmul fmul dword ptr [g_1019BDA8]
    fstp fstp dword ptr [esp + 36]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 44]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 28]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    mov mov ebx, dword ptr [esp + 28]
    fld fld dword ptr [g_1019BC78]
    mov mov edx, dword ptr [esp + 24]
    xor xor ecx, ecx
    test test ebx, ebx
    mov mov dword ptr [esp + 20], 0
    mov mov edi, 03F800000h
    jle sub_100402F7
    fld fld dword ptr [esp + 40]
    lea lea eax, [esi + 72]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [ebp + 104]
    fld fld dword ptr [esp + 64]
    fmul fmul st(1)
L4:
    fadd fadd dword ptr [ebp + 60]
    fstp fstp dword ptr [eax - 72]
    fld fld dword ptr [esp + 68]
    fmul fmul st(1)
    fadd fadd dword ptr [ebp + 64]
    fstp fstp dword ptr [eax - 68]
    fld fld dword ptr [esp + 72]
    fmul fmul st(1)
    fadd fadd dword ptr [ebp + 68]
    fstp fstp dword ptr [eax - 64]
    fstp fstp st(0)
    fld fld st(1)
    fmul fmul dword ptr [ebp + 104]
    fld fld dword ptr [esp + 76]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 72]
    fstp fstp dword ptr [eax - 72]
    fld fld dword ptr [esp + 80]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 68]
    fstp fstp dword ptr [eax - 68]
    fld fld dword ptr [esp + 84]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 64]
    fstp fstp dword ptr [eax - 64]
    mov mov dword ptr [eax - 60], edi
    mov mov dword ptr [eax - 36], edi
    fstp fstp st(0)
    mov mov dword ptr [eax - 44], edx
    fst fst dword ptr [eax - 40]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [ebp + 100]
    fld fld dword ptr [esp + 64]
    fmul fmul st(1)
    fadd fadd dword ptr [ebp + 72]
    fstp fstp dword ptr [eax - 8]
    fld fld dword ptr [esp + 68]
    fmul fmul st(1)
    fadd fadd dword ptr [ebp + 76]
    fstp fstp dword ptr [eax - 4]
    fld fld dword ptr [esp + 72]
    fmul fmul st(1)
    fadd fadd dword ptr [ebp + 80]
    fstp fstp dword ptr [eax]
    fstp fstp st(0)
    fld fld st(1)
    fmul fmul dword ptr [ebp + 100]
    fld fld dword ptr [esp + 76]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 8]
    fstp fstp dword ptr [eax - 8]
    fld fld dword ptr [esp + 80]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 4]
    fstp fstp dword ptr [eax - 4]
    fld fld dword ptr [esp + 84]
    fmul fmul st(1)
    fadd fadd dword ptr [eax]
    fstp fstp dword ptr [eax]
    mov mov dword ptr [eax + 4], edi
    mov mov dword ptr [eax + 28], 0
    fstp fstp st(0)
    mov mov dword ptr [eax + 20], edx
    fst fst dword ptr [eax + 24]
    fadd fadd dword ptr [esp + 44]
    fld fld st(1)
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 92]
    faddp faddp st(1)
    fxch fxch st(2)
    fmul fmul dword ptr [esp + 92]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 16]
    fsubp fsubp st(1)
    fxch fxch st(2)
    fstp fstp dword ptr [esp + 20]
    mov mov esi, dword ptr [g_1072D9D4]
    mov mov ebx, dword ptr [g_1072D9D0]
    mov mov edi, dword ptr [g_1072D9B0]
    add add esi, ecx
    mov mov word ptr [edi + ebx*2], si
    mov mov esi, dword ptr [g_1072D9D4]
    mov mov ebx, dword ptr [g_1072D9D0]
    mov mov edi, dword ptr [g_1072D9B0]
    lea lea esi, [ecx + esi + 1]
    mov mov word ptr [edi + ebx*2 + 2], si
    mov mov esi, dword ptr [g_1072D9D4]
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov ebx, dword ptr [g_1072D9B0]
    lea lea esi, [ecx + esi + 3]
    mov mov word ptr [ebx + edi*2 + 4], si
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov edi, dword ptr [g_1072D9D4]
    mov mov ebx, dword ptr [g_1072D9B0]
    add add esi, 3
    mov mov dword ptr [g_1072D9D0], esi
    lea lea edi, [ecx + edi + 3]
    mov mov word ptr [ebx + esi*2], di
    mov mov esi, dword ptr [g_1072D9D4]
    mov mov ebx, dword ptr [g_1072D9D0]
    mov mov edi, dword ptr [g_1072D9B0]
    lea lea esi, [ecx + esi + 2]
    mov mov word ptr [edi + ebx*2 + 2], si
    mov mov esi, dword ptr [g_1072D9D4]
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov ebx, dword ptr [g_1072D9B0]
    add add esi, ecx
    mov mov word ptr [ebx + edi*2 + 4], si
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov ebx, dword ptr [esp + 28]
    add add esi, 3
    add add ecx, 2
    add add eax, 080h
    cmp cmp ecx, ebx
    mov mov dword ptr [g_1072D9D0], esi
    mov mov edi, 03F800000h
    jl sub_100402F8
    mov mov esi, dword ptr [esp + 48]
    fstp fstp st(0)
    shl shl ecx, 6
    fstp fstp st(0)
    lea lea eax, [ecx + esi]
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esi + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esi + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [esi + 12]
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 32], edi
    mov mov dword ptr [eax + 36], edi
    mov mov dword ptr [eax + 28], edx
    mov mov ecx, dword ptr [esi + 64]
    mov mov dword ptr [eax + 64], ecx
    mov mov ecx, dword ptr [esi + 68]
    mov mov dword ptr [eax + 68], ecx
    mov mov ecx, dword ptr [esi + 72]
    mov mov dword ptr [eax + 72], ecx
    mov mov ecx, dword ptr [esi + 76]
    mov mov dword ptr [eax + 76], ecx
    mov mov dword ptr [eax + 96], edi
    pop pop edi
    mov mov dword ptr [eax + 100], 0
    mov mov dword ptr [eax + 92], edx
    mov mov edx, dword ptr [g_1072D9D4]
    pop pop esi
    lea lea eax, [edx + ebx + 2]
    pop pop ebp
    mov mov dword ptr [g_1072D9D4], eax
    pop pop ebx
    add add esp, 72
    ret ret
FUN_1003fdb0 ENDP
END
