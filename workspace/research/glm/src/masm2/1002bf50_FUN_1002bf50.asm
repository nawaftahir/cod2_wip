.686
.MODEL FLAT, C
EXTRN sub_1002BED7:PROC
EXTRN sub_1002BFF2:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_1002bf50 PROC
    push push esi
    push push edi
    call sub_1002BED7
    mov mov edi, eax
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 16]
    mov mov esi, eax
    shr shr esi, 20
    test test edi, edi
    push push esi
    jne L0
    push push 0101975A0h
    push push edi
    call dword ptr [fp_101D49C8]
    add add esp, 12
    pop pop edi
    mov mov eax, esi
    pop pop esi
    ret ret
    push push edi
    push push 010197550h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 16
    cmp cmp edi, esi
    jae sub_1002BFF2
    lea lea esi, [edi - 16]
    push push esi
    push push 01019750Ch
L0:
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    pop pop edi
    mov mov eax, esi
    pop pop esi
    ret ret
FUN_1002bf50 ENDP
END
