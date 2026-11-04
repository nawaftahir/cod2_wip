.686
.MODEL FLAT, C
EXTRN sub_100591C5:PROC
EXTRN sub_100F9118:PROC
EXTRN sub_100F912B:PROC
EXTRN sub_100F913E:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCAC:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BF00:DWORD
.CODE
FUN_10026b30 PROC
    sub esp, 64
    push ebx
    push ebp
    xor eax, eax
    push esi
    push edi
    mov dword ptr [esp + 56], 0
    mov dword ptr [esp + 60], 0
    mov dword ptr [esp + 64], 0
    mov dword ptr [esp + 24], eax
    xor ebp, ebp
    jmp L1
L0:
    xor eax, eax
    jmp L1
    lea ecx, [ecx]
L1:
    cmp dword ptr [esp + 92], eax
    mov dword ptr [esp + 16], eax
    jle L7
    mov dword ptr [esp + 20], eax
L2:
    mov eax, dword ptr [esp + 88]
    xor ebx, ebx
    test eax, eax
    mov dword ptr [esp + 28], ebx
    jle L6
    fild dword ptr [esp + 16]
    lea edi, [ebp + ebp*8 + 9]
    shl edi, 2
    fadd dword ptr [g_1019BCB0]
    fadd st(0), st(0)
    fidiv dword ptr [esp + 92]
    fsub dword ptr [g_1019BC78]
    fild dword ptr [esp + 88]
    fstp dword ptr [esp + 32]
    fld st(0)
    fmul dword ptr [edi + 0101903C0h]
    fstp dword ptr [esp + 36]
    fld st(0)
    fmul dword ptr [edi + 0101903C4h]
    fstp dword ptr [esp + 40]
    fmul dword ptr [edi + 0101903C8h]
    fstp dword ptr [esp + 48]
    jmp L3
    lea ecx, [ecx]
L3:
    fild dword ptr [esp + 28]
    lea esi, [esp + 68]
    fadd dword ptr [g_1019BCB0]
    fadd st(0), st(0)
    fdiv dword ptr [esp + 32]
    fsub dword ptr [g_1019BC78]
    fld st(0)
    fmul dword ptr [edi + 0101903B4h]
    fadd dword ptr [edi + 0101903A8h]
    fld st(1)
    fmul dword ptr [edi + 0101903B8h]
    fadd dword ptr [edi + 0101903ACh]
    fstp dword ptr [esp + 72]
    fxch st(1)
    fmul dword ptr [edi + 0101903BCh]
    fadd dword ptr [edi + 0101903B0h]
    fstp dword ptr [esp + 76]
    fld dword ptr [esp + 36]
    fadd st(1)
    fstp dword ptr [esp + 68]
    fstp st(0)
    fld dword ptr [esp + 40]
    fadd dword ptr [esp + 72]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 48]
    fadd dword ptr [esp + 76]
    fstp dword ptr [esp + 76]
    call sub_100591C5
    mov eax, dword ptr [esp + 96]
    fstp st(0)
    fld dword ptr [esp + 76]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 72]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 68]
    fmul dword ptr [eax]
    faddp st(1)
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jnp L4
    mov eax, dword ptr [esp + 20]
    fld st(0)
    mov edx, dword ptr [esp + 84]
    add eax, ebx
    lea ecx, [eax + eax*2]
    mov eax, dword ptr [edx + ebp*4]
    fmul dword ptr [eax + ecx*4]
    lea eax, [eax + ecx*4]
    fadd dword ptr [esp + 56]
    fstp dword ptr [esp + 56]
    fld st(0)
    fmul dword ptr [eax + 4]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fmul dword ptr [eax + 8]
    mov eax, dword ptr [esp + 24]
    inc eax
    mov dword ptr [esp + 24], eax
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    jmp L5
L4:
    fstp st(0)
L5:
    mov eax, dword ptr [esp + 88]
    inc ebx
    cmp ebx, eax
    mov dword ptr [esp + 28], ebx
    jl L3
L6:
    mov ecx, dword ptr [esp + 88]
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 16]
    add edx, ecx
    mov ecx, dword ptr [esp + 92]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], edx
    jl L2
L7:
    inc ebp
    cmp ebp, 6
    jl L0
    fild dword ptr [esp + 24]
    fdivr dword ptr [g_1019BC78]
    fld dword ptr [esp + 56]
    fmul st(1)
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 60]
    fmul st(1)
    fstp dword ptr [esp + 60]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 56]
    fld qword ptr [g_1019BF00]
    call sub_100F9118
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 60]
    fld qword ptr [g_1019BF00]
    call sub_100F912B
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 64]
    fld qword ptr [g_1019BF00]
    call sub_100F913E
    mov eax, dword ptr [esp + 100]
    fld dword ptr [esp + 56]
    fmul dword ptr [eax]
    pop edi
    pop esi
    pop ebp
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 48]
    pop ebx
    fmul dword ptr [eax + 4]
    fstp dword ptr [esp + 44]
    fmul dword ptr [eax + 8]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 40]
    fsub dword ptr [g_1019BC78]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    jne L8
    fld dword ptr [g_1019BC78]
    jmp L9
L8:
    fld dword ptr [esp + 40]
L9:
    fmul dword ptr [g_1019BCAC]
    fstp dword ptr [esp + 84]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 24]
    fld dword ptr [esp + 84]
    fadd qword ptr [esp + 24]
    fistp dword ptr [esp + 32]
    fld dword ptr [esp + 44]
    mov dl, byte ptr [esp + 32]
    fsub dword ptr [g_1019BC78]
    mov ecx, dword ptr [esp + 88]
    mov byte ptr [ecx + 2], dl
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    jne L10
    fld dword ptr [g_1019BC78]
    jmp L11
L10:
    fld dword ptr [esp + 44]
L11:
    fmul dword ptr [g_1019BCAC]
    fstp dword ptr [esp + 84]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 32]
    fld dword ptr [esp + 84]
    fadd qword ptr [esp + 32]
    fistp dword ptr [esp + 88]
    fld dword ptr [esp + 48]
    mov al, byte ptr [esp + 88]
    fsub dword ptr [g_1019BC78]
    mov byte ptr [ecx + 1], al
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    jne L12
    fld dword ptr [g_1019BC78]
    jmp L13
L12:
    fld dword ptr [esp + 48]
L13:
    fmul dword ptr [g_1019BCAC]
    fstp dword ptr [esp + 84]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 32]
    fld dword ptr [esp + 84]
    fadd qword ptr [esp + 32]
    fistp dword ptr [esp + 88]
    mov dl, byte ptr [esp + 88]
    mov byte ptr [ecx], dl
FUN_10026b30 ENDP
END
