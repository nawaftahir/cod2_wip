.686
.MODEL FLAT, C
EXTRN sub_100FA20B:PROC
EXTRN fp_1010C194:DWORD
EXTRN g_101AE16C:DWORD
EXTRN g_101AE17C:DWORD
EXTRN g_101AE180:DWORD
.CODE
_GetLcidFromCountry PROC
    push dword ptr [g_101AE180]
    call sub_100FA20B
    sub eax, 3
    neg eax
    pop ecx
    sbb eax, eax
    push 1
    inc eax
    push 01010066Bh
    mov dword ptr [g_101AE17C], eax
    call dword ptr [fp_1010C194]
    test byte ptr [g_101AE16C], 4
    jne L0
    and dword ptr [g_101AE16C], 0
L0:
    ret
_GetLcidFromCountry ENDP
END
