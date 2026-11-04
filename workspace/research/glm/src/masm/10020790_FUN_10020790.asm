.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
.CODE
FUN_10020790 PROC
    push ecx
    xor eax, eax
L0:
    mov ecx, dword ptr [eax + 010190398h]
    dec ecx
    mov dword ptr [esp], ecx
    fild dword ptr [esp]
    add eax, 4
    cmp eax, 12
    fld dword ptr [eax + 0101DA988h]
    fsub dword ptr [eax + 0101DA97Ch]
    fdivp st(1)
    fst dword ptr [eax + 0101DA994h]
    fld dword ptr [g_1019BC78]
    fdiv st(1)
    fstp dword ptr [eax + 0101DA9A0h]
    fstp st(0)
    fld dword ptr [eax + 0101DA994h]
    fmul dword ptr [eax + 0101DA97Ch]
    fchs
    fstp dword ptr [eax + 0101DA9ACh]
    jne L0
    pop ecx
    ret
FUN_10020790 ENDP
END
