.686
.MODEL FLAT, C
EXTRN sub_100210AB:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_106784A0:DWORD
EXTRN g_106784AC:DWORD
EXTRN g_106784B8:DWORD
EXTRN g_106784D0:DWORD
EXTRN g_106784E8:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9B4:DWORD
.CODE
FUN_10020b50 PROC
    push edi
    xor eax, eax
    mov ecx, 21
    mov edi, 010678498h
    rep stosd dword ptr es:[edi], eax
    mov eax, 000001000h
    push 000200000h
    mov dword ptr [g_106784A0], eax
    mov dword ptr [g_106784AC], 000000200h
    mov dword ptr [g_106784B8], eax
    mov dword ptr [g_106784D0], 000004000h
    mov dword ptr [g_106784E8], eax
    call dword ptr [fp_101D49D4]
    push 000200000h
    mov dword ptr [g_1072D9B0], eax
    call dword ptr [fp_101D49D4]
    mov dword ptr [g_1072D9B4], eax
    mov eax, dword ptr [g_101DA9C8]
    add esp, 8
    xor ecx, ecx
    cmp eax, ecx
    pop edi
    jne L0
    jmp sub_100210AB
L0:
    mov dword ptr [eax + 000249D0Ch], ecx
    mov dword ptr [eax + 000249D10h], ecx
    mov dword ptr [eax + 000249D14h], ecx
    ret
FUN_10020b50 ENDP
END
