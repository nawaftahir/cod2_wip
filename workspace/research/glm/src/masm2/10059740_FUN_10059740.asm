.686
.MODEL FLAT, C
EXTRN sub_10059579:PROC
EXTRN sub_10059F60:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_10059740 PROC
    sub sub esp, 12
    push push edi
    lea lea edi, [esi + 12]
    mov mov eax, edi
    mov mov ecx, esi
    call sub_10059F60
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L0
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [edi + 4]
    mov mov edx, dword ptr [edi + 8]
    push push ebx
    mov mov dword ptr [esp + 8], eax
    mov mov eax, dword ptr [esp + 24]
    push push eax
    mov mov dword ptr [esp + 16], ecx
    push push edi
    lea lea ebx, [esp + 16]
    mov mov ecx, esi
    mov mov dword ptr [esp + 24], edx
    call sub_10059579
    add add esp, 8
    pop pop ebx
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edi + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 24]
    fld fld dword ptr [edi]
    fmul fmul dword ptr [esi + 8]
    fld fld dword ptr [edi + 8]
    fmul fmul dword ptr [esi]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 28]
    fld fld dword ptr [edi + 4]
L0:
    fmul fmul dword ptr [esi]
    fld fld dword ptr [edi]
    pop pop edi
    fmul fmul dword ptr [esi + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 32]
    add add esp, 12
    ret ret
FUN_10059740 ENDP
END
