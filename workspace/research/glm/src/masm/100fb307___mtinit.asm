.686
.MODEL FLAT, C
EXTRN sub_100FB0F2:PROC
EXTRN sub_100FB1CE:PROC
EXTRN sub_100FBF17:PROC
EXTRN sub_100FD87B:PROC
EXTRN fp_1010C07C:DWORD
EXTRN fp_1010C0FC:DWORD
EXTRN fp_101ADDB8:DWORD
EXTRN fp_101ADDC0:DWORD
EXTRN g_1010C04C:DWORD
EXTRN g_1010C118:DWORD
EXTRN g_1010C11C:DWORD
EXTRN g_1010C120:DWORD
EXTRN g_101A4898:DWORD
EXTRN g_101ADDB8:DWORD
EXTRN g_101ADDBC:DWORD
EXTRN g_101ADDC0:DWORD
EXTRN g_101ADDC4:DWORD
.CODE
__mtinit PROC
    call sub_100FBF17
    test eax, eax
    jne L0
    call sub_100FB0F2
    xor eax, eax
    ret
L0:
    push esi
    push edi
    push 01017C7ECh
    call dword ptr [fp_1010C07C]
    mov edi, eax
    test edi, edi
    je L1
    mov esi, dword ptr [g_1010C04C]
    push 01017C7E0h
    push edi
    call esi
    push 01017C7D4h
    push edi
    mov dword ptr [g_101ADDB8], eax
    call esi
    push 01017C7C8h
    push edi
    mov dword ptr [g_101ADDBC], eax
    call esi
    push 01017C7C0h
    push edi
    mov dword ptr [g_101ADDC0], eax
    call esi
    cmp dword ptr [g_101ADDBC], 0
    mov dword ptr [g_101ADDC4], eax
    jne L1
    mov eax, dword ptr [g_1010C120]
    mov dword ptr [g_101ADDBC], eax
    mov eax, dword ptr [g_1010C11C]
    mov dword ptr [g_101ADDC0], eax
    mov eax, dword ptr [g_1010C118]
    mov dword ptr [g_101ADDB8], 0100FB0DBh
    mov dword ptr [g_101ADDC4], eax
L1:
    push 0100FB185h
    call dword ptr [fp_101ADDB8]
    cmp eax, -1
    mov dword ptr [g_101A4898], eax
    je L2
    xor edi, edi
    push 00000008Ch
    inc edi
    push edi
    call sub_100FD87B
    mov esi, eax
    test esi, esi
    pop ecx
    pop ecx
    je L2
    push esi
    push dword ptr [g_101A4898]
    call dword ptr [fp_101ADDC0]
    test eax, eax
    je L2
    mov dword ptr [esi + 84], 0101A4E88h
    mov dword ptr [esi + 20], edi
    call dword ptr [fp_1010C0FC]
    or dword ptr [esi + 4], 0FFFFFFFFh
    mov dword ptr [esi], eax
    mov eax, edi
    jmp L3
L2:
    call sub_100FB1CE
    xor eax, eax
L3:
    pop edi
    pop esi
    ret
__mtinit ENDP
END
