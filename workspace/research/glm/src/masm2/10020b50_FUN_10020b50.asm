.686
.MODEL FLAT, C
EXTRN sub_10020C21:PROC
EXTRN sub_100210AB:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_106784A0:DWORD:DWORD
EXTRN EXTRN g_106784AC:DWORD:DWORD
EXTRN EXTRN g_106784B8:DWORD:DWORD
EXTRN EXTRN g_106784D0:DWORD:DWORD
EXTRN EXTRN g_106784E8:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9B4:DWORD:DWORD
.CODE
FUN_10020b50 PROC
    push push edi
    xor xor eax, eax
    mov mov ecx, 21
    mov mov edi, 010678498h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, 01000h
    push push 0200000h
    mov mov dword ptr [g_106784A0], eax
    mov mov dword ptr [g_106784AC], 0200h
    mov mov dword ptr [g_106784B8], eax
    mov mov dword ptr [g_106784D0], 04000h
    mov mov dword ptr [g_106784E8], eax
    call dword ptr [fp_101D49D4]
    push push 0200000h
    mov mov dword ptr [g_1072D9B0], eax
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [g_1072D9B4], eax
    mov mov eax, dword ptr [g_101DA9C8]
    add add esp, 8
    xor xor ecx, ecx
    cmp cmp eax, ecx
    pop pop edi
    jne sub_10020C21
    jmp sub_100210AB
    mov mov dword ptr [eax + 0249D0Ch], ecx
    mov mov dword ptr [eax + 0249D10h], ecx
    mov mov dword ptr [eax + 0249D14h], ecx
    ret ret
FUN_10020b50 ENDP
END
