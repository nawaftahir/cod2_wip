; flsall @ 0x100f6b68 — auto-synthesized
    EXTRN g_1076adb8:DWORD
    EXTRN g_1076bdc0:DWORD
    sub_100f6ba6 PROTO C
    sub_100f6bc1 PROTO C
    sub_100fb531 PROTO C
    sub_100fb5e8 PROTO C
    sub_100fb61c PROTO C
    sub_100fc098 PROTO C
.CODE
flsall PROC
    push 0x14
    push 0x1017c440
    call sub_100fb61c
    xor edi, edi
    mov dword ptr [ebp - 0x1c], edi
    mov dword ptr [ebp - 0x24], edi
    push 1
    call sub_100fc098
    pop ecx
    mov dword ptr [ebp - 4], edi
    xor esi, esi
    mov dword ptr [ebp - 0x20], esi
    cmp esi, dword ptr [g_1076bdc0]
    jge L0
    mov eax, dword ptr [g_1076adb8]
    mov eax, dword ptr [eax + esi*4]
    cmp eax, edi
    je L1
    test byte ptr [eax + 0xc], 0x83
    je L1
    push eax
    push esi
    call sub_100fb531
    pop ecx
    pop ecx
    xor edx, edx
    inc edx
    mov dword ptr [ebp - 4], edx
    mov eax, dword ptr [g_1076adb8]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [eax + 0xc]
    test cl, 0x83
    je L2
    cmp dword ptr [ebp + 8], edx
    jne L3
    push eax
    call sub_100f6ba6
    pop ecx
    cmp eax, -1
    je L2
    inc dword ptr [ebp - 0x1c]
    jmp L2
    cmp dword ptr [ebp + 8], edi
    jne L2
    test cl, 2
    je L2
    push eax
    call sub_100f6bc1
    pop ecx
    cmp eax, -1
    jne L2
    or dword ptr [ebp - 0x24], eax
    mov dword ptr [ebp - 4], edi
    call L4
    inc esi
    jmp L5
    xor edi, edi
    mov esi, dword ptr [ebp - 0x20]
    mov eax, dword ptr [g_1076adb8]
    push dword ptr [eax + esi*4]
    push esi
    call sub_100fb5e8
    pop ecx
    pop ecx
    ret
    or dword ptr [ebp - 4], 0xffffffff
flsall ENDP
END