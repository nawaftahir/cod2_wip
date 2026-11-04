.686
.MODEL FLAT, C
EXTRN sub_100207E3:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
.CODE
FUN_10020790 PROC
    push push ecx
    xor xor eax, eax
    mov mov ecx, dword ptr [eax + 010190398h]
    dec dec ecx
    mov mov dword ptr [esp], ecx
    fild fild dword ptr [esp]
    add add eax, 4
    cmp cmp eax, 12
    fld fld dword ptr [eax + 0101DA988h]
    fsub fsub dword ptr [eax + 0101DA97Ch]
    fdivp fdivp st(1)
    fst fst dword ptr [eax + 0101DA994h]
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv st(1)
    fstp fstp dword ptr [eax + 0101DA9A0h]
    fstp fstp st(0)
    fld fld dword ptr [eax + 0101DA994h]
    fmul fmul dword ptr [eax + 0101DA97Ch]
    fchs fchs
    fstp fstp dword ptr [eax + 0101DA9ACh]
    jne sub_100207E3
    pop pop ecx
    ret ret
FUN_10020790 ENDP
END
