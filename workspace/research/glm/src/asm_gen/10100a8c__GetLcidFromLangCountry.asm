; _GetLcidFromLangCountry @ 0x10100a8c — auto-synthesized
    EXTRN fp_1010c194:DWORD
    EXTRN g_101ae16c:DWORD
    EXTRN g_101ae170:DWORD
    EXTRN g_101ae178:DWORD
    EXTRN g_101ae17c:DWORD
    EXTRN g_101ae180:DWORD
    EXTRN g_101ae184:DWORD
    EXTRN g_101ae188:DWORD
    sub_100fa20b PROTO C
    sub_100fa223 PROTO C
    sub_101006a7 PROTO C
.CODE
_GetLcidFromLangCountry PROC
    push dword ptr [g_101ae188]
    call sub_100fa20b
    push dword ptr [g_101ae180]
    sub eax, 3
    neg eax
    sbb eax, eax
    inc eax
    mov dword ptr [g_101ae178], eax
    call sub_100fa223
    sub eax, 3
    neg eax
    sbb eax, eax
    and dword ptr [g_101ae170], 0
    inc eax
    cmp dword ptr [g_101ae178], 0
    pop ecx
    pop ecx
    mov dword ptr [g_101ae17c], eax
    je L0
    mov dword ptr [g_101ae184], 2
    jmp L1
    mov edx, dword ptr [g_101ae188]
    call sub_101006a7
    mov dword ptr [g_101ae184], eax
    push 1
    push 0x10100770
    call dword ptr [fp_1010c194]
    mov eax, dword ptr [g_101ae16c]
    test ah, 1
    je L2
    test ah, 2
    je L2
    test al, 7
    jne L3
    and dword ptr [g_101ae16c], 0
    ret
_GetLcidFromLangCountry ENDP
END