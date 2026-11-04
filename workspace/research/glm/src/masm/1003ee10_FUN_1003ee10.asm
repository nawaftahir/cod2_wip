.686
.MODEL FLAT, C
EXTRN sub_1003EE7D:PROC
EXTRN g_1019BD50:DWORD
.CODE
FUN_1003ee10 PROC
    push ecx
    push esi
    mov esi, eax
    xor edx, edx
    sub esi, ecx
    jmp L0
    lea ebx, [ebx]
L0:
    fld dword ptr [ecx + esi]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fcomp dword ptr [g_1019BD50]
    fnstsw ax
    test ah, 65
    je sub_1003EE7D
    inc edx
    add ecx, 4
    cmp edx, 3
    jl L0
    mov eax, 1
    pop esi
    pop ecx
FUN_1003ee10 ENDP
END
