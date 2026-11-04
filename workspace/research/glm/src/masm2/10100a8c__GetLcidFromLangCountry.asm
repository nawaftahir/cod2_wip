.686
.MODEL FLAT, C
EXTRN sub_100FA20B:PROC
EXTRN sub_100FA223:PROC
EXTRN sub_101006A7:PROC
EXTRN sub_10100B1C:PROC
EXTRN sub_10100B38:PROC
EXTRN sub_10100B7F:PROC
EXTRN sub_10100B84:PROC
EXTRN sub_10100B8F:PROC
EXTRN EXTRN fp_1010C194:DWORD:DWORD
EXTRN EXTRN g_101AE16C:DWORD:DWORD
EXTRN EXTRN g_101AE170:DWORD:DWORD
EXTRN EXTRN g_101AE178:DWORD:DWORD
EXTRN EXTRN g_101AE17C:DWORD:DWORD
EXTRN EXTRN g_101AE180:DWORD:DWORD
EXTRN EXTRN g_101AE184:DWORD:DWORD
EXTRN EXTRN g_101AE188:DWORD:DWORD
.CODE
_GetLcidFromLangCountry PROC
    push push dword ptr [g_101AE188]
    call sub_100FA20B
    push push dword ptr [g_101AE180]
    sub sub eax, 3
    neg neg eax
    sbb sbb eax, eax
    inc inc eax
    mov mov dword ptr [g_101AE178], eax
    call sub_100FA223
    sub sub eax, 3
    neg neg eax
    sbb sbb eax, eax
    and and dword ptr [g_101AE170], 0
    inc inc eax
    cmp cmp dword ptr [g_101AE178], 0
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [g_101AE17C], eax
    je sub_10100B1C
    mov mov dword ptr [g_101AE184], 2
    jmp sub_10100B38
    mov mov edx, dword ptr [g_101AE188]
    call sub_101006A7
    mov mov dword ptr [g_101AE184], eax
    push push 1
    push push 010100770h
    call dword ptr [fp_1010C194]
    mov mov eax, dword ptr [g_101AE16C]
    test test ah, 1
    je sub_10100B7F
    test test ah, 2
    je sub_10100B84
    test test al, 7
    jne sub_10100B8F
    and and dword ptr [g_101AE16C], 0
    ret ret
_GetLcidFromLangCountry ENDP
END
