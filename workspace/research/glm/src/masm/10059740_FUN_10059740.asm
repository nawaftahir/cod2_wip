.686
.MODEL FLAT, C
EXTRN sub_10059579:PROC
EXTRN sub_10059F60:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_10059740 PROC
    sub esp, 12
    push edi
    lea edi, [esi + 12]
    mov eax, edi
    mov ecx, esi
    call sub_10059F60
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 20]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L0
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [edi + 4]
    mov edx, dword ptr [edi + 8]
    push ebx
    mov dword ptr [esp + 8], eax
    mov eax, dword ptr [esp + 24]
    push eax
    mov dword ptr [esp + 16], ecx
    push edi
    lea ebx, [esp + 16]
    mov ecx, esi
    mov dword ptr [esp + 24], edx
    call sub_10059579
    add esp, 8
    pop ebx
L0:
    fld dword ptr [edi + 8]
    fmul dword ptr [esi + 4]
    fld dword ptr [esi + 8]
    fmul dword ptr [edi + 4]
    fsubp st(1)
    fstp dword ptr [esi + 24]
    fld dword ptr [edi]
    fmul dword ptr [esi + 8]
    fld dword ptr [edi + 8]
    fmul dword ptr [esi]
    fsubp st(1)
    fstp dword ptr [esi + 28]
    fld dword ptr [edi + 4]
    fmul dword ptr [esi]
    fld dword ptr [edi]
    pop edi
    fmul dword ptr [esi + 4]
    fsubp st(1)
    fstp dword ptr [esi + 32]
    add esp, 12
    ret
FUN_10059740 ENDP
END
