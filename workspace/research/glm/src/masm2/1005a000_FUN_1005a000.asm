.686
.MODEL FLAT, C
EXTRN sub_100590DE:PROC
EXTRN sub_10059106:PROC
EXTRN sub_1005914D:PROC
.CODE
FUN_1005a000 PROC
    sub sub esp, 24
    fld fld dword ptr [edi]
    push push ebp
    fsub fsub dword ptr [eax]
    mov mov ebp, dword ptr [esp + 32]
    push push esi
    lea lea esi, [esp + 20]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [edi + 4]
    fsub fsub dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 28]
    call sub_100590DE
    fstp fstp st(0)
    lea lea esi, [esp + 8]
    fld fld dword ptr [edi]
    fsub fsub dword ptr [ebp]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [edi + 4]
    fsub fsub dword ptr [ebp + 4]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [ebp + 8]
    fstp fstp dword ptr [esp + 16]
    call sub_10059106
    fstp fstp st(0)
    mov mov esi, ebx
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 28]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 20]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx + 4]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 24]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ebx + 8]
    call sub_1005914D
    pop pop esi
    fstp fstp st(0)
    pop pop ebp
    add add esp, 24
    ret ret
FUN_1005a000 ENDP
END
