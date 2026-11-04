.686
.MODEL FLAT, C
EXTRN sub_10035090:PROC
EXTRN sub_10035097:PROC
EXTRN sub_100351F1:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BEE4:DWORD
EXTRN g_1019BEE8:DWORD
EXTRN g_1019BEEC:DWORD
EXTRN g_1019BEF0:DWORD
.CODE
FUN_100351a0 PROC
    sub esp, 16
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 32]
    push ebx
    mov ebx, dword ptr [esp + 44]
    push ebp
    mov ebp, dword ptr [esp + 44]
    push esi
    push edi
    xor edi, edi
    cmp ecx, ebp
    mov dword ptr [esp + 24], ebp
    mov dword ptr [esp + 28], ebx
    jne L0
    cmp edx, ebx
    je L3
L0:
    fld dword ptr [esp + 40]
    fsub dword ptr [esp + 36]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    mov eax, dword ptr [esp + 36]
    je L1
    mov eax, dword ptr [esp + 40]
L1:
    mov dword ptr [esp + 20], eax
    fld dword ptr [esp + 20]
    fcomp dword ptr [g_1019BEF0]
    fnstsw ax
    test ah, 65
    jne L2
    mov dword ptr [esp + 20], 03FB1DD1Eh
L2:
    fld dword ptr [esp + 20]
    mov esi, dword ptr [esp + 60]
    fmul dword ptr [esp + 20]
    push ebx
    fld dword ptr [esp + 40]
    push ebp
    fmul dword ptr [esp + 44]
    push edx
    mov edx, dword ptr [esp + 32]
    push edx
    fsub st(1)
    fsqrt
    fimul dword ptr [esp + 68]
    fidiv dword ptr [esp + 60]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 56]
    fsubrp st(1)
    fsqrt
    fimul dword ptr [esp + 72]
    fidiv dword ptr [esp + 64]
    fstp dword ptr [esp + 56]
    call sub_10035090
    add esp, 16
    mov edi, 1
L3:
    mov eax, dword ptr [esp + 60]
    mov esi, edi
    imul esi, esi, 000000098h
    add esi, eax
    jmp L5
L4:
    mov ebx, dword ptr [esp + 56]
    lea esp, [esp]
L5:
    fld dword ptr [esp + 36]
    fcomp dword ptr [g_1019BEEC]
    fnstsw ax
    test ah, 1
    je L6
    fld dword ptr [esp + 40]
    fcomp dword ptr [g_1019BEEC]
    fnstsw ax
    test ah, 1
    jne L14
L6:
    fld dword ptr [esp + 36]
    fsub dword ptr [esp + 40]
    fabs
    fcomp dword ptr [g_1019BEEC]
    fnstsw ax
    test ah, 5
    jp L7
    fld dword ptr [esp + 36]
    fadd dword ptr [esp + 40]
    fmul dword ptr [g_1019BCB0]
    fst dword ptr [esp + 20]
    fcomp dword ptr [g_1019BEF0]
    fnstsw ax
    test ah, 65
    jnp L13
L7:
    fld dword ptr [esp + 36]
    fcomp dword ptr [esp + 40]
    fnstsw ax
    test ah, 65
    jne L9
    fld dword ptr [esp + 36]
    fcomp dword ptr [g_1019BEE8]
    fnstsw ax
    test ah, 5
    jp L8
    mov eax, dword ptr [esp + 36]
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 36], 0
    xor ebx, ebx
    jmp L12
L8:
    fld dword ptr [esp + 36]
    mov dword ptr [esp + 20], 040CFED92h
    fmul dword ptr [esp + 36]
    xor ebx, ebx
    fsub dword ptr [g_1019BEE4]
    fsqrt
    fstp dword ptr [esp + 36]
    jmp L12
L9:
    fld dword ptr [esp + 40]
    fcomp dword ptr [g_1019BEE8]
    fnstsw ax
    test ah, 65
    jp L10
    mov ecx, dword ptr [esp + 40]
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 40], 0
    jmp L11
L10:
    fld dword ptr [esp + 40]
    mov dword ptr [esp + 20], 040CFED92h
    fmul dword ptr [esp + 40]
    fsub dword ptr [g_1019BEE4]
    fsqrt
    fstp dword ptr [esp + 40]
L11:
    mov ebx, 1
L12:
    mov eax, dword ptr [esp + 20]
    lea edx, [esp + 24]
    push edx
    push eax
    call sub_10035097
    add esp, 8
    inc edi
    add esi, 000000098h
    cmp edi, 16
    jl L4
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 16
    ret
L13:
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 60]
    mov esi, edi
    imul esi, esi, 000000098h
    push ebx
    push ebp
    push ebx
    push ecx
    add esi, eax
    mov ecx, ebp
    call sub_100351F1
    add esp, 16
    inc edi
L14:
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 16
    ret
FUN_100351a0 ENDP
END
