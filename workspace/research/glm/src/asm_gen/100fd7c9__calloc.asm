; _calloc @ 0x100fd7c9 — auto-synthesized
    EXTRN fp_1010c130:DWORD
    EXTRN g_101ae238:DWORD
    EXTRN g_1076ac70:DWORD
    EXTRN g_1076ac94:DWORD
    EXTRN g_1076ac98:DWORD
    sub_100fb61c PROTO C
    sub_100fc0c6 PROTO C
    sub_100fd8f5 PROTO C
    sub_100fd90a PROTO C
    sub_100fd912 PROTO C
    sub_100fd925 PROTO C
    sub_101003b2 PROTO C
    sub_10101e22 PROTO C
    sub_10107f48 PROTO C
.CODE
_calloc PROC
    push 0x10
    push 0x1017c9c0
    call sub_100fb61c
    mov esi, dword ptr [ebp + 8]
    imul esi, dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 0x20], esi
    test esi, esi
    jne L0
    inc esi
    xor edi, edi
    mov dword ptr [ebp - 0x1c], edi
    cmp esi, -0x20
    ja L1
    cmp dword ptr [g_1076ac98], 3
    jne L2
    add esi, 0xf
    and esi, 0xfffffff0
    mov dword ptr [ebp + 0xc], esi
    mov ebx, dword ptr [ebp - 0x20]
    cmp ebx, dword ptr [g_1076ac70]
    ja L2
    push 4
    call sub_100fc0c6
    pop ecx
    and dword ptr [ebp - 4], edi
    push ebx
    call sub_10101e22
    pop ecx
    mov dword ptr [ebp - 0x1c], eax
    or dword ptr [ebp - 4], 0xffffffff
    call L3
    mov edi, dword ptr [ebp - 0x1c]
    test edi, edi
    je L4
    push dword ptr [ebp - 0x20]
    push 0
    push edi
    call sub_101003b2
    add esp, 0xc
    test edi, edi
    jne sub_100fd8f5
    push esi
    push 8
    push dword ptr [g_1076ac94]
    call dword ptr [fp_1010c130]
    mov edi, eax
    test edi, edi
    jne sub_100fd90a
    cmp dword ptr [g_101ae238], edi
    je sub_100fd912
    push esi
    call sub_10107f48
    pop ecx
    test eax, eax
    jne L0
    jmp sub_100fd925
    mov esi, dword ptr [ebp + 0xc]
    push 4
_calloc ENDP
END