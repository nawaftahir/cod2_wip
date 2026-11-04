.686
.MODEL FLAT, C
EXTRN sub_10013952:PROC
EXTRN sub_1001397D:PROC
EXTRN sub_1001517A:PROC
EXTRN sub_100F78F0:PROC
EXTRN sub_100F7978:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_101D7EB0:DWORD
.CODE
FUN_10014c60 PROC
    push ecx
    push esi
    push edi
    mov edi, eax
L0:
    mov eax, dword ptr [g_101D7EB0]
    xor esi, esi
    test eax, eax
    jle L2
L1:
    mov eax, dword ptr [esi*4 + 0101D7EB4h]
    mov ecx, dword ptr [eax + 20]
    push ecx
    push edi
    call sub_100F78F0
    add esp, 8
    test eax, eax
    je L7
    mov eax, dword ptr [g_101D7EB0]
    inc esi
    cmp esi, eax
    jl L1
L2:
    cmp eax, 64
    jne L5
    push 0101942A0h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101D7EB0]
    add esp, 8
    xor esi, esi
    test eax, eax
    jle L4
    jmp L3
    lea esp, [esp]
    nop
L3:
    mov edx, dword ptr [esi*4 + 0101D7EB4h]
    mov eax, dword ptr [edx + 20]
    push eax
    push 0101932D4h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101D7EB0]
    add esp, 12
    inc esi
    cmp esi, eax
    jl L3
L4:
    push eax
    push 010194260h
    push 1
    call sub_10013952
    add esp, 12
L5:
    call sub_1001517A
    test eax, eax
    jne L8
    push 010194250h
    push edi
    call sub_100F7978
    add esp, 8
    test eax, eax
    jne L6
    push edi
    push 010194228h
    push 1
    call sub_1001397D
    add esp, 12
L6:
    mov edi, 010194250h
    jmp L0
L7:
    mov eax, dword ptr [esi*4 + 0101D7EB4h]
    pop edi
    pop esi
    pop ecx
    ret
L8:
    mov ecx, dword ptr [g_101D7EB0]
    mov dword ptr [ecx*4 + 0101D7EB4h], eax
    mov ecx, dword ptr [g_101D7EB0]
    inc ecx
    pop edi
FUN_10014c60 ENDP
END
