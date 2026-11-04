.686
.MODEL FLAT, C
EXTRN sub_100271C3:PROC
EXTRN sub_1002754D:PROC
EXTRN sub_100275B0:PROC
EXTRN sub_1005AAF4:PROC
EXTRN sub_1005AF81:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB4:DWORD:DWORD
EXTRN EXTRN g_1019BDEC:DWORD:DWORD
EXTRN EXTRN g_1019BEF8:DWORD:DWORD
EXTRN EXTRN g_101CE618:DWORD:DWORD
.CODE
FUN_10027290 PROC
    sub sub esp, 76
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 92]
    push push edi
    lea lea edi, [esp + 52]
    call sub_100271C3
    fld fld dword ptr [esp + 64]
    fchs fchs
    xor xor ebx, ebx
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 68]
    fchs fchs
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [esp + 72]
    fchs fchs
    fstp fstp dword ptr [esp + 72]
    test test bl, 1
    je L0
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [esp + 16], eax
    mov mov eax, dword ptr [esp + 92]
    jmp L1
    mov mov eax, dword ptr [esp + 92]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [esp + 16], ecx
    test test bl, 2
    je L2
    mov mov edx, dword ptr [ebp + 4]
    mov mov dword ptr [esp + 20], edx
    jmp L3
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [esp + 20], ecx
    test test bl, 4
    je L4
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [esp + 24], edx
    jmp L5
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [esp + 24], eax
    lea lea ecx, [esp + 56]
L0:
    xor xor edx, edx
    nop nop
    test test ebx, ebx
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [ecx + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [ecx - 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 12]
    mov mov edi, dword ptr [esp + 12]
    je L7
    fld fld dword ptr [esp + 12]
    fcomp fcomp dword ptr [esp + edx + 40]
    fnstsw fnstsw ax
    test test ah, 65
L2:
    jne L9
    mov mov dword ptr [esp + edx + 40], edi
    test test ebx, ebx
    je L10
    fld fld dword ptr [esp + 12]
    fcomp fcomp dword ptr [esp + edx + 28]
    fnstsw fnstsw ax
    test test ah, 5
    jp L11
    mov mov dword ptr [esp + edx + 28], edi
    add add edx, 4
    add add ecx, 12
    cmp cmp edx, 12
    jne L8
    inc inc ebx
    cmp cmp ebx, 8
    jne L6
    mov mov ebx, dword ptr [g_101CE618]
    xor xor edi, edi
L5:
    lea lea ecx, [esp + 56]
    nop nop
    fld fld dword ptr [esp + edi*4 + 40]
    lea lea eax, [edi + 2]
    fsub fsub dword ptr [esp + edi*4 + 28]
    cdq cdq
    mov mov ebp, 3
    idiv idiv ebp
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [g_1019BCB4]
    fdiv fdiv dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BEF8]
    cmp cmp edx, 2
    fstp fstp dword ptr [esp + 12]
    je L12
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [ecx - 4]
    fstp fstp dword ptr [esi + edx*4 + 72]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [ecx]
    fstp fstp dword ptr [esi + edx*4 + 88]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [ecx + 4]
    fstp fstp dword ptr [esi + edx*4 + 104]
    fld fld dword ptr [esp + edi*4 + 28]
    fadd fadd dword ptr [esp + edi*4 + 40]
    fmul fmul dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BDEC]
    fstp fstp dword ptr [esi + edx*4 + 120]
    jmp sub_100275B0
    fld fld dword ptr [esp + edi*4 + 28]
    mov mov edx, dword ptr [ecx - 4]
    fadd fadd dword ptr [esp + edi*4 + 40]
    mov mov eax, dword ptr [ecx]
    mov mov dword ptr [esi + 80], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [esi + 96], eax
    mov mov dword ptr [esi + 112], edx
    fmul fmul dword ptr [g_1019BDEC]
    fstp fstp dword ptr [esi + 080h]
L10:
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [ebx + 8]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 80]
    fstp fstp dword ptr [esi + 80]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 96]
    fstp fstp dword ptr [esi + 96]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 112]
    fstp fstp dword ptr [esi + 112]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esi + 080h]
    fstp fstp dword ptr [esi + 080h]
    inc inc edi
    add add ecx, 12
    cmp cmp edi, 3
    jne sub_1002754D
    mov mov ecx, dword ptr [esp + 56]
    mov mov edx, dword ptr [esp + 60]
    xor xor eax, eax
    mov mov dword ptr [esi + 84], eax
    mov mov dword ptr [esi + 100], eax
    mov mov dword ptr [esi + 116], eax
    mov mov eax, dword ptr [esp + 52]
    mov mov ebp, 03F800000h
    mov mov dword ptr [esi + 084h], ebp
    mov mov dword ptr [esi + 12], eax
    mov mov eax, dword ptr [esp + 64]
    mov mov dword ptr [esi + 16], ecx
    mov mov ecx, dword ptr [esp + 68]
    mov mov dword ptr [esi + 20], edx
    mov mov edx, dword ptr [esp + 72]
    mov mov dword ptr [esi + 24], eax
    mov mov eax, dword ptr [esp + 76]
    mov mov dword ptr [esi + 28], ecx
    mov mov ecx, dword ptr [esp + 80]
    mov mov dword ptr [esi + 32], edx
    mov mov edx, dword ptr [esp + 84]
    mov mov dword ptr [esi + 36], eax
    mov mov dword ptr [esi + 40], ecx
    mov mov dword ptr [esi + 44], edx
    lea lea ebx, [esi + 088h]
    xor xor eax, eax
    mov mov dword ptr [esi], eax
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi + 8], eax
    mov mov ecx, 16
    mov mov edi, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, 03F000000h
    mov mov dword ptr [ebx + 40], eax
    mov mov dword ptr [ebx + 56], eax
    mov mov dword ptr [ebx], 03F7BFFFFh
    mov mov dword ptr [ebx + 20], 03F7BFFFFh
    mov mov dword ptr [ebx + 60], ebp
    lea lea edx, [esi + 0C8h]
    fld fld dword ptr [esi + 0C0h]
    lea lea ecx, [esi + 72]
    fchs fchs
    mov mov eax, ebx
    fstp fstp dword ptr [esi + 0148h]
    call sub_1005AAF4
    lea lea ecx, [esi + 0108h]
    mov mov eax, edx
    call sub_1005AF81
    pop pop edi
    xor xor eax, eax
    mov mov ecx, 080h
    mov mov dword ptr [esi + 68], ebp
    pop pop ebp
    mov mov dword ptr [esi + 48], eax
    mov mov dword ptr [esi + 52], eax
    mov mov dword ptr [esi + 56], ecx
    mov mov dword ptr [esi + 60], ecx
    mov mov dword ptr [esi + 64], eax
    pop pop ebx
    add add esp, 76
    ret ret
FUN_10027290 ENDP
END
