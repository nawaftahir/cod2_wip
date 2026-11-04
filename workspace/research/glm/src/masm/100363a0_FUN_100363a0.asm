.686
.MODEL FLAT, C
EXTRN sub_10035A5D:PROC
EXTRN sub_10035AD6:PROC
EXTRN sub_100361B6:PROC
EXTRN sub_100362BC:PROC
EXTRN sub_100364E1:PROC
EXTRN sub_1003659E:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD68:DWORD
EXTRN g_1019BDE0:DWORD
EXTRN g_1019BF10:DWORD
EXTRN g_1019BF14:DWORD
EXTRN g_1019BF18:DWORD
EXTRN g_101CE818:DWORD
.CODE
FUN_100363a0 PROC
    sub esp, 64
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 80]
    fld dword ptr [ebp]
    push esi
    fsub dword ptr [g_1019BDE0]
    push edi
    fstp dword ptr [esp + 52]
    fld qword ptr [g_1019BD68]
    fstp qword ptr [esp + 40]
    fld dword ptr [esp + 52]
    fsub qword ptr [esp + 40]
    fistp dword ptr [esp + 48]
    fld dword ptr [ebp]
    mov eax, dword ptr [esp + 48]
    fsub dword ptr [g_1019BDE0]
    sar eax, 5
    mov dword ptr [esp + 40], eax
    fmul dword ptr [g_1019BF18]
    fisub dword ptr [esp + 40]
    fstp dword ptr [esp + 60]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esp + 60]
    fstp dword ptr [esp + 56]
    fld dword ptr [ebp + 4]
    fsub dword ptr [g_1019BDE0]
    fstp dword ptr [esp + 52]
    fld qword ptr [g_1019BD68]
    fstp qword ptr [esp + 32]
    fld dword ptr [esp + 52]
    fsub qword ptr [esp + 32]
    fistp dword ptr [esp + 48]
    fld dword ptr [ebp + 4]
    mov ecx, dword ptr [esp + 48]
    fsub dword ptr [g_1019BDE0]
    sar ecx, 5
    mov dword ptr [esp + 48], ecx
    fmul dword ptr [g_1019BF18]
    fisub dword ptr [esp + 48]
    fstp dword ptr [esp + 68]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esp + 68]
    fstp dword ptr [esp + 64]
    fld dword ptr [ebp + 8]
    fsub dword ptr [g_1019BDE0]
    fstp dword ptr [esp + 52]
    fld qword ptr [g_1019BD68]
    fstp qword ptr [esp + 24]
    fld dword ptr [esp + 52]
    fsub qword ptr [esp + 24]
    fistp dword ptr [esp + 32]
    fld dword ptr [ebp + 8]
    mov edx, dword ptr [esp + 32]
    fsub dword ptr [g_1019BDE0]
    mov esi, dword ptr [g_101CE818]
    mov bl, byte ptr [esi + 8]
    sar edx, 6
    test bl, bl
    fmul dword ptr [g_1019BF14]
    mov dword ptr [esp + 52], edx
    fisub dword ptr [esp + 52]
    fstp dword ptr [esp + 76]
    fld dword ptr [g_1019BC78]
    fsub dword ptr [esp + 76]
    fstp dword ptr [esp + 72]
    je L0
    call sub_10035AD6
    mov eax, ebp
    call sub_10035A5D
L0:
    mov edi, dword ptr [esp + 92]
    xor eax, eax
    mov ecx, 24
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 20], eax
    xor ebx, ebx
    jmp L2
L1:
    mov ebp, dword ptr [esp + 88]
    lea ebx, [ebx]
L2:
    mov eax, dword ptr [esp + 52]
    mov ecx, dword ptr [esp + 48]
    push ebp
    mov ebp, dword ptr [esp + 44]
    mov edx, ebx
    and edx, 1
    mov edi, ebx
    mov esi, ebx
    mov dword ptr [esp + 36], edx
    sar edi, 2
    sar esi, 1
    add edx, ebp
    mov ebp, dword ptr [esp + 88]
    and edi, 1
    and esi, 1
    push ebx
    add eax, edi
    add ecx, esi
    push ebp
    call sub_100361B6
    mov ebp, eax
    add esp, 12
    test ebp, ebp
    je L3
    fld dword ptr [esp + esi*4 + 64]
    mov edx, dword ptr [esp + 32]
    fmul dword ptr [esp + edi*4 + 72]
    mov edi, dword ptr [esp + 92]
    fmul dword ptr [esp + edx*4 + 56]
    mov edx, dword ptr [esp + 84]
    fst dword ptr [esp + 32]
    mov eax, dword ptr [esp + 32]
    fadd dword ptr [esp + 24]
    push eax
    movzx eax, word ptr [ebp + 6]
    lea ecx, [eax + eax*2]
    mov eax, dword ptr [edx + 12]
    fstp dword ptr [esp + 28]
    lea ecx, [eax + ecx*8]
    mov eax, edi
    call sub_100362BC
    mov al, byte ptr [ebp + 4]
    add esp, 4
    test al, 1
    je L4
    fld dword ptr [esp + 32]
    fadd dword ptr [esp + 20]
    fstp dword ptr [esp + 20]
    jmp L4
L3:
    mov edi, dword ptr [esp + 92]
L4:
    inc ebx
    cmp ebx, 8
    jl L1
    fld dword ptr [esp + 24]
    fcomp dword ptr [g_1019BF10]
    fnstsw ax
    test ah, 5
    jp L12
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jp L11
    fld dword ptr [esp + 60]
    fcomp dword ptr [g_1019BCB0]
    fnstsw ax
    test ah, 65
    jne L5
    mov eax, 1
    jmp L6
L5:
    xor eax, eax
L6:
    fld dword ptr [esp + 68]
    mov ecx, dword ptr [esp + 40]
    fcomp dword ptr [g_1019BCB0]
    add ecx, eax
    fnstsw ax
    test ah, 65
    jne L7
    mov eax, 1
    jmp L8
L7:
    xor eax, eax
L8:
    fld dword ptr [esp + 76]
    mov edx, dword ptr [esp + 48]
    fcomp dword ptr [g_1019BCB0]
    add edx, eax
    fnstsw ax
    test ah, 65
    jne L9
    mov eax, 1
    jmp L10
L9:
    xor eax, eax
L10:
    mov esi, dword ptr [esp + 52]
    add eax, esi
    mov esi, dword ptr [esp + 84]
    push edi
    push eax
    push ecx
    lea ebx, [esp + 32]
    call sub_1003659E
    fld dword ptr [esp + 32]
    add esp, 12
    test al, al
    jne L13
    xor ecx, ecx
    mov dword ptr [edi], ecx
    mov dword ptr [edi + 8], ecx
    mov eax, 03F800000h
    mov dword ptr [edi + 4], eax
    mov dword ptr [edi + 12], eax
    mov dword ptr [edi + 16], ecx
    mov dword ptr [edi + 20], eax
    mov dword ptr [edi + 24], ecx
    mov dword ptr [edi + 28], eax
    mov dword ptr [edi + 32], ecx
    mov dword ptr [edi + 36], ecx
    mov dword ptr [edi + 40], eax
    mov dword ptr [edi + 44], eax
    mov dword ptr [edi + 48], ecx
    mov dword ptr [edi + 52], ecx
    mov dword ptr [edi + 56], eax
    mov dword ptr [edi + 60], eax
    mov dword ptr [edi + 64], ecx
    mov dword ptr [edi + 68], ecx
    mov dword ptr [edi + 72], ecx
    mov dword ptr [edi + 76], ecx
    mov dword ptr [edi + 80], eax
    mov dword ptr [edi + 84], eax
    mov dword ptr [edi + 88], eax
    mov dword ptr [edi + 92], eax
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 64
    ret
L11:
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 24]
    fst dword ptr [esp + 88]
    fmul dword ptr [esp + 20]
    mov eax, dword ptr [esp + 88]
    push eax
    mov eax, edi
    fstp dword ptr [esp + 24]
    call sub_100364E1
    add esp, 4
L12:
    fld dword ptr [esp + 20]
L13:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 64
    ret
FUN_100363a0 ENDP
END
