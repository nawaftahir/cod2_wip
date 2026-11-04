.686
.MODEL FLAT, C
EXTRN sub_1001E55F:PROC
EXTRN sub_1001E5B0:PROC
EXTRN sub_100EFE93:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101D4810:DWORD:DWORD
EXTRN EXTRN g_101D49B0:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_1001e4b0 PROC
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [eax + 0217C78h]
    mov mov eax, dword ptr [g_101D4810]
    test test eax, eax
    push push esi
    mov mov esi, dword ptr [ecx + 8]
    jne L0
    mov mov eax, dword ptr [esp + 8]
    test test eax, eax
    mov mov eax, 02000h
    je L1
    mov mov eax, 01000h
    mov mov edx, dword ptr [esi]
    push push edi
    push push eax
    push push 0101D49B0h
    push push 0
    push push 0
    push push esi
    call call dword ptr [edx + 44]
    mov mov edi, eax
L0:
    test test edi, edi
    jge sub_1001E55F
    push push 010194030h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    push push edi
    call sub_100EFE93
    push push eax
    push push 010194008h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    call dword ptr [fp_101D4A1C]
    test test byte ptr [g_101D49B0], 15
    pop pop edi
    je sub_1001E5B0
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax + 48]
    mov mov dword ptr [g_101D49B0], 0
    pop pop esi
    ret ret
FUN_1001e4b0 ENDP
END
