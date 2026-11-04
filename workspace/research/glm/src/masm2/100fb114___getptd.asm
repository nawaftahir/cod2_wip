.686
.MODEL FLAT, C
EXTRN sub_100F7896:PROC
EXTRN sub_100FB195:PROC
EXTRN sub_100FB1A1:PROC
EXTRN sub_100FB1B2:PROC
EXTRN sub_100FB1D6:PROC
EXTRN sub_100FD7F1:PROC
EXTRN EXTRN fp_1010C054:DWORD:DWORD
EXTRN EXTRN fp_1010C0FC:DWORD:DWORD
EXTRN EXTRN fp_1010C110:DWORD:DWORD
EXTRN EXTRN fp_101ADDBC:DWORD:DWORD
EXTRN EXTRN fp_101ADDC0:DWORD:DWORD
EXTRN EXTRN g_101A4898:DWORD:DWORD
.CODE
__getptd PROC
    push push ebx
    push push esi
    call dword ptr [fp_1010C054]
    push push dword ptr [g_101A4898]
    mov mov ebx, eax
    call dword ptr [fp_101ADDBC]
    mov mov esi, eax
    test test esi, esi
    jne sub_100FB195
    push push 08Ch
    push push 1
    call sub_100FD7F1
    mov mov esi, eax
    test test esi, esi
    pop pop ecx
    pop pop ecx
    je sub_100FB1A1
    push push esi
    push push dword ptr [g_101A4898]
    call dword ptr [fp_101ADDC0]
    test test eax, eax
    je sub_100FB1B2
    mov mov dword ptr [esi + 84], 0101A4E88h
    mov mov dword ptr [esi + 20], 1
    call dword ptr [fp_1010C0FC]
    or or dword ptr [esi + 4], -1
    mov mov dword ptr [esi], eax
    jmp sub_100FB1D6
    push push 16
    call sub_100F7896
    pop pop ecx
    push push ebx
    call dword ptr [fp_1010C110]
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    ret ret
__getptd ENDP
END
