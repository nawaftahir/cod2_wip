; doexit @ 0x100fd6c6 — auto-synthesized
    EXTRN fp_1010c148:DWORD
    EXTRN fp_1010c14c:DWORD
    EXTRN g_101ae044:DWORD
    EXTRN g_101ae048:DWORD
    EXTRN g_101ae04c:DWORD
    EXTRN g_1076ada4:DWORD
    EXTRN g_1076ada8:DWORD
    sub_100fb61c PROTO C
    sub_100fc090 PROTO C
    sub_100fd68e PROTO C
    sub_100fd6a3 PROTO C
    sub_100fd6b3 PROTO C
    sub_100fd81f PROTO C
    sub_100fd836 PROTO C
.CODE
doexit PROC
    push 8
    push 0x1017c9b0
    call sub_100fb61c
    push 8
    call sub_100fc090
    pop ecx
    xor edi, edi
    mov dword ptr [ebp - 4], edi
    xor esi, esi
    inc esi
    cmp dword ptr [g_101ae04c], esi
    jne L0
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010c14c]
    push eax
    call dword ptr [fp_1010c148]
    mov dword ptr [g_101ae048], esi
    mov al, byte ptr [ebp + 0x10]
    mov byte ptr [g_101ae044], al
    cmp dword ptr [ebp + 0xc], edi
    jne L1
    cmp dword ptr [g_1076ada8], edi
    je L2
    mov eax, dword ptr [g_1076ada4]
    sub eax, 4
    mov dword ptr [g_1076ada4], eax
    cmp eax, dword ptr [g_1076ada8]
    jb L2
    mov eax, dword ptr [eax]
    cmp eax, edi
    je L3
    call eax
    jmp L3
    push 0x1019e02c
    mov eax, 0x1019e024
    call sub_100fd6a3
    pop ecx
    push 0x1019e034
    mov eax, 0x1019e030
    call sub_100fd6b3
    pop ecx
    or dword ptr [ebp - 4], 0xffffffff
    call L4
    cmp dword ptr [ebp + 0x10], edi
    jne sub_100fd81f
    mov dword ptr [g_101ae04c], esi
    push dword ptr [ebp + 8]
    call sub_100fd68e
    xor edi, edi
    xor esi, esi
    inc esi
    cmp dword ptr [ebp + 0x10], edi
    je sub_100fd836
doexit ENDP
END