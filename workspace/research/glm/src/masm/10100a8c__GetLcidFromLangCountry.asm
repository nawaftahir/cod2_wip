.686
.MODEL FLAT, C
EXTRN sub_100FA20B:PROC
EXTRN sub_100FA223:PROC
EXTRN sub_101006A7:PROC
EXTRN fp_1010C194:DWORD
EXTRN g_101AE16C:DWORD
EXTRN g_101AE170:DWORD
EXTRN g_101AE178:DWORD
EXTRN g_101AE17C:DWORD
EXTRN g_101AE180:DWORD
EXTRN g_101AE184:DWORD
EXTRN g_101AE188:DWORD
.CODE
_GetLcidFromLangCountry PROC
    push dword ptr [g_101AE188]
    call sub_100FA20B
    push dword ptr [g_101AE180]
    sub eax, 3
    neg eax
    sbb eax, eax
    inc eax
    mov dword ptr [g_101AE178], eax
    call sub_100FA223
    sub eax, 3
    neg eax
    sbb eax, eax
    and dword ptr [g_101AE170], 0
    inc eax
    cmp dword ptr [g_101AE178], 0
    pop ecx
    pop ecx
    mov dword ptr [g_101AE17C], eax
    je L0
    mov dword ptr [g_101AE184], 2
    jmp L1
L0:
    mov edx, dword ptr [g_101AE188]
    call sub_101006A7
    mov dword ptr [g_101AE184], eax
L1:
    push 1
    push 010100770h
    call dword ptr [fp_1010C194]
    mov eax, dword ptr [g_101AE16C]
    test ah, 1
    je L2
    test ah, 2
    je L2
    test al, 7
    jne L3
L2:
    and dword ptr [g_101AE16C], 0
L3:
    ret
_GetLcidFromLangCountry ENDP
END
