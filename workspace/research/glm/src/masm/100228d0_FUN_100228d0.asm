.686
.MODEL FLAT, C
EXTRN sub_10061D2C:PROC
EXTRN sub_100EFE81:PROC
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4878:DWORD
.CODE
FUN_100228d0 PROC
    push ecx
    mov eax, dword ptr [g_101D4878]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 4]
    mov eax, dword ptr [g_101D4878]
    pop ecx
    ret
L0:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 0
    lea ecx, [esp + 4]
    push ecx
    push 0
    push 0
    push 0
    push 75
    push 000000080h
    push 000000080h
    push eax
    call dword ptr [edx + 0x74]
    test eax, eax
    jge L1
    push eax
    call sub_100EFE81
    push eax
    push 000000080h
    push 000000080h
    push 010196B6Ch
    push 0
    call sub_10061D2C
    add esp, 20
L1:
    mov eax, dword ptr [esp]
    pop ecx
    ret
FUN_100228d0 ENDP
END
