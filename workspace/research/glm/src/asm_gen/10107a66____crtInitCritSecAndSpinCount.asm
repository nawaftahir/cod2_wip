; ___crtInitCritSecAndSpinCount @ 0x10107a66 — auto-synthesized
    EXTRN fp_1010c04c:DWORD
    EXTRN fp_1010c07c:DWORD
    EXTRN g_101ae00c:DWORD
    EXTRN g_101ae22c:DWORD
    sub_100fb61c PROTO C
    sub_10107b44 PROTO C
.CODE
___crtInitCritSecAndSpinCount PROC
    push 0x10
    push 0x10182270
    call sub_100fb61c
    mov eax, dword ptr [g_101ae22c]
    test eax, eax
    jne L0
    cmp dword ptr [g_101ae00c], 1
    je L1
    push 0x1017c7ec
    call dword ptr [fp_1010c07c]
    test eax, eax
    je L1
    push 0x10182244
    push eax
    call dword ptr [fp_1010c04c]
    mov dword ptr [g_101ae22c], eax
    test eax, eax
    jne L0
    mov eax, 0x10107a56
    mov dword ptr [g_101ae22c], eax
    and dword ptr [ebp - 4], 0
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call eax
    mov dword ptr [ebp - 0x20], eax
    jmp sub_10107b44
    mov eax, dword ptr [ebp - 0x14]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax]
    mov dword ptr [ebp - 0x1c], eax
___crtInitCritSecAndSpinCount ENDP
END