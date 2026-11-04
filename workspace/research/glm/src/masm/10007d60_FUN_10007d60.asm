.686
.MODEL FLAT, C
EXTRN sub_100138D5:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10007d60 PROC
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    jne L0
    push 0101925CCh
    push 1
    call sub_100138D5
    add esp, 8
L0:
    mov eax, dword ptr [g_101D1B9C]
    mov ecx, dword ptr [eax + 12]
    cmp dword ptr [ecx], -1
    jne L4
L1:
    mov eax, dword ptr [ecx + 12]
    fld dword ptr [eax + 8]
    fmul dword ptr [esi + 8]
    fld dword ptr [eax + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [eax]
    fmul dword ptr [esi]
    faddp st(1)
    fsub dword ptr [eax + 12]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L2
    mov ecx, dword ptr [ecx + 16]
    jmp L3
L2:
    mov ecx, dword ptr [ecx + 20]
L3:
    cmp dword ptr [ecx], -1
    je L1
L4:
    mov eax, dword ptr [ecx + 8]
    ret
FUN_10007d60 ENDP
END
