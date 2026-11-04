.686
.MODEL FLAT, C
EXTRN sub_10059F60:PROC
EXTRN sub_10059F6B:PROC
EXTRN sub_10059FF0:PROC
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
.CODE
FUN_10059d80 PROC
    sub sub esp, 36
    fld fld dword ptr [edx + 4]
    lea lea eax, [esp + 4]
    fmul fmul dword ptr [g_1019BD8C]
    lea lea ecx, [esp]
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 28], ecx
    fstp fstp dword ptr [esp + 24]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 32]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 36]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    fld fld dword ptr [edx]
    lea lea eax, [esp + 16]
    fmul fmul dword ptr [g_1019BD8C]
    lea lea ecx, [esp + 20]
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 32], ecx
    fstp fstp dword ptr [esp + 24]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 32]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 36]
    mov mov eax, dword ptr [esp + 40]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    test test esi, esi
    je L0
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 4]
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp]
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [esp + 20]
    fchs fchs
    fstp fstp dword ptr [esi + 8]
    test test edi, edi
    jne L1
    test test ebx, ebx
    je sub_10059F6B
    fld fld dword ptr [edx + 8]
    lea lea edx, [esp + 12]
    fmul fmul dword ptr [g_1019BD8C]
    lea lea eax, [esp + 8]
    mov mov dword ptr [esp + 28], edx
    mov mov dword ptr [esp + 32], eax
    fstp fstp dword ptr [esp + 24]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 32]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 36]
    mov mov eax, dword ptr [esp + 40]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    test test edi, edi
    je sub_10059F60
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [edi]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 4]
    fmul fmul dword ptr [g_1019BDA0]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp]
    fsubp fsubp st(1)
    fstp fstp dword ptr [edi + 4]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BDA0]
    fstp fstp dword ptr [edi + 8]
    test test ebx, ebx
    je sub_10059FF0
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 4]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp]
    faddp faddp st(1)
    fstp fstp dword ptr [ebx]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx + 4]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [ebx + 8]
    add add esp, 36
    ret ret
FUN_10059d80 ENDP
END
