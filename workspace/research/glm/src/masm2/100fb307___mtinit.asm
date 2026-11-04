.686
.MODEL FLAT, C
EXTRN sub_100FB0F2:PROC
EXTRN sub_100FB1CE:PROC
EXTRN sub_100FB3FD:PROC
EXTRN sub_100FB490:PROC
EXTRN sub_100FB4A6:PROC
EXTRN sub_100FB4B7:PROC
EXTRN sub_100FB4D8:PROC
EXTRN sub_100FBF17:PROC
EXTRN sub_100FD87B:PROC
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
EXTRN EXTRN fp_1010C0FC:DWORD:DWORD
EXTRN EXTRN fp_101ADDB8:DWORD:DWORD
EXTRN EXTRN fp_101ADDC0:DWORD:DWORD
EXTRN EXTRN g_1010C04C:DWORD:DWORD
EXTRN EXTRN g_1010C118:DWORD:DWORD
EXTRN EXTRN g_1010C11C:DWORD:DWORD
EXTRN EXTRN g_1010C120:DWORD:DWORD
EXTRN EXTRN g_101A4898:DWORD:DWORD
EXTRN EXTRN g_101ADDB8:DWORD:DWORD
EXTRN EXTRN g_101ADDBC:DWORD:DWORD
EXTRN EXTRN g_101ADDC0:DWORD:DWORD
EXTRN EXTRN g_101ADDC4:DWORD:DWORD
.CODE
__mtinit PROC
    call sub_100FBF17
    test test eax, eax
    jne L0
    call sub_100FB0F2
    xor xor eax, eax
    ret ret
    push push esi
    push push edi
    push push 01017C7ECh
    call dword ptr [fp_1010C07C]
    mov mov edi, eax
    test test edi, edi
    je L1
    mov mov esi, dword ptr [g_1010C04C]
    push push 01017C7E0h
    push push edi
    call call esi
    push push 01017C7D4h
    push push edi
    mov mov dword ptr [g_101ADDB8], eax
    call call esi
    push push 01017C7C8h
    push push edi
    mov mov dword ptr [g_101ADDBC], eax
    call call esi
    push push 01017C7C0h
    push push edi
    mov mov dword ptr [g_101ADDC0], eax
    call call esi
    cmp cmp dword ptr [g_101ADDBC], 0
    mov mov dword ptr [g_101ADDC4], eax
    jne sub_100FB3FD
    mov mov eax, dword ptr [g_1010C120]
    mov mov dword ptr [g_101ADDBC], eax
    mov mov eax, dword ptr [g_1010C11C]
    mov mov dword ptr [g_101ADDC0], eax
    mov mov eax, dword ptr [g_1010C118]
    mov mov dword ptr [g_101ADDB8], 0100FB0DBh
    mov mov dword ptr [g_101ADDC4], eax
    push push 0100FB185h
    call dword ptr [fp_101ADDB8]
    cmp cmp eax, -1
    mov mov dword ptr [g_101A4898], eax
    je sub_100FB490
    xor xor edi, edi
    push push 08Ch
    inc inc edi
    push push edi
    call sub_100FD87B
    mov mov esi, eax
    test test esi, esi
    pop pop ecx
    pop pop ecx
    je sub_100FB4A6
    push push esi
    push push dword ptr [g_101A4898]
    call dword ptr [fp_101ADDC0]
    test test eax, eax
    je sub_100FB4B7
    mov mov dword ptr [esi + 84], 0101A4E88h
    mov mov dword ptr [esi + 20], edi
    call dword ptr [fp_1010C0FC]
    or or dword ptr [esi + 4], -1
    mov mov dword ptr [esi], eax
    mov mov eax, edi
    jmp sub_100FB4D8
    call sub_100FB1CE
    xor xor eax, eax
    pop pop edi
    pop pop esi
    ret ret
__mtinit ENDP
END
