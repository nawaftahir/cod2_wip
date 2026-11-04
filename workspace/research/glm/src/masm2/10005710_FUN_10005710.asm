.686
.MODEL FLAT, C
EXTRN sub_10005707:PROC
EXTRN sub_100057E6:PROC
EXTRN sub_100590DF:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BED8:DWORD:DWORD
.CODE
FUN_10005710 PROC
    sub sub esp, 16
    push push ebx
    mov mov ebx, eax
    fld fld dword ptr [ebx]
    push push esi
    push push edi
    mov mov edi, ecx
    fsub fsub dword ptr [edi]
    lea lea esi, [esp + 16]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 24]
    call sub_100590DF
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edi + 20]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edi + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [edi + 12]
    faddp faddp st(1)
    fsub fsub dword ptr [g_1019BED8]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 12]
    fstp fstp st(0)
    fld fld dword ptr [esp + 12]
    fcomp fcomp dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100057E6
    mov mov dword ptr [esp + 12], 03F800000h
    mov mov eax, dword ptr [esp + 40]
    mov mov ecx, dword ptr [esp + 12]
    mov mov edi, dword ptr [esp + 32]
    push push eax
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [esp + 48]
    call sub_10005707
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 16
    ret ret
FUN_10005710 ENDP
END
