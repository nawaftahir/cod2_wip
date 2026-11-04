; __fltin2 @ 0x100fa28b — auto-synthesized
    EXTRN g_101a50d0:DWORD
    sub_10100de0 PROTO C
    sub_1010640d PROTO C
    sub_10106549 PROTO C
.CODE
__fltin2 PROC
    push ebp
    mov ebp, esp
    sub esp, 0x1c
    mov eax, dword ptr [g_101a50d0]
    push ebx
    push esi
    push edi
    xor esi, esi
    push esi
    push esi
    push esi
    push esi
    push dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 4], eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    xor edi, edi
    call sub_10106549
    mov ebx, eax
    add esp, 0x1c
    test bl, 4
    je L0
    mov edi, 0x200
    mov dword ptr [ebp - 0x18], esi
    mov dword ptr [ebp - 0x14], esi
    jmp L1
    lea eax, [ebp - 0x18]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    call sub_1010640d
    test bl, 2
    pop ecx
    pop ecx
    jne L2
    cmp eax, 1
    jne L3
    mov edi, 0x80
    test bl, 1
    jne L4
    cmp eax, 2
    jne L1
    or edi, 0x100
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 0x1c]
    sub ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax], edi
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [ebp - 0x18]
    mov dword ptr [eax + 0x10], ecx
    mov ecx, dword ptr [ebp - 0x14]
    pop edi
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [ebp - 4]
    pop esi
    pop ebx
    call sub_10100de0
    leave
    ret
__fltin2 ENDP
END