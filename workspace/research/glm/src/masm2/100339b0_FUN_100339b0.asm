.686
.MODEL FLAT, C
EXTRN sub_100330D4:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_1019BDF4:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
EXTRN EXTRN g_1019BF40:DWORD:DWORD
EXTRN EXTRN g_101D1B38:DWORD:DWORD
.CODE
FUN_100339b0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101D1B38]
    push push 0552h
    push push 0
    push push 0
    call sub_100330D4
    add add esp, 12
    fmul fmul dword ptr [g_1019BF40]
    push push 010197DECh
    push push 0
    fstp fstp dword ptr [esp + 8]
    call dword ptr [fp_101D49C8]
    fld fld qword ptr [g_1019BE20]
    fstp fstp qword ptr [esp]
    push push 010197AE4h
    push push 0
    call dword ptr [fp_101D49C8]
    fld fld qword ptr [g_1019BE20]
    add add esp, 8
    fstp fstp qword ptr [esp]
    push push 010197AB4h
    push push 0
    call dword ptr [fp_101D49C8]
    fld fld qword ptr [g_1019BE20]
    add add esp, 8
    fstp fstp qword ptr [esp]
    push push 010197A84h
    push push 0
    call dword ptr [fp_101D49C8]
    fld fld qword ptr [g_1019BE20]
    add add esp, 8
    fstp fstp qword ptr [esp]
    push push 010197A54h
    push push 0
    call dword ptr [fp_101D49C8]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BDF4]
    add add esp, 8
    fstp fstp qword ptr [esp]
    push push 010197A24h
    push push 0
    call dword ptr [fp_101D49C8]
    fld fld dword ptr [esp + 16]
    fadd fadd st(0), st(0)
    add add esp, 8
    fstp fstp qword ptr [esp]
    push push 0101979F4h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010197DECh
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 28
    ret ret
FUN_100339b0 ENDP
END
