.686
.MODEL FLAT, C
EXTRN sub_100FA20B:PROC
EXTRN sub_10100ABA:PROC
EXTRN EXTRN fp_1010C194:DWORD:DWORD
EXTRN EXTRN g_101AE16C:DWORD:DWORD
EXTRN EXTRN g_101AE17C:DWORD:DWORD
EXTRN EXTRN g_101AE180:DWORD:DWORD
.CODE
_GetLcidFromCountry PROC
    push push dword ptr [g_101AE180]
    call sub_100FA20B
    sub sub eax, 3
    neg neg eax
    pop pop ecx
    sbb sbb eax, eax
    push push 1
    inc inc eax
    push push 01010066Bh
    mov mov dword ptr [g_101AE17C], eax
    call dword ptr [fp_1010C194]
    test test byte ptr [g_101AE16C], 4
    jne sub_10100ABA
    and and dword ptr [g_101AE16C], 0
    ret ret
_GetLcidFromCountry ENDP
END
