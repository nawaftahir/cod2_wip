.686
.MODEL FLAT, C
EXTRN sub_1003AC7F:PROC
EXTRN sub_1003AD1A:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003bda0 PROC
    push ecx
    mov ecx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [g_1072DDC8]
    fld dword ptr [ecx + 0000001BCh]
    fmul dword ptr [eax + 20]
    fld dword ptr [ecx + 0000001B8h]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [ecx + 0000001B4h]
    fmul dword ptr [eax + 12]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [ecx + 000000194h]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L0
    mov dword ptr [esi], 0
    jmp L4
L0:
    fld dword ptr [esp]
    fcomp dword ptr [ecx + 00000018Ch]
    fnstsw ax
    test ah, 65
    jp L1
    fld dword ptr [g_1019BC84]
    jmp L3
L1:
    fld dword ptr [esp]
    fcomp dword ptr [ecx + 000000190h]
    fnstsw ax
    test ah, 1
    jne L2
    fld dword ptr [g_1019BC78]
    jmp L3
L2:
    fld dword ptr [esp]
    fsub dword ptr [ecx + 00000018Ch]
    fld dword ptr [ecx + 000000190h]
    fsub dword ptr [ecx + 00000018Ch]
    fdivp st(1)
L3:
    mov eax, dword ptr [ecx + 00000019Ch]
    fmul dword ptr [edx + 24]
    mov ecx, dword ptr [ecx + 000000198h]
    push edi
    push eax
    mov eax, dword ptr [edx + 4]
    push ecx
    push ecx
    fstp dword ptr [esp]
    push eax
    call sub_1003AC7F
    fst dword ptr [edx + 4]
    mov ecx, dword ptr [g_101D1B9C]
    fmul dword ptr [ecx + 000000194h]
    add esp, 20
    fstp dword ptr [esi]
L4:
    mov ecx, dword ptr [g_101D1B9C]
    fld dword ptr [ecx + 0000001A8h]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L5
    mov dword ptr [ebx], 0
    pop ecx
    ret
L5:
    fld dword ptr [esp]
    fcomp dword ptr [ecx + 0000001A0h]
    fnstsw ax
    test ah, 65
    jp L6
    fld dword ptr [g_1019BC84]
    jmp L8
L6:
    fld dword ptr [esp]
    fcomp dword ptr [ecx + 0000001A4h]
    fnstsw ax
    test ah, 1
    jne L7
    fld dword ptr [g_1019BC78]
    jmp L8
L7:
    fld dword ptr [esp]
    fsub dword ptr [ecx + 0000001A0h]
    fld dword ptr [ecx + 0000001A4h]
    fsub dword ptr [ecx + 0000001A0h]
    fdivp st(1)
L8:
    mov eax, dword ptr [ecx + 0000001B0h]
    fmul dword ptr [edx + 24]
    mov ecx, dword ptr [ecx + 0000001ACh]
    push edi
    push eax
    mov eax, dword ptr [edx + 8]
    push ecx
    push ecx
    fstp dword ptr [esp]
    push eax
    call sub_1003AD1A
    fst dword ptr [edx + 8]
    mov ecx, dword ptr [g_101D1B9C]
    fmul dword ptr [ecx + 0000001A8h]
    add esp, 20
    fstp dword ptr [ebx]
    pop ecx
    ret
FUN_1003bda0 ENDP
END
