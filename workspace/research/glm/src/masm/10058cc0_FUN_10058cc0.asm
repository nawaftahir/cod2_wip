.686
.MODEL FLAT, C
.CODE
FUN_10058cc0 PROC
    sub esp, 8
    xor edx, edx
    test esi, esi
    push edi
    jle L1
    fld dword ptr [esp + 16]
    mov edi, eax
    fmul dword ptr [esp + 16]
    sub edi, ecx
    fstp dword ptr [esp + 8]
    lea ebx, [ebx]
L0:
    fld dword ptr [ecx + edi]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 65
    je L2
    inc edx
    add ecx, 4
    cmp edx, esi
    jl L0
L1:
    mov eax, 1
    pop edi
    add esp, 8
    ret
L2:
    xor eax, eax
    pop edi
    add esp, 8
    ret
FUN_10058cc0 ENDP
END
