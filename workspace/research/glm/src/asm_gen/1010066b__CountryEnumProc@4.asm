; _CountryEnumProc@4 @ 0x1010066b — auto-synthesized
    EXTRN fp_101ae18c:DWORD
    EXTRN g_101a50d0:DWORD
    EXTRN g_101ae16c:DWORD
    EXTRN g_101ae170:DWORD
    EXTRN g_101ae174:DWORD
    EXTRN g_101ae17c:DWORD
    EXTRN g_101ae180:DWORD
    sub_100f7925 PROTO C
    sub_1010057a PROTO C
    sub_10100630 PROTO C
    sub_10100ddd PROTO C
.CODE
_CountryEnumProc@4 PROC
    push ebp
    mov ebp, esp
    sub esp, 0x7c
    mov eax, dword ptr [g_101a50d0]
    mov edx, dword ptr [ebp + 8]
    push esi
    mov dword ptr [ebp - 4], eax
    call sub_10100630
    mov esi, eax
    push 0x78
    lea eax, [ebp - 0x7c]
    push eax
    mov eax, dword ptr [g_101ae17c]
    neg eax
    sbb eax, eax
    and eax, 0xfffff005
    add eax, 0x1002
    push eax
    push esi
    call dword ptr [fp_101ae18c]
    test eax, eax
    jne L0
    and dword ptr [g_101ae16c], eax
    inc eax
    jmp L1
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr [g_101ae180]
    call sub_100f7925
    test eax, eax
    pop ecx
    pop ecx
    jne L2
    push esi
    call sub_1010057a
    test eax, eax
    pop ecx
    je L2
    or dword ptr [g_101ae16c], 4
    mov dword ptr [g_101ae174], esi
    mov dword ptr [g_101ae170], esi
    mov eax, dword ptr [g_101ae16c]
    shr eax, 2
    not eax
    and eax, 1
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100ddd
    leave
    ret 4
_CountryEnumProc@4 ENDP
END