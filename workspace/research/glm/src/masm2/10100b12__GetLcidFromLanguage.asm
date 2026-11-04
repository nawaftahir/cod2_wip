.686
.MODEL FLAT, C
EXTRN sub_100FA20B:PROC
EXTRN sub_10100680:PROC
EXTRN sub_10100B70:PROC
EXTRN sub_10100BB3:PROC
EXTRN EXTRN fp_1010C194:DWORD:DWORD
EXTRN EXTRN g_101AE16C:DWORD:DWORD
EXTRN EXTRN g_101AE178:DWORD:DWORD
EXTRN EXTRN g_101AE184:DWORD:DWORD
EXTRN EXTRN g_101AE188:DWORD:DWORD
.CODE
_GetLcidFromLanguage PROC
    push push dword ptr [g_101AE188]
    call sub_100FA20B
    sub sub eax, 3
    neg neg eax
    sbb sbb eax, eax
    inc inc eax
    pop pop ecx
    mov mov dword ptr [g_101AE178], eax
    je L0
    mov mov dword ptr [g_101AE184], 2
    jmp sub_10100B70
    mov mov edx, dword ptr [g_101AE188]
    call sub_10100680
    mov mov dword ptr [g_101AE184], eax
    push push 1
    push push 01010098Ah
    call dword ptr [fp_1010C194]
    test test byte ptr [g_101AE16C], 4
    jne sub_10100BB3
    and and dword ptr [g_101AE16C], 0
    ret ret
_GetLcidFromLanguage ENDP
END
