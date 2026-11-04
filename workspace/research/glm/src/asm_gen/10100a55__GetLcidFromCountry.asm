; _GetLcidFromCountry @ 0x10100a55 — auto-synthesized
    EXTRN fp_1010c194:DWORD
    EXTRN g_101ae16c:DWORD
    EXTRN g_101ae17c:DWORD
    EXTRN g_101ae180:DWORD
    sub_100fa20b PROTO C
.CODE
_GetLcidFromCountry PROC
    push dword ptr [g_101ae180]
    call sub_100fa20b
    sub eax, 3
    neg eax
    pop ecx
    sbb eax, eax
    push 1
    inc eax
    push 0x1010066b
    mov dword ptr [g_101ae17c], eax
    call dword ptr [fp_1010c194]
    test byte ptr [g_101ae16c], 4
    jne L0
    and dword ptr [g_101ae16c], 0
    ret
_GetLcidFromCountry ENDP
END