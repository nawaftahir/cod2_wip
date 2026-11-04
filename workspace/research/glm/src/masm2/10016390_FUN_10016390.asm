.686
.MODEL FLAT, C
EXTRN sub_10013926:PROC
EXTRN sub_10016452:PROC
EXTRN sub_10016466:PROC
EXTRN EXTRN g_101DA2D4:DWORD:DWORD
.CODE
FUN_10016390 PROC
    mov mov edx, dword ptr [g_101DA2D4]
    push push esi
    xor xor esi, esi
    test test edx, edx
    jle L2
    mov mov ecx, 0101DA2E0h
    fld fld dword ptr [ecx - 8]
    fld fld dword ptr [edi]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L1
    fld fld dword ptr [ecx - 4]
    fld fld dword ptr [edi + 4]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L3
    fld fld dword ptr [ecx]
    fld fld dword ptr [edi + 8]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L4
    fld fld dword ptr [ecx + 4]
    fld fld dword ptr [edi + 12]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10016466
    inc inc esi
    add add ecx, 16
    cmp cmp esi, edx
    jl L0
    cmp cmp esi, 16
    jne sub_10016452
    push push esi
    push push 010194538h
    push push 1
    call sub_10013926
L0:
    add add esp, 12
    mov mov ecx, dword ptr [edi]
    shl shl esi, 4
    lea lea eax, [esi + 0101DA2D8h]
    mov mov dword ptr [eax], ecx
L2:
    mov mov edx, dword ptr [edi + 4]
    mov mov dword ptr [eax + 4], edx
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov edx, dword ptr [edi + 12]
    mov mov dword ptr [eax + 12], edx
    pop pop esi
L4:
    ret ret
    mov mov eax, esi
    shl shl eax, 4
    add add eax, 0101DA2D8h
    pop pop esi
    ret ret
FUN_10016390 ENDP
END
