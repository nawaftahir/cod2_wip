.686
.MODEL FLAT, C
EXTRN sub_10035669:PROC
EXTRN sub_100356C9:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101D4854:DWORD
EXTRN g_101D48E0:DWORD
EXTRN g_1072DED0:DWORD
EXTRN g_1072DED4:DWORD
EXTRN g_1072DED8:DWORD
EXTRN g_10730558:DWORD
.CODE
FUN_10035740 PROC
    push ecx
    fld dword ptr [g_1019BC84]
    push esi
    fld dword ptr [ebx]
    push edi
    fucompp
    fnstsw ax
    test ah, 68
    jnp L1
    fild dword ptr [g_101D48E0]
    mov edi, 9
    fidiv dword ptr [g_101D4854]
    fld st(0)
    fmul dword ptr [ebx]
    fst dword ptr [esp + 8]
    mov eax, dword ptr [esp + 8]
    fstp dword ptr [ebx]
    push eax
    fmul dword ptr [ebx + 4]
    fstp dword ptr [ebx + 4]
    mov esi, dword ptr [g_10730558]
    call sub_10035669
    fld dword ptr [g_1019BC84]
    mov esi, eax
    lea ecx, [esi + esi*4]
    mov edx, dword ptr [ecx*4 + 0101D4820h]
    mov dword ptr [g_1072DED4], edx
    fld dword ptr [ebx + 4]
    fucompp
    add esp, 4
    fnstsw ax
    test ah, 68
    jp L0
    mov dword ptr [g_1072DED0], 1
    pop edi
    pop esi
    pop ecx
    ret
L0:
    fld dword ptr [ebx + 4]
    mov edi, 9
    fld st(0)
    fmul st(1)
    fld dword ptr [ebx]
    fstp st(2)
    fld st(1)
    fmul st(2)
    fsubp st(1)
    fsqrt
    fstp st(1)
    fst dword ptr [esp + 8]
    mov eax, dword ptr [esp + 8]
    fstp dword ptr [ebx + 4]
    push eax
    call sub_100356C9
    lea ecx, [eax + eax*4]
    mov edx, dword ptr [ecx*4 + 0101D4820h]
    add esp, 4
    mov dword ptr [g_1072DED8], edx
    mov dword ptr [g_1072DED0], 2
L1:
    pop edi
    pop esi
    pop ecx
    ret
FUN_10035740 ENDP
END
