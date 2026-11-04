.686
.MODEL FLAT, C
EXTRN sub_1000EC6F:PROC
EXTRN sub_1000EE2F:PROC
EXTRN sub_1000F045:PROC
EXTRN sub_100100FD:PROC
EXTRN sub_100102ED:PROC
EXTRN sub_100F883A:PROC
EXTRN sub_1010AA0A:PROC
EXTRN sub_1010AA60:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BE9C:DWORD:DWORD
.CODE
FUN_1000fe90 PROC
    mov mov eax, 01060h
    call sub_100F883A
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 80]
    push push ebx
    fld fld qword ptr [g_1019BD80]
    push push ebp
    mov mov ebp, dword ptr [esp + 0106Ch]
    fstp fstp qword ptr [esp + 80]
    fld fld qword ptr [g_1019BD80]
    push push esi
    fstp fstp qword ptr [esp + 76]
    push push edi
    fld fld qword ptr [g_1019BD80]
L0:
    lea lea edi, [esp + 112]
    fstp fstp qword ptr [esp + 104]
    mov mov dword ptr [esp + 28], 0
    lea lea esp, [esp]
    fild fild dword ptr [esp + 28]
    xor xor ebx, ebx
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    mov mov dword ptr [esp + 20], ebx
    fadd fadd dword ptr [g_1019BCB0]
    fdiv fdiv dword ptr [g_1019BE9C]
    fadd fadd st(0), st(0)
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 40]
    lea lea ebx, [ebx]
    fild fild dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fadd fadd dword ptr [g_1019BCB0]
    fdiv fdiv dword ptr [g_1019BE9C]
    fadd fadd st(0), st(0)
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 36]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 40]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 32]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jp L1
    mov mov eax, dword ptr [esp + 20]
    mov mov dword ptr [esp + 24], eax
    fld fld dword ptr [esp + 24]
    call sub_1010AA0A
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 24]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L2
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 40]
    mov mov dword ptr [esp + 32], 0
    fld fld dword ptr [esp + 32]
    call sub_1010AA60
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    lea lea esi, [esp + 64]
    fstp fstp dword ptr [esp + 44]
    lea lea ecx, [esp + 36]
    call L0
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [g_1019BCAC]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fadd fadd qword ptr [esp + 96]
    fistp fistp dword ptr [esp + 52]
    fld fld dword ptr [esp + 68]
    mov mov cl, byte ptr [esp + 52]
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [edi], cl
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fadd fadd qword ptr [esp + 88]
    fistp fistp dword ptr [esp + 60]
    fld fld dword ptr [esp + 72]
    mov mov dl, byte ptr [esp + 60]
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [edi + 1], dl
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fadd fadd qword ptr [esp + 80]
    fistp fistp dword ptr [esp + 56]
    fld fld dword ptr [esp + 76]
    mov mov al, byte ptr [esp + 56]
    fmul fmul dword ptr [g_1019BCAC]
    mov mov byte ptr [edi + 2], al
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 20]
    fadd fadd qword ptr [esp + 104]
    fistp fistp dword ptr [esp + 48]
    mov mov cl, byte ptr [esp + 48]
    mov mov byte ptr [edi + 3], cl
    add add edi, 4
    inc inc ebx
    cmp cmp ebx, 32
    mov mov dword ptr [esp + 20], ebx
    jl sub_100100FD
    mov mov eax, dword ptr [esp + 28]
    inc inc eax
    cmp cmp eax, 32
    mov mov dword ptr [esp + 28], eax
    jl L3
    push push 0
    push push 3
    push push 1
    push push 32
    push push 32
    mov mov eax, 21
    mov mov ecx, ebp
L1:
    call sub_1000F045
    mov mov eax, dword ptr [ebp]
    add add esp, 20
    cmp cmp eax, 4
    jne sub_100102ED
    lea lea edx, [esp + 112]
    push push edx
    push push 0
    push push 21
    push push ebp
    call sub_1000EE2F
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 01060h
    ret ret
    lea lea eax, [esp + 112]
    push push eax
    push push 21
    xor xor edi, edi
    xor xor ebx, ebx
    mov mov esi, ebp
    call sub_1000EC6F
L3:
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 01060h
    ret ret
FUN_1000fe90 ENDP
END
