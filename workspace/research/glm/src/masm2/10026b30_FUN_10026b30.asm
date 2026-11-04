.686
.MODEL FLAT, C
EXTRN sub_10026FEA:PROC
EXTRN sub_10026FF6:PROC
EXTRN sub_10027086:PROC
EXTRN sub_10027092:PROC
EXTRN sub_1002711A:PROC
EXTRN sub_10027126:PROC
EXTRN sub_100591C5:PROC
EXTRN sub_100F9118:PROC
EXTRN sub_100F912B:PROC
EXTRN sub_100F913E:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BF00:DWORD:DWORD
.CODE
FUN_10026b30 PROC
    sub sub esp, 64
    push push ebx
    push push ebp
    xor xor eax, eax
    push push esi
    push push edi
    mov mov dword ptr [esp + 56], 0
    mov mov dword ptr [esp + 60], 0
    mov mov dword ptr [esp + 64], 0
    mov mov dword ptr [esp + 24], eax
    xor xor ebp, ebp
    jmp L0
    xor xor eax, eax
    jmp L1
    lea lea ecx, [ecx]
    cmp cmp dword ptr [esp + 92], eax
    mov mov dword ptr [esp + 16], eax
    jle L5
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [esp + 88]
    xor xor ebx, ebx
    test test eax, eax
    mov mov dword ptr [esp + 28], ebx
    jle L3
    fild fild dword ptr [esp + 16]
    lea lea edi, [ebp + ebp*8 + 9]
    shl shl edi, 2
    fadd fadd dword ptr [g_1019BCB0]
    fadd fadd st(0), st(0)
    fidiv fidiv dword ptr [esp + 92]
    fsub fsub dword ptr [g_1019BC78]
    fild fild dword ptr [esp + 88]
    fstp fstp dword ptr [esp + 32]
    fld fld st(0)
    fmul fmul dword ptr [edi + 0101903C0h]
    fstp fstp dword ptr [esp + 36]
    fld fld st(0)
    fmul fmul dword ptr [edi + 0101903C4h]
    fstp fstp dword ptr [esp + 40]
    fmul fmul dword ptr [edi + 0101903C8h]
    fstp fstp dword ptr [esp + 48]
    jmp L2
    lea lea ecx, [ecx]
    fild fild dword ptr [esp + 28]
    lea lea esi, [esp + 68]
    fadd fadd dword ptr [g_1019BCB0]
    fadd fadd st(0), st(0)
    fdiv fdiv dword ptr [esp + 32]
    fsub fsub dword ptr [g_1019BC78]
    fld fld st(0)
    fmul fmul dword ptr [edi + 0101903B4h]
    fadd fadd dword ptr [edi + 0101903A8h]
    fld fld st(1)
    fmul fmul dword ptr [edi + 0101903B8h]
    fadd fadd dword ptr [edi + 0101903ACh]
    fstp fstp dword ptr [esp + 72]
    fxch fxch st(1)
    fmul fmul dword ptr [edi + 0101903BCh]
    fadd fadd dword ptr [edi + 0101903B0h]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [esp + 36]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 68]
    fstp fstp st(0)
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 48]
    fadd fadd dword ptr [esp + 76]
    fstp fstp dword ptr [esp + 76]
    call sub_100591C5
    mov mov eax, dword ptr [esp + 96]
    fstp fstp st(0)
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [esp + 72]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jnp L8
    mov mov eax, dword ptr [esp + 20]
    fld fld st(0)
    mov mov edx, dword ptr [esp + 84]
    add add eax, ebx
    lea lea ecx, [eax + eax*2]
    mov mov eax, dword ptr [edx + ebp*4]
    fmul fmul dword ptr [eax + ecx*4]
    lea lea eax, [eax + ecx*4]
    fadd fadd dword ptr [esp + 56]
    fstp fstp dword ptr [esp + 56]
    fld fld st(0)
    fmul fmul dword ptr [eax + 4]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fmul fmul dword ptr [eax + 8]
    mov mov eax, dword ptr [esp + 24]
    inc inc eax
    mov mov dword ptr [esp + 24], eax
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    jmp L9
    fstp fstp st(0)
    mov mov eax, dword ptr [esp + 88]
    inc inc ebx
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 28], ebx
    jl L7
    mov mov ecx, dword ptr [esp + 88]
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 16]
    add add edx, ecx
    mov mov ecx, dword ptr [esp + 92]
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], edx
    jl L6
    inc inc ebp
    cmp cmp ebp, 6
    jl L4
    fild fild dword ptr [esp + 24]
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld dword ptr [esp + 56]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 60]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 56]
    fld fld qword ptr [g_1019BF00]
    call sub_100F9118
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 60]
    fld fld qword ptr [g_1019BF00]
    call sub_100F912B
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 64]
    fld fld qword ptr [g_1019BF00]
    call sub_100F913E
    mov mov eax, dword ptr [esp + 100]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [eax]
    pop pop edi
    pop pop esi
    pop pop ebp
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 48]
    pop pop ebx
    fmul fmul dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 44]
    fmul fmul dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 40]
    fsub fsub dword ptr [g_1019BC78]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_10026FEA
    fld fld dword ptr [g_1019BC78]
    jmp sub_10026FF6
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BCAC]
    fstp fstp dword ptr [esp + 84]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [esp + 84]
    fadd fadd qword ptr [esp + 24]
    fistp fistp dword ptr [esp + 32]
    fld fld dword ptr [esp + 44]
    mov mov dl, byte ptr [esp + 32]
    fsub fsub dword ptr [g_1019BC78]
    mov mov ecx, dword ptr [esp + 88]
    mov mov byte ptr [ecx + 2], dl
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_10027086
    fld fld dword ptr [g_1019BC78]
    jmp sub_10027092
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [g_1019BCAC]
    fstp fstp dword ptr [esp + 84]
    fld fld qword ptr [g_1019BD80]
L8:
    fstp fstp qword ptr [esp + 32]
    fld fld dword ptr [esp + 84]
    fadd fadd qword ptr [esp + 32]
    fistp fistp dword ptr [esp + 88]
    fld fld dword ptr [esp + 48]
    mov mov al, byte ptr [esp + 88]
    fsub fsub dword ptr [g_1019BC78]
    mov mov byte ptr [ecx + 1], al
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_1002711A
    fld fld dword ptr [g_1019BC78]
    jmp sub_10027126
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BCAC]
    fstp fstp dword ptr [esp + 84]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 32]
    fld fld dword ptr [esp + 84]
    fadd fadd qword ptr [esp + 32]
    fistp fistp dword ptr [esp + 88]
    mov mov dl, byte ptr [esp + 88]
    mov mov byte ptr [ecx], dl
FUN_10026b30 ENDP
END
