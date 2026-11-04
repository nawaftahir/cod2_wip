.686
.MODEL FLAT, C
EXTRN sub_1000EC6F:PROC
EXTRN sub_1000EE2F:PROC
EXTRN sub_1000F045:PROC
EXTRN sub_1000FEC9:PROC
EXTRN sub_100F883A:PROC
EXTRN sub_1010AA0A:PROC
EXTRN sub_1010AA60:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCAC:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BE9C:DWORD
.CODE
FUN_1000fe90 PROC
    mov eax, 000001060h
    call sub_100F883A
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 80]
    push ebx
    fld qword ptr [g_1019BD80]
    push ebp
    mov ebp, dword ptr [esp + 00000106Ch]
    fstp qword ptr [esp + 80]
    fld qword ptr [g_1019BD80]
    push esi
    fstp qword ptr [esp + 76]
    push edi
    fld qword ptr [g_1019BD80]
    lea edi, [esp + 112]
    fstp qword ptr [esp + 104]
    mov dword ptr [esp + 28], 0
    lea esp, [esp]
L0:
    fild dword ptr [esp + 28]
    xor ebx, ebx
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    mov dword ptr [esp + 20], ebx
    fadd dword ptr [g_1019BCB0]
    fdiv dword ptr [g_1019BE9C]
    fadd st(0), st(0)
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 40]
    lea ebx, [ebx]
L1:
    fild dword ptr [esp + 20]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fadd dword ptr [g_1019BCB0]
    fdiv dword ptr [g_1019BE9C]
    fadd st(0), st(0)
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 40]
    faddp st(1)
    fstp dword ptr [esp + 20]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esp + 20]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jp L3
    mov eax, dword ptr [esp + 20]
    mov dword ptr [esp + 24], eax
    fld dword ptr [esp + 24]
    call sub_1010AA0A
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fstp dword ptr [esp + 24]
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L2
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 24]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 36]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 40]
    fstp dword ptr [esp + 40]
L2:
    mov dword ptr [esp + 32], 0
L3:
    fld dword ptr [esp + 32]
    call sub_1010AA60
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    lea esi, [esp + 64]
    fstp dword ptr [esp + 44]
    lea ecx, [esp + 36]
    call sub_1000FEC9
    fld dword ptr [esp + 64]
    fmul dword ptr [g_1019BCAC]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fadd qword ptr [esp + 96]
    fistp dword ptr [esp + 52]
    fld dword ptr [esp + 68]
    mov cl, byte ptr [esp + 52]
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [edi], cl
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fadd qword ptr [esp + 88]
    fistp dword ptr [esp + 60]
    fld dword ptr [esp + 72]
    mov dl, byte ptr [esp + 60]
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [edi + 1], dl
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fadd qword ptr [esp + 80]
    fistp dword ptr [esp + 56]
    fld dword ptr [esp + 76]
    mov al, byte ptr [esp + 56]
    fmul dword ptr [g_1019BCAC]
    mov byte ptr [edi + 2], al
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fadd qword ptr [esp + 104]
    fistp dword ptr [esp + 48]
    mov cl, byte ptr [esp + 48]
    mov byte ptr [edi + 3], cl
    add edi, 4
    inc ebx
    cmp ebx, 32
    mov dword ptr [esp + 20], ebx
    jl L1
    mov eax, dword ptr [esp + 28]
    inc eax
    cmp eax, 32
    mov dword ptr [esp + 28], eax
    jl L0
    push 0
    push 3
    push 1
    push 32
    push 32
    mov eax, 21
    mov ecx, ebp
    call sub_1000F045
    mov eax, dword ptr [ebp]
    add esp, 20
    cmp eax, 4
    jne L4
    lea edx, [esp + 112]
    push edx
    push 0
    push 21
    push ebp
    call sub_1000EE2F
    add esp, 16
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000001060h
    ret
L4:
    lea eax, [esp + 112]
    push eax
    push 21
    xor edi, edi
    xor ebx, ebx
    mov esi, ebp
    call sub_1000EC6F
    add esp, 8
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000001060h
    ret
FUN_1000fe90 ENDP
END
