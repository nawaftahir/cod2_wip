.686
.MODEL FLAT, C
EXTRN g_1019BD8C:DWORD
EXTRN g_1019BDA0:DWORD
.CODE
FUN_10059d80 PROC
    sub esp, 36
    fld dword ptr [edx + 4]
    lea eax, [esp + 4]
    fmul dword ptr [g_1019BD8C]
    lea ecx, [esp]
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 28], ecx
    fstp dword ptr [esp + 24]
    push eax
    push ecx
    fld dword ptr [esp + 32]
    fsincos
    mov ecx, dword ptr [esp + 40]
    mov eax, dword ptr [esp + 36]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [edx]
    lea eax, [esp + 16]
    fmul dword ptr [g_1019BD8C]
    lea ecx, [esp + 20]
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 32], ecx
    fstp dword ptr [esp + 24]
    push eax
    push ecx
    fld dword ptr [esp + 32]
    fsincos
    mov ecx, dword ptr [esp + 36]
    mov eax, dword ptr [esp + 40]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    test esi, esi
    je L0
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 4]
    fstp dword ptr [esi]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp]
    fstp dword ptr [esi + 4]
    fld dword ptr [esp + 20]
    fchs
    fstp dword ptr [esi + 8]
L0:
    test edi, edi
    jne L1
    test ebx, ebx
    je L3
L1:
    fld dword ptr [edx + 8]
    lea edx, [esp + 12]
    fmul dword ptr [g_1019BD8C]
    lea eax, [esp + 8]
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 32], eax
    fstp dword ptr [esp + 24]
    push eax
    push ecx
    fld dword ptr [esp + 32]
    fsincos
    mov ecx, dword ptr [esp + 36]
    mov eax, dword ptr [esp + 40]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    test edi, edi
    je L2
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 4]
    fsubp st(1)
    fstp dword ptr [edi]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 4]
    fmul dword ptr [g_1019BDA0]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp]
    fsubp st(1)
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 16]
    fmul dword ptr [g_1019BDA0]
    fstp dword ptr [edi + 8]
L2:
    test ebx, ebx
    je L3
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 4]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp]
    faddp st(1)
    fstp dword ptr [ebx]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 4]
    fsubp st(1)
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 16]
    fstp dword ptr [ebx + 8]
L3:
    add esp, 36
    ret
FUN_10059d80 ENDP
END
