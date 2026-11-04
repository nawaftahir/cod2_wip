.686
.MODEL FLAT, C
EXTRN sub_10013952:PROC
EXTRN sub_1001397D:PROC
EXTRN sub_10014D56:PROC
EXTRN sub_10014DD0:PROC
EXTRN sub_10014DD3:PROC
EXTRN sub_1001517A:PROC
EXTRN sub_100F78F0:PROC
EXTRN sub_100F7978:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D7EB0:DWORD:DWORD
.CODE
FUN_10014c60 PROC
    push push ecx
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [g_101D7EB0]
    xor xor esi, esi
    test test eax, eax
    jle L0
    mov mov eax, dword ptr [esi*4 + 0101D7EB4h]
    mov mov ecx, dword ptr [eax + 20]
    push push ecx
    push push edi
    call sub_100F78F0
    add add esp, 8
    test test eax, eax
    je sub_10014D56
    mov mov eax, dword ptr [g_101D7EB0]
    inc inc esi
    cmp cmp esi, eax
    jl L0
    cmp cmp eax, 64
    jne L3
    push push 0101942A0h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [g_101D7EB0]
    add add esp, 8
    xor xor esi, esi
    test test eax, eax
    jle L4
    jmp L1
    lea lea esp, [esp]
    nop nop
    mov mov edx, dword ptr [esi*4 + 0101D7EB4h]
    mov mov eax, dword ptr [edx + 20]
    push push eax
    push push 0101932D4h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [g_101D7EB0]
    add add esp, 12
    inc inc esi
    cmp cmp esi, eax
    jl L5
    push push eax
    push push 010194260h
    push push 1
    call sub_10013952
    add add esp, 12
    call sub_1001517A
    test test eax, eax
    jne sub_10014DD3
    push push 010194250h
    push push edi
    call sub_100F7978
    add add esp, 8
    test test eax, eax
    jne sub_10014DD0
    push push edi
    push push 010194228h
    push push 1
L1:
    call sub_1001397D
    add add esp, 12
    mov mov edi, 010194250h
    jmp L2
    mov mov eax, dword ptr [esi*4 + 0101D7EB4h]
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
    mov mov ecx, dword ptr [g_101D7EB0]
L4:
    mov mov dword ptr [ecx*4 + 0101D7EB4h], eax
    mov mov ecx, dword ptr [g_101D7EB0]
    inc inc ecx
    pop pop edi
FUN_10014c60 ENDP
END
