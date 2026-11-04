.686
.MODEL FLAT, C
EXTRN sub_10035090:PROC
EXTRN sub_10035097:PROC
EXTRN sub_100353DD:PROC
EXTRN sub_10035452:PROC
EXTRN sub_10035454:PROC
EXTRN sub_10035463:PROC
EXTRN sub_100354AB:PROC
EXTRN sub_100354C4:PROC
EXTRN sub_100354CC:PROC
EXTRN sub_100354DC:PROC
EXTRN sub_100354EC:PROC
EXTRN sub_1003550A:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BEE4:DWORD:DWORD
EXTRN EXTRN g_1019BEE8:DWORD:DWORD
EXTRN EXTRN g_1019BEEC:DWORD:DWORD
EXTRN EXTRN g_1019BEF0:DWORD:DWORD
.CODE
FUN_100351a0 PROC
    sub sub esp, 16
    mov mov ecx, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 32]
    push push ebx
    mov mov ebx, dword ptr [esp + 44]
    push push ebp
    mov mov ebp, dword ptr [esp + 44]
    push push esi
    push push edi
    xor xor edi, edi
    cmp cmp ecx, ebp
    mov mov dword ptr [esp + 24], ebp
    mov mov dword ptr [esp + 28], ebx
    jne L1
    cmp cmp edx, ebx
    je L4
    fld fld dword ptr [esp + 40]
    fsub fsub dword ptr [esp + 36]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    mov mov eax, dword ptr [esp + 36]
    je L2
    mov mov eax, dword ptr [esp + 40]
    mov mov dword ptr [esp + 20], eax
    fld fld dword ptr [esp + 20]
L1:
    fcomp fcomp dword ptr [g_1019BEF0]
    fnstsw fnstsw ax
    test test ah, 65
    jne L3
    mov mov dword ptr [esp + 20], 03FB1DD1Eh
    fld fld dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 20]
    push push ebx
    fld fld dword ptr [esp + 40]
    push push ebp
    fmul fmul dword ptr [esp + 44]
    push push edx
    mov mov edx, dword ptr [esp + 32]
    push push edx
    fsub fsub st(1)
    fsqrt fsqrt
    fimul fimul dword ptr [esp + 68]
    fidiv fidiv dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 56]
    fsubrp fsubrp st(1)
    fsqrt fsqrt
    fimul fimul dword ptr [esp + 72]
    fidiv fidiv dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 56]
    call sub_10035090
    add add esp, 16
    mov mov edi, 1
    mov mov eax, dword ptr [esp + 60]
    mov mov esi, edi
    imul imul esi, esi, 098h
    add add esi, eax
L3:
    jmp L5
    mov mov ebx, dword ptr [esp + 56]
    lea lea esp, [esp]
    fld fld dword ptr [esp + 36]
    fcomp fcomp dword ptr [g_1019BEEC]
    fnstsw fnstsw ax
    test test ah, 1
    je L6
    fld fld dword ptr [esp + 40]
L4:
    fcomp fcomp dword ptr [g_1019BEEC]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_100354AB
    fld fld dword ptr [esp + 36]
    fsub fsub dword ptr [esp + 40]
    fabs fabs
    fcomp fcomp dword ptr [g_1019BEEC]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100353DD
    fld fld dword ptr [esp + 36]
    fadd fadd dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BCB0]
    fst fst dword ptr [esp + 20]
    fcomp fcomp dword ptr [g_1019BEF0]
    fnstsw fnstsw ax
    test test ah, 65
    jnp sub_100354C4
    fld fld dword ptr [esp + 36]
    fcomp fcomp dword ptr [esp + 40]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10035463
    fld fld dword ptr [esp + 36]
    fcomp fcomp dword ptr [g_1019BEE8]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10035454
    mov mov eax, dword ptr [esp + 36]
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 36], 0
    xor xor ebx, ebx
    jmp sub_100354CC
    fld fld dword ptr [esp + 36]
    mov mov dword ptr [esp + 20], 040CFED92h
    fmul fmul dword ptr [esp + 36]
    xor xor ebx, ebx
    fsub fsub dword ptr [g_1019BEE4]
    fsqrt fsqrt
    fstp fstp dword ptr [esp + 36]
    jmp sub_100354EC
    fld fld dword ptr [esp + 40]
    fcomp fcomp dword ptr [g_1019BEE8]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_100354DC
    mov mov ecx, dword ptr [esp + 40]
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 40], 0
    jmp sub_1003550A
    fld fld dword ptr [esp + 40]
    mov mov dword ptr [esp + 20], 040CFED92h
    fmul fmul dword ptr [esp + 40]
    fsub fsub dword ptr [g_1019BEE4]
    fsqrt fsqrt
    fstp fstp dword ptr [esp + 40]
    mov mov ebx, 1
    mov mov eax, dword ptr [esp + 20]
    lea lea edx, [esp + 24]
    push push edx
    push push eax
    call sub_10035097
L6:
    add add esp, 8
    inc inc edi
    add add esi, 098h
    cmp cmp edi, 16
    jl sub_10035452
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 16
    ret ret
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 60]
    mov mov esi, edi
    imul imul esi, esi, 098h
    push push ebx
    push push ebp
    push push ebx
    push push ecx
    add add esi, eax
    mov mov ecx, ebp
    call L0
    add add esp, 16
    inc inc edi
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 16
    ret ret
FUN_100351a0 ENDP
END
