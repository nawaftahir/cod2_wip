.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_101DA980:DWORD
EXTRN g_101DA984:DWORD
EXTRN g_101DA988:DWORD
EXTRN g_101DA98C:DWORD
EXTRN g_101DA990:DWORD
EXTRN g_101DA994:DWORD
.CODE
FUN_10020640 PROC
    mov eax, 0C8000000h
    mov dword ptr [g_101DA980], 048000000h
    mov dword ptr [g_101DA984], 048000000h
    mov dword ptr [g_101DA988], 048000000h
    mov dword ptr [g_101DA98C], eax
    mov dword ptr [g_101DA990], eax
    mov dword ptr [g_101DA994], eax
    mov eax, dword ptr [edx + 16]
    push edi
    xor edi, edi
    test eax, eax
    je L7
    push esi
    xor esi, esi
L0:
    mov eax, dword ptr [edx + 20]
    mov ecx, dword ptr [eax + esi]
    add eax, esi
    test byte ptr [ecx + 12], 8
    jne L6
    mov ecx, dword ptr [eax + 8]
    fld dword ptr [g_101DA980]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 65
    jne L1
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [g_101DA980], eax
L1:
    fld dword ptr [g_101DA98C]
    fcomp dword ptr [ecx + 16]
    fnstsw ax
    test ah, 5
    jp L2
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [g_101DA98C], eax
L2:
    fld dword ptr [g_101DA984]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    jne L3
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [g_101DA984], eax
L3:
    fld dword ptr [g_101DA990]
    fcomp dword ptr [ecx + 20]
    fnstsw ax
    test ah, 5
    jp L4
    mov eax, dword ptr [ecx + 20]
    mov dword ptr [g_101DA990], eax
L4:
    fld dword ptr [g_101DA988]
    fcomp dword ptr [ecx + 12]
    fnstsw ax
    test ah, 65
    jne L5
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [g_101DA988], eax
L5:
    fld dword ptr [g_101DA994]
    fcomp dword ptr [ecx + 24]
    fnstsw ax
    test ah, 5
    jp L6
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [g_101DA994], ecx
L6:
    mov eax, dword ptr [edx + 16]
    inc edi
    add esi, 12
    cmp edi, eax
    jne L0
    pop esi
L7:
    mov ecx, 0101DA980h
    pop edi
    nop
L8:
    cmp dword ptr [ecx], 048000000h
    jne L9
    mov dword ptr [ecx], 0
    mov dword ptr [ecx + 12], 0
L9:
    fld dword ptr [ecx + 12]
    fsub dword ptr [ecx]
    fcomp dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 5
    jp L10
    fld dword ptr [ecx]
    fsub dword ptr [g_1019BCB0]
    fstp dword ptr [ecx]
    fld dword ptr [ecx + 12]
    fadd dword ptr [g_1019BCB0]
    fstp dword ptr [ecx + 12]
L10:
    add ecx, 4
    cmp ecx, 0101DA98Ch
    jne L8
    ret
FUN_10020640 ENDP
END
