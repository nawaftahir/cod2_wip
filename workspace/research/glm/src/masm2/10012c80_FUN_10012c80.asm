.686
.MODEL FLAT, C
EXTRN sub_10012053:PROC
EXTRN sub_1001283E:PROC
EXTRN sub_100128E9:PROC
EXTRN sub_100129EE:PROC
EXTRN sub_10012BB9:PROC
EXTRN sub_10012DBF:PROC
EXTRN sub_10012DC0:PROC
EXTRN sub_10012DC5:PROC
EXTRN sub_10012DDD:PROC
EXTRN EXTRN fp_1010C1DC:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN fp_101D4A24:DWORD:DWORD
EXTRN EXTRN fp_101D4A6C:DWORD:DWORD
EXTRN EXTRN g_101CE688:DWORD:DWORD
EXTRN EXTRN g_101CE6DC:DWORD:DWORD
EXTRN EXTRN g_101CE7FC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4934:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_101D4C74:DWORD:DWORD
.CODE
FUN_10012c80 PROC
    mov mov eax, dword ptr [g_101D1BF8]
    sub sub esp, 36
    test test eax, eax
    push push esi
    push push edi
    je L0
    call sub_10012053
    pop pop edi
    pop pop esi
    add add esp, 36
    ret ret
    call sub_1001283E
    mov mov edi, edi
    lea lea esi, [esp + 8]
    call sub_10012BB9
    call sub_100129EE
    test test al, al
    je L1
    mov mov edi, esi
    call sub_100128E9
    test test al, al
    jne sub_10012DBF
    mov mov ecx, dword ptr [g_101CE6DC]
    mov mov eax, dword ptr [ecx + 8]
    cmp cmp eax, 1
    jle L4
    dec dec eax
    push push eax
    push push ecx
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    jmp L2
    mov mov ecx, dword ptr [g_101CE7FC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    jle L6
    cmp cmp dword ptr [g_101D4C74], 60
    jle L7
L1:
    dec dec eax
    push push eax
    push push ecx
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    jmp L3
    mov mov ecx, dword ptr [g_101CE688]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    jle sub_10012DC5
    cmp cmp dword ptr [g_101D4C6C], 0280h
    jg sub_10012DC0
    cmp cmp dword ptr [g_101D4C70], 01E0h
    jle sub_10012DDD
    dec dec eax
    push push eax
    push push ecx
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    jmp L5
    push push 010194150h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 0101940F0h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010194090h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010193AF0h
    push push 010194088h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 36
    call dword ptr [fp_101D4A1C]
    jmp L8
    call dword ptr [fp_101D4A24]
    mov mov eax, dword ptr [esp + 8]
    push push 5
    push push eax
    mov mov dword ptr [g_101D4934], 0
    call dword ptr [fp_1010C1DC]
    pop pop edi
    pop pop esi
    add add esp, 36
    ret ret
FUN_10012c80 ENDP
END
