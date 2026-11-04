.686
.MODEL FLAT, C
EXTRN sub_1001F8AD:PROC
EXTRN sub_1001FC39:PROC
EXTRN sub_1001FFFA:PROC
EXTRN sub_10024856:PROC
EXTRN sub_10027351:PROC
EXTRN sub_10027938:PROC
EXTRN sub_10027939:PROC
EXTRN sub_10027A3C:PROC
EXTRN sub_10027A46:PROC
EXTRN sub_10027A5E:PROC
EXTRN EXTRN fp_101D4BF8:DWORD:DWORD
EXTRN EXTRN fp_101D4BFC:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
EXTRN EXTRN g_101CE810:DWORD:DWORD
EXTRN EXTRN g_101D7E90:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
EXTRN EXTRN g_10678AB8:DWORD:DWORD
.CODE
FUN_100276d0 PROC
    sub sub esp, 8
    push push ebx
    mov mov ebx, dword ptr [g_10678510]
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 32]
    mov mov ebp, esi
    imul imul esi, esi, 116
    imul imul ebp, ebp, 52
    add add ebp, 010678AC4h
    mov mov eax, dword ptr [ebp + 8]
    push push edi
    add add esi, ebx
    push push eax
    mov mov dword ptr [esp + 24], esi
    call dword ptr [fp_101D4BFC]
    add add esp, 4
    push push ebp
    mov mov eax, esi
    call sub_1001FFFA
    fld fld dword ptr [ebp + 32]
    lea lea edi, [ebp + 32]
    fsub fsub dword ptr [ebp + 20]
    lea lea edx, [ebp + 20]
    fld fld dword ptr [edi + 4]
    add add esp, 4
    fsub fsub dword ptr [edx + 4]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [edx + 8]
    fld fld st(0)
    fmul fmul st(1)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fld fld st(3)
    fmul fmul st(4)
    faddp faddp st(1)
    fld fld dword ptr [g_1019BC84]
    fucompp fucompp
    fstp fstp st(0)
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    fstp fstp st(0)
    jnp sub_10027939
    mov mov ecx, dword ptr [esp + 44]
    mov mov eax, dword ptr [ecx + 0A20h]
    mov mov ebx, eax
    imul imul ebx, ebx, 108
    add add ebx, ecx
    inc inc eax
    mov mov dword ptr [ecx + 0A20h], eax
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [eax + 0217C7Ch]
    mov mov esi, ecx
    imul imul esi, esi, 014Ch
    inc inc ecx
    lea lea esi, [esi + eax + 0217C80h]
    push push edi
    mov mov dword ptr [eax + 0217C7Ch], ecx
    push push edx
    mov mov dword ptr [ebx + 100], esi
    call sub_10027351
    mov mov ecx, dword ptr [esp + 48]
    mov mov esi, dword ptr [ebx + 100]
    mov mov dword ptr [ebx + 104], ecx
    add add esp, 8
    add add esi, 0C8h
    lea lea edi, [ebx + 12]
    mov mov ecx, 16
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    fld fld dword ptr [ebx + 16]
    fmul fmul dword ptr [g_1019BDA0]
    fstp fstp dword ptr [ebx + 16]
    fld fld dword ptr [ebx + 32]
    fmul fmul dword ptr [g_1019BDA0]
    fstp fstp dword ptr [ebx + 32]
    fld fld dword ptr [ebx + 48]
    fmul fmul dword ptr [g_1019BDA0]
    lea lea eax, [ebx + 28]
    mov mov ecx, 2
    fstp fstp dword ptr [ebx + 48]
    fld fld dword ptr [ebx + 64]
    fmul fmul dword ptr [g_1019BDA0]
    fstp fstp dword ptr [ebx + 64]
    fld fld dword ptr [eax - 16]
    add add eax, 4
    dec dec ecx
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax - 20]
    fld fld dword ptr [eax - 4]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax - 4]
    fld fld dword ptr [eax + 12]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 12]
    fld fld dword ptr [eax + 28]
    fadd fadd dword ptr [g_1019BC78]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 28]
    jne sub_10027938
    mov mov edx, dword ptr [ebp + 20]
    mov mov dword ptr [ebx + 76], edx
    mov mov eax, dword ptr [ebp + 24]
    mov mov dword ptr [ebx + 80], eax
    mov mov ecx, dword ptr [ebp + 28]
    mov mov dword ptr [ebx + 84], ecx
    mov mov edx, dword ptr [ebp + 32]
    mov mov dword ptr [ebx + 88], edx
    mov mov eax, dword ptr [ebp + 36]
    mov mov dword ptr [ebx + 92], eax
    mov mov ecx, dword ptr [ebp + 40]
    mov mov eax, dword ptr [esp + 44]
    mov mov dword ptr [ebx + 96], ecx
    mov mov edx, dword ptr [g_10678AB8]
    mov mov dword ptr [ebx], edx
    mov mov ecx, dword ptr [eax + 0A20h]
    mov mov edx, dword ptr [g_101CE810]
    cmp cmp ecx, dword ptr [edx + 8]
    jg sub_10027A3C
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esp + 28]
    push push ecx
    mov mov dword ptr [g_101D7E90], eax
    call dword ptr [fp_101D4BF8]
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [eax]
    add add esp, 4
    cmp cmp ecx, 1
    jne sub_10027A46
    push push -1
    push push eax
    push push ebp
    call sub_1001F8AD
    add add esp, 12
    jmp sub_10027A5E
    push push eax
    push push ebp
    call sub_1001FC39
    add add esp, 8
    mov mov edx, dword ptr [esp + 36]
    push push edx
    call sub_10024856
    add add esp, 4
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 32]
    push push eax
    push push ecx
    call L0
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_100276d0 ENDP
END
