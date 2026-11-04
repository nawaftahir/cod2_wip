.686
.MODEL FLAT, C
EXTRN sub_10012053:PROC
EXTRN sub_1001283E:PROC
EXTRN sub_100128E9:PROC
EXTRN sub_100129EE:PROC
EXTRN sub_10012BB9:PROC
EXTRN fp_1010C1DC:DWORD
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN fp_101D4A24:DWORD
EXTRN fp_101D4A6C:DWORD
EXTRN g_101CE688:DWORD
EXTRN g_101CE6DC:DWORD
EXTRN g_101CE7FC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4934:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_101D4C74:DWORD
.CODE
FUN_10012c80 PROC
    mov eax, dword ptr [g_101D1BF8]
    sub esp, 36
    test eax, eax
    push esi
    push edi
    je L0
    call sub_10012053
    pop edi
    pop esi
    add esp, 36
    ret
L0:
    call sub_1001283E
    mov edi, edi
L1:
    lea esi, [esp + 8]
    call sub_10012BB9
    call sub_100129EE
    test al, al
    je L2
    mov edi, esi
    call sub_100128E9
    test al, al
    jne L7
L2:
    mov ecx, dword ptr [g_101CE6DC]
    mov eax, dword ptr [ecx + 8]
    cmp eax, 1
    jle L3
    dec eax
    push eax
    push ecx
    call dword ptr [fp_101D4A6C]
    add esp, 8
    jmp L1
L3:
    mov ecx, dword ptr [g_101CE7FC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    jle L4
    cmp dword ptr [g_101D4C74], 60
    jle L4
    dec eax
    push eax
    push ecx
    call dword ptr [fp_101D4A6C]
    add esp, 8
    jmp L1
L4:
    mov ecx, dword ptr [g_101CE688]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    jle L6
    cmp dword ptr [g_101D4C6C], 000000280h
    jg L5
    cmp dword ptr [g_101D4C70], 0000001E0h
    jle L6
L5:
    dec eax
    push eax
    push ecx
    call dword ptr [fp_101D4A6C]
    add esp, 8
    jmp L1
L6:
    push 010194150h
    push 0
    call dword ptr [fp_101D49C8]
    push 0101940F0h
    push 0
    call dword ptr [fp_101D49C8]
    push 010194090h
    push 0
    call dword ptr [fp_101D49C8]
    push 010193AF0h
    push 010194088h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 36
    call dword ptr [fp_101D4A1C]
    jmp L1
L7:
    call dword ptr [fp_101D4A24]
    mov eax, dword ptr [esp + 8]
    push 5
    push eax
    mov dword ptr [g_101D4934], 0
    call dword ptr [fp_1010C1DC]
    pop edi
    pop esi
    add esp, 36
    ret
FUN_10012c80 ENDP
END
