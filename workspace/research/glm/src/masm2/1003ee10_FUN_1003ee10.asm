.686
.MODEL FLAT, C
EXTRN sub_1003EE57:PROC
EXTRN sub_1003EE7D:PROC
EXTRN EXTRN g_1019BD50:DWORD:DWORD
.CODE
FUN_1003ee10 PROC
    push push ecx
    push push esi
    mov mov esi, eax
    xor xor edx, edx
    sub sub esi, ecx
    jmp L0
    lea lea ebx, [ebx]
    fld fld dword ptr [ecx + esi]
    fsub fsub dword ptr [ecx]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [esp + 4]
    fcomp fcomp dword ptr [g_1019BD50]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1003EE7D
    inc inc edx
    add add ecx, 4
    cmp cmp edx, 3
    jl sub_1003EE57
    mov mov eax, 1
    pop pop esi
    pop pop ecx
FUN_1003ee10 ENDP
END
