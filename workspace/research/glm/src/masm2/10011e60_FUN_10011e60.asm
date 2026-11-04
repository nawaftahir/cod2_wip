.686
.MODEL FLAT, C
EXTRN sub_10011F21:PROC
EXTRN sub_10011F27:PROC
EXTRN sub_10011F80:PROC
EXTRN EXTRN fp_101D49F4:DWORD:DWORD
EXTRN EXTRN g_101D4978:DWORD:DWORD
EXTRN EXTRN g_101D49A0:DWORD:DWORD
EXTRN EXTRN g_101D49C0:DWORD:DWORD
EXTRN EXTRN g_101D49C4:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10011e60 PROC
    mov mov eax, dword ptr [g_101D4978]
    test test eax, eax
    je L0
    lea lea esp, [esp]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [g_101D4978], eax
    jne L1
    mov mov eax, dword ptr [g_101D49A0]
    test test eax, eax
    je L2
L0:
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [g_101D49A0], eax
    jne L2
    push push esi
    mov mov esi, 0101D4988h
    lea lea ecx, [ecx]
    cmp cmp dword ptr [esi], 0
    je sub_10011F21
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    mov mov dword ptr [esi], 0
    jne sub_10011F21
    add add esi, 12
    cmp cmp esi, 0101D49A0h
    jne sub_10011F27
L2:
    mov mov eax, dword ptr [g_101D49C0]
    test test eax, eax
    pop pop esi
    je sub_10011F80
    push push eax
    call dword ptr [fp_101D49F4]
    add add esp, 4
    mov mov dword ptr [g_101D49C0], 0
    mov mov dword ptr [g_101D49C4], 0
    ret ret
FUN_10011e60 ENDP
END
