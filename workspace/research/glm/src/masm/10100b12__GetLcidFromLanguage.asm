.686
.MODEL FLAT, C
EXTRN sub_100FA20B:PROC
EXTRN sub_10100680:PROC
EXTRN fp_1010C194:DWORD
EXTRN g_101AE16C:DWORD
EXTRN g_101AE178:DWORD
EXTRN g_101AE184:DWORD
EXTRN g_101AE188:DWORD
.CODE
_GetLcidFromLanguage PROC
    push dword ptr [g_101AE188]
    call sub_100FA20B
    sub eax, 3
    neg eax
    sbb eax, eax
    inc eax
    pop ecx
    mov dword ptr [g_101AE178], eax
    je L0
    mov dword ptr [g_101AE184], 2
    jmp L1
L0:
    mov edx, dword ptr [g_101AE188]
    call sub_10100680
    mov dword ptr [g_101AE184], eax
L1:
    push 1
    push 01010098Ah
    call dword ptr [fp_1010C194]
    test byte ptr [g_101AE16C], 4
    jne L2
    and dword ptr [g_101AE16C], 0
L2:
    ret
_GetLcidFromLanguage ENDP
END
