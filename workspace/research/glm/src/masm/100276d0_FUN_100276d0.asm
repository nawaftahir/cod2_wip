.686
.MODEL FLAT, C
EXTRN sub_1001F8AD:PROC
EXTRN sub_1001FC39:PROC
EXTRN sub_1001FFFA:PROC
EXTRN sub_10024856:PROC
EXTRN sub_10027351:PROC
EXTRN sub_10027778:PROC
EXTRN fp_101D4BF8:DWORD
EXTRN fp_101D4BFC:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BDA0:DWORD
EXTRN g_101CE810:DWORD
EXTRN g_101D7E90:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10678510:DWORD
EXTRN g_10678AB8:DWORD
.CODE
FUN_100276d0 PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [g_10678510]
    push ebp
    push esi
    mov esi, dword ptr [esp + 32]
    mov ebp, esi
    imul esi, esi, 116
    imul ebp, ebp, 52
    add ebp, 010678AC4h
    mov eax, dword ptr [ebp + 8]
    push edi
    add esi, ebx
    push eax
    mov dword ptr [esp + 24], esi
    call dword ptr [fp_101D4BFC]
    add esp, 4
    push ebp
    mov eax, esi
    call sub_1001FFFA
    fld dword ptr [ebp + 32]
    lea edi, [ebp + 32]
    fsub dword ptr [ebp + 20]
    lea edx, [ebp + 20]
    fld dword ptr [edi + 4]
    add esp, 4
    fsub dword ptr [edx + 4]
    fld dword ptr [edi + 8]
    fsub dword ptr [edx + 8]
    fld st(0)
    fmul st(1)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fld st(3)
    fmul st(4)
    faddp st(1)
    fld dword ptr [g_1019BC84]
    fucompp
    fstp st(0)
    fnstsw ax
    fstp st(0)
    test ah, 68
    fstp st(0)
    jnp L4
    mov ecx, dword ptr [esp + 44]
    mov eax, dword ptr [ecx + 000000A20h]
    mov ebx, eax
    imul ebx, ebx, 108
    add ebx, ecx
    inc eax
    mov dword ptr [ecx + 000000A20h], eax
    mov eax, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [eax + 000217C7Ch]
    mov esi, ecx
    imul esi, esi, 00000014Ch
    inc ecx
    lea esi, [esi + eax + 000217C80h]
    push edi
    mov dword ptr [eax + 000217C7Ch], ecx
    push edx
    mov dword ptr [ebx + 100], esi
    call sub_10027351
    mov ecx, dword ptr [esp + 48]
    mov esi, dword ptr [ebx + 100]
    mov dword ptr [ebx + 104], ecx
    add esp, 8
    add esi, 0000000C8h
    lea edi, [ebx + 12]
    mov ecx, 16
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fld dword ptr [ebx + 16]
    fmul dword ptr [g_1019BDA0]
    fstp dword ptr [ebx + 16]
    fld dword ptr [ebx + 32]
    fmul dword ptr [g_1019BDA0]
    fstp dword ptr [ebx + 32]
    fld dword ptr [ebx + 48]
    fmul dword ptr [g_1019BDA0]
    lea eax, [ebx + 28]
    mov ecx, 2
    fstp dword ptr [ebx + 48]
    fld dword ptr [ebx + 64]
    fmul dword ptr [g_1019BDA0]
    fstp dword ptr [ebx + 64]
L0:
    fld dword ptr [eax - 16]
    add eax, 4
    dec ecx
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax - 20]
    fld dword ptr [eax - 4]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax - 4]
    fld dword ptr [eax + 12]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 12]
    fld dword ptr [eax + 28]
    fadd dword ptr [g_1019BC78]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 28]
    jne L0
    mov edx, dword ptr [ebp + 20]
    mov dword ptr [ebx + 76], edx
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [ebx + 80], eax
    mov ecx, dword ptr [ebp + 28]
    mov dword ptr [ebx + 84], ecx
    mov edx, dword ptr [ebp + 32]
    mov dword ptr [ebx + 88], edx
    mov eax, dword ptr [ebp + 36]
    mov dword ptr [ebx + 92], eax
    mov ecx, dword ptr [ebp + 40]
    mov eax, dword ptr [esp + 44]
    mov dword ptr [ebx + 96], ecx
    mov edx, dword ptr [g_10678AB8]
    mov dword ptr [ebx], edx
    mov ecx, dword ptr [eax + 000000A20h]
    mov edx, dword ptr [g_101CE810]
    cmp ecx, dword ptr [edx + 8]
    jg L3
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [esp + 28]
    push ecx
    mov dword ptr [g_101D7E90], eax
    call dword ptr [fp_101D4BF8]
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [eax]
    add esp, 4
    cmp ecx, 1
    jne L1
    push -1
    push eax
    push ebp
    call sub_1001F8AD
    add esp, 12
    jmp L2
L1:
    push eax
    push ebp
    call sub_1001FC39
    add esp, 8
L2:
    mov edx, dword ptr [esp + 36]
    push edx
    call sub_10024856
    add esp, 4
L3:
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 32]
    push eax
    push ecx
    call sub_10027778
    add esp, 8
L4:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_100276d0 ENDP
END
