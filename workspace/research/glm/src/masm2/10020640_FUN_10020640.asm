.686
.MODEL FLAT, C
EXTRN sub_100207A8:PROC
EXTRN sub_100207D8:PROC
EXTRN sub_10020809:PROC
EXTRN sub_1002085D:PROC
EXTRN sub_10020888:PROC
EXTRN sub_100208A4:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_101DA980:DWORD:DWORD
EXTRN EXTRN g_101DA984:DWORD:DWORD
EXTRN EXTRN g_101DA988:DWORD:DWORD
EXTRN EXTRN g_101DA98C:DWORD:DWORD
EXTRN EXTRN g_101DA990:DWORD:DWORD
EXTRN EXTRN g_101DA994:DWORD:DWORD
.CODE
FUN_10020640 PROC
    mov mov eax, 0C8000000h
    mov mov dword ptr [g_101DA980], 048000000h
    mov mov dword ptr [g_101DA984], 048000000h
    mov mov dword ptr [g_101DA988], 048000000h
    mov mov dword ptr [g_101DA98C], eax
    mov mov dword ptr [g_101DA990], eax
    mov mov dword ptr [g_101DA994], eax
    mov mov eax, dword ptr [edx + 16]
    push push edi
    xor xor edi, edi
    test test eax, eax
    je L3
    push push esi
    xor xor esi, esi
    mov mov eax, dword ptr [edx + 20]
    mov mov ecx, dword ptr [eax + esi]
    add add eax, esi
    test test byte ptr [ecx + 12], 8
    jne L5
    mov mov ecx, dword ptr [eax + 8]
    fld fld dword ptr [g_101DA980]
    fcomp fcomp dword ptr [ecx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    jne L0
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [g_101DA980], eax
    fld fld dword ptr [g_101DA98C]
    fcomp fcomp dword ptr [ecx + 16]
    fnstsw fnstsw ax
    test test ah, 5
    jp L1
    mov mov eax, dword ptr [ecx + 16]
    mov mov dword ptr [g_101DA98C], eax
    fld fld dword ptr [g_101DA984]
    fcomp fcomp dword ptr [ecx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne L2
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [g_101DA984], eax
    fld fld dword ptr [g_101DA990]
    fcomp fcomp dword ptr [ecx + 20]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100207A8
    mov mov eax, dword ptr [ecx + 20]
    mov mov dword ptr [g_101DA990], eax
    fld fld dword ptr [g_101DA988]
    fcomp fcomp dword ptr [ecx + 12]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100207D8
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [g_101DA988], eax
    fld fld dword ptr [g_101DA994]
    fcomp fcomp dword ptr [ecx + 24]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10020809
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [g_101DA994], ecx
    mov mov eax, dword ptr [edx + 16]
    inc inc edi
    add add esi, 12
    cmp cmp edi, eax
    jne L4
    pop pop esi
    mov mov ecx, 0101DA980h
    pop pop edi
    nop nop
    cmp cmp dword ptr [ecx], 048000000h
    jne sub_1002085D
L1:
    mov mov dword ptr [ecx], 0
    mov mov dword ptr [ecx + 12], 0
    fld fld dword ptr [ecx + 12]
    fsub fsub dword ptr [ecx]
    fcomp fcomp dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100208A4
    fld fld dword ptr [ecx]
    fsub fsub dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ecx]
    fld fld dword ptr [ecx + 12]
    fadd fadd dword ptr [g_1019BCB0]
    fstp fstp dword ptr [ecx + 12]
    add add ecx, 4
    cmp cmp ecx, 0101DA98Ch
    jne sub_10020888
    ret ret
FUN_10020640 ENDP
END
