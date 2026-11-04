.686
.MODEL FLAT, C
EXTRN sub_10013926:PROC
EXTRN g_101DA2D4:DWORD
.CODE
FUN_10016390 PROC
    mov edx, dword ptr [g_101DA2D4]
    push esi
    xor esi, esi
    test edx, edx
    jle L2
    mov ecx, 0101DA2E0h
L0:
    fld dword ptr [ecx - 8]
    fld dword ptr [edi]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    fld dword ptr [ecx - 4]
    fld dword ptr [edi + 4]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    fld dword ptr [ecx]
    fld dword ptr [edi + 8]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    fld dword ptr [ecx + 4]
    fld dword ptr [edi + 12]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L3
L1:
    inc esi
    add ecx, 16
    cmp esi, edx
    jl L0
    cmp esi, 16
    jne L2
    push esi
    push 010194538h
    push 1
    call sub_10013926
    add esp, 12
L2:
    mov ecx, dword ptr [edi]
    shl esi, 4
    lea eax, [esi + 0101DA2D8h]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [edi + 12]
    mov dword ptr [eax + 12], edx
    pop esi
    ret
L3:
    mov eax, esi
    shl eax, 4
    add eax, 0101DA2D8h
    pop esi
    ret
FUN_10016390 ENDP
END
