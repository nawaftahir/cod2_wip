.686
.MODEL FLAT, C
EXTRN sub_100EFE93:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101D4810:DWORD
EXTRN g_101D49B0:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_1001e4b0 PROC
    mov eax, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [eax + 000217C78h]
    mov eax, dword ptr [g_101D4810]
    test eax, eax
    push esi
    mov esi, dword ptr [ecx + 8]
    jne L0
    mov eax, dword ptr [esp + 8]
    test eax, eax
    mov eax, 000002000h
    je L1
L0:
    mov eax, 000001000h
L1:
    mov edx, dword ptr [esi]
    push edi
    push eax
    push 0101D49B0h
    push 0
    push 0
    push esi
    call dword ptr [edx + 0x2c]
    mov edi, eax
    test edi, edi
    jge L2
    push 010194030h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    push edi
    call sub_100EFE93
    push eax
    push 010194008h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    call dword ptr [fp_101D4A1C]
L2:
    test byte ptr [g_101D49B0], 15
    pop edi
    je L3
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax + 0x30]
    mov dword ptr [g_101D49B0], 0
L3:
    pop esi
    ret
FUN_1001e4b0 ENDP
END
