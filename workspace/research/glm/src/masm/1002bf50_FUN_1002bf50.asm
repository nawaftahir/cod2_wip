.686
.MODEL FLAT, C
EXTRN sub_1002BED7:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_101D1BF8:DWORD
.CODE
FUN_1002bf50 PROC
    push esi
    push edi
    call sub_1002BED7
    mov edi, eax
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x10]
    mov esi, eax
    shr esi, 20
    test edi, edi
    push esi
    jne L0
    push 0101975A0h
    push edi
    call dword ptr [fp_101D49C8]
    add esp, 12
    pop edi
    mov eax, esi
    pop esi
    ret
L0:
    push edi
    push 010197550h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 16
    cmp edi, esi
    jae L1
    lea esi, [edi - 16]
    push esi
    push 01019750Ch
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
L1:
    pop edi
    mov eax, esi
    pop esi
    ret
FUN_1002bf50 ENDP
END
