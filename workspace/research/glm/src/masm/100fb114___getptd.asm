.686
.MODEL FLAT, C
EXTRN sub_100F7896:PROC
EXTRN sub_100FD7F1:PROC
EXTRN fp_1010C054:DWORD
EXTRN fp_1010C0FC:DWORD
EXTRN fp_1010C110:DWORD
EXTRN fp_101ADDBC:DWORD
EXTRN fp_101ADDC0:DWORD
EXTRN g_101A4898:DWORD
.CODE
__getptd PROC
    push ebx
    push esi
    call dword ptr [fp_1010C054]
    push dword ptr [g_101A4898]
    mov ebx, eax
    call dword ptr [fp_101ADDBC]
    mov esi, eax
    test esi, esi
    jne L1
    push 00000008Ch
    push 1
    call sub_100FD7F1
    mov esi, eax
    test esi, esi
    pop ecx
    pop ecx
    je L0
    push esi
    push dword ptr [g_101A4898]
    call dword ptr [fp_101ADDC0]
    test eax, eax
    je L0
    mov dword ptr [esi + 84], 0101A4E88h
    mov dword ptr [esi + 20], 1
    call dword ptr [fp_1010C0FC]
    or dword ptr [esi + 4], 0FFFFFFFFh
    mov dword ptr [esi], eax
    jmp L1
L0:
    push 16
    call sub_100F7896
    pop ecx
L1:
    push ebx
    call dword ptr [fp_1010C110]
    mov eax, esi
    pop esi
    pop ebx
    ret
__getptd ENDP
END
