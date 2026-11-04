.686
.MODEL FLAT, C
EXTRN sub_10026C53:PROC
EXTRN sub_10026FDA:PROC
EXTRN sub_10026FE0:PROC
EXTRN sub_10026FE4:PROC
EXTRN sub_10026FF2:PROC
EXTRN sub_10027006:PROC
EXTRN sub_100591A7:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
.CODE
FUN_10026e60 PROC
    sub sub esp, 36
    push push ebx
    push push ebp
    push push esi
    push push edi
    xor xor edi, edi
    mov mov dword ptr [esp + 24], edi
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 64]
    xor xor ebx, ebx
    cmp cmp eax, ebx
    mov mov dword ptr [esp + 20], ebx
    jle sub_10026FE4
    mov mov ecx, dword ptr [esp + 60]
    mov mov dword ptr [esp + 32], ebx
    lea lea ebx, [ebx]
    xor xor ebp, ebp
    test test ecx, ecx
    mov mov dword ptr [esp + 28], ebp
    jle sub_10026FDA
    fild fild dword ptr [esp + 20]
    lea lea edi, [edi + edi*8 + 9]
    shl shl edi, 2
    fadd fadd dword ptr [g_1019BCB0]
    fadd fadd st(0), st(0)
    fidiv fidiv dword ptr [esp + 64]
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 16]
    fild fild dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 36]
    jmp L0
    lea lea esp, [esp]
    fild fild dword ptr [esp + 28]
    lea lea esi, [esp + 40]
    fadd fadd dword ptr [g_1019BCB0]
    fadd fadd st(0), st(0)
    fdiv fdiv dword ptr [esp + 36]
    fsub fsub dword ptr [g_1019BC78]
    fld fld st(0)
    fmul fmul dword ptr [edi + 0101903B4h]
    fadd fadd dword ptr [edi + 0101903A8h]
    fld fld st(1)
    fmul fmul dword ptr [edi + 0101903B8h]
    fadd fadd dword ptr [edi + 0101903ACh]
    fstp fstp dword ptr [esp + 44]
    fxch fxch st(1)
    fmul fmul dword ptr [edi + 0101903BCh]
    fadd fadd dword ptr [edi + 0101903B0h]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + 0101903C0h]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 40]
    fstp fstp st(0)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + 0101903C4h]
    fadd fadd dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + 0101903C8h]
    fadd fadd dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 48]
    call sub_100591A7
    mov mov eax, dword ptr [esp + 72]
    fstp fstp st(0)
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esp + 68]
    add add edx, ebx
    push push edx
    mov mov edx, dword ptr [esp + 68]
    push push eax
    mov mov eax, dword ptr [esp + 64]
    mov mov ecx, esi
    mov mov esi, dword ptr [esp + 68]
    push push ecx
    push push edx
    push push esi
    push push eax
    call sub_10026C53
    add add esp, 24
    inc inc ebp
    add add ebx, 4
    cmp cmp ebp, esi
    mov mov dword ptr [esp + 28], ebp
    jl sub_10027006
    mov mov edi, dword ptr [esp + 24]
    mov mov ecx, esi
    mov mov ebx, dword ptr [esp + 32]
    mov mov edx, dword ptr [esp + 20]
    lea lea eax, [ecx*4]
    add add ebx, eax
    mov mov eax, dword ptr [esp + 64]
    inc inc edx
    cmp cmp edx, eax
    mov mov dword ptr [esp + 20], edx
    mov mov dword ptr [esp + 32], ebx
    jl sub_10026FF2
    inc inc edi
    cmp cmp edi, 6
    mov mov dword ptr [esp + 24], edi
    jl sub_10026FE0
    pop pop edi
FUN_10026e60 ENDP
END
