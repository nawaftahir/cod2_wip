.686
.MODEL FLAT, C
.CODE
FUN_1002c060 PROC
    push ecx
    xor edx, edx
    test esi, esi
    jle L1
    fld dword ptr [esp + 8]
    add ecx, 4
    fchs
    fstp dword ptr [esp]
L0:
    fld dword ptr [ecx - 4]
    fmul dword ptr [edi]
    fld dword ptr [ecx + 4]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fld dword ptr [edi + 4]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 8]
    fcomp dword ptr [esp]
    fnstsw ax
    test ah, 5
    jnp L2
    inc edx
    add ecx, 20
    cmp edx, esi
    jl L0
L1:
    xor eax, eax
    pop ecx
    ret
L2:
    mov eax, 2
    pop ecx
    ret
FUN_1002c060 ENDP
END
