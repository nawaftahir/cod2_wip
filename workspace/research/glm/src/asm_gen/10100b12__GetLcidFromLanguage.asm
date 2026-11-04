; _GetLcidFromLanguage @ 0x10100b12 — auto-synthesized
    EXTRN fp_1010c194:DWORD
    EXTRN g_101ae16c:DWORD
    EXTRN g_101ae178:DWORD
    EXTRN g_101ae184:DWORD
    EXTRN g_101ae188:DWORD
    sub_100fa20b PROTO C
    sub_10100680 PROTO C
.CODE
_GetLcidFromLanguage PROC
    push dword ptr [g_101ae188]
    call sub_100fa20b
    sub eax, 3
    neg eax
    sbb eax, eax
    inc eax
    pop ecx
    mov dword ptr [g_101ae178], eax
    je L0
    mov dword ptr [g_101ae184], 2
    jmp L1
    mov edx, dword ptr [g_101ae188]
    call sub_10100680
    mov dword ptr [g_101ae184], eax
    push 1
    push 0x1010098a
    call dword ptr [fp_1010c194]
    test byte ptr [g_101ae16c], 4
    jne L2
    and dword ptr [g_101ae16c], 0
    ret
_GetLcidFromLanguage ENDP
END