.686
.MODEL FLAT, C
EXTRN fp_1010C1D4:DWORD
EXTRN g_1010C1E8:DWORD
EXTRN g_101D1BF4:DWORD
EXTRN g_101D1BFC:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_101D4C78:DWORD
.CODE
FUN_10011560 PROC
    mov eax, dword ptr [g_101D4C78]
    sub esp, 40
    test eax, eax
    push edi
    je L1
    mov edx, dword ptr [g_101D1BFC]
    mov eax, dword ptr [g_101D1BF4]
    mov ecx, dword ptr [eax]
    push edx
    push eax
    call dword ptr [ecx + 0x3c]
    lea ecx, [esp + 4]
    push ecx
    push eax
    mov dword ptr [esp + 12], 40
    call dword ptr [fp_1010C1D4]
    test eax, eax
    je L0
    mov edi, dword ptr [esp + 8]
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 12]
    sub edx, edi
    sub eax, ecx
    mov dword ptr [esi], edx
    mov dword ptr [ebx], eax
    pop edi
    add esp, 40
    ret
L0:
    mov edi, dword ptr [g_1010C1E8]
    push 0
    call edi
    push 1
    mov dword ptr [esi], eax
    call edi
    mov dword ptr [ebx], eax
    cmp dword ptr [esi], 0
    jle L1
    test eax, eax
    jg L2
L1:
    mov ecx, dword ptr [g_101D4C6C]
    mov edx, dword ptr [g_101D4C70]
    mov dword ptr [esi], ecx
    mov dword ptr [ebx], edx
L2:
    pop edi
    add esp, 40
    ret
FUN_10011560 ENDP
END
