.686
.MODEL FLAT, C
EXTRN sub_10026C53:PROC
EXTRN sub_100591A7:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB0:DWORD
.CODE
FUN_10026e60 PROC
    sub esp, 36
    push ebx
    push ebp
    push esi
    push edi
    xor edi, edi
    mov dword ptr [esp + 24], edi
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [esp + 64]
    xor ebx, ebx
    cmp eax, ebx
    mov dword ptr [esp + 20], ebx
    jle L4
    mov ecx, dword ptr [esp + 60]
    mov dword ptr [esp + 32], ebx
    lea ebx, [ebx]
L1:
    xor ebp, ebp
    test ecx, ecx
    mov dword ptr [esp + 28], ebp
    jle L3
    fild dword ptr [esp + 20]
    lea edi, [edi + edi*8 + 9]
    shl edi, 2
    fadd dword ptr [g_1019BCB0]
    fadd st(0), st(0)
    fidiv dword ptr [esp + 64]
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 16]
    fild dword ptr [esp + 60]
    fstp dword ptr [esp + 36]
    jmp L2
    lea esp, [esp]
L2:
    fild dword ptr [esp + 28]
    lea esi, [esp + 40]
    fadd dword ptr [g_1019BCB0]
    fadd st(0), st(0)
    fdiv dword ptr [esp + 36]
    fsub dword ptr [g_1019BC78]
    fld st(0)
    fmul dword ptr [edi + 0101903B4h]
    fadd dword ptr [edi + 0101903A8h]
    fld st(1)
    fmul dword ptr [edi + 0101903B8h]
    fadd dword ptr [edi + 0101903ACh]
    fstp dword ptr [esp + 44]
    fxch st(1)
    fmul dword ptr [edi + 0101903BCh]
    fadd dword ptr [edi + 0101903B0h]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + 0101903C0h]
    fadd st(1)
    fstp dword ptr [esp + 40]
    fstp st(0)
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + 0101903C4h]
    fadd dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + 0101903C8h]
    fadd dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    call sub_100591A7
    mov eax, dword ptr [esp + 72]
    fstp st(0)
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esp + 68]
    add edx, ebx
    push edx
    mov edx, dword ptr [esp + 68]
    push eax
    mov eax, dword ptr [esp + 64]
    mov ecx, esi
    mov esi, dword ptr [esp + 68]
    push ecx
    push edx
    push esi
    push eax
    call sub_10026C53
    add esp, 24
    inc ebp
    add ebx, 4
    cmp ebp, esi
    mov dword ptr [esp + 28], ebp
    jl L2
    mov edi, dword ptr [esp + 24]
    mov ecx, esi
L3:
    mov ebx, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 20]
    lea eax, [ecx*4]
    add ebx, eax
    mov eax, dword ptr [esp + 64]
    inc edx
    cmp edx, eax
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 32], ebx
    jl L1
L4:
    inc edi
    cmp edi, 6
    mov dword ptr [esp + 24], edi
    jl L0
    pop edi
FUN_10026e60 ENDP
END
