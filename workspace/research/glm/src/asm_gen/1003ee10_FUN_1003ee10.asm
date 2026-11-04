; FUN_1003ee10 @ 0x1003ee10 — auto-synthesized
    EXTRN g_1019bd50:DWORD
    sub_1003ee7d PROTO C
.CODE
FUN_1003ee10 PROC
    push ecx
    push esi
    mov esi, eax
    xor edx, edx
    sub esi, ecx
    jmp L0
    lea ebx, [ebx]
    fld dword ptr [ecx + esi]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fcomp dword ptr [g_1019bd50]
    fnstsw ax
    test ah, 0x41
    je sub_1003ee7d
    inc edx
    add ecx, 4
    cmp edx, 3
    jl L0
    mov eax, 1
    pop esi
    pop ecx
FUN_1003ee10 ENDP
END