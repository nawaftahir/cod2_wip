.686
.MODEL FLAT, C
EXTRN sub_100590DE:PROC
EXTRN sub_10059106:PROC
EXTRN sub_1005914D:PROC
.CODE
FUN_1005a000 PROC
    sub esp, 24
    fld dword ptr [edi]
    push ebp
    fsub dword ptr [eax]
    mov ebp, dword ptr [esp + 32]
    push esi
    lea esi, [esp + 20]
    fstp dword ptr [esp + 20]
    fld dword ptr [edi + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 24]
    fld dword ptr [edi + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 28]
    call sub_100590DE
    fstp st(0)
    lea esi, [esp + 8]
    fld dword ptr [edi]
    fsub dword ptr [ebp]
    fstp dword ptr [esp + 8]
    fld dword ptr [edi + 4]
    fsub dword ptr [ebp + 4]
    fstp dword ptr [esp + 12]
    fld dword ptr [edi + 8]
    fsub dword ptr [ebp + 8]
    fstp dword ptr [esp + 16]
    call sub_10059106
    fstp st(0)
    mov esi, ebx
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 28]
    fsubp st(1)
    fstp dword ptr [ebx]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 20]
    fsubp st(1)
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 24]
    fsubp st(1)
    fstp dword ptr [ebx + 8]
    call sub_1005914D
    pop esi
    fstp st(0)
    pop ebp
    add esp, 24
    ret
FUN_1005a000 ENDP
END
