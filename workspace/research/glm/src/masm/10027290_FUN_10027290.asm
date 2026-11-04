.686
.MODEL FLAT, C
EXTRN sub_100271C3:PROC
EXTRN sub_1005AAF4:PROC
EXTRN sub_1005AF81:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB4:DWORD
EXTRN g_1019BDEC:DWORD
EXTRN g_1019BEF8:DWORD
EXTRN g_101CE618:DWORD
.CODE
FUN_10027290 PROC
    sub esp, 76
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 92]
    push edi
    lea edi, [esp + 52]
    call sub_100271C3
    fld dword ptr [esp + 64]
    fchs
    xor ebx, ebx
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 68]
    fchs
    fstp dword ptr [esp + 68]
    fld dword ptr [esp + 72]
    fchs
    fstp dword ptr [esp + 72]
L0:
    test bl, 1
    je L1
    mov eax, dword ptr [ebp]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 92]
    jmp L2
L1:
    mov eax, dword ptr [esp + 92]
    mov ecx, dword ptr [eax]
    mov dword ptr [esp + 16], ecx
L2:
    test bl, 2
    je L3
    mov edx, dword ptr [ebp + 4]
    mov dword ptr [esp + 20], edx
    jmp L4
L3:
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [esp + 20], ecx
L4:
    test bl, 4
    je L5
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [esp + 24], edx
    jmp L6
L5:
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 24], eax
L6:
    lea ecx, [esp + 56]
    xor edx, edx
    nop
L7:
    test ebx, ebx
    fld dword ptr [esp + 24]
    fmul dword ptr [ecx + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [ecx - 4]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [ecx]
    faddp st(1)
    fstp dword ptr [esp + 12]
    mov edi, dword ptr [esp + 12]
    je L8
    fld dword ptr [esp + 12]
    fcomp dword ptr [esp + edx + 40]
    fnstsw ax
    test ah, 65
    jne L9
L8:
    mov dword ptr [esp + edx + 40], edi
L9:
    test ebx, ebx
    je L10
    fld dword ptr [esp + 12]
    fcomp dword ptr [esp + edx + 28]
    fnstsw ax
    test ah, 5
    jp L11
L10:
    mov dword ptr [esp + edx + 28], edi
L11:
    add edx, 4
    add ecx, 12
    cmp edx, 12
    jne L7
    inc ebx
    cmp ebx, 8
    jne L0
    mov ebx, dword ptr [g_101CE618]
    xor edi, edi
    lea ecx, [esp + 56]
    nop
L12:
    fld dword ptr [esp + edi*4 + 40]
    lea eax, [edi + 2]
    fsub dword ptr [esp + edi*4 + 28]
    cdq
    mov ebp, 3
    idiv ebp
    fstp dword ptr [esp + 12]
    fld dword ptr [g_1019BCB4]
    fdiv dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    fmul dword ptr [g_1019BEF8]
    cmp edx, 2
    fstp dword ptr [esp + 12]
    je L13
    fld dword ptr [esp + 12]
    fmul dword ptr [ecx - 4]
    fstp dword ptr [esi + edx*4 + 72]
    fld dword ptr [esp + 12]
    fmul dword ptr [ecx]
    fstp dword ptr [esi + edx*4 + 88]
    fld dword ptr [esp + 12]
    fmul dword ptr [ecx + 4]
    fstp dword ptr [esi + edx*4 + 104]
    fld dword ptr [esp + edi*4 + 28]
    fadd dword ptr [esp + edi*4 + 40]
    fmul dword ptr [esp + 12]
    fmul dword ptr [g_1019BDEC]
    fstp dword ptr [esi + edx*4 + 120]
    jmp L14
L13:
    fld dword ptr [esp + edi*4 + 28]
    mov edx, dword ptr [ecx - 4]
    fadd dword ptr [esp + edi*4 + 40]
    mov eax, dword ptr [ecx]
    mov dword ptr [esi + 80], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [esi + 96], eax
    mov dword ptr [esi + 112], edx
    fmul dword ptr [g_1019BDEC]
    fstp dword ptr [esi + 000000080h]
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [ebx + 8]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 80]
    fstp dword ptr [esi + 80]
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 96]
    fstp dword ptr [esi + 96]
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 112]
    fstp dword ptr [esi + 112]
    fld dword ptr [esp + 12]
    fmul dword ptr [esi + 000000080h]
    fstp dword ptr [esi + 000000080h]
L14:
    inc edi
    add ecx, 12
    cmp edi, 3
    jne L12
    mov ecx, dword ptr [esp + 56]
    mov edx, dword ptr [esp + 60]
    xor eax, eax
    mov dword ptr [esi + 84], eax
    mov dword ptr [esi + 100], eax
    mov dword ptr [esi + 116], eax
    mov eax, dword ptr [esp + 52]
    mov ebp, 03F800000h
    mov dword ptr [esi + 000000084h], ebp
    mov dword ptr [esi + 12], eax
    mov eax, dword ptr [esp + 64]
    mov dword ptr [esi + 16], ecx
    mov ecx, dword ptr [esp + 68]
    mov dword ptr [esi + 20], edx
    mov edx, dword ptr [esp + 72]
    mov dword ptr [esi + 24], eax
    mov eax, dword ptr [esp + 76]
    mov dword ptr [esi + 28], ecx
    mov ecx, dword ptr [esp + 80]
    mov dword ptr [esi + 32], edx
    mov edx, dword ptr [esp + 84]
    mov dword ptr [esi + 36], eax
    mov dword ptr [esi + 40], ecx
    mov dword ptr [esi + 44], edx
    lea ebx, [esi + 000000088h]
    xor eax, eax
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], eax
    mov ecx, 16
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
    mov eax, 03F000000h
    mov dword ptr [ebx + 40], eax
    mov dword ptr [ebx + 56], eax
    mov dword ptr [ebx], 03F7BFFFFh
    mov dword ptr [ebx + 20], 03F7BFFFFh
    mov dword ptr [ebx + 60], ebp
    lea edx, [esi + 0000000C8h]
    fld dword ptr [esi + 0000000C0h]
    lea ecx, [esi + 72]
    fchs
    mov eax, ebx
    fstp dword ptr [esi + 000000148h]
    call sub_1005AAF4
    lea ecx, [esi + 000000108h]
    mov eax, edx
    call sub_1005AF81
    pop edi
    xor eax, eax
    mov ecx, 000000080h
    mov dword ptr [esi + 68], ebp
    pop ebp
    mov dword ptr [esi + 48], eax
    mov dword ptr [esi + 52], eax
    mov dword ptr [esi + 56], ecx
    mov dword ptr [esi + 60], ecx
    mov dword ptr [esi + 64], eax
    pop ebx
    add esp, 76
    ret
FUN_10027290 ENDP
END
