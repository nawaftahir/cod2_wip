.686
.MODEL FLAT, C
EXTRN fp_101D49F4:DWORD
EXTRN g_101D4978:DWORD
EXTRN g_101D49A0:DWORD
EXTRN g_101D49C0:DWORD
EXTRN g_101D49C4:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10011e60 PROC
    mov eax, dword ptr [g_101D4978]
    test eax, eax
    je L1
    lea esp, [esp]
L0:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101D4978], eax
    jne L0
L1:
    mov eax, dword ptr [g_101D49A0]
    test eax, eax
    je L3
L2:
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101D49A0], eax
    jne L2
L3:
    push esi
    mov esi, 0101D4988h
    lea ecx, [ecx]
L4:
    cmp dword ptr [esi], 0
    je L6
L5:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    mov dword ptr [esi], 0
    jne L5
L6:
    add esi, 12
    cmp esi, 0101D49A0h
    jne L4
    mov eax, dword ptr [g_101D49C0]
    test eax, eax
    pop esi
    je L7
    push eax
    call dword ptr [fp_101D49F4]
    add esp, 4
    mov dword ptr [g_101D49C0], 0
    mov dword ptr [g_101D49C4], 0
L7:
    ret
FUN_10011e60 ENDP
END
