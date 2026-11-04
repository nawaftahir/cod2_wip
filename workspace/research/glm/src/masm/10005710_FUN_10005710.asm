.686
.MODEL FLAT, C
EXTRN sub_10005707:PROC
EXTRN sub_100590DF:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BED8:DWORD
.CODE
FUN_10005710 PROC
    sub esp, 16
    push ebx
    mov ebx, eax
    fld dword ptr [ebx]
    push esi
    push edi
    mov edi, ecx
    fsub dword ptr [edi]
    lea esi, [esp + 16]
    fstp dword ptr [esp + 16]
    fld dword ptr [ebx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 20]
    fld dword ptr [ebx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 24]
    call sub_100590DF
    fld dword ptr [esp + 24]
    fmul dword ptr [edi + 20]
    fld dword ptr [esp + 20]
    fmul dword ptr [edi + 16]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [edi + 12]
    faddp st(1)
    fsub dword ptr [g_1019BED8]
    fmul st(1)
    fstp dword ptr [esp + 12]
    fstp st(0)
    fld dword ptr [esp + 12]
    fcomp dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 5
    jp L0
    mov dword ptr [esp + 12], 03F800000h
L0:
    mov eax, dword ptr [esp + 40]
    mov ecx, dword ptr [esp + 12]
    mov edi, dword ptr [esp + 32]
    push eax
    push ecx
    push ebx
    mov ebx, dword ptr [esp + 48]
    call sub_10005707
    add esp, 12
    pop edi
    pop esi
    pop ebx
    add esp, 16
    ret
FUN_10005710 ENDP
END
