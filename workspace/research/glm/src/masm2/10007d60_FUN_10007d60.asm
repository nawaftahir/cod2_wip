.686
.MODEL FLAT, C
EXTRN sub_10007DDE:PROC
EXTRN sub_10007DFD:PROC
EXTRN sub_10007E05:PROC
EXTRN sub_100138D5:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10007d60 PROC
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    jne L0
    push push 0101925CCh
    push push 1
    call sub_100138D5
    add add esp, 8
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov ecx, dword ptr [eax + 12]
    cmp cmp dword ptr [ecx], -1
    jne sub_10007DDE
    mov mov eax, dword ptr [ecx + 12]
    fld fld dword ptr [eax + 8]
    fmul fmul dword ptr [esi + 8]
    fld fld dword ptr [eax + 4]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fld fld dword ptr [eax]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fsub fsub dword ptr [eax + 12]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10007DFD
    mov mov ecx, dword ptr [ecx + 16]
    jmp sub_10007E05
    mov mov ecx, dword ptr [ecx + 20]
    cmp cmp dword ptr [ecx], -1
    je sub_10007DDE
    mov mov eax, dword ptr [ecx + 8]
    ret ret
FUN_10007d60 ENDP
END
