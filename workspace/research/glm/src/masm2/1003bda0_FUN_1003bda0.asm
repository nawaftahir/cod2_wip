.686
.MODEL FLAT, C
EXTRN sub_1003AC7F:PROC
EXTRN sub_1003AD1A:PROC
EXTRN sub_1003BF60:PROC
EXTRN sub_1003BF90:PROC
EXTRN sub_1003BFC0:PROC
EXTRN sub_1003BFC7:PROC
EXTRN sub_1003BFDF:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003bda0 PROC
    push push ecx
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [g_1072DDC8]
    fld fld dword ptr [ecx + 01BCh]
    fmul fmul dword ptr [eax + 20]
    fld fld dword ptr [ecx + 01B8h]
    fmul fmul dword ptr [eax + 16]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 01B4h]
    fmul fmul dword ptr [eax + 12]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [ecx + 0194h]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp L0
    mov mov dword ptr [esi], 0
    jmp L5
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [ecx + 018Ch]
    fnstsw fnstsw ax
    test test ah, 65
    jp L1
    fld fld dword ptr [g_1019BC84]
    jmp L3
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [ecx + 0190h]
    fnstsw fnstsw ax
    test test ah, 1
    jne L2
    fld fld dword ptr [g_1019BC78]
    jmp L4
    fld fld dword ptr [esp]
    fsub fsub dword ptr [ecx + 018Ch]
    fld fld dword ptr [ecx + 0190h]
    fsub fsub dword ptr [ecx + 018Ch]
    fdivp fdivp st(1)
    mov mov eax, dword ptr [ecx + 019Ch]
    fmul fmul dword ptr [edx + 24]
    mov mov ecx, dword ptr [ecx + 0198h]
    push push edi
    push push eax
    mov mov eax, dword ptr [edx + 4]
    push push ecx
    push push ecx
    fstp fstp dword ptr [esp]
    push push eax
    call sub_1003AC7F
    fst fst dword ptr [edx + 4]
    mov mov ecx, dword ptr [g_101D1B9C]
    fmul fmul dword ptr [ecx + 0194h]
    add add esp, 20
    fstp fstp dword ptr [esi]
    mov mov ecx, dword ptr [g_101D1B9C]
    fld fld dword ptr [ecx + 01A8h]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_1003BF60
    mov mov dword ptr [ebx], 0
    pop pop ecx
    ret ret
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [ecx + 01A0h]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_1003BF90
    fld fld dword ptr [g_1019BC84]
    jmp sub_1003BFC7
    fld fld dword ptr [esp]
    fcomp fcomp dword ptr [ecx + 01A4h]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_1003BFC0
L5:
    fld fld dword ptr [g_1019BC78]
    jmp sub_1003BFDF
    fld fld dword ptr [esp]
    fsub fsub dword ptr [ecx + 01A0h]
    fld fld dword ptr [ecx + 01A4h]
    fsub fsub dword ptr [ecx + 01A0h]
    fdivp fdivp st(1)
    mov mov eax, dword ptr [ecx + 01B0h]
    fmul fmul dword ptr [edx + 24]
    mov mov ecx, dword ptr [ecx + 01ACh]
    push push edi
    push push eax
    mov mov eax, dword ptr [edx + 8]
    push push ecx
    push push ecx
    fstp fstp dword ptr [esp]
    push push eax
    call sub_1003AD1A
    fst fst dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_101D1B9C]
    fmul fmul dword ptr [ecx + 01A8h]
    add add esp, 20
    fstp fstp dword ptr [ebx]
    pop pop ecx
    ret ret
FUN_1003bda0 ENDP
END
