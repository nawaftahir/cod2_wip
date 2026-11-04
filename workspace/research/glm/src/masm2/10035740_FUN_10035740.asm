.686
.MODEL FLAT, C
EXTRN sub_10035669:PROC
EXTRN sub_100356C9:PROC
EXTRN sub_1003581E:PROC
EXTRN sub_1003582E:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101D4854:DWORD:DWORD
EXTRN EXTRN g_101D48E0:DWORD:DWORD
EXTRN EXTRN g_1072DED0:DWORD:DWORD
EXTRN EXTRN g_1072DED4:DWORD:DWORD
EXTRN EXTRN g_1072DED8:DWORD:DWORD
EXTRN EXTRN g_10730558:DWORD:DWORD
.CODE
FUN_10035740 PROC
    push push ecx
    fld fld dword ptr [g_1019BC84]
    push push esi
    fld fld dword ptr [ebx]
    push push edi
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1003581E
    fild fild dword ptr [g_101D48E0]
    mov mov edi, 9
    fidiv fidiv dword ptr [g_101D4854]
    fld fld st(0)
    fmul fmul dword ptr [ebx]
    fst fst dword ptr [esp + 8]
    mov mov eax, dword ptr [esp + 8]
    fstp fstp dword ptr [ebx]
    push push eax
    fmul fmul dword ptr [ebx + 4]
    fstp fstp dword ptr [ebx + 4]
    mov mov esi, dword ptr [g_10730558]
    call sub_10035669
    fld fld dword ptr [g_1019BC84]
    mov mov esi, eax
    lea lea ecx, [esi + esi*4]
    mov mov edx, dword ptr [ecx*4 + 0101D4820h]
    mov mov dword ptr [g_1072DED4], edx
    fld fld dword ptr [ebx + 4]
    fucompp fucompp
    add add esp, 4
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1003582E
    mov mov dword ptr [g_1072DED0], 1
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
    fld fld dword ptr [ebx + 4]
    mov mov edi, 9
    fld fld st(0)
    fmul fmul st(1)
    fld fld dword ptr [ebx]
    fstp fstp st(2)
    fld fld st(1)
    fmul fmul st(2)
    fsubp fsubp st(1)
    fsqrt fsqrt
    fstp fstp st(1)
    fst fst dword ptr [esp + 8]
    mov mov eax, dword ptr [esp + 8]
    fstp fstp dword ptr [ebx + 4]
    push push eax
    call sub_100356C9
    lea lea ecx, [eax + eax*4]
    mov mov edx, dword ptr [ecx*4 + 0101D4820h]
    add add esp, 4
    mov mov dword ptr [g_1072DED8], edx
    mov mov dword ptr [g_1072DED0], 2
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
FUN_10035740 ENDP
END
