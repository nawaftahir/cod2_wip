.686
.MODEL FLAT, C
EXTRN sub_100330D4:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_1019BDF4:DWORD
EXTRN g_1019BE20:DWORD
EXTRN g_1019BF40:DWORD
EXTRN g_101D1B38:DWORD
.CODE
FUN_100339b0 PROC
    push ecx
    mov eax, dword ptr [g_101D1B38]
    push 000000552h
    push 0
    push 0
    call sub_100330D4
    add esp, 12
    fmul dword ptr [g_1019BF40]
    push 010197DECh
    push 0
    fstp dword ptr [esp + 8]
    call dword ptr [fp_101D49C8]
    fld qword ptr [g_1019BE20]
    fstp qword ptr [esp]
    push 010197AE4h
    push 0
    call dword ptr [fp_101D49C8]
    fld qword ptr [g_1019BE20]
    add esp, 8
    fstp qword ptr [esp]
    push 010197AB4h
    push 0
    call dword ptr [fp_101D49C8]
    fld qword ptr [g_1019BE20]
    add esp, 8
    fstp qword ptr [esp]
    push 010197A84h
    push 0
    call dword ptr [fp_101D49C8]
    fld qword ptr [g_1019BE20]
    add esp, 8
    fstp qword ptr [esp]
    push 010197A54h
    push 0
    call dword ptr [fp_101D49C8]
    fld dword ptr [esp + 16]
    fmul dword ptr [g_1019BDF4]
    add esp, 8
    fstp qword ptr [esp]
    push 010197A24h
    push 0
    call dword ptr [fp_101D49C8]
    fld dword ptr [esp + 16]
    fadd st(0), st(0)
    add esp, 8
    fstp qword ptr [esp]
    push 0101979F4h
    push 0
    call dword ptr [fp_101D49C8]
    push 010197DECh
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 28
    ret
FUN_100339b0 ENDP
END
